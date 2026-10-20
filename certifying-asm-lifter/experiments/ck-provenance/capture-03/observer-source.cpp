// Read-only Clang 21.1.8 AST observer, executed in the LLVM-emitting invocation.
// No AST/IR mutation, no asm-site selection, no CK-specific function names.
// SPDX-License-Identifier: MIT
#include "clang/AST/ASTConsumer.h"
#include "clang/AST/ASTContext.h"
#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/Basic/SourceManager.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Frontend/FrontendPluginRegistry.h"
#include "clang/Lex/Lexer.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/Support/JSON.h"
#include "llvm/Support/SHA256.h"
#include "llvm/Support/raw_ostream.h"
#include <set>
#include <map>

using namespace clang;
using O = llvm::json::Object;
using A = llvm::json::Array;
using V = llvm::json::Value;

namespace {
class Observer : public RecursiveASTVisitor<Observer> {
  ASTContext &C;
  SourceManager &SM;
  const FunctionDecl *Current = nullptr;
  std::map<unsigned, FileID> Files;
  std::set<const FunctionDecl *> Definitions;
  std::set<const Decl *> FunctionSymbols;

  std::string id(const Decl *D) {
    if (!D) return "";
    return "0x" + llvm::utohexstr(
        reinterpret_cast<uintptr_t>(D->getCanonicalDecl()), true);
  }
  O fileLoc(SourceLocation L) {
    if (L.isInvalid()) return O{{"valid", false}};
    L = SM.getFileLoc(L);
    auto F = SM.getFileID(L);
    Files.insert({F.getHashValue(), F});
    return O{{"valid", true}, {"file_id", F.getHashValue()},
             {"offset", SM.getFileOffset(L)},
             {"line", SM.getSpellingLineNumber(L)},
             {"column", SM.getSpellingColumnNumber(L)},
             {"path", SM.getFilename(L).str()}};
  }
  O loc(SourceLocation L) {
    if (L.isInvalid()) return O{{"valid", false}};
    A chain;
    SourceLocation P = L;
    std::set<unsigned> seen;
    while (P.isMacroID()) {
      if (!seen.insert(P.getRawEncoding()).second)
        llvm::report_fatal_error("cyclic source-manager location");
      auto R = SM.getImmediateExpansionRange(P);
      auto Caller = SM.getImmediateMacroCallerLoc(P);
      chain.push_back(O{{"raw", P.getRawEncoding()},
                       {"spelling_raw", SM.getImmediateSpellingLoc(P).getRawEncoding()},
                       {"spelling", fileLoc(SM.getSpellingLoc(P))},
                       {"expansion_begin_raw", R.getBegin().getRawEncoding()},
                       {"expansion_end_raw", R.getEnd().getRawEncoding()},
                       {"expansion_begin", fileLoc(SM.getExpansionLoc(R.getBegin()))},
                       {"expansion_end", fileLoc(SM.getExpansionLoc(R.getEnd()))},
                       {"caller_raw", Caller.getRawEncoding()},
                       {"argument_expansion", SM.isMacroArgExpansion(P)}});
      P = Caller;
    }
    return O{{"valid", true}, {"raw", L.getRawEncoding()},
             {"macro", L.isMacroID()},
             {"spelling", fileLoc(SM.getSpellingLoc(L))},
             {"expansion", fileLoc(SM.getExpansionLoc(L))},
             {"chain", std::move(chain)}};
  }
  O type(QualType T) {
    auto Canon = C.getCanonicalType(T);
    O R{{"spelled", T.getAsString()}, {"canonical", QualType(Canon).getAsString()},
        {"qualifiers", T.getCVRQualifiers()},
        {"integer", T->isIntegerType()}, {"unsigned", T->isUnsignedIntegerType()},
        {"pointer", T->isPointerType()}};
    // Placeholder/function/dependent types need not have a layout. Do not ask
    // ASTContext to lay them out merely because a non-selected body contains one.
    if (T->isIntegerType() || T->isPointerType())
      R["bits"] = C.getTypeSize(T);
    if (T->isPointerType()) R["pointee"] = type(T->getPointeeType());
    return R;
  }
  V stmt(const Stmt *S) {
    if (!S) return nullptr;
    O R{{"kind", S->getStmtClassName()}, {"begin", loc(S->getBeginLoc())},
        {"end", loc(S->getEndLoc())}};
    if (auto E = dyn_cast<Expr>(S)) {
      R["type"] = type(E->getType());
      R["lvalue"] = E->isLValue();
    }
    if (auto D = dyn_cast<DeclRefExpr>(S)) {
      R["decl"] = id(D->getDecl());
      R["name"] = D->getDecl()->getNameAsString();
    }
    if (auto E = dyn_cast<CastExpr>(S)) R["cast"] = E->getCastKindName();
    if (auto E = dyn_cast<UnaryOperator>(S))
      R["opcode"] = UnaryOperator::getOpcodeStr(E->getOpcode()).str();
    if (auto E = dyn_cast<BinaryOperator>(S)) R["opcode"] = E->getOpcodeStr().str();
    if (auto E = dyn_cast<IntegerLiteral>(S)) {
      llvm::SmallString<32> text;
      E->getValue().toString(text, 10, false);
      R["value"] = text.str().str();
    }
    if (auto E = dyn_cast<CallExpr>(S)) {
      R["callee"] = id(E->getDirectCallee());
      A Args;
      for (auto Arg : E->arguments()) Args.push_back(stmt(Arg));
      R["arguments"] = std::move(Args);
    }
    if (auto D = dyn_cast<DeclStmt>(S)) {
      A Decls;
      for (auto Item : D->decls()) {
        if (auto Var = dyn_cast<VarDecl>(Item))
          Decls.push_back(O{{"id", id(Var)}, {"name", Var->getNameAsString()},
                            {"type", type(Var->getType())}, {"init", stmt(Var->getInit())}});
        else Decls.push_back(O{{"unsupported_decl", Item->getDeclKindName()}});
      }
      R["declarations"] = std::move(Decls);
    }
    if (auto SAsm = dyn_cast<GCCAsmStmt>(S)) {
      auto Str = dyn_cast<StringLiteral>(SAsm->getAsmStringExpr());
      R["asm_key"] = Str ? Str->getBeginLoc().getRawEncoding() : 0;
    }
    A Children;
    for (auto Child : S->children()) Children.push_back(stmt(Child));
    R["children"] = std::move(Children);
    return R;
  }
public:
  A Functions, Globals, Sites, Symbols;
  Observer(ASTContext &Context) : C(Context), SM(C.getSourceManager()) {}
  bool VisitFunctionDecl(FunctionDecl *F) {
    if (FunctionSymbols.insert(F->getCanonicalDecl()).second)
      Symbols.push_back(O{{"id", id(F)}, {"name", F->getNameAsString()},
                          {"type", type(F->getType())}});
    return true;
  }
  bool TraverseFunctionDecl(FunctionDecl *F) {
    const FunctionDecl *Old = Current;
    Current = F;
    bool Result = RecursiveASTVisitor::TraverseFunctionDecl(F);
    if (F->doesThisDeclarationHaveABody() && Definitions.insert(F).second) {
      A Params;
      for (auto P : F->parameters())
        Params.push_back(O{{"id", id(P)}, {"name", P->getNameAsString()},
                          {"type", type(P->getType())}});
      Functions.push_back(O{{"id", id(F)}, {"name", F->getNameAsString()},
                            {"location", loc(F->getLocation())},
                            {"parameters", std::move(Params)},
                            {"return_type", type(F->getReturnType())},
                            {"body", stmt(F->getBody())}});
    }
    Current = Old;
    return Result;
  }
  bool VisitVarDecl(VarDecl *D) {
    if (!D->isLocalVarDeclOrParm())
      Globals.push_back(O{{"id", id(D)}, {"name", D->getNameAsString()},
                          {"type", type(D->getType())}, {"location", loc(D->getLocation())},
                          {"global_storage", D->hasGlobalStorage()}});
    return true;
  }
  bool VisitGCCAsmStmt(GCCAsmStmt *S) {
    O R{{"function", id(Current)}, {"begin", loc(S->getBeginLoc())},
        {"end", loc(S->getEndLoc())}, {"volatile", S->isVolatile()},
        {"simple", S->isSimple()}, {"goto", S->isAsmGoto()}};
    A Cookies, Tokens, Operands, Clobbers;
    if (auto Str = dyn_cast<StringLiteral>(S->getAsmStringExpr())) {
      R["template"] = Str->getString().str();
      Cookies.push_back(Str->getBeginLoc().getRawEncoding());
      auto Text = Str->getString();
      unsigned StartToken = 0, ByteOffset = 0;
      for (unsigned i = 0; i + 1 < Text.size(); ++i)
        if (Text[i] == '\n') Cookies.push_back(Str->getLocationOfByte(
            i + 1, SM, C.getLangOpts(), C.getTargetInfo(),
            &StartToken, &ByteOffset).getRawEncoding());
      for (unsigned i = 0; i < Str->getNumConcatenated(); ++i)
        Tokens.push_back(loc(Str->getStrTokenLoc(i)));
    } else R["unsupported_string"] = true;
    for (unsigned i = 0; i < S->getNumOutputs(); ++i)
      Operands.push_back(O{{"constraint", S->getOutputConstraint(i)},
                           {"name", S->getOutputName(i).str()}, {"output", true},
                           {"expression", stmt(S->getOutputExpr(i))}});
    for (unsigned i = 0; i < S->getNumInputs(); ++i)
      Operands.push_back(O{{"constraint", S->getInputConstraint(i)},
                           {"name", S->getInputName(i).str()}, {"output", false},
                           {"expression", stmt(S->getInputExpr(i))}});
    for (unsigned i = 0; i < S->getNumClobbers(); ++i)
      Clobbers.push_back(S->getClobber(i));
    R["cookies"] = std::move(Cookies);
    R["string_tokens"] = std::move(Tokens);
    R["operands"] = std::move(Operands);
    R["clobbers"] = std::move(Clobbers);
    Sites.push_back(std::move(R));
    return true;
  }
  O finish() {
    A Buffers;
    // All file IDs were obtained from actual SourceManager locations.
    for (auto [Number, F] : Files) {
      bool Invalid = false;
      auto Data = SM.getBufferData(F, &Invalid);
      if (Invalid) llvm::report_fatal_error("source buffer unavailable");
      auto Digest = llvm::SHA256::hash(llvm::arrayRefFromStringRef(Data));
      Buffers.push_back(O{{"file_id", Number}, {"bytes", Data.size()},
                          {"sha256", llvm::toHex(Digest, true)},
                          {"path", SM.getBufferName(SM.getLocForStartOfFile(F)).str()}});
    }
    return O{{"schema", "clang21-observer-v1"}, {"sites", std::move(Sites)},
             {"functions", std::move(Functions)}, {"symbols", std::move(Symbols)},
             {"globals", std::move(Globals)},
             {"buffers", std::move(Buffers)}};
  }
};

class Consumer : public ASTConsumer {
  std::string Output;
public:
  Consumer(std::string Path) : Output(std::move(Path)) {}
  void HandleTranslationUnit(ASTContext &C) override {
    if (C.getDiagnostics().hasErrorOccurred()) return;
    Observer Obs(C);
    Obs.TraverseDecl(C.getTranslationUnitDecl());
    std::error_code EC;
    llvm::raw_fd_ostream OS(Output, EC);
    if (EC) llvm::report_fatal_error("cannot write observer JSON");
    OS << llvm::formatv("{0:2}\n", V(Obs.finish()));
    llvm::raw_fd_ostream AST(Output + ".ast.json", EC);
    if (EC) llvm::report_fatal_error("cannot write raw AST");
    C.getTranslationUnitDecl()->dump(AST, true, ADOF_JSON);
  }
};
class Action : public PluginASTAction {
  std::string Output;
  bool ParseArgs(const CompilerInstance &, const std::vector<std::string> &Args) override {
    if (Args.size() != 1 || Args[0].empty()) return false;
    Output = Args[0];
    return true;
  }
  std::unique_ptr<ASTConsumer> CreateASTConsumer(CompilerInstance &, llvm::StringRef) override {
    return std::make_unique<Consumer>(Output);
  }
  ActionType getActionType() override { return AddBeforeMainAction; }
};
}
static FrontendPluginRegistry::Add<Action>
    Register("cert-observe", "read-only complete GNU asm provenance observation");

"""Same-invocation identity join and independently checked inline substitution.

No caller-selected AST node, function name, asm text match or register map.
The observer/Clang contract is trusted and explicitly recorded, not proved here.
Unknown host expressions, non-unique joins and additional live sites reject.
"""
import hashlib
import json
import re
from pathlib import Path
import z3
from frontend.gnu import Reject, parse
from certification.interface import sha, nodes, llvm_site
from certification.coverage import supported_worker
from certification.continuation import llvm_continuation
from certification.evidence import save_json, save_certificate


def require(condition, message):
    if not condition:
        raise Reject(message)


def unique(items, message):
    require(len(items) == 1, message)
    return items[0]


def children(node):
    result = node.get("children", [])
    require(all(isinstance(c, dict) for c in result), "null/unknown AST child")
    return result


def single(node):
    return unique(children(node), "expected exactly one AST child")


def walk(node):
    yield node
    # Enumeration is over the complete AST, including unsupported unused bodies
    # with optional null children (e.g. an absent else). Admission uses children.
    for c in node.get("children", []):
        if isinstance(c, dict):
            yield from walk(c)


def signature(t):
    return t["canonical"], t["qualifiers"], t.get("bits")


def unsigned(t):
    return (t.get("integer") is True and t.get("unsigned") is True
            and t.get("pointer") is False and t.get("qualifiers") == 0
            and (t.get("canonical"), t.get("bits")) in
            {("unsigned int", 32), ("unsigned long", 64), ("unsigned long long", 64)})


def same_type(a, b):
    return signature(a) == signature(b)


def pointer(t):
    return t.get("pointer") is True and t.get("bits") == 64 and t.get("qualifiers") == 0 and unsigned(t["pointee"])


def evaluate(e, env, globals_):
    """Small C expression interpreter; no string parsing or EvaluateAsInt oracle.

    Values are constants/symbols/pointers, with lvalues kept distinct. No
    general load, cast, arithmetic, call, UB or side effect is silently ignored.
    """
    kind, ty, cs = e["kind"], e["type"], children(e)
    if kind == "ParenExpr":
        c = single(e)
        require(same_type(ty, c["type"]), "parenthesis changes type")
        return evaluate(c, env, globals_)
    if kind == "DeclRefExpr":
        require(not cs and e.get("lvalue") is True, "non-lvalue declaration reference")
        identity = e["decl"]
        if identity in env:
            t, value = env[identity]
            require(same_type(ty, t), "parameter/local type differs at use")
            return {"kind": "lvalue", "decl": identity, "value": value, "type": ty}
        require(identity in globals_, "unbound C declaration")
        g = globals_[identity]
        require(g["global_storage"] and unsigned(g["type"]) and same_type(g["type"], ty),
                "unsupported global lvalue")
        require(re.fullmatch(r"[-a-zA-Z$._0-9]+", g["name"]), "unsupported C linkage name")
        return {"kind": "lvalue", "address": "@" + g["name"], "type": ty}
    if kind == "IntegerLiteral":
        require(not cs and ty.get("integer") and ty.get("qualifiers") == 0,
                "invalid integer literal type")
        value = int(e["value"])
        bits = ty["bits"]
        require(0 <= value < 2 ** (bits if ty["unsigned"] else bits - 1),
                "nonrepresentable or signed negative literal")
        return {"kind": "value", "value": str(value), "type": ty}
    if kind in {"ImplicitCastExpr", "CStyleCastExpr"}:
        c = single(e)
        v = evaluate(c, env, globals_)
        cast = e["cast"]
        if cast == "LValueToRValue":
            require(kind == "ImplicitCastExpr" and v["kind"] == "lvalue"
                    and "value" in v and same_type(ty, c["type"])
                    and ty["qualifiers"] == 0, "unsupported C lvalue load")
            return {"kind": "value", "value": v["value"], "type": ty}
        if cast == "NoOp":
            require(pointer(ty) and pointer(c["type"]) and same_type(ty, c["type"])
                    and same_type(ty["pointee"], c["type"]["pointee"])
                    and v["kind"] == "value", "non-identity pointer cast")
            return {**v, "type": ty}
        if cast == "IntegralCast":
            require(kind == "ImplicitCastExpr" and unsigned(ty)
                    and v["kind"] == "value" and c["type"].get("integer")
                    and re.fullmatch(r"\d+", v["value"])
                    and 0 <= int(v["value"]) < 2 ** ty["bits"], "unsupported integral conversion")
            return {**v, "type": ty}
        if cast == "NullToPointer":
            require(ty.get("canonical") == "void *" and ty.get("qualifiers") == 0
                    and v["kind"] == "value" and v["value"] == "0", "unsupported null conversion")
            return {"kind": "value", "value": "null", "type": ty}
        raise Reject("unsupported C cast: " + cast)
    if kind == "UnaryOperator":
        c, v = single(e), evaluate(single(e), env, globals_)
        if e["opcode"] == "&":
            require(pointer(ty) and v["kind"] == "lvalue" and "address" in v
                    and same_type(ty["pointee"], c["type"]), "unsupported C address expression")
            return {"kind": "value", "value": v["address"], "type": ty}
        if e["opcode"] == "*":
            require(unsigned(ty) and pointer(c["type"]) and v["kind"] == "value"
                    and same_type(ty, c["type"]["pointee"]) and e.get("lvalue") is True,
                    "unsupported C dereference")
            return {"kind": "lvalue", "address": v["value"], "type": ty}
    raise Reject("unsupported C expression: " + kind)


def call_arguments(call, expected_id):
    require(call["kind"] == "CallExpr" and call.get("callee") == expected_id, "not a direct expected call")
    cs = children(call)
    require(cs and cs[0]["kind"] == "ImplicitCastExpr"
            and cs[0].get("cast") == "FunctionToPointerDecay", "unsupported function call expression")
    ref = single(cs[0])
    require(ref["kind"] == "DeclRefExpr" and ref.get("decl") == expected_id
            and not children(ref), "direct callee declaration disagrees")
    require(cs[1:] == call["arguments"], "observer CallExpr argument views disagree")
    return cs[1:]


def authenticate_capture(directory):
    """Receipt gate. Authenticity ultimately depends on the recorded local run."""
    directory = Path(directory)
    r = json.loads((directory / "compiler-receipt.json").read_bytes())
    require(r["result"] == "SAME_INVOCATION_CAPTURED", "not a same-invocation capture")
    require(r["compiler_binary_sha256"] == "412bbe8c60571a1eb06f48fde89635033621caeb01a9b4ee76d46711bae8e932"
            and "clang version 21.1.8" in r["compiler_version"], "capture is not the pinned Clang build")
    require(set(r["artifacts"]) == {"observer.json", "observer.json.ast.json", "source.ll", "source.c"},
            "capture artifact set incomplete")
    for name, digest in r["artifacts"].items():
        require(sha((directory / name).read_bytes()) == digest, "captured artifact changed: " + name)
    obs = json.loads((directory / "observer.json").read_bytes())
    require(obs["schema"] == "clang21-observer-v1", "unknown observer schema")
    ast = json.loads((directory / "observer.json.ast.json").read_bytes())
    require(not any(n.get("kind") in {"FileScopeAsmDecl", "MSAsmStmt"} for n in nodes(ast)),
            "additional non-GNU-statement assembly unsupported")
    # Entry-point/alias/cleanup attributes must not invalidate the restricted
    # main -> worker -> wrapper reachability argument. Use a whitelist, not a
    # blacklist that would silently accept a new attribute.
    attrs = {n["kind"] for n in nodes(ast) if n.get("kind", "").endswith("Attr")}
    require(not attrs - {"BuiltinAttr", "ConstAttr", "NoThrowAttr", "UnusedAttr"},
            "source contains attributes outside the restricted reachability contract")
    require(sum(n.get("kind") == "GCCAsmStmt" for n in nodes(ast)) == len(obs["sites"]),
            "raw AST and observer asm census differ")
    require(sha((directory / "observer-source.cpp").read_bytes()) == r["observer_build"]["source_sha256"],
            "observer source/build mismatch")
    require(r["observer_build"]["clang_sha256"] == r["compiler_binary_sha256"], "compiler mismatch")
    deps = {}
    for path, row in r["dependencies"].items():
        data = (directory / row["file"]).read_bytes()
        require(sha(data) == row["sha256"], "captured dependency changed")
        deps[path] = data
    origin = json.loads((directory / "upstream-download.json").read_bytes())
    require(origin["commit"] == r["ck_commit"], "upstream commit mismatch")
    ck_suffix = "/ck-" + origin["commit"] + "/"
    for path, data in deps.items():
        if ck_suffix in path:
            rel = path.split(ck_suffix, 1)[1]
            # Generated configuration has its own captured bytes; it is not
            # falsely represented as an original tracked upstream file.
            require(rel == "include/ck_md.h" or origin["files"].get(rel) == sha(data),
                    "included upstream source differs from original")
    buffers = {}
    for b in obs["buffers"]:
        require(b["file_id"] not in buffers, "duplicate SourceManager file ID")
        data = b["content"].encode("utf-8")
        require(sha(data) == b["sha256"] and len(data) == b["bytes"], "source buffer digest mismatch")
        if b["path"].startswith("<") and b["path"].endswith(">"):
            require(b["path"] in {"<scratch space>", "<built-in>", "<command line>"},
                    "unrecognized virtual compiler buffer")
        else:
            require(deps.get(b["path"]) == data, "observer buffer is not a captured dependency")
        buffers[b["file_id"]] = b
    require(deps[r["source_path"]] == (directory / "source.c").read_bytes(), "main source mismatch")
    return obs, r, buffers, (directory / "source.ll").read_bytes().decode("utf-8")


def check_literal_tokens(source, buffers):
    """Rebuild the selected string from original spelling bytes.

    This milestone needs plain narrow string tokens only. Escape processing and
    wide/constexpr asm strings are not implemented; reject instead of using
    Python escape semantics as a stand-in for C.
    """
    strings = []
    for token in source["string_tokens"]:
        p = token["spelling"]
        raw = buffers[p["file_id"]]["content"].encode("utf-8")[p["offset"]:]
        match = re.match(rb'"([^"\\\r\n]*)"', raw)
        require(match is not None, "asm string token needs unsupported C escape/prefix handling")
        strings.append(match[1].decode("ascii"))
    require("".join(strings) == source["template"], "expanded asm template differs from source spelling tokens")
    require(len(source["cookies"]) == 1 and "\n" not in source["template"],
            "selected multiline provenance not implemented in this milestone")
    return strings


def validate_location(loc, buffers):
    require(loc.get("valid") is True and isinstance(loc.get("raw"), int) and loc["raw"] > 0,
            "invalid raw source location")

    def physical(p):
        require(p.get("valid") is True and p["file_id"] in buffers, "invalid physical location")
        b = buffers[p["file_id"]]
        data = b["content"].encode("utf-8")
        off = p["offset"]
        require(0 <= off <= len(data), "source offset outside captured buffer")
        require(p["line"] == data[:off].count(b"\n") + 1
                and p["column"] == off - data.rfind(b"\n", 0, off),
                "source line/column does not match bytes")
        require(p["path"] == b["path"], "source buffer/path mismatch")
    physical(loc["spelling"])
    physical(loc["expansion"])
    chain = loc["chain"]
    require(bool(chain) == loc["macro"], "macro ancestry flag mismatch")
    current, seen = loc["raw"], set()
    for row in chain:
        require(row["raw"] == current and current not in seen and current >= 2 ** 31,
                "broken/cyclic macro caller ancestry")
        seen.add(current)
        for key in ("spelling", "expansion_begin", "expansion_end"):
            physical(row[key])
        current = row["caller_raw"]
    require(current < 2 ** 31, "macro ancestry does not end at a file location")


def mapped_path(path, receipt):
    p = receipt["debug_prefix"]
    require(path.startswith(p["from"] + "/"), "location outside authenticated debug prefix")
    return p["to"] + path[len(p["from"]):]


def metadata_lineage(module, site, wrapper, worker, call, receipt, buffers):
    md = dict(re.findall(r"^!(\d+) = (.*)$", module, re.M))
    line = site["llvm_call"]
    def field(text, key):
        return unique(re.findall(r"(?:^|\(|, )" + key + r": !(\d+)(?=[,)])", text),
                      "missing/ambiguous debug field: " + key)
    def integer(text, key):
        return int(unique(re.findall(r"(?:^|\(|, )" + key + r": (\d+)(?=[,)])", text),
                          "missing/ambiguous debug integer: " + key))
    def location(mid, physical, function):
        text = md[mid]
        require(re.fullmatch(r"(?:distinct )?!DILocation\(.*\)", text), "not an LLVM debug location")
        require(integer(text, "line") == physical["line"]
                and integer(text, "column") == physical["column"], "inline debug position differs")
        sp = md[field(text, "scope")]
        require(re.fullmatch(r'distinct !DISubprogram\(.*\)', sp), "unsupported inline scope")
        require(re.search(r'\bname: "' + re.escape(function["name"]) + r'"(?:,|\))', sp),
                "inline function declaration differs")
        file = md[field(sp, "file")]
        def string(key):
            return unique(re.findall(key + r': "([^"]*)"', file), "invalid DIFile " + key)
        path = string("filename")
        if not path.startswith("/"):
            path = string("directory").rstrip("/") + "/" + path
        require(path == mapped_path(physical["path"], receipt), "debug file differs from source object")
        require("checksumkind: CSK_MD5" in file and string("checksum") ==
                hashlib.md5(buffers[physical["file_id"]]["content"].encode()).hexdigest(),
                "debug file checksum mismatch")
        return text
    first = unique(re.findall(r"!dbg !(\d+)", line), "asm has no unique debug location")
    inner = location(first, site["provenance"]["asm_location"]["expansion"], wrapper)
    outer_id = field(inner, "inlinedAt")
    outer = location(outer_id, call["begin"]["expansion"], worker)
    require("inlinedAt:" not in outer, "nested inline chain unsupported")
    return {"asm_debug_id": first, "inlined_at_debug_id": outer_id,
            "wrapper_decl": wrapper["id"], "worker_decl": worker["id"],
            "call_raw_location": call["begin"]["raw"]}


def prove_source_assertions(worker_body, output_decl, output_type, module, interface, symbols, globals_, out):
    """C return-to-assert link checked independently of LLVM debug names."""
    scope = supported_worker(module, interface)
    value = z3.BitVec("inline-source-output", output_type["bits"])
    expected = []
    env = {output_decl: (output_type, "LIVE")}
    assertion_id = unique([s["id"] for s in symbols if s["name"] == "__VERIFIER_assert"],
                          "missing unique assertion function")
    for stmt in worker_body[1:-1]:
        args = call_arguments(stmt, assertion_id)
        e = unique(args, "assertion needs one argument")
        require(e["kind"] == "BinaryOperator" and e["opcode"] in {"==", "!="}
                and signature(e["type"]) == ("int", 0, 32), "unsupported C assertion condition")
        cs = children(e)
        require(len(cs) == 2 and same_type(cs[0]["type"], cs[1]["type"])
                and unsigned(cs[0]["type"]), "unsupported C comparison types")
        vals = [evaluate(c, env, globals_) for c in cs]
        require(all(v["kind"] == "value" and same_type(v["type"], output_type) for v in vals),
                "comparison is not in the live-output domain")
        def term(v):
            return value if v["value"] == "LIVE" else z3.BitVecVal(int(v["value"]), output_type["bits"])
        eq = term(vals[0]) == term(vals[1])
        expected.append(eq if e["opcode"] == "==" else z3.Not(eq))
    last = worker_body[-1]
    require(last["kind"] == "ReturnStmt"
            and evaluate(single(last), {}, globals_)["value"] == "null", "worker does not return null")
    actual = llvm_continuation(scope["continuation"], interface["result_ssa"], interface["width"], value)
    require(expected and len(expected) == len(actual), "C/LLVM live assertion count mismatch")
    cert = {"result": "REJECT", "obligations": []}
    for i, (a, b) in enumerate(zip(expected, actual)):
        solver = z3.Solver()
        solver.set(timeout=10000)
        solver.add(a != b)
        answer = str(solver.check())
        cert["obligations"].append({"name": f"c-llvm-assert-{i}", "result": answer, "smt2": solver.to_smt2()})
        if answer == "sat":
            cert["obligations"][-1]["model"] = str(solver.model())
        elif answer == "unknown":
            cert["obligations"][-1]["reason"] = solver.reason_unknown()
        if answer != "unsat" and out:
            save_certificate(Path(out) / "c-continuation", cert)
        require(answer == "unsat", "source/LLVM assertion condition differs or solver unknown")
    cert["result"] = "C_INLINE_CONTINUATION_EXACT"
    if out:
        save_certificate(Path(out) / "c-continuation", cert)
    return cert


def reconcile(directory, out=None):
    obs, receipt, buffers, module = authenticate_capture(directory)
    return _reconcile_objects(obs, receipt, buffers, module, out)


def _reconcile_objects(obs, receipt, buffers, module, out=None):
    """Local semantic checker. Only reconcile() establishes the capture gate.

    Exposed privately for explicit component fault injection; those synthetic
    inputs are never accepted by the production capture path.
    """
    # Join all surviving calls against ALL source sites, before looking at
    # function names, templates, filenames, operands, or user-supplied hints.
    calls = [(i, line) for i, line in enumerate(module.splitlines())
             if re.search(r"\b(?:call|callbr|invoke)\b.*\basm\b", line)]
    md = dict(re.findall(r"^!(\d+) = !\{([^{}]*)\}$", module, re.M))
    joins = []
    for i, line in calls:
        mid = unique(re.findall(r"!srcloc !(\d+)", line), "missing/ambiguous asm origin metadata")
        require(mid in md and re.fullmatch(r"i64 \d+(?:, i64 \d+)*", md[mid]), "unsupported srcloc tuple")
        key = [int(x) for x in re.findall(r"i64 (\d+)", md[mid])]
        choices = [s for s in obs["sites"] if s["cookies"] == key]
        source = unique(choices, "source provenance join is missing or ambiguous")
        joins.append((i, source))
    i, source = unique(joins, "this milestone admits exactly one surviving static asm site")
    for loc in [source["begin"], source["end"], *source["string_tokens"]]:
        validate_location(loc, buffers)
    original_strings = check_literal_tokens(source, buffers)
    require(source["cookies"][0] == source["string_tokens"][0]["raw"], "cookie/string origin mismatch")
    require(source["volatile"] and not source["simple"] and not source["goto"], "unsupported asm kind")
    definitions = {f["id"]: f for f in obs["functions"]}
    require(len(definitions) == len(obs["functions"]), "duplicate function identity")
    wrapper = definitions[source["function"]]
    body = children(wrapper["body"])
    require(wrapper["body"]["kind"] == "CompoundStmt" and len(body) == 2
            and body[0]["kind"] == "GCCAsmStmt" and body[0]["asm_key"] == source["cookies"][0]
            and body[1]["kind"] == "ReturnStmt", "inline wrapper contains extra behavior")
    require(body[0]["children"] == [o["expression"] for o in source["operands"]],
            "asm census and enclosing body operand objects disagree")
    params = wrapper["parameters"]
    require(len(params) == 2 and len({p["id"] for p in params}) == 2, "wrapper needs two distinct parameters")
    require(all(unsigned(p["type"]) or pointer(p["type"]) for p in params), "unsupported formal parameter type")
    uses = [(f, n) for f in obs["functions"] for n in walk(f["body"])
            if n["kind"] == "CallExpr" and n.get("callee") == wrapper["id"]]
    worker, call = unique(uses, "wrapper must have one direct static call context")
    args = call_arguments(call, wrapper["id"])
    require(len(args) == len(params), "formal/actual arity mismatch")
    globals_ = {g["id"]: g for g in obs["globals"]}
    require(len(globals_) == len(obs["globals"]), "ambiguous global declarations")
    require(all(unsigned(g["type"]) and g["global_storage"] for g in globals_.values()),
            "global declarations outside restricted scalar host contract")
    env = {}
    for p, arg in zip(params, args):
        require(same_type(p["type"], arg["type"]), "formal/actual C types differ")
        v = evaluate(arg, {}, globals_)
        require(v["kind"] == "value", "actual argument did not evaluate to a value")
        env[p["id"]] = (p["type"], v["value"])
    normalized = []
    operands = []
    binding = {}
    scalar_decl = None
    widths = set()
    require(len(source["operands"]) == 2, "unsupported operand count")
    for index, o in enumerate(source["operands"]):
        require(o["name"] == "" and o["output"] is True, "only unnamed read-write outputs admitted")
        e = o["expression"]
        for n in walk(e):
            validate_location(n["begin"], buffers)
            validate_location(n["end"], buffers)
        require(unsigned(e["type"]), "operand is not unqualified unsigned scalar")
        widths.add(e["type"]["bits"])
        v = evaluate(e, env, globals_)
        require(v["kind"] == "lvalue", "output not an lvalue")
        memory = o["constraint"] == "+m"
        if memory:
            require("address" in v, "memory operand not an addressable object")
            binding["p" + str(index)] = v["address"]
            slot = "*addr" + str(index)
        else:
            require(o["constraint"] in {"+q", "+r"} and "decl" in v and scalar_decl is None,
                    "unsupported register output")
            require(v["decl"] in env and unsigned(env[v["decl"]][0]), "output not a scalar parameter")
            scalar_decl = v["decl"]
            binding["o" + str(index)] = v["value"]
            slot = "v" + str(index)
        normalized.append(json.dumps(o["constraint"]) + "(" + slot + ")")
        operands.append({"index": index, "constraint": o["constraint"], "output": True,
                         "memory": memory, "clang_type": e["type"], "actual_expression": e})
    require(len(widths) == 1 and scalar_decl is not None and len([k for k in binding if k[0] == "p"]) == 1,
            "need one common-width scalar and memory output")
    require(source["clobbers"] == ["memory", "cc"], "unexpected explicit clobbers")
    width = widths.pop()
    env_return = {**env, scalar_decl: (env[scalar_decl][0], "UPDATED_OUTPUT")}
    returned = evaluate(single(body[1]), env_return, globals_)
    require(returned["kind"] == "value" and returned["value"] == "UPDATED_OUTPUT"
            and same_type(returned["type"], wrapper["return_type"]), "wrapper return is not exact updated output")
    text = ('asm volatile(' + json.dumps(source["template"]) + " : " + ",".join(normalized)
            + ' : : "memory", "cc");')
    block = parse(text, width)
    reg = unique([o.index for o in block.operands if o.output and o.kind != "m"], "not one register output")
    interface = {"source_sha256": receipt["artifacts"]["source.c"], "normalized": text, "width": width,
                 "register_output": reg, "operands": operands,
                 "line": source["begin"]["expansion"]["line"],
                 "source_path": mapped_path(source["begin"]["expansion"]["path"], receipt),
                 "host_source_path": mapped_path(receipt["source_path"], receipt),
                 "provenance": {"method": "same-invocation raw srcloc identity join",
                                "all_ast_asm_sites": len(obs["sites"]), "surviving_llvm_sites": len(joins),
                                "cookies": source["cookies"], "asm_location": source["begin"],
                                "original_spelling_strings": original_strings,
                                "string_tokens": source["string_tokens"],
                                "source_function_decl": source["function"]}}
    interface = llvm_site(module, interface)
    require(interface["llvm_line_index"] == i and interface["bindings"] == binding,
            "actual LLVM operands differ from independent typed C substitution")
    scope = supported_worker(module, interface)
    require(scope["function"] == worker["name"], "LLVM container differs from actual AST caller")
    require(set(re.findall(r"^define [^\n]*@([-a-zA-Z$._0-9]+)\(", module, re.M)) == {worker["name"], "main"},
            "extra surviving LLVM function outside restricted host contract")
    wb = children(worker["body"])
    require(worker["body"]["kind"] == "CompoundStmt" and len(wb) >= 3
            and wb[0]["kind"] == "DeclStmt", "unsupported source worker body")
    local = unique(wb[0]["declarations"], "first worker statement needs one declaration")
    require(local["init"] == call and children(wb[0]) == [call]
            and same_type(local["type"], wrapper["return_type"]), "call result not initialized directly")
    interface["provenance"]["inline_context"] = metadata_lineage(
        module, interface, wrapper, worker, call, receipt, buffers)
    interface["c_substitution"] = {"parameters": params, "arguments": args,
                                 "llvm_bindings_derived_from_c": binding,
                                 "output_parameter": scalar_decl, "return_local": local["id"]}
    # Strict source reachability: only the wrapper, this worker, and main may
    # execute. No extra main calls/control flow may hide another asm instance.
    main = unique([f for f in obs["functions"] if f["name"] == "main"], "no unique source main")
    mb = children(main["body"])
    require(main["body"]["kind"] == "CompoundStmt", "unsupported main body")
    symbols = {s["id"]: s["name"] for s in obs["symbols"]}
    creates = []
    for st in mb:
        if st["kind"] == "DeclStmt":
            require(all(d.get("init") is None for d in st["declarations"]), "main initializer can hide behavior")
        elif st["kind"] == "ReturnStmt":
            require(st is mb[-1] and evaluate(single(st), {}, globals_)["value"] == "0", "unsupported main return")
        elif st["kind"] == "CallExpr":
            name = symbols.get(st["callee"])
            require(name in {"pthread_create", "pthread_join", "__VERIFIER_assert"}, "extra source main call")
            arguments = call_arguments(st, st["callee"])
            require(not any(n["kind"] in {"CallExpr", "GCCAsmStmt"} for a in arguments for n in walk(a)),
                    "nested main call/asm unsupported")
            if name == "pthread_create":
                require(len(arguments) == 4 and arguments[2]["kind"] == "ImplicitCastExpr"
                        and arguments[2].get("cast") == "FunctionToPointerDecay"
                        and single(arguments[2]).get("decl") == worker["id"], "another worker target")
                validate_location(st["begin"], buffers)
                require(st["begin"]["expansion"]["path"] == receipt["source_path"], "main creation outside host source")
                creates.append(st["begin"]["expansion"])
        else:
            raise Reject("unsupported source main statement: " + st["kind"])
    require(sorted(c["line"] for c in creates) == sorted(scope["pthread_create_source_lines"]),
            "C and LLVM worker activation census disagree")
    require(len(set(c["line"] for c in creates)) == len(creates), "ambiguous creation source positions")
    interface["provenance"]["creation_occurrences"] = creates
    cert = prove_source_assertions(wb, local["id"], local["type"], module, interface,
                                   obs["symbols"], globals_, out)
    interface["result"] = "INTERFACE_MATCH"
    interface["provenance"]["result"] = "PROVENANCE_AND_INLINE_BINDING_CHECKED"
    interface["external_trust"] = receipt["trust"]
    if out:
        save_json(Path(out) / "interface.json", interface)
        save_json(Path(out) / "provenance-summary.json", {
            "result": interface["provenance"]["result"], "c_continuation": cert["result"],
            "all_asm_sites": len(obs["sites"]), "key": source["cookies"],
            "matched_function": wrapper["name"], "worker": worker["name"],
            "instances": len(creates), "census": [
                {"cookies": s["cookies"], "function": s["function"],
                 "begin_raw": s["begin"]["raw"]} for s in obs["sites"]],
            "external_trust": receipt["trust"], "program_verdict_eligible": False})
    return interface

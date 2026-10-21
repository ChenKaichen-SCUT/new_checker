"""L3 finite LLVM activation provider. Does not interpret worker C branches.

Uses the existing restricted main checker only for lifecycle/object census.
Rejects any unconsumed LLVM worker instruction or conditional/looping asm call.
"""
import json
import re
from pathlib import Path
import z3
from certification.provenance import authenticate_capture, require, unique, walk, children
from certification.p0_host import source_main, llvm_main, Obligations
from certification.p1_entry import obj, serial_ops
from certification.continuation import SSA, VALUE
from certification.evidence import save_certificate


def prepare_scope(capture, local, out):
    report = {"result": "REJECT", "program_verdict_eligible": False}
    proof = Obligations(report)
    try:
        obs, receipt, buffers, module = authenticate_capture(capture)
        translation = local["translation"]
        interfaces = translation.get("interfaces", [translation["interface"]])
        workers = {i["worker_name"] for i in interfaces}
        require(set(re.findall(r"^define [^\n]*@([-\w.$]+)\(", module, re.M)) == {"main", *workers}, "complete LLVM function census")
        objects, main_ops = source_main(obs, receipt, json.loads((Path(capture) / "observer.json.ast.json").read_bytes()), workers, typed_entry=True)
        report["llvm_main"] = llvm_main(module, main_ops, objects, proof)
        activations = []
        for ci, create in enumerate(o for o in main_ops if o["kind"] == "create"):
            name, argument = create["target"], create["argument"]
            fn = unique([f for f in obs["functions"] if f["name"] == name], "source worker identity")
            require(not any(n["kind"] in {"ForStmt", "WhileStmt", "DoStmt", "GotoStmt", "SwitchStmt"}
                            for n in walk(fn["body"])), "L3 activation induction absent")
            sites = [i for i in interfaces if i["worker_name"] == name]
            # Source asm calls must be top-level declaration initializers; no
            # conditional occurrence is silently treated as unconditional.
            direct_calls = {n["begin"]["raw"] for st in children(fn["body"]) if st["kind"] == "DeclStmt"
                            for n in walk(st) if n["kind"] == "CallExpr"}
            require(all(i["call_context"]["begin_raw"] in direct_calls for i in sites), "conditional source asm occurrence")
            ops = llvm_operations(module, name, argument, sites, objects, ci)
            activations.append({"create_index": ci, "create": create, "worker": name, "argument": argument,
                                "ops": ops, "interfaces": sites})
        require({a["worker"] for a in activations} == workers, "unactivated LLVM worker")
        reads = {o["object"] for a in activations for o in a["ops"] if o["kind"] == "read"}
        writes = {o["pointer"][1:] for a in activations for o in a["ops"] if o["kind"] == "asm"}
        require(not reads & writes, "ordinary/asm LLVM input conflict")
        report.update(result="FINITE_LLVM_ACTIVATIONS_EXACT", activations=[
            {**{k:v for k,v in a.items() if k != "ops"}, "ops": serial_ops(a["ops"])} for a in activations],
            worker_C_semantics="NOT_CHECKED; no L4 follows")
        return {"profile": "D2", "module": module, "report": report, "objects": objects,
                "main_ops": main_ops, "activations": activations, "translation": translation}
    finally: save_certificate(out, report)


def llvm_operations(module, name, argument, interfaces, objects, ci):
    lines = module.splitlines(); sites = {i["llvm_line_index"]:i for i in interfaces}
    begin = unique([n for n,s in enumerate(lines) if re.match(r"define .*@"+re.escape(name)+r"\(",s)], "LLVM activation function")
    m = re.fullmatch(rf"define dso_local noundef ptr @{re.escape(name)}\(ptr noundef readonly captures\(none\) ({SSA})\) #0 !dbg !\d+ \{{", lines[begin])
    require(m is not None, "finite LLVM worker signature")
    env, defs, ops, seen = {m[1]:argument}, {m[1]}, [], set()
    end = next(i for i in range(begin+1,len(lines)) if lines[i] == "}")
    def term(s,w):
        v = env[s] if s.startswith("%") else z3.BitVecVal(int(s),w)
        require(z3.is_bv(v) and v.size()==w, "LLVM dependency type")
        return v
    def address(s):
        a=env[s] if s.startswith("%") else s
        require(isinstance(a,str) and a.startswith("@") and a[1:] in objects, "known complete input object")
        return a
    for i in range(begin+1,end):
        text=re.sub(r"(?:, !(?:dbg|tbaa) !\d+)+$","",lines[i].strip())
        if not text or text.startswith(";"): continue
        d=re.match(rf"({SSA}) = ",text)
        if d: require(d[1] not in defs,"LLVM fresh definition"); defs.add(d[1])
        if i in sites:
            f=sites[i]; ptr=address(f["bindings"][f["slots"]["pointer"]]); w=f["width"]
            require(objects[ptr[1:]]["width"]==w and not f.get("llvm_entry_conditions"),"L3 port domain obligation")
            value=term(f["bindings"][f["slots"]["value"]],w)
            response=z3.BitVec(f"llvm-create-{ci}-read-{len(ops)}",w)
            ops.append({"kind":"asm","pointer":ptr,"input":value,"value":response,"interface":f})
            env[f["result_ssa"]]=response; seen.add(i);continue
        m=re.fullmatch(rf"({SSA}) = load i(32|64), ptr ({SSA}|@[-\w.$]+), align (\d+)",text)
        if m:
            a=address(m[3]);w=int(m[2]);require(objects[a[1:]]["width"]==w and int(m[4])>=w//8,"LLVM read width/alignment")
            v=z3.BitVec(f"llvm-create-{ci}-read-{len(ops)}",w);env[m[1]]=v
            ops.append({"kind":"read","object":a[1:],"width":w,"value":v});continue
        m=re.fullmatch(rf"({SSA}) = icmp (eq|ne) i(32|64) ({VALUE}), ({VALUE})",text)
        if m:
            a,b=term(m[4],int(m[3])),term(m[5],int(m[3]));env[m[1]]=z3.If(a==b if m[2]=="eq" else a!=b,z3.BitVecVal(1,1),z3.BitVecVal(0,1));continue
        m=re.fullmatch(rf"({SSA}) = (?:add) i(32|64) ({VALUE}), ({VALUE})",text)
        if m: env[m[1]]=term(m[3],int(m[2]))+term(m[4],int(m[2]));continue
        m=re.fullmatch(rf"({SSA}) = select i1 ({VALUE}), i(32|64) ({VALUE}), i\3 ({VALUE})",text)
        if m: env[m[1]]=z3.If(term(m[2],1)==1,term(m[4],int(m[3])),term(m[5],int(m[3])));continue
        m=re.fullmatch(rf"({SSA}) = zext i1 ({SSA}) to i32",text)
        if m: env[m[1]]=z3.ZeroExt(31,term(m[2],1));continue
        m=re.fullmatch(rf"(?:tail )?call void @__VERIFIER_assert\(i32 noundef ({VALUE})\) #3",text)
        if m: ops.append({"kind":"assert","condition":term(m[1],32)!=0});continue
        if text=="ret ptr null": require(i==end-1,"early LLVM return");ops.append({"kind":"return"});continue
        raise ValueError("unconsumed L3 LLVM instruction: "+text)
    require(seen==set(sites) and ops and ops[-1]["kind"]=="return","incomplete LLVM activation effects")
    return ops

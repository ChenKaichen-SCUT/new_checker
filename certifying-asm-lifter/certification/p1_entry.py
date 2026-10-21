"""D1a typed open host interpreter. No backend register spelling convention.

The production entry takes a same-invocation capture, never an operand map.
All LLVM and Program operands are evaluated from definitions. The only object
identities admitted are complete source globals. This does not prove Gamma.
"""
import json
import re
from pathlib import Path
import z3
from certification.provenance import (
    authenticate_capture, require, unique, children, single, walk, unsigned,
    pointer, same_type, signature, evaluate, call_arguments, validate_location,
    check_literal_tokens, metadata_lineage, mapped_path,
)
from certification.interface import llvm_site, sha
from certification.continuation import SSA, VALUE, core_expr
from certification.endpoints import type_of
from certification.p0_host import (
    source_main, llvm_main, program_main, Obligations, signature_void,
    mem, literal, basic_event,
)
from certification.evidence import save_certificate, save_json
from frontend.gnu import parse, initial_bindings, Reject
from semantics.reference import execute as reference


def obj(name):
    require(name.startswith("@"), "typed object identity")
    return z3.BitVec("object:" + name[1:], 64)


def wrapper_interface(obs, receipt, buffers, module, source, worker, call, line_index=None):
    """Independently check the entire original wrapper, with symbolic formals."""
    validate_location(call["begin"], buffers)
    validate_location(call["end"], buffers)
    for loc in [source["begin"], source["end"], *source["string_tokens"]]:
        validate_location(loc, buffers)
    strings = check_literal_tokens(source, buffers)
    require(source["cookies"][0] == source["string_tokens"][0]["raw"], "origin cookie/string")
    require(source["volatile"] and not source["simple"] and not source["goto"], "asm kind")
    wrapper = unique([f for f in obs["functions"] if f["id"] == source["function"]], "asm definition")
    body, params = children(wrapper["body"]), wrapper["parameters"]
    require(wrapper["body"]["kind"] == "CompoundStmt" and len(body) == 2
            and body[0]["kind"] == "GCCAsmStmt" and body[0]["asm_key"] == source["cookies"][0]
            and body[0]["children"] == [o["expression"] for o in source["operands"]]
            and body[1]["kind"] == "ReturnStmt", "wrapper complete body")
    require(len(params) == 2 and len({p["id"] for p in params}) == 2
            and pointer(params[0]["type"]) and unsigned(params[1]["type"])
            and same_type(params[0]["type"]["pointee"], params[1]["type"]), "wrapper formal types")
    args = call_arguments(call, wrapper["id"])
    require(len(args) == 2 and all(same_type(p["type"], a["type"]) for p, a in zip(params, args)),
            "typed actual/formal substitution")
    formal = {params[0]["id"]: (params[0]["type"], "FORMAL_POINTER"),
              params[1]["id"]: (params[1]["type"], "FORMAL_VALUE")}
    require(len(source["operands"]) == 2 and source["clobbers"] == ["memory", "cc"], "operand/clobber census")
    normalized, reg, slots, operands = [], None, {}, []
    for i, operand in enumerate(source["operands"]):
        e = operand["expression"]
        for n in walk(e):
            validate_location(n["begin"], buffers)
            validate_location(n["end"], buffers)
        require(not operand["name"] and operand["output"] is True and unsigned(e["type"])
                and same_type(e["type"], params[1]["type"]), "typed RW output")
        v = evaluate(e, formal, {})
        require(v["kind"] == "lvalue", "asm output lvalue")
        memory = operand["constraint"] == "+m"
        if memory:
            require(v.get("address") == "FORMAL_POINTER" and "pointer" not in slots, "memory formal binding")
            slots["pointer"] = "p" + str(i)
            slot = "*addr" + str(i)
        else:
            require(operand["constraint"] in {"+q", "+r"} and reg is None
                    and v.get("decl") == params[1]["id"] and v.get("value") == "FORMAL_VALUE",
                    "register formal binding")
            reg = i
            slots["value"] = "o" + str(i)
            slot = "v" + str(i)
        normalized.append(json.dumps(operand["constraint"]) + "(" + slot + ")")
        operands.append({"index": i, "constraint": operand["constraint"], "output": True,
                         "memory": memory, "clang_type": e["type"]})
    require(reg is not None and set(slots) == {"pointer", "value"}, "exact wrapper slots")
    returned = evaluate(single(body[1]), {**formal, params[1]["id"]: (params[1]["type"], "UPDATED")}, {})
    require(returned["kind"] == "value" and returned["value"] == "UPDATED"
            and same_type(returned["type"], wrapper["return_type"]), "wrapper return")
    normalized = ('asm volatile(' + json.dumps(source["template"]) + " : " + ",".join(normalized)
                  + ' : : "memory", "cc");')
    block = parse(normalized, params[1]["type"]["bits"])
    require(len(block.instructions) == 1 and re.fullmatch(r"lock xadd[lq] %\d+, %\d+", block.instructions[0]),
            "P1 accepts existing xadd only")
    interface = llvm_site(module, {
        "source_sha256": receipt["artifacts"]["source.c"], "normalized": normalized,
        "width": params[1]["type"]["bits"], "register_output": reg, "operands": operands,
        "line": source["begin"]["expansion"]["line"],
        "source_path": mapped_path(source["begin"]["expansion"]["path"], receipt),
        "host_source_path": mapped_path(receipt["source_path"], receipt),
        "provenance": {"all_ast_asm_sites": len(obs["sites"]), "cookies": source["cookies"],
                       "asm_location": source["begin"],
                       "original_spelling_strings": strings, "source_function_decl": wrapper["id"]},
        "slots": slots,
    }, checked_line_index=line_index)
    interface["provenance"]["inline_context"] = metadata_lineage(
        module, interface, wrapper, worker, call, receipt, buffers)
    interface["result"] = "INTERFACE_MATCH"
    interface["call_context"] = {"begin_raw": call["begin"]["raw"], "end_raw": call["end"]["raw"]}
    return interface, wrapper


def source_worker(worker, wrapper, interface, argument, objects, obs, *, call_count=1):
    params = worker["parameters"]
    require(len(params) == 1 and signature_void(params[0]["type"])
            and signature_void(worker["return_type"]) and worker["body"]["kind"] == "CompoundStmt",
            "worker signature/body")
    require(argument.startswith("@") and argument[1:] in objects, "D1a requires a known object argument")
    globals_ = {g["id"]: g for g in obs["globals"]}
    require(len(globals_) == len(obs["globals"]), "global identity")
    env = {params[0]["id"]: (params[0]["type"], argument)}
    ops, definitions = [], set(env)
    assertion = unique([s for s in obs["symbols"] if s["name"] == "__VERIFIER_assert"], "assert declaration")
    require(assertion["type"]["canonical"] == "void (int)", "assert type")

    def value(e):
        k, t, cs = e["kind"], e["type"], children(e)
        if k == "ParenExpr":
            require(same_type(t, single(e)["type"]), "parenthesis type")
            return value(single(e))
        if k == "IntegerLiteral":
            v = evaluate(e, {}, globals_)
            return z3.BitVecVal(int(v["value"]), t["bits"])
        if k == "UnaryOperator" and e["opcode"] == "&":
            v = evaluate(e, {}, globals_)
            require(v["kind"] == "value" and v["value"][1:] in objects, "complete-object address")
            return v["value"]
        if k in {"ImplicitCastExpr", "CStyleCastExpr"}:
            c = single(e)
            if e["cast"] == "LValueToRValue":
                require(k == "ImplicitCastExpr" and same_type(t, c["type"]), "lvalue conversion type")
                if c["kind"] == "DeclRefExpr" and c["decl"] in env:
                    old_type, v = env[c["decl"]]
                    require(same_type(t, old_type) and not children(c), "local definition/use type")
                    return v
                if c["kind"] == "UnaryOperator" and c["opcode"] == "*":
                    p = value(single(c))
                    require(pointer(single(c)["type"]) and unsigned(t) and c.get("lvalue")
                            and same_type(single(c)["type"]["pointee"], t), "typed shared dereference")
                elif c["kind"] == "DeclRefExpr" and c["decl"] in globals_:
                    g = globals_[c["decl"]]
                    require(same_type(t, g["type"]) and not children(c), "global use type")
                    p = "@" + g["name"]
                else:
                    raise Reject("unsupported source lvalue")
                require(isinstance(p, str) and p.startswith("@") and p[1:] in objects
                        and objects[p[1:]]["width"] == t["bits"], "unknown alias/pointee width")
                u = z3.BitVec("p1-open-read-" + str(len(ops)), t["bits"])
                ops.append({"kind": "read", "object": p[1:], "width": t["bits"], "value": u})
                return u
            v = value(c)
            if e["cast"] == "BitCast":
                require(k == "CStyleCastExpr" and signature_void(c["type"]) and pointer(t)
                        and isinstance(v, str) and v[1:] in objects
                        and objects[v[1:]]["width"] == t["pointee"]["bits"], "pointer roundtrip provenance/type")
                g = unique([g for g in globals_.values() if g["name"] == v[1:]], "pointee declaration")
                require(same_type(g["type"], t["pointee"]), "exact complete-object pointee type")
                return v
            if e["cast"] == "NoOp":
                require(pointer(t) and same_type(t, c["type"]), "pointer no-op type")
                return v
            if e["cast"] == "IntegralCast":
                require(k == "ImplicitCastExpr" and unsigned(t) and z3.is_bv_value(v)
                        and v.as_long() < 2 ** t["bits"], "representable literal conversion")
                return z3.BitVecVal(v.as_long(), t["bits"])
            raise Reject("unsupported source cast " + e["cast"])
        if k == "CallExpr":
            args = call_arguments(e, wrapper["id"])
            require(len(args) == 2 and all(same_type(a["type"], p["type"])
                    for a, p in zip(args, wrapper["parameters"])), "call types")
            p, v = [value(a) for a in args]
            require(isinstance(p, str) and p.startswith("@") and p[1:] in objects
                    and z3.is_bv(v) and v.size() == interface["width"]
                    and objects[p[1:]]["width"] == interface["width"], "call value/address types")
            u = z3.BitVec("p1-open-rmw-" + str(len(ops)), interface["width"])
            ops.append({"kind": "asm", "pointer": p, "input": v, "value": u, "call": e})
            return u
        raise Reject("unsupported source worker expression " + k)

    body = children(worker["body"])
    for i, st in enumerate(body):
        if st["kind"] == "DeclStmt":
            d = unique(st["declarations"], "one initialized worker declaration")
            require(d["id"] not in definitions and d["init"] is not None
                    and children(st) == [d["init"]] and same_type(d["type"], d["init"]["type"])
                    and (unsigned(d["type"]) or pointer(d["type"])), "worker local declaration")
            nested_calls = [n for n in walk(d["init"]) if n["kind"] == "CallExpr"]
            require(not nested_calls or (len(nested_calls) == 1 and nested_calls[0] == d["init"]),
                    "call must be a complete declaration initializer")
            v = value(d["init"])
            env[d["id"]] = d["type"], v
            definitions.add(d["id"])
        elif st["kind"] == "CallExpr":
            e = unique(call_arguments(st, assertion["id"]), "assert arity")
            require(e["kind"] == "BinaryOperator" and e["opcode"] in {"==", "!="}
                    and signature(e["type"]) == ("int", 0, 32) and len(children(e)) == 2
                    and unsigned(children(e)[0]["type"])
                    and same_type(children(e)[0]["type"], children(e)[1]["type"]), "worker comparison types")
            require(not any(n["kind"] == "CallExpr"
                            or (n["kind"] == "UnaryOperator" and n["opcode"] == "*")
                            or (n["kind"] == "DeclRefExpr" and n["decl"] in globals_)
                            for n in walk(e)), "worker monitor must use pure local values/literals")
            a, b = [value(c) for c in children(e)]
            ops.append({"kind": "assert", "condition": a == b if e["opcode"] == "==" else a != b})
        elif st["kind"] == "ReturnStmt":
            require(i == len(body) - 1 and evaluate(single(st), {}, globals_)["value"] == "null", "worker return")
            ops.append({"kind": "return"})
        else:
            raise Reject("unconsumed C worker statement")
    require(ops and ops[-1]["kind"] == "return" and any(o["kind"] == "assert" for o in ops),
            "worker return/monitor coverage")
    require(sum(o["kind"] == "asm" for o in ops) == call_count and any(o["kind"] == "read" for o in ops),
            "complete admitted asm count with ordinary shared input")
    return ops


def llvm_worker(module, worker, interface, argument, ops, proof, *, interfaces=None):
    interfaces = interfaces or [interface]
    sites = {x["llvm_line_index"]: x for x in interfaces}
    require(len(sites) == len(interfaces), "distinct LLVM static sites")
    lines = module.splitlines()
    begin = unique([i for i, s in enumerate(lines) if re.match(r"define .*@" + re.escape(worker) + r"\(", s)],
                   "LLVM worker")
    m = re.fullmatch(rf"define dso_local noundef ptr @{re.escape(worker)}"
                     rf"\(ptr noundef readonly captures\(none\) ({SSA})\) #0 !dbg !\d+ \{{", lines[begin])
    require(m is not None, "D1a LLVM worker signature")
    env, defined, index = {m[1]: argument}, {m[1]}, 0
    end = next(i for i in range(begin + 1, len(lines)) if lines[i] == "}")
    records = []

    def consume(kind):
        nonlocal index
        require(index < len(ops) and ops[index]["kind"] == kind, "complete C/LLVM worker effect census")
        op = ops[index]
        index += 1
        return op

    def term(s, w):
        v = env[s] if s.startswith("%") else z3.BitVecVal(int(s), w)
        require(z3.is_bv(v) and v.size() == w, "LLVM SSA definition/use type")
        return v

    for i in range(begin + 1, end):
        raw = lines[i].strip()
        if not raw or raw.startswith(";"):
            continue
        records.append({"line_index": i, "text": raw})
        text = re.sub(r"(?:, !(?:dbg|tbaa) !\d+)+$", "", raw)
        definition = re.match(rf"({SSA}) = ", text)
        if definition:
            require(definition[1] not in defined, "LLVM SSA freshness")
            defined.add(definition[1])
        if i in sites:
            interface = sites[i]
            op = consume("asm")
            require(interface["call_context"] == {"begin_raw": op["call"]["begin"]["raw"],
                                                  "end_raw": op["call"]["end"]["raw"]},
                    "ordered source/LLVM call context")
            p = interface["bindings"][interface["slots"]["pointer"]]
            v = interface["bindings"][interface["slots"]["value"]]
            require((env[p] if p.startswith("%") else p) == op["pointer"], "C/LLVM asm address")
            require(v.startswith("%") and v in env and not z3.is_bv_value(env[v]),
                    "increment must survive as a nonconstant SSA definition")
            proof.prove("typed-entry-llvm-input-" + str(i), term(v, interface["width"]) == op["input"])
            op["interface"] = interface
            env[interface["result_ssa"]] = op["value"]
            continue
        m = re.fullmatch(rf"({SSA}) = load i(32|64), ptr ({SSA}|@[-\w.$]+), align (\d+)", text)
        if m:
            op = consume("read")
            require((env[m[3]] if m[3].startswith("%") else m[3]) == "@" + op["object"]
                    and int(m[2]) == op["width"] and int(m[4]) >= op["width"] // 8, "C/LLVM ordinary read")
            env[m[1]] = op["value"]
            continue
        m = re.fullmatch(rf"({SSA}) = icmp (eq|ne) i(32|64) ({VALUE}), ({VALUE})", text)
        if m:
            a, b = term(m[4], int(m[3])), term(m[5], int(m[3]))
            env[m[1]] = z3.If(a == b if m[2] == "eq" else a != b, z3.BitVecVal(1, 1), z3.BitVecVal(0, 1))
            continue
        m = re.fullmatch(rf"({SSA}) = zext i1 ({SSA}) to i32", text)
        if m:
            env[m[1]] = z3.ZeroExt(31, term(m[2], 1))
            continue
        m = re.fullmatch(rf"(?:tail )?call void @__VERIFIER_assert\(i32 noundef ({VALUE})\) #3", text)
        if m:
            op = consume("assert")
            proof.prove("c-llvm-worker-monitor-" + str(index), op["condition"] == (term(m[1], 32) != 0))
            continue
        if text == "ret ptr null":
            consume("return")
            continue
        raise Reject("unconsumed LLVM worker instruction " + text)
    require(index == len(ops), "incomplete LLVM worker coverage")
    return records


def prepare_entry(capture, out):
    """Authenticate and check source/LLVM; translation remains the existing path."""
    out = Path(out)
    out.mkdir(parents=True, exist_ok=True)
    report = {"result": "REJECT", "program_verdict_eligible": False}
    proof = Obligations(report)
    try:
        obs, receipt, buffers, module = authenticate_capture(capture)
        calls = [(i, s) for i, s in enumerate(module.splitlines())
                 if re.search(r"\b(?:call|invoke|callbr)\b.*\basm\b", s)]
        require(len(calls) in {1, 2}, "only D1a/D1b one or two live calls admitted")
        profile = "D1a" if len(calls) == 1 else "D1b"
        md = dict(re.findall(r"^!(\d+) = !\{([^{}]*)\}$", module, re.M))
        sources = []
        for i, line in calls:
            mid = unique(re.findall(r"!srcloc !(\d+)", line), "asm provenance cookie")
            require(re.fullmatch(r"i64 \d+(?:, i64 \d+)*", md[mid]), "origin tuple syntax")
            key = [int(x) for x in re.findall(r"i64 (\d+)", md[mid])]
            sources.append(unique([s for s in obs["sites"] if s["cookies"] == key],
                                  "whole-AST origin identity join"))
        require(len({s["function"] for s in sources}) == 1, "D1b same original inline definition")
        source = sources[0]
        uses = [(f, n) for f in obs["functions"] for n in walk(f["body"])
                if n["kind"] == "CallExpr" and n.get("callee") == source["function"]]
        require(len(uses) == len(calls) and 1 <= len({f["id"] for f, n in uses}) <= 2,
                "complete one/two-worker static call census")
        worker = uses[0][0]
        workers = {f["name"]: f for f, n in uses}
        if len(workers) > 1:
            profile = "D2"
        require(set(re.findall(r"^define [^\n]*@([-\w.$]+)\(", module, re.M)) == {"main", *workers},
                "extra surviving function")
        interfaces, selected = [], set()
        for (i, line), source in zip(calls, sources):
            candidates = []
            for ui, (candidate_worker, call) in enumerate(uses):
                try:
                    pair = wrapper_interface(obs, receipt, buffers, module, source, candidate_worker, call, i)
                    candidates.append((ui, pair))
                except Reject:
                    pass
            ui, (interface, wrapper) = unique(candidates, "unique independently checked inline call context")
            require(ui not in selected, "inline call context reused")
            selected.add(ui)
            interface["worker_definition"] = uses[ui][0]["id"]
            interface["worker_name"] = uses[ui][0]["name"]
            if len(calls) > 1:
                interface["instance_namespace"] = "call" + str(len(interfaces)) + "_"
            interfaces.append(interface)
        require(selected == set(range(len(uses))), "complete source/LLVM inline context coverage")
        interface = interfaces[0]
        raw = json.loads((Path(capture) / "observer.json.ast.json").read_bytes())
        objects, main_ops = source_main(obs, receipt, raw, workers, typed_entry=True)
        creates = [o for o in main_ops if o["kind"] == "create"]
        require({o["target"] for o in creates} == set(workers), "unactivated worker definition")
        activations = []
        report["activations"] = []
        for ci, create in enumerate(creates):
            worker = workers[create["target"]]
            local_interfaces = [x for x in interfaces if x["worker_definition"] == worker["id"]]
            argument = create["argument"]
            ops = source_worker(worker, wrapper, local_interfaces[0], argument, objects, obs,
                                call_count=len(local_interfaces))
            from z3.z3util import get_vars
            variables = {v.sexpr(): v for op in ops for e in op.values()
                         if isinstance(e, z3.AstRef) for v in get_vars(e)}
            fresh = [(v, z3.Const(f"source-create-{ci}:" + n, v.sort())) for n, v in variables.items()]
            ops = [{k: z3.substitute(v, *fresh) if isinstance(v, z3.AstRef) else v
                    for k, v in op.items()} for op in ops]
            records = llvm_worker(module, worker["name"], local_interfaces[0], argument, ops,
                                  proof, interfaces=local_interfaces)
            activations.append({"create_index": ci, "create": create, "worker": worker["name"],
                                "argument": argument, "ops": ops, "interfaces": local_interfaces})
            report["activations"].append({"create_index": ci, "create": create,
                                         "source_ops": serial_ops(ops), "llvm_worker": records})
        reads = {o["object"] for a in activations for o in a["ops"] if o["kind"] == "read"}
        writes = {o["pointer"][1:] for a in activations for o in a["ops"] if o["kind"] == "asm"}
        report["source_conflict_check"] = {"ordinary_worker_reads": sorted(reads),
                                           "asm_worker_writes": sorted(writes),
                                           "overlap": sorted(reads & writes)}
        require(not reads & writes, "MIXED_C_ASM_CONFLICT: " + ",".join(sorted(reads & writes)))
        report["source_conflict_check"]["result"] = "ORDINARY_C_CONFLICT_FREE"
        report["llvm_main"] = llvm_main(module, main_ops, objects, proof)
        # Compatibility fields describe the first activation only; all acceptance
        # paths below use the exhaustive activation list.
        argument, ops, worker = activations[0]["argument"], activations[0]["ops"], workers[activations[0]["worker"]]
        report.update(result="TYPED_SOURCE_LLVM_ENTRY_EXACT", worker=worker["name"],
                      argument=argument, objects=objects, interfaces=interfaces, profile=profile,
                      source_ops=serial_ops(ops))
        translation = translate_all(interfaces, module, out / "translation")
        return {"report": report, "translation": translation, "ops": ops, "main_ops": main_ops,
                "objects": objects, "module": module, "receipt": receipt, "worker": worker["name"],
                "argument": argument, "profile": profile, "activations": activations}
    except Exception as error:
        report["reason"] = str(error)
        raise
    finally:
        save_certificate(out / "entry", report)


def serial_ops(ops):
    return [{k: (v.sexpr() if isinstance(v, z3.AstRef) else v)
             for k, v in op.items() if k != "call"} for op in ops]


def translate_all(interfaces, module, out):
    from certification.prepare import _translate_checked_interface
    if len(interfaces) == 1:
        return _translate_checked_interface(interfaces[0], module, out)
    out.mkdir(parents=True, exist_ok=True)
    lines = module.splitlines(keepends=True)
    new_defs, certificates, intervals = set(), [], []
    for ci, interface in enumerate(interfaces):
        directory = out / f"call-{ci}"
        local = _translate_checked_interface(interface, module, directory)
        fragment = (directory / "actual-fragment.ll").read_bytes().decode()
        defs = re.findall(r"^\s*(%[-\w.$]+) = ", fragment, re.M)
        scoped_defs = {(interface["worker_name"], d) for d in defs}
        require(len(defs) == len(set(defs)) and not new_defs.intersection(scoped_defs), "cross-call SSA freshness")
        new_defs.update(scoped_defs)
        i = interface["llvm_line_index"]
        require(lines[i] == interface["llvm_call"], "unmodified distinct replacement interval")
        lines[i] = fragment
        intervals.append({"llvm_line_index": i, "call_context": interface["call_context"],
                          "fragment_sha256": sha(fragment), "result_ssa": interface["result_ssa"]})
        local.pop("candidate_llvm")
        certificates.append(local)
    candidate = "".join(lines)
    # Reconstruct the untouched frame by masking exactly all admitted intervals.
    original = module.splitlines(keepends=True)
    selected = {x["llvm_line_index"] for x in interfaces}
    require(len(selected) == len(interfaces)
            and all(a == b for i, (a, b) in enumerate(zip(original, lines)) if i not in selected),
            "complete multiple-replacement host frame")
    frame = {"source_module_sha256": sha(module), "target_module_sha256": sha(candidate),
             "intervals": intervals, "fresh_definitions": sorted(new_defs),
             "host_frame_sha256": sha("".join(s for i, s in enumerate(original) if i not in selected))}
    (out / "candidate.ll").write_bytes(candidate.encode())
    save_json(out / "host-frame.json", frame)
    return {"interface": interfaces[0], "interfaces": interfaces, "calls": certificates, "frame": frame,
            "candidate_llvm": candidate, "program_verdict_eligible": False}


def qexpr(x, env):
    if x.get("kind") == "object":
        require(x.get("complete") is True and x["type"] == "bv64", "object expression type")
        return obj("@" + x["name"])
    if x.get("kind") == "ADD":
        require(x.get("complete") is True and len(x["args"]) == 2, "ADD expression")
        a, b = [qexpr(v, env) for v in x["args"]]
        require(a.sort() == b.sort() == type_of(x["type"]), "ADD type")
        return a + b
    # Recursion in core_expr covers all other admitted expressions. ADD/object
    # are not permitted inside its Boolean operators in this first D1a profile.
    return core_expr(x, env)


def program_workers(q, prepared, out):
    report = {"result": "REJECT", "program_verdict_eligible": False}
    proof = Obligations(report)
    try:
        require(q["format"] == "dat3m-core-snapshot-v1" and q["arch"] == "TSO", "actual Q target")
        worker_names = {a["worker"] for a in prepared["activations"]}
        threads = [t for t in q["threads"] if t["name"] in worker_names]
        creates = [o for o in prepared["main_ops"] if o["kind"] == "create"]
        main = unique([t for t in q["threads"] if t["name"] == "main"], "actual main for creators")
        qcreates = [e for e in main["events"] if e["class"] == "ThreadCreate"]
        require(len(qcreates) == len(creates), "complete actual creator census")
        by_creator = {e["id"]: a for e, a in zip(qcreates, prepared["activations"])}
        require(len(by_creator) == len(creates), "duplicate actual creator")
        seen_creators, expected_coverage = set(), set()
        require(len(threads) == len(creates) and len({t["id"] for t in threads}) == len(threads),
                "complete dynamic activation count")
        all_ids = [e["id"] for t in q["threads"] for e in t["events"]]
        require(len(all_ids) == len(set(all_ids)), "global actual event identities")
        continuations, certificates = [], []
        for thread in threads:
            events = thread["events"]
            for i, e in enumerate(events):
                basic_event(e, events[i + 1]["id"] if i + 1 < len(events) else None)
            require([e["class"] for e in events[:4]] == ["ThreadStart", "Load", "Assume", "ThreadArgument"]
                    and [e["class"] for e in events[-4:]] == ["Load", "RMWStore", "ThreadReturn", "Label"],
                    "complete worker runtime shape")
            start, r, assume, arg = events[:4]
            cr, cw, ret, label = events[-4:]
            creator = unique([e for t in q["threads"] for e in t["events"]
                              if e["id"] == start["creator"]], "actual worker creator")
            require(creator["id"] in by_creator and creator["id"] not in seen_creators,
                    "uncovered/reused actual activation creator")
            activation = by_creator[creator["id"]]
            seen_creators.add(creator["id"])
            require(thread["name"] == activation["worker"], "source/actual worker target")
            expected_coverage.update((thread["id"], x["llvm_line_index"]) for x in activation["interfaces"])
            require(creator["class"] == "ThreadCreate" and creator["spawned_thread"] == thread["id"]
                    and len(creator["arguments"]) == 1 and arg["creator"] == creator["id"]
                    and arg["argument_index"] == 0 and arg["writes"]["type"] == "bv64",
                    "actual thread argument definition")
            proof.prove("thread-argument-" + str(thread["id"]),
                        qexpr(creator["arguments"][0], {}) == obj(activation["argument"]))
            runtime = f'__com_{thread["name"]}#{thread["id"]}'
            for e, tags in [(r, ["M", "R", "_"]), (cr, ["A", "M", "R", "RMW", "_"]),
                            (cw, ["A", "M", "W", "RMW", "_"])]:
                mem(e, runtime, 2, tags)
                require(e.get("source") is None, "runtime source separation")
            require(cw["rmw_load"] == cr["id"] and label["successor"] is None, "runtime pair/exit")
            require(r["writes"]["type"] == cr["writes"]["type"] == "bv2"
                    and not r["reads"] and not cr["reads"] and not arg["reads"], "runtime writer/read types")
            literal(ret["return_value"], 64, 0)
            rv, cv = z3.BitVec("startup", 2), z3.BitVec("completion", 2)
            proof.prove("startup-" + str(thread["id"]),
                        core_expr(assume["condition"], {r["writes"]["name"]: rv}) == (z3.Extract(0, 0, rv) != 0))
            proof.prove("completion-" + str(thread["id"]),
                        core_expr(cw["value"], {cr["writes"]["name"]: cv}) == (cv & 2))
            env = {arg["writes"]["name"]: obj(activation["argument"])}
            body, index, assertions = events[4:-4], 0, []

            def writer(e, v):
                require(e["writes"] and type_of(e["writes"]["type"]) == v.sort(), "actual writer type")
                env[e["writes"]["name"]] = v

            def pure():
                nonlocal index
                while index < len(body) and body[index]["class"] in {"Local", "StringAnnotation"}:
                    e = body[index]
                    if e["class"] == "Local":
                        writer(e, qexpr(e["expr"], env))
                    index += 1

            def take(cls):
                nonlocal index
                pure()
                require(index < len(body) and body[index]["class"] == cls, "complete Program worker effect census: " + cls)
                e = body[index]
                index += 1
                return e

            from z3.z3util import get_vars
            variables = {v.sexpr(): v for op in activation["ops"] for expr in op.values()
                         if isinstance(expr, z3.AstRef) for v in get_vars(expr)}
            renaming = [(v, z3.Const(f"activation-{thread['id']}:" + n, v.sort())) for n, v in variables.items()]
            ops = [{k: z3.substitute(v, *renaming) if isinstance(v, z3.AstRef) else v
                    for k, v in op.items()} for op in activation["ops"]]
            for oi, op in enumerate(ops):
                if op["kind"] == "read":
                    e = take("Load")
                    require(set(e["tags"]) == {"M", "R", "_"} and e["width"] == op["width"], "ordinary read tags/width")
                    proof.prove(f"thread-{thread['id']}-read-{oi}-address", qexpr(e["addr"], env) == obj("@" + op["object"]))
                    writer(e, op["value"])
                elif op["kind"] == "asm":
                    interface = op["interface"]
                    rd = take("Load")
                    require(set(rd["tags"]) == {"A", "M", "R", "RMW", "_"}
                            and rd["width"] == interface["width"], "RMW read width/labels")
                    proof.prove(f"thread-{thread['id']}-asm-{oi}-read-address", qexpr(rd["addr"], env) == obj(op["pointer"]))
                    writer(rd, op["value"])
                    wr = take("RMWStore")
                    require(set(wr["tags"]) == {"A", "M", "W", "RMW", "_"}
                            and wr["width"] == interface["width"] and wr["rmw_load"] == rd["id"],
                            "actual RMW width/labels/pair")
                    block = parse(interface["normalized"], interface["width"])
                    substitutions = []
                    for slot, (symbol, bits) in initial_bindings(block).items():
                        v = obj(op["pointer"]) if slot == interface["slots"]["pointer"] else op["input"]
                        substitutions.append((z3.BitVec(symbol, bits), v))
                    expected, outputs, _ = reference(block)
                    require(len(expected) == 1 and expected[0]["kind"] == "RMW", "reference event shape")
                    substitutions.append((expected[0]["read"], op["value"]))
                    sub = lambda x: z3.substitute(x, *substitutions)
                    prefix = f"thread-{thread['id']}-asm-{oi}"
                    proof.prove(prefix + "-write-address", qexpr(wr["addr"], env) == sub(expected[0]["addr"]))
                    proof.prove(prefix + "-write-value", qexpr(wr["value"], env) == sub(expected[0]["value"]))
                    proof.prove(prefix + "-write-presence", sub(expected[0]["has_write"]))
                    proof.prove(prefix + "-reference-return", sub(outputs["o" + str(interface["register_output"])]) == op["value"])
                    certificates.append({"thread": thread["id"], "source_operation": oi,
                                         "create_index": activation["create_index"],
                                         "worker_definition": interface["worker_definition"],
                                         "worker_name": activation["worker"],
                                         "call_context": interface["call_context"],
                                         "llvm_line_index": interface["llvm_line_index"],
                                         "read": rd["id"], "write": wr["id"],
                                         "actual_read_register": rd["writes"], "input": op["input"].sexpr(),
                                         "output": op["value"].sexpr(), "result": "OPEN_RMW_EXACT"})
                elif op["kind"] == "assert":
                    e = take("Assert")
                    require(e["error_message"] == "user assertion", "worker monitor role")
                    proof.prove(f"thread-{thread['id']}-monitor-{e['id']}", qexpr(e["condition"], env) == op["condition"])
                    assertions.append(e["id"])
                elif op["kind"] == "return":
                    pure()
                    require(index == len(body), "unconsumed worker effects")
            continuations.append({"thread": thread["id"], "assertion_events": assertions})
        require(seen_creators == set(by_creator), "uncovered source create")
        actual = [(c["thread"], c["llvm_line_index"]) for c in certificates]
        endpoints = [e for c in certificates for e in (c["read"], c["write"])]
        require(len(actual) == len(expected_coverage) and set(actual) == expected_coverage and len(set(endpoints)) == len(endpoints),
                "complete disjoint static-call by activation product")
        report.update(result="TYPED_WORKERS_EXACT", actual_worker_threads=[t["id"] for t in threads],
                      continuations=continuations, regions=certificates,
                      scope={"functions": sorted(worker_names), "coverage": "dependent-create-call-union"})
    except Exception as error:
        report["reason"] = str(error)
    save_certificate(out, report)
    return report


def check_program_host(q, prepared, coverage, out):
    report = {"result": "REJECT", "program_verdict_eligible": False,
              "domain": "D1a typed entry; original Gamma runtime contract"}
    proof = Obligations(report)
    try:
        require(coverage["result"] == "TYPED_WORKERS_EXACT", "typed worker premise")
        report.update(program_main(q, prepared["main_ops"], prepared["objects"], coverage, proof,
                                   mapped_path(prepared["receipt"]["source_path"], prepared["receipt"])))
        report.update(result=prepared["profile"] + "_OPEN_HOST_EXACT", acceptance_domain=prepared["profile"])
    except Exception as error:
        report["reason"] = str(error)
    save_certificate(out, report)
    return report

"""P0: exhaustive open host comparison for a strict, finite subset of D0.

No execution result or final shared value enters this comparison. Registers are
obtained from actual operands/writers, never from an LLVM-to-backend name rule.
Unsupported source statements, IR instructions and Program events reject.
"""
import json
import re
from pathlib import Path
import z3
from frontend.gnu import Reject
from certification.provenance import (
    authenticate_capture, require, unique, children, single, unsigned, same_type,
    evaluate, call_arguments, mapped_path,
)
from certification.continuation import core_expr, SSA, VALUE
from certification.evidence import save_certificate


class Obligations:
    def __init__(self, report):
        self.report = report
        report["obligations"] = []

    def prove(self, name, statement):
        solver = z3.Solver()
        solver.set(timeout=10000)
        solver.add(z3.Not(statement))
        answer = str(solver.check())
        row = {"name": name, "result": answer, "expected": "unsat", "smt2": solver.to_smt2()}
        if answer == "sat":
            row["model"] = str(solver.model())
        if answer == "unknown":
            row["reason"] = solver.reason_unknown()
        self.report["obligations"].append(row)
        require(answer == "unsat", "unproved P0 obligation: " + name)


def signature_void(ty):
    return ty.get("canonical") == "void *" and ty.get("bits") == 64 and ty.get("qualifiers") == 0


def source_main(obs, receipt, raw_ast, worker, *, typed_entry=False):
    globals_ = {g["id"]: g for g in obs["globals"]}
    require(len(globals_) == len(obs["globals"]), "duplicate source global identity")
    raw_globals = [n for n in raw_ast["inner"] if n.get("kind") == "VarDecl"]
    require({n["id"] for n in raw_globals} == set(globals_), "raw/observer global census")
    objects = {}
    for g in globals_.values():
        n = unique([n for n in raw_globals if n["id"] == g["id"]], "global AST declaration")
        initial = 0
        if typed_entry and n.get("init") == "c":
            init = unique(n.get("inner", []), "single global initializer")
            if init["kind"] == "ImplicitCastExpr":
                require(init.get("castKind") == "IntegralCast", "global initializer conversion")
                init = unique(init.get("inner", []), "single literal initializer")
            require(init["kind"] == "IntegerLiteral" and not init.get("inner"),
                    "global initializer must be an integer literal")
            initial = int(init["value"])
            require(0 <= initial < 2 ** g["type"]["bits"], "global initializer representability")
        require(g["global_storage"] and unsigned(g["type"])
                and (typed_entry or (not n.get("inner") and "init" not in n))
                and (not typed_entry or (not n.get("inner") and "init" not in n) or n.get("init") == "c")
                and "storageClass" not in n and "tls" not in n
                and n["name"] == g["name"] and n.get("mangledName") == g["name"],
                "P0 requires zero-initialized unsigned file-scope definitions")
        require(g["name"] not in objects and not g["name"].startswith("__com_"),
                "source object identity/private namespace")
        objects[g["name"]] = {"width": g["type"]["bits"], "initial": initial, "declaration": g["id"]}
    main = unique([f for f in obs["functions"] if f["name"] == "main"], "unique C main")
    require(not main["parameters"] and main["return_type"]["canonical"] == "int"
            and main["return_type"]["bits"] == 32 and main["body"]["kind"] == "CompoundStmt",
            "unsupported main signature/body")
    symbols = {s["id"]: s for s in obs["symbols"]}
    worker_names = {worker} if isinstance(worker, str) else set(worker)
    worker_ids = {unique([s["id"] for s in obs["symbols"] if s["name"] == name],
                         "worker declaration"): name for name in worker_names}
    require(worker_ids, "empty worker target census")
    signatures = {
        "pthread_create": "int (unsigned long *, const void *, void *(*)(void *), void *)",
        "pthread_join": "int (unsigned long, void **)",
        "__VERIFIER_assert": "void (int)",
    }
    handles, created, joined, ops = {}, set(), set(), []

    def ref(e):
        require(e["kind"] == "DeclRefExpr" and not children(e), "direct declaration required")
        return e["decl"]

    def null(e, ty):
        require(e["kind"] == "ImplicitCastExpr" and e["cast"] == "NullToPointer"
                and e["type"]["canonical"] == ty and e["type"].get("bits") == 64,
                "unsupported null argument")
        require(evaluate(single(e), {}, globals_)["value"] == "0", "nonzero null argument")

    statements = children(main["body"])
    require(statements and statements[-1]["kind"] == "ReturnStmt", "main must end in return")
    for pos, stmt in enumerate(statements):
        loc = stmt["begin"]["expansion"]
        require(loc["valid"] and mapped_path(loc["path"], receipt) ==
                mapped_path(receipt["source_path"], receipt), "main source identity")
        at = {"line": loc["line"], "offset": loc["offset"], "statement": pos}
        kind = stmt["kind"]
        if kind == "DeclStmt":
            require(not ops and not children(stmt) and stmt.get("declarations"), "late/initialized main local")
            for d in stmt["declarations"]:
                require(d["id"] not in handles and d["init"] is None and unsigned(d["type"])
                        and d["type"]["canonical"] == "unsigned long" and d["type"]["bits"] == 64,
                        "main local is not an uninitialized pthread handle")
                handles[d["id"]] = d
        elif kind == "CallExpr":
            symbol = symbols[stmt["callee"]]
            name = symbol["name"]
            require(name in signatures and symbol["type"]["canonical"] == signatures[name],
                    "unsupported call signature")
            args = call_arguments(stmt, symbol["id"])
            if name == "pthread_create":
                require(len(args) == 4 and not joined and args[0]["kind"] == "UnaryOperator"
                        and args[0]["opcode"] == "&" and args[0]["type"]["canonical"] == "unsigned long *",
                        "unsupported create")
                h = ref(single(args[0]))
                require(h in handles and h not in created and same_type(single(args[0])["type"], handles[h]["type"]),
                        "create handle declaration")
                null(args[1], "const void *")
                require(args[2]["kind"] == "ImplicitCastExpr" and args[2]["cast"] == "FunctionToPointerDecay"
                        and ref(single(args[2])) in worker_ids, "create target")
                argument = "null"
                if typed_entry and args[3].get("cast") == "BitCast":
                    require(args[3]["kind"] == "ImplicitCastExpr"
                            and signature_void(args[3]["type"]), "thread pointer conversion")
                    value = evaluate(single(args[3]), {}, globals_)
                    require(value["kind"] == "value" and value["value"].startswith("@")
                            and value["value"][1:] in objects, "thread argument is not a complete global")
                    argument = value["value"]
                else:
                    null(args[3], "void *")
                created.add(h)
                ops.append({"kind": "create", "handle": h, "target": worker_ids[ref(single(args[2]))],
                            "argument": argument, **at})
            elif name == "pthread_join":
                require(len(args) == 2 and args[0]["kind"] == "ImplicitCastExpr"
                        and args[0]["cast"] == "LValueToRValue", "unsupported join")
                h = ref(single(args[0]))
                require(h in created and h not in joined and same_type(args[0]["type"], handles[h]["type"])
                        and same_type(single(args[0])["type"], handles[h]["type"]), "join source association")
                null(args[1], "void **")
                joined.add(h)
                ops.append({"kind": "join", "handle": h, **at})
            else:
                require(len(args) == 1 and created == joined == set(handles) and created,
                        "assertion before complete joins")
                e = args[0]
                require(e["kind"] == "BinaryOperator" and e["opcode"] in {"==", "!="}
                        and e["type"]["canonical"] == "int" and e["type"]["bits"] == 32
                        and len(children(e)) == 2, "unsupported main assertion expression")
                left, right = children(e)
                require(left["kind"] == "ImplicitCastExpr" and left["cast"] == "LValueToRValue",
                        "main assertion requires an explicit shared read")
                gid = ref(single(left))
                require(gid in globals_ and same_type(left["type"], globals_[gid]["type"])
                        and same_type(single(left)["type"], left["type"]), "shared read type/declaration")
                value = evaluate(right, {}, globals_)
                require(value["kind"] == "value" and same_type(value["type"], left["type"]),
                        "main comparison operand type")
                width = left["type"]["bits"]
                u = z3.BitVec("p0-main-read-" + str(sum(o["kind"] == "read" for o in ops)), width)
                ops.append({"kind": "read", "object": globals_[gid]["name"], "width": width, "value": u, **at})
                constant = z3.BitVecVal(int(value["value"]), width)
                ops.append({"kind": "assert", "condition": u == constant if e["opcode"] == "==" else u != constant, **at})
        elif kind == "ReturnStmt":
            require(pos == len(statements) - 1 and created == joined == set(handles) and created
                    and evaluate(single(stmt), {}, globals_)["value"] == "0",
                    "main return/lifecycle domain")
            ops.append({"kind": "return", **at})
        else:
            raise Reject("unconsumed C main statement: " + kind)
    require(any(o["kind"] == "assert" for o in ops), "no source main safety monitor")
    return objects, ops


def llvm_main(module, source_ops, objects, proof):
    lines = module.splitlines()
    require('target triple = "x86_64-pc-linux-gnu"' in lines
            and 'target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"' in lines,
            "LLVM ABI outside pinned D0")
    tuning = ('"no-trapping-math"="true" "stack-protector-buffer-size"="8" '
              '"target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic"')
    groups = dict(re.findall(r"^attributes #(\d+) = \{ (.*) \}$", module, re.M))
    require(groups == {
        "0": 'nounwind uwtable "min-legal-vector-width"="0" ' + tuning,
        "1": "mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)",
        "2": tuning, "3": "nounwind",
    }, "LLVM attribute groups outside pinned semantics")
    declarations = [s for s in lines if s.startswith("declare ")]
    cleaned = [re.sub(r"declare !dbg !\d+ ", "declare ", s) for s in declarations]
    require(len(cleaned) == 5 and set(cleaned) == {
        "declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1",
        "declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1",
        "declare void @__VERIFIER_assert(i32 noundef) local_unnamed_addr #2",
        "declare i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #2",
        "declare i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #2",
    }, "LLVM intrinsic/external declaration census")
    for line in lines:
        if "call " in line:
            require(re.search(r"\) #3(?:, !|\s*$)", line) is not None, "unsupported call attributes")
    begin = unique([i for i, s in enumerate(lines) if re.match(r"define .*@main\(", s)], "LLVM main")
    require(re.fullmatch(r"define (?:dso_local )?(?:noundef )?i32 @main\(\) (?:local_unnamed_addr )?#\d+ !dbg !\d+ \{",
                         lines[begin]), "LLVM main signature")
    require(re.search(r" #0 !dbg", lines[begin]) is not None, "main attribute binding")
    end = next(i for i in range(begin + 1, len(lines)) if lines[i] == "}")
    locations = dict(re.findall(r"!(\d+) = !DILocation\(line: (\d+)", module))
    raw_globals = [s for s in lines if s.startswith("@")]
    require(len(raw_globals) == len(objects), "LLVM complete global census")
    for name, obj in objects.items():
        m = unique([re.fullmatch(r"@" + re.escape(name) + r" = (?:dso_local )?global i(32|64) (\d+), align (\d+)", s)
                    for s in raw_globals if s.startswith("@" + name + " = ")], "LLVM global declaration")
        require(m is not None and int(m[1]) == obj["width"] and int(m[2]) == obj["initial"]
                and int(m[3]) >= obj["width"] // 8, "C/LLVM initialization")
        obj["llvm_alignment"] = int(m[3])
    env, allocas, live, bound, defs = {}, set(), set(), {}, set()
    index = 0
    consumed = []
    status_defs = set()

    def consume(kind, line):
        nonlocal index
        require(index < len(source_ops) and source_ops[index]["kind"] == kind, "LLVM/source main operation census")
        op = source_ops[index]
        dbg = re.search(r"!dbg !(\d+)", line)
        if kind != "return":
            require(dbg is not None and int(locations[dbg[1]]) == op["line"], "LLVM/source main location")
        index += 1
        return op

    def val(s, w):
        v = env[s] if s.startswith("%") else z3.BitVecVal(int(s), w)
        require(z3.is_bv(v) and v.size() == w, "main SSA operand type")
        return v

    for lineno in range(begin + 1, end):
        raw = lines[lineno].strip()
        if not raw or raw.startswith(";"):
            continue
        text = re.sub(r"(?:, !(?:dbg|tbaa) !\d+)+$", "", raw)
        consumed.append({"line_index": lineno, "text": raw})
        d = re.match(rf"({SSA}) = ", text)
        if d:
            require(d[1] not in defs, "duplicate LLVM SSA")
            defs.add(d[1])
        m = re.fullmatch(rf"({SSA}) = alloca i64, align 8", text)
        if m:
            require(index == 0, "late LLVM handle allocation")
            allocas.add(m[1])
            continue
        m = re.fullmatch(rf"call void @llvm.lifetime.(start|end).p0\(i64 8, ptr nonnull ({SSA})\)(?: #\d+)?", text)
        if m:
            require(m[2] in allocas, "lifetime of unknown object")
            if m[1] == "start":
                require(index == 0 and m[2] not in live, "invalid lifetime start")
                live.add(m[2])
            else:
                require(index == len(source_ops) - 1 and m[2] in live, "invalid lifetime end")
                live.remove(m[2])
            continue
        ptr = r"ptr(?: noundef)?(?: nonnull)? "
        m = re.fullmatch(rf"({SSA}) = call i32 @pthread_create\({ptr}({SSA}), {ptr}null, {ptr}@([-\w.$]+), {ptr}(null|@[-\w.$]+)\)(?: #\d+)?", text)
        if m:
            op = consume("create", raw)
            require(m[2] in live and m[2] not in bound and m[3] == op["target"], "LLVM create binding")
            require(m[4] == op.get("argument", "null"), "LLVM thread argument binding")
            bound[m[2]] = op["handle"]
            status_defs.add(m[1])
            continue
        m = re.fullmatch(rf"({SSA}) = load i(32|64), ptr (@[-\w.$]+|{SSA}), align (\d+)", text)
        if m:
            w = int(m[2])
            require(int(m[4]) >= w // 8, "underaligned LLVM read")
            if m[3].startswith("%"):
                require(w == 64 and m[3] in live and m[3] in bound, "uninitialized handle read")
                env[m[1]] = ("handle", bound[m[3]])
            else:
                op = consume("read", raw)
                require(m[3][1:] == op["object"] and w == op["width"], "LLVM shared read binding")
                env[m[1]] = op["value"]
            continue
        m = re.fullmatch(rf"({SSA}) = call i32 @pthread_join\(i64(?: noundef)? ({SSA}), {ptr}null\)(?: #\d+)?", text)
        if m:
            op = consume("join", raw)
            require(env.get(m[2]) == ("handle", op["handle"]), "LLVM join association")
            status_defs.add(m[1])
            continue
        m = re.fullmatch(rf"({SSA}) = icmp (eq|ne) i(32|64) ({VALUE}), ({VALUE})", text)
        if m:
            a, b = val(m[4], int(m[3])), val(m[5], int(m[3]))
            env[m[1]] = z3.If(a == b if m[2] == "eq" else a != b, z3.BitVecVal(1, 1), z3.BitVecVal(0, 1))
            continue
        m = re.fullmatch(rf"({SSA}) = zext i1 ({SSA}) to i32", text)
        if m:
            env[m[1]] = z3.ZeroExt(31, val(m[2], 1))
            continue
        m = re.fullmatch(rf"(?:tail )?call void @__VERIFIER_assert\(i32(?: noundef)? ({VALUE})\)(?: #\d+)?", text)
        if m:
            op = consume("assert", raw)
            proof.prove("c-llvm-main-monitor-" + str(index), op["condition"] == (val(m[1], 32) != 0))
            continue
        if text == "ret i32 0":
            consume("return", raw)
            continue
        raise Reject("unconsumed LLVM main instruction: " + text)
    require(index == len(source_ops) and not live and set(bound) == allocas, "incomplete LLVM host coverage")
    # Status return values are permitted only when genuinely unused.
    body = "\n".join(s["text"] for s in consumed)
    for name in status_defs:
        require(len(re.findall(re.escape(name) + r"(?![-\w.$])", body)) == 1, "used pthread status outside P0")
    return consumed


def registers(expr):
    if not isinstance(expr, dict):
        return set()
    if expr.get("kind") == "register":
        return {(expr["name"], expr["type"])}
    return set().union(*(registers(x) for x in expr.get("args", [])))


def basic_event(e, nxt):
    require(e.get("complete") is True and e["successor"] == nxt, "incomplete/disconnected Program event")
    require(e["cf_implies_exec"] is (e["class"] != "ThreadJoin"), "unexpected execution predicate")
    expected = set()
    for key in ("addr", "value", "expr", "guard", "condition", "return_value"):
        expected |= registers(e.get(key))
    for arg in e.get("arguments", []):
        expected |= registers(arg)
    require({(r["name"], r["type"]) for r in e["reads"]} == expected
            and len(e["reads"]) == len(expected), "actual read census disagrees with expressions")
    writers = {"Local", "Load", "ThreadJoin", "ThreadArgument"}
    require(bool(e["writes"]) == (e["class"] in writers), "unexpected register writer")
    if e["class"] not in {"Load", "Store", "RMWStore", "Init"}:
        require(e["tags"] == [], "unexpected nonmemory semantic tag")
    require(("jump" in e) == (e["class"] == "CondJump"), "unexpected control edge")


def addr(e):
    a = e["addr"]
    require(a["kind"] == "object" and a["type"] == "bv64" and a["complete"], "non-object Program address")
    return a["name"]


def mem(e, name, width, tags):
    require(addr(e) == name and e["width"] == width and set(e["tags"]) == set(tags), "Program memory effect mismatch")


def literal(expr, width, value):
    require(expr.get("complete") is True and expr.get("kind") == "int"
            and expr.get("type") == f"bv{width}" and int(expr["value"]) == value, "literal value/type mismatch")


def program_main(q, ops, objects, coverage, proof, path):
    main = unique([t for t in q["threads"] if t["name"] == "main"], "actual main thread")
    workers = {t["id"]: t for t in q["threads"] if t["id"] in coverage["actual_worker_threads"]}
    for t in q["threads"]:
        es = t["events"]
        for i, e in enumerate(es):
            # Also check the worker field census independently of its semantic
            # region/continuation interpreters. P0 deliberately rejects extra tags.
            basic_event(e, es[i + 1]["id"] if i + 1 < len(es) else None)
    events = [e for e in main["events"] if e["class"] != "StringAnnotation"]
    require(events[0]["class"] == "ThreadStart" and events[0]["creator"] is None, "main entry")
    i, bindings, env, links, user_asserts, runtime_asserts = 1, {}, {}, [], [], []
    protocol = {}

    def take(classes, op):
        nonlocal i
        block = events[i:i + len(classes)]
        require([e["class"] for e in block] == classes, "main operation/event census: expected " + ",".join(classes))
        i += len(classes)
        for e in block:
            if e["class"] not in {"ThreadReturn", "Label"}:
                require(e.get("source") == {"path": path, "line": op["line"]}, "Program/main source identity")
        links.append({"source": {k: v for k, v in op.items() if k not in {"value", "condition"}},
                      "events": [e["id"] for e in block]})
        return block

    def writer(e, width, value, fresh=True):
        r = e["writes"]
        require(r["type"] == f"bv{width}" and (not fresh or r["name"] not in env), "Program writer type/alias")
        env[r["name"]] = value
        return r["name"]

    for op in ops:
        kind = op["kind"]
        if kind == "create":
            store, create = take(["Store", "ThreadCreate"], op)
            tid, obj = create["spawned_thread"], addr(store)
            require(tid in workers and tid not in [v[0] for v in bindings.values()]
                    and workers[tid]["name"] == op["target"] and obj not in objects and obj not in protocol,
                    "Program create/worker/private-object identity")
            mem(store, obj, 2, ["M", "W", "_"])
            literal(store["value"], 2, 3)
            require(len(create["arguments"]) == 1, "worker argument count")
            argument = op.get("argument", "null")
            if argument == "null":
                literal(create["arguments"][0], 64, 0)
            else:
                actual = create["arguments"][0]
                require(actual.get("complete") is True and actual.get("kind") == "object"
                        and actual.get("type") == "bv64" and actual.get("name") == argument[1:],
                        "Program thread argument binding")
            wes = workers[tid]["events"]
            require(wes[0]["creator"] == create["id"] and addr(wes[1]) == obj
                    and addr(wes[-4]) == obj and addr(wes[-3]) == obj,
                    "created protocol object differs from checked worker")
            bindings[op["handle"]] = (tid, obj)
            protocol[obj] = {"width": 2, "initial": 0, "size": 1, "worker": tid}
        elif kind == "join":
            a, r, w, b, j, assume, zero, jump, label, monitor = take(
                ["Local", "Load", "RMWStore", "CondJump", "ThreadJoin", "Assume",
                 "Local", "CondJump", "Label", "Assert"], op)
            tid, obj = bindings[op["handle"]]
            require(j["joined_thread"] == tid, "Program join association differs from source handle")
            state, status = z3.BitVec("p0-join-read-" + str(r["id"]), 2), z3.BitVec("p0-join-status-" + str(a["id"]), 8)
            literal(a["expr"], 8, 3)
            status_name = writer(a, 8, status)
            writer(r, 2, state)
            mem(r, obj, 2, ["A", "M", "R", "RMW", "_"])
            mem(w, obj, 2, ["A", "M", "W", "RMW", "_"])
            require(w["rmw_load"] == r["id"], "join actual RMW pairing")
            proof.prove("join-update-" + str(w["id"]), core_expr(w["value"], env) == (state & 1))
            proof.prove("join-branch-" + str(b["id"]), core_expr(b["guard"], env) == (z3.Extract(1, 1, state) == 0))
            proof.prove("join-assume-" + str(assume["id"]), core_expr(assume["condition"], env) == (z3.Extract(0, 0, state) == 0))
            require(b["jump"] == jump["jump"] == label["id"], "join CFG not closed/forward")
            proof.prove("join-forward-" + str(jump["id"]), core_expr(jump["guard"], env))
            writer(j, 64, z3.BitVec("p0-join-unused-" + str(j["id"]), 64))
            require(zero["writes"] == a["writes"], "join status destination")
            literal(zero["expr"], 8, 0)
            require(monitor["error_message"] == "Invalid thread id in pthread_join.", "runtime monitor role")
            proof.prove("join-monitor-" + str(monitor["id"]), core_expr(monitor["condition"], env) == (status != 1))
            runtime_asserts.append(monitor["id"])
            # status is intentionally free for monitor comparison, not assumed zero.
            require(status_name not in {n for n, _ in registers(jump["guard"])}, "join state leakage")
        elif kind == "read":
            e, = take(["Load"], op)
            mem(e, op["object"], op["width"], ["M", "R", "_"])
            writer(e, op["width"], op["value"])
        elif kind == "assert":
            e, = take(["Assert"], op)
            require(e["error_message"] == "user assertion", "user monitor role")
            proof.prove("c-program-main-monitor-" + str(e["id"]), core_expr(e["condition"], env) == op["condition"])
            user_asserts.append(e["id"])
        elif kind == "return":
            e, = take(["ThreadReturn"], op)
            literal(e["return_value"], 32, 0)
    require(i == len(events) - 1 and events[i]["class"] == "Label"
            and events[i]["successor"] is None, "unconsumed final main events")
    require({v[0] for v in bindings.values()} == set(workers), "main activation coverage")
    expected_objects = {**objects, **protocol}
    require({m["name"] for m in q["memory"]} == set(expected_objects)
            and len(q["memory"]) == len(expected_objects), "complete Program object census")
    for m in q["memory"]:
        o = expected_objects[m["name"]]
        require(not m["thread_local"] and set(m["initial"]) == {"0"}, "object locality/initial offsets")
        literal(m["size"], 64, o.get("size", o["width"] // 8))
        require(m["alignment"]["kind"] == "int" and int(m["alignment"]["value"]) >= o.get("llvm_alignment", 1),
                "Program object alignment")
        literal(m["initial"]["0"], o["width"], o["initial"])
    init_ids, initialized = [], set()
    for t in q["threads"]:
        if t["id"] in workers or t["id"] == main["id"]:
            continue
        es = t["events"]
        require([e["class"] for e in es] == ["ThreadStart", "Init", "Label"]
                and es[0]["creator"] is None, "uncovered thread/event")
        e = es[1]
        name = addr(e)
        require(name in expected_objects and name not in initialized, "Init object coverage")
        o = expected_objects[name]
        mem(e, name, o["width"], ["IW", "M", "W", "_"])
        literal(e["value"], o["width"], o["initial"])
        initialized.add(name)
        init_ids.extend(x["id"] for x in es)
    require(initialized == set(expected_objects), "missing initialization event")
    worker_asserts = [n for c in coverage["continuations"] for n in c["assertion_events"]]
    all_asserts = [e["id"] for t in q["threads"] for e in t["events"] if e["class"] == "Assert"]
    require(sorted(all_asserts) == sorted(user_asserts + worker_asserts + runtime_asserts), "complete safety monitor census")
    return {"main_links": links, "user_assertions": user_asserts + worker_asserts,
            "runtime_assertions": runtime_asserts, "all_assertions": all_asserts,
            "protocol_objects": protocol, "main_events": [e["id"] for e in main["events"]],
            "worker_events": [e["id"] for t in workers.values() for e in t["events"]],
            "initialization_events": init_ids, "main_shared_writes": [],
            "open_read_symbols": [str(o["value"]) for o in ops if o["kind"] == "read"]}


def check_host(capture, module, q, coverage, out):
    report = {"result": "REJECT", "program_verdict_eligible": False,
              "domain": "P0 strict subset of D0; zero-initialized unsigned globals; straight-line main; constant worker inputs",
              "trusted_runtime": "Gamma_runtime of unchanged E2E-SAFE, NOT proved by protocol shape"}
    proof = Obligations(report)
    try:
        require(coverage["result"] == "SUPPORTED_WORKERS_EXACT", "missing worker proof/coverage")
        obs, receipt, _, actual_module = authenticate_capture(capture)
        require(module == actual_module, "host module differs from capture")
        raw_ast = json.loads((Path(capture) / "observer.json.ast.json").read_bytes())
        objects, ops = source_main(obs, receipt, raw_ast, coverage["scope"]["function"])
        report["llvm_instructions"] = llvm_main(module, ops, objects, proof)
        report["objects"] = objects
        report.update(program_main(q, ops, objects, coverage, proof, mapped_path(receipt["source_path"], receipt)))
        report["result"] = "D0_OPEN_HOST_EXACT"
    except Exception as error:
        report["reason"] = str(error)
    save_certificate(out, report)
    return report

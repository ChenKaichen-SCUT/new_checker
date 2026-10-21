"""Finite ordered effect correspondence and independently checked boundaries.

No PD omission, source-safety premise, supplied register map or local rf/co.
The producer only proposes a plan. check() reconstructs raw facts again.
Unsupported source/LLVM grammar remains rejected by the original adapters.
"""
from pathlib import Path
import json
import z3
from z3.z3util import get_vars
from certification.provenance import require, unique
from certification.interface import sha
from certification.p0_host import Obligations, basic_event, mem, literal
from certification.p1_entry import obj, qexpr, initial_bindings, parse, reference
from certification.continuation import core_expr
from certification.evidence import save_certificate, save_json


def digest(value):
    return sha(json.dumps(value, sort_keys=True, separators=(",", ":")).encode())


def expressions(unit):
    return unit["fields"]


def serial(unit):
    return {k: ({f: v.sexpr() for f, v in value.items()} if k == "fields"
                else value.sexpr() if isinstance(value, z3.AstRef) else value)
            for k, value in unit.items()}


def source_units(activation, proof):
    units = []
    for oi, op in enumerate(activation["ops"]):
        kind = op["kind"]
        if kind == "return":
            require(oi == len(activation["ops"]) - 1, "source early return")
            continue
        u = {"id": f"a{activation['create_index']}:u{oi}", "kind": kind,
             "fields": {}, "source_operation": oi}
        if kind == "assert":
            u["fields"]["condition"] = op["condition"]
        elif kind == "read":
            u.update(width=op["width"], response=op["value"])
            u["fields"]["address"] = obj("@" + op["object"])
        elif kind == "asm":
            f = op["interface"]
            block = parse(f["normalized"], f["width"])
            expected, outputs, _ = reference(block)
            require(len(expected) == 1 and expected[0]["kind"] == "RMW", "source FAA footprint")
            substitutions = []
            for slot, (symbol, width) in initial_bindings(block).items():
                value = obj(op["pointer"]) if slot == f["slots"]["pointer"] else op["input"]
                substitutions.append((z3.BitVec(symbol, width), value))
            substitutions.append((expected[0]["read"], op["value"]))
            sub = lambda e: z3.substitute(e, *substitutions)
            proof.prove(u["id"].replace(":", "-") + "-reference-return",
                        sub(outputs["o" + str(f["register_output"])]) == op["value"])
            proof.prove(u["id"].replace(":", "-") + "-unconditional", sub(expected[0]["has_write"]))
            u.update(width=f["width"], response=op["value"], llvm_site=f["llvm_line_index"],
                     call_context=f["call_context"], source_definition=f["worker_definition"])
            u["fields"] = {"address": sub(expected[0]["addr"]),
                           "write_address": sub(expected[0]["addr"]),
                           "write_value": sub(expected[0]["value"])}
        else:
            raise ValueError("unsupported source unit " + kind)
        units.append(u)
    require(units, "empty source activation")
    return units


def q_units(thread, argument):
    """Parse actual Q independently of source kinds/counts/expressions.

    The current runtime entry/exit is checked separately. Every body node is
    assigned. Public effects, not source coordinates or register spellings,
    determine the cutpoints. Internal pure nodes may occur between RMW ends.
    """
    body = thread["events"][4:-4]
    arg = thread["events"][3]
    env = {arg["writes"]["name"]: obj(argument)}
    definitions = {arg["writes"]["name"]: arg["id"]}
    units, pending, versions, pending_rmw = [], [], [], None

    def write(e, value):
        require(e["writes"] and e["writes"]["type"] == "bv" + str(value.size()), "Q definition type")
        name = e["writes"]["name"]
        definitions[name] = e["id"]
        env[name] = value
        versions.append({"event": e["id"], "register": name, "type": e["writes"]["type"]})

    def pure_read_check(e):
        for r in e["reads"]:
            require(r["name"] in env and env[r["name"]].sort() ==
                    (z3.BoolSort() if r["type"] == "bool" else z3.BitVecSort(int(r["type"][2:]))),
                    "Q undefined or mistyped register use")

    for e in body:
        pending.append(e["id"])
        pure_read_check(e)
        cls = e["class"]
        if cls == "StringAnnotation":
            require(not e["reads"] and e["writes"] is None, "annotation has effects")
            continue
        if cls == "Local":
            v = qexpr(e["expr"], env)
            require(e["writes"] and e["writes"]["type"] ==
                    ("bool" if z3.is_bool(v) else "bv" + str(v.size())), "Q Local type")
            definitions[e["writes"]["name"]] = e["id"]
            env[e["writes"]["name"]] = v
            versions.append({"event": e["id"], "register": e["writes"]["name"], "type": e["writes"]["type"]})
            continue
        if cls == "Load":
            require(pending_rmw is None, "public event inside RMW pair")
            require(e["width"] in {32, 64}, "unsupported user read width")
            tags = set(e["tags"])
            require(tags in ({"M", "R", "_"}, {"A", "M", "R", "RMW", "_"}), "Q read labels")
            address = qexpr(e["addr"], env)
            response = z3.BitVec(f"actc-q-{thread['id']}-read-{e['id']}", e["width"])
            write(e, response)
            u = {"id": e["id"], "kind": "asm" if "RMW" in tags else "read",
                 "width": e["width"], "response": response, "read": e["id"],
                 "fields": {"address": address}}
            if "RMW" in tags:
                pending_rmw = u
                continue
        elif cls == "RMWStore":
            require(pending_rmw is not None and e["rmw_load"] == pending_rmw["read"]
                    and e["width"] == pending_rmw["width"]
                    and set(e["tags"]) == {"A", "M", "W", "RMW", "_"}, "Q real RMW pairing/labels")
            u, pending_rmw = pending_rmw, None
            u["write"] = e["id"]
            u["fields"].update(write_address=qexpr(e["addr"], env), write_value=qexpr(e["value"], env))
        elif cls == "Assert":
            require(pending_rmw is None and e["error_message"] == "user assertion", "Q assertion role/position")
            u = {"id": e["id"], "kind": "assert", "fields": {"condition": qexpr(e["condition"], env)}}
            require(z3.is_bool(u["fields"]["condition"]), "Q assertion type")
        else:
            raise ValueError("unconsumed Q body event " + cls)
        u["events"] = pending
        pending = []
        units.append(u)
    require(pending_rmw is None and units, "unclosed/empty actual effect sequence")
    units[-1]["events"].extend(pending)
    require([n for u in units for n in u["events"]] == [e["id"] for e in body], "Q body partition")
    return units, versions


def recover(q, prepared, out):
    """Trusted finite fact extraction; it takes no proposed map or region."""
    report = {"result": "REJECT", "program_verdict_eligible": False}
    proof = Obligations(report)
    try:
        require(q["format"] == "dat3m-core-snapshot-v1" and q["arch"] == "TSO", "Q model")
        ids = [e["id"] for t in q["threads"] for e in t["events"]]
        require(len(ids) == len(set(ids)), "duplicate Q event ID")
        require(len({t["id"] for t in q["threads"]}) == len(q["threads"]), "duplicate Q thread ID")
        for t in q["threads"]:
            for n, e in enumerate(t["events"]):
                basic_event(e, t["events"][n+1]["id"] if n+1 < len(t["events"]) else None)
        main = unique([t for t in q["threads"] if t["name"] == "main"], "Q main")
        creates = [e for e in main["events"] if e["class"] == "ThreadCreate"]
        require(len(creates) == len(prepared["activations"]), "source/Q create census")
        threads, activations = [], []
        for creator, a in zip(creates, prepared["activations"]):
            thread = unique([t for t in q["threads"] if t["id"] == creator["spawned_thread"]], "actual spawned thread")
            require(thread["id"] not in threads and thread["name"] == a["worker"], "duplicate/wrong activation")
            threads.append(thread["id"])
            es = thread["events"]
            require([e["class"] for e in es[:4]] == ["ThreadStart", "Load", "Assume", "ThreadArgument"]
                    and [e["class"] for e in es[-4:]] == ["Load", "RMWStore", "ThreadReturn", "Label"], "runtime frame")
            start, r, assume, arg = es[:4]
            cr, cw, ret, label = es[-4:]
            require(start["creator"] == arg["creator"] == creator["id"]
                    and len(creator["arguments"]) == 1 and arg["argument_index"] == 0
                    and arg["writes"]["type"] == "bv64", "creator/start/argument association")
            proof.prove(f"thread-{thread['id']}-argument", qexpr(creator["arguments"][0], {}) == obj(a["argument"]))
            runtime = f"__com_{thread['name']}#{thread['id']}"
            for e, tags in ((r, ["M", "R", "_"]), (cr, ["A", "M", "R", "RMW", "_"]),
                            (cw, ["A", "M", "W", "RMW", "_"])):
                mem(e, runtime, 2, tags)
                require(e.get("source") is None, "runtime/user separation")
            require(cw["rmw_load"] == cr["id"] and label["successor"] is None, "runtime pair/exit")
            require(r["writes"]["type"] == cr["writes"]["type"] == "bv2"
                    and not r["reads"] and not cr["reads"] and not arg["reads"], "runtime dependencies")
            literal(ret["return_value"], 64, 0)
            rv, cv = z3.BitVec("startup", 2), z3.BitVec("completion", 2)
            proof.prove(f"thread-{thread['id']}-startup",
                        core_expr(assume["condition"], {r["writes"]["name"]: rv}) == (z3.Extract(0, 0, rv) != 0))
            proof.prove(f"thread-{thread['id']}-completion",
                        core_expr(cw["value"], {cr["writes"]["name"]: cv}) == (cv & 2))
            src = source_units(a, proof)
            target, versions = q_units(thread, a["argument"])
            activations.append({"create_index": a["create_index"], "creator": creator["id"],
                                "thread": thread["id"], "worker": a["worker"],
                                "source": src, "target": target, "definitions": versions})
        facts = {"activations": activations, "actual_worker_threads": threads}
        report.update(result="ACTC_FACTS_RECOVERED", activations=[{
            **{k: v for k, v in a.items() if k not in {"source", "target"}},
            "source": [serial(u) for u in a["source"]], "target": [serial(u) for u in a["target"]]
        } for a in activations])
        save_json(Path(out) / "facts.json", report)
        return facts
    except Exception as error:
        report["reason"] = str(error)
        raise
    finally:
        save_certificate(out, report)


def dependencies(units):
    producers = {u["response"].sexpr(): u["id"] for u in units if "response" in u}
    require(len(producers) == sum("response" in u for u in units), "response identity reused")
    ranks = {u["id"]: n for n, u in enumerate(units)}
    edges = set()
    for u in units:
        for expr in expressions(u).values():
            for v in get_vars(expr):
                if v.sexpr().startswith("|object:") or str(v).startswith("object:"):
                    continue
                require(v.sexpr() in producers, "unbound summary leaf " + v.sexpr())
                producer = producers[v.sexpr()]
                require(ranks[producer] < ranks[u["id"]] or
                        (producer == u["id"] and u["kind"] == "asm"), "noncausal summary dependency")
                if producer != u["id"]:
                    edges.add((producer, u["id"]))
    return edges


def boundary(a, pairs, regions):
    """Derive a boundary from facts and an already checked total mapping."""
    q_to_s = {q: s for s, q in pairs}
    edges = dependencies(a["source"]) | {(q_to_s[x], q_to_s[y]) for x, y in dependencies(a["target"])}
    result = []
    for region in regions:
        inside = set(region)
        inputs = sorted({x for x, y in edges if y in inside and x not in inside})
        outputs = sorted({x for x, y in edges if x in inside and y not in inside})
        crossing = sorted([x, y] for x, y in edges if (x in inside) != (y in inside))
        qids = {q for s, q in pairs if s in inside}
        result.append({"source_units": region, "input_ports": inputs, "output_ports": outputs,
                       "crossing_dependencies": crossing,
                       "actual_nodes": [n for u in a["target"] if u["id"] in qids for n in u["events"]]})
    return result


def propose(facts, binding, *, merged=False):
    """Untrusted deterministic plan. Order-preserving scope has a unique rank map."""
    rows = []
    for a in facts["activations"]:
        require(len(a["source"]) == len(a["target"]), "candidate effect-count mismatch")
        pairs = [[s["id"], q["id"]] for s, q in zip(a["source"], a["target"])]
        regions = [[u["id"] for u in a["source"]]] if merged else [[u["id"]] for u in a["source"]]
        rows.append({"create_index": a["create_index"], "thread": a["thread"], "pairs": pairs,
                     "regions": boundary(a, pairs, regions)})
    return {"format": "actc-plan-v1", "binding": binding, "activations": rows}


def check(q, prepared, binding, proposal, out):
    """Independent checker entry: reconstruct all facts; never calls propose()."""
    out = Path(out)
    report = {"result": "REJECT", "program_verdict_eligible": False, "obligations": []}
    proof = Obligations(report)
    try:
        facts = recover(q, prepared, out / "reconstructed")
        require(set(proposal) == {"format", "binding", "activations"}
                and proposal["format"] == "actc-plan-v1" and proposal["binding"] == binding, "plan artifact/schema binding")
        rows = proposal["activations"]
        require(len(rows) == len(facts["activations"]), "plan activation coverage")
        remaining = {(a["create_index"], a["thread"]): a for a in facts["activations"]}
        continuations, regions = [], []
        for row in rows:
            require(set(row) == {"create_index", "thread", "pairs", "regions"}, "activation plan schema")
            key = row["create_index"], row["thread"]
            require(key in remaining, "missing/repeated/wrong activation")
            a = remaining.pop(key)
            pairs = row["pairs"]
            require(all(isinstance(p, list) and len(p) == 2 for p in pairs), "map schema")
            require([p[0] for p in pairs] == [u["id"] for u in a["source"]]
                    and [p[1] for p in pairs] == [u["id"] for u in a["target"]], "total ordered bijection")
            groups = [r["source_units"] for r in row["regions"]]
            require(all(groups) and [s for g in groups for s in g] == [u["id"] for u in a["source"]], "contiguous complete region partition")
            require(row["regions"] == boundary(a, pairs, groups), "incomplete/wrong boundary certificate")
            substitutions = [(t["response"], s["response"]) for s, t in zip(a["source"], a["target"])
                             if "response" in s and "response" in t]
            assertions = []
            for s, t in zip(a["source"], a["target"]):
                label = f"thread-{a['thread']}-{s['id'].replace(':', '-')}-Q-{t['id']}"
                require(s["kind"] == t["kind"] and s.get("width") == t.get("width")
                        and set(s["fields"]) == set(t["fields"]), "effect signature mismatch: " + label)
                for field, expr in s["fields"].items():
                    target = z3.substitute(t["fields"][field], *substitutions)
                    proof.prove(label + "-" + field, expr == target)
                if s["kind"] == "asm":
                    regions.append({"thread": a["thread"], "create_index": a["create_index"],
                                    "llvm_line_index": s["llvm_site"], "call_context": s["call_context"],
                                    "source_definition": s["source_definition"], "read": t["read"], "write": t["write"]})
                elif s["kind"] == "assert":
                    assertions.append(t["id"])
            continuations.append({"thread": a["thread"], "assertion_events": assertions})
        require(not remaining, "uncovered activation")
        report.update(result="COMPOSITIONAL_WORKERS_EXACT", regions=regions, continuations=continuations,
                      actual_worker_threads=facts["actual_worker_threads"],
                      region_count=sum(len(a["regions"]) for a in rows),
                      boundary_ports=sum(len(r["input_ports"]) for a in rows for r in a["regions"]),
                      plan_sha256=digest(proposal), binding=binding,
                      pending=["whole Q main/init/runtime partition", "actual safety and bound queries"])
    except Exception as error:
        report["reason"] = str(error)
    save_certificate(out, report)
    return report

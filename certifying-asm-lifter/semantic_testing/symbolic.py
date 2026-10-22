"""Algorithm B. Complete per-path SMT graphs, no import of target encodings."""
import itertools
import json
import time
from pathlib import Path
import z3
from .dsl import CAT, FENCES, Invalid, Limit, canonical, digest, path_products, require, validate
from .witness import seal, verify


def expression(e, env):
    if type(e) is bool: return z3.BoolVal(e)
    if type(e) is int: return z3.BitVecVal(e, 32)
    if type(e) is str: return env[e]
    op = e[0]; a = [expression(x, env) for x in e[1:]]
    if op == "add": return a[0] + a[1]
    if op == "sub": return a[0] - a[1]
    if op == "mul": return a[0] * a[1]
    if op == "band": return a[0] & a[1]
    if op == "bor": return a[0] | a[1]
    if op == "xor": return a[0] ^ a[1]
    if op == "shl": return a[0] << (a[1] & 31)
    if op == "shr": return z3.LShR(a[0], a[1] & 31)
    if op == "ult": return z3.ULT(a[0], a[1])
    if op == "ule": return z3.ULE(a[0], a[1])
    if op == "eq": return a[0] == a[1]
    if op == "and": return z3.And(*a)
    if op == "or": return z3.Or(*a)
    if op == "not": return z3.Not(a[0])
    if op == "ite": return z3.If(*a)
    raise Invalid("SYMBOLIC_OPERATOR")


def value(model, e):
    v = model.eval(e, model_completion=True)
    return z3.is_true(v) if z3.is_bool(v) else v.as_long()


def raw_smt(solver):
    # to_smt2() may collapse all assertions when an explicit false occurs.
    # Preserve the actual assertion list, including infeasible structural paths.
    return solver.sexpr() + "\n(check-sat)\n"


class Encoding:
    def __init__(self, p, paths):
        self.solver = s = z3.Solver()
        self.inputs = inputs = {k: (z3.Bool("input_" + k) if t == "bool" else z3.BitVec("input_" + k, 32)) for k, t in sorted(p["inputs"].items())}
        # Retain declarations even for unused but observable inputs in raw SMT.
        for var in inputs.values(): s.add(var == var)
        s.add(expression(p["domain"], inputs))
        es, po, rmw, ends = [], set(), set(), []
        self.reads = reads = {}
        def emit(eid, thread, kind, obj, val, atomic=False):
            es.append(dict(id=eid, thread=thread, kind=kind, obj=obj, val=val, atomic=atomic))
            return len(es) - 1
        for obj, init in p["objects"].items(): emit("I:" + obj, "I:" + obj, "W", obj, expression(init, inputs))
        for tid, path in enumerate(paths):
            env, order = dict(inputs), []
            for node in path:
                op, sid = node["op"], node["id"]
                if op == "guard":
                    s.add(expression(node["value"], env) == node["choice"]); continue
                if op == "set": env[node["dst"]] = expression(node["value"], env); continue
                if op == "fence": order.append(emit(sid + ":F", tid, "F", None, None)); continue
                val = expression(node["value"], env) if "value" in node else None
                if op in ("load", "faa"):
                    old = z3.BitVec("read_" + sid, 32); reads[sid + ":R"] = old
                    r = emit(sid + ":R", tid, "R", node["obj"], old, op == "faa")
                    order.append(r); env[node["dst"]] = old
                if op in ("store", "faa"):
                    w = emit(sid + ":W", tid, "W", node["obj"], old + val if op == "faa" else val, op == "faa")
                    order.append(w)
                    if op == "faa": rmw.add((r, w))
            po.update((a, b) for i, a in enumerate(order) for b in order[i + 1:])
            ends.append(env)
        self.events = es; n = len(es)
        R = [i for i, e in enumerate(es) if e["kind"] == "R"]
        W = [i for i, e in enumerate(es) if e["kind"] == "W"]
        mem = set(R + W)
        self.co = ranks = {}
        self.rf = rf = {}
        for obj in p["objects"]:
            writes = [i for i in W if es[i]["obj"] == obj]
            bits = max(1, len(writes).bit_length())
            for i in writes:
                ranks[i] = z3.BitVec("co_" + str(i), bits)
                s.add(z3.ULT(ranks[i], len(writes)))
                if es[i]["id"] == "I:" + obj: s.add(ranks[i] == 0)
            s.add(z3.Distinct(*[ranks[i] for i in writes]))
        for r in R:
            options = []
            for w in W:
                if es[w]["obj"] != es[r]["obj"]: continue
                rf[w, r] = b = z3.Bool(f"rf_{w}_{r}"); options.append(b)
                s.add(z3.Implies(b, es[w]["val"] == es[r]["val"]))
            s.add(z3.PbEq([(b, 1) for b in options], 1))
        def co(a, b):
            return z3.ULT(ranks[a], ranks[b]) if a in ranks and b in ranks and es[a]["obj"] == es[b]["obj"] else z3.BoolVal(False)
        def fr(a, b):
            return z3.Or(*[z3.And(v, co(w, b)) for (w, r), v in rf.items() if r == a])
        def external(a, b): return es[a]["thread"] != es[b]["thread"]
        for r, w in rmw:
            for v in W:
                if external(r, v) and external(v, w): s.add(z3.Not(z3.And(fr(r, v), co(v, w))))
        bits = max(1, n.bit_length())
        u = [z3.BitVec(f"topo_U_{i}", bits) for i in range(n)]
        t = [z3.BitVec(f"topo_T_{i}", bits) for i in range(n)]
        for rank in u + t: s.add(z3.ULT(rank, n))
        for a, b in itertools.product(range(n), repeat=2):
            poloc = (a, b) in po and a in mem and b in mem and es[a]["obj"] == es[b]["obj"]
            fence = a in mem and b in mem and any((a, f) in po and (f, b) in po for f in range(n) if es[f]["kind"] == "F")
            kept = (a, b) in po and a in mem and b in mem and (a in R or b in W or es[a]["atomic"] or es[b]["atomic"])
            rfab = rf.get((a, b), z3.BoolVal(False))
            s.add(z3.Implies(z3.Or(poloc, rfab, co(a, b), fr(a, b)), z3.ULT(u[a], u[b])))
            s.add(z3.Implies(z3.Or(kept, fence, co(a, b), fr(a, b), z3.And(external(a, b), rfab)), z3.ULT(t[a], t[b])))
        self.observations = list(inputs.values())
        for obj in p["observe"]["objects"]:
            writes = [i for i in W if es[i]["obj"] == obj]
            final = z3.BitVec("final_" + obj, 32)
            for i in writes: s.add(z3.Implies(ranks[i] == len(writes) - 1, final == es[i]["val"]))
            self.observations.append(final)
        self.observations += [ends[t][v] for t, vs in enumerate(p["observe"]["locals"]) for v in vs]
        # Graph key excludes arbitrary topological ranks; includes all actual semantic choices.
        self.keys = list(inputs.values()) + list(reads.values()) + list(rf.values()) + list(ranks.values())

    def core(self, model, p):
        es = self.events
        return {"inputs": {k: value(model, e) for k, e in self.inputs.items()},
                "reads": {k: value(model, e) for k, e in self.reads.items()},
                "rf": {es[r]["id"]: es[w]["id"] for (w, r), b in self.rf.items() if value(model, b)},
                "co": {obj: [es[i]["id"] for i in sorted([i for i in self.co if es[i]["obj"] == obj], key=lambda i: value(model, self.co[i]))] for obj in p["objects"]}}


def decide(p, directory, seconds=60, max_graphs=10000, path_limit=4096):
    """Enumerate ALL graphs, not just observations. Persist base formulas and exact blockers."""
    directory = Path(directory); directory.mkdir(parents=True, exist_ok=False)
    start, cpu = time.perf_counter(), time.process_time()
    result = {"version": "oracle-B-1", "program_sha256": digest(p), "model": [CAT, FENCES],
              "status": "UNKNOWN", "reason": None, "graphs": [], "observations": [], "queries": []}
    (directory / "input.json").write_text(json.dumps(p, indent=2), encoding="utf-8")
    observations = {}
    smt_seconds, check_seconds, encode_seconds = 0., 0., 0.
    try:
        result["validation"] = validate(p)
        paths = path_products(p, path_limit)
        result["path_count"] = len(paths)
        for number, path in enumerate(paths):
            if time.perf_counter() - start >= seconds: raise Limit("TASK_TIME")
            before = time.perf_counter(); enc = Encoding(p, path); encode_seconds += time.perf_counter() - before
            stem = f"path-{number:03d}"
            (directory / (stem + ".smt2")).write_text(raw_smt(enc.solver), encoding="utf-8")
            blockers, query_records = [], []
            while True:
                remaining = seconds - (time.perf_counter() - start)
                if remaining <= 0: raise Limit("TASK_TIME")
                enc.solver.set(timeout=max(1, int(remaining * 1000)))
                before = time.perf_counter(); status = enc.solver.check(); smt_seconds += time.perf_counter() - before
                rec = {"path": number, "index": len(query_records), "status": str(status)}
                result["queries"].append(rec); query_records.append(rec)
                if status == z3.unsat: break
                if status != z3.sat: raise Limit("SOLVER_UNKNOWN:" + enc.solver.reason_unknown())
                m = enc.solver.model(); before = time.perf_counter()
                cert = seal(p, enc.core(m, p)); verify(p, cert)
                require(canonical(cert["observation"]) == canonical([value(m, e) for e in enc.observations]), "ENCODED_OBSERVATION")
                check_seconds += time.perf_counter() - before
                result["graphs"].append(cert)
                observations[canonical(cert["observation"])] = cert["observation"]
                block = z3.Or(*[e != m.eval(e, model_completion=True) for e in enc.keys])
                blockers.append("(assert " + block.sexpr() + ")")
                enc.solver.add(block)
                # Persist every transition; the final UNSAT formula is base + all blockers.
                (directory / (stem + ".blocks.smt2")).write_text("\n".join(blockers) + "\n", encoding="utf-8")
                if len(result["graphs"]) >= max_graphs: raise Limit("GRAPH_COUNT")
            (directory / (stem + ".final.smt2")).write_text(raw_smt(enc.solver), encoding="utf-8")
        result["status"] = "COMPLETE" if result["graphs"] else "EMPTY_INPUT_DOMAIN"
    except Limit as e:
        result["reason"] = str(e)
    except Invalid as e:
        result["status"] = "INVALID_INPUT"; result["reason"] = str(e)
    except Exception as e:
        result["status"] = "INTERNAL_ERROR"; result["reason"] = repr(e)
        import traceback
        (directory / "failure.log").write_text(traceback.format_exc(), encoding="utf-8")
    result["observations"] = [observations[k] for k in sorted(observations)]
    result["metrics"] = {"wall_seconds": time.perf_counter() - start, "cpu_seconds": time.process_time() - cpu,
                         "smt_seconds": smt_seconds, "check_seconds": check_seconds, "encode_seconds": encode_seconds}
    (directory / "result.json").write_text(json.dumps(result, indent=2), encoding="utf-8")
    return result

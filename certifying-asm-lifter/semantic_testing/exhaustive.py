"""Independent control/choice enumeration, no SMT and no symbolic extractor.

Scope: Boolean inputs; init/store/FAA operands reference only inputs. Read
responses stay bv32: co predecessor recurrence computes them, not truncation.
This checks the SAME axiomatic semantics, not a second memory-model theorem.
"""
import itertools
import time
from collections import Counter
from .dsl import MASK, Invalid, Limit, canonical, digest, etype, evaluate, validate
from .witness import inspect


def choices(seq):
    if not seq:
        yield []
        return
    first, *tail = seq
    if first["op"] == "if":
        for b, key in ((False, "else"), (True, "then")):
            for branch in choices(first[key]):
                for rest in choices(tail):
                    yield [(first, b)] + branch + rest
    else:
        for rest in choices(tail): yield [(first, None)] + rest


def decide_a(p, seconds=60, max_candidates=1000000):
    start = time.perf_counter(); counts = Counter(); accepted = {}
    result = {"algorithm": "explicit-co-rf-A", "program_sha256": digest(p), "status": "UNKNOWN", "reason": None}
    try:
        validate(p)
        if any(t != "bool" for t in p["inputs"].values()): raise Limit("A_UNSUPPORTED_BV_INPUT_DOMAIN")
        for thread in p["threads"]:
            from .dsl import walk
            for n in walk(thread):
                if n["op"] in ("store", "faa"):
                    try: etype(n["value"], p["inputs"])
                    except Invalid: raise Limit("A_UNSUPPORTED_DATA_DEPENDENT_WRITE")
        paths = [list(itertools.islice(choices(t), 4097)) for t in p["threads"]]
        if any(len(v) > 4096 for v in paths): raise Limit("A_PATH_BUDGET")
        legal_inputs = 0
        for values in itertools.product((False, True), repeat=len(p["inputs"])):
            if time.perf_counter() - start >= seconds: raise Limit("A_TIME")
            inputs = dict(zip(sorted(p["inputs"]), values))
            if not evaluate(p["domain"], inputs): continue
            legal_inputs += 1
            for selected in itertools.product(*paths):
                if time.perf_counter() - start >= seconds: raise Limit("A_TIME")
                writes = {a: ["I:" + a] for a in p["objects"]}; nodes = {}; loads = []
                expected_paths = []
                for thread in selected:
                    expected_paths.append([[n["id"], b] if b is not None else [n["id"]] for n, b in thread])
                    for n, _ in thread:
                        nodes[n["id"]] = n
                        if n["op"] in ("store", "faa"): writes[n["obj"]].append(n["id"] + ":W")
                        if n["op"] == "load": loads.append(n)
                per_object = [[(ws[0],) + tail for tail in itertools.permutations(ws[1:])] for ws in writes.values()]
                for orders in itertools.product(*per_object):
                    co = {obj: list(order) for obj, order in zip(writes, orders)}
                    wvals, faa_rf, faa_reads = {}, {}, {}
                    for obj, order in co.items():
                        wvals[order[0]] = evaluate(p["objects"][obj], inputs)
                        for prev, w in zip(order, order[1:]):
                            n = nodes[w[:-2]]; operand = evaluate(n["value"], inputs)
                            if n["op"] == "store": wvals[w] = operand
                            else:
                                wvals[w] = (wvals[prev] + operand) & MASK
                                faa_rf[n["id"] + ":R"] = prev
                                faa_reads[n["id"] + ":R"] = wvals[prev]
                    for sources in itertools.product(*[writes[n["obj"]] for n in loads]):
                        if time.perf_counter() - start >= seconds: raise Limit("A_TIME")
                        if sum(counts.values()) >= max_candidates: raise Limit("A_CANDIDATES")
                        core = dict(inputs=inputs, co=co, rf=dict(faa_rf), reads=dict(faa_reads))
                        for n, source in zip(loads, sources):
                            r = n["id"] + ":R"; core["rf"][r] = source; core["reads"][r] = wvals[source]
                        try:
                            g = inspect(p, core)
                            if g["paths"] != expected_paths: raise Invalid("PATH_CHOICE")
                        except Invalid as e:
                            counts[str(e)] += 1; continue
                        counts["LEGAL"] += 1
                        accepted[canonical(core)] = g["observation"]
        result["status"] = "COMPLETE" if legal_inputs else "EMPTY_INPUT_DOMAIN"
        result["legal_inputs"] = legal_inputs
    except (Limit, Invalid) as e:
        result["reason"] = str(e)
    result.update(counts=dict(counts), graphs=sorted(accepted),
                  observations=sorted({canonical(v) for v in accepted.values()}), wall_seconds=time.perf_counter() - start)
    return result


def compare(p, symbolic_result, seconds=60):
    explicit = decide_a(p, seconds)
    if explicit["status"] != "COMPLETE" or symbolic_result["status"] != "COMPLETE":
        return {"status": "UNKNOWN", "explicit": explicit}
    candidate = sorted({canonical(c["core"]) for c in symbolic_result["graphs"]})
    observations = sorted(canonical(o) for o in symbolic_result["observations"])
    return {"status": "AGREEMENT" if candidate == explicit["graphs"] and observations == explicit["observations"] else "CONTRADICTION",
            "explicit": explicit, "graph_sets_equal": candidate == explicit["graphs"],
            "observation_sets_equal": observations == explicit["observations"]}

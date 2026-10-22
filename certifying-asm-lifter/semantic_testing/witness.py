"""Concrete verifier: reexecute raw DSL, ignore solver ranks and supplied event maps."""
from .dsl import MASK, Invalid, digest, evaluate, fields, require, validate


def acyclic(vertices, edges):
    incoming = {v: 0 for v in vertices}
    successors = {v: [] for v in vertices}
    for a, b in edges:
        incoming[b] += 1; successors[a].append(b)
    todo = [v for v in vertices if incoming[v] == 0]
    visited = 0
    while todo:
        a = todo.pop(); visited += 1
        for b in successors[a]:
            incoming[b] -= 1
            if incoming[b] == 0: todo.append(b)
    return visited == len(vertices)


def rebuild(p, inputs, reads):
    validate(p)
    require(type(inputs) is dict and set(inputs) == set(p["inputs"]), "INPUT_COVERAGE")
    for k, typ in p["inputs"].items():
        require(type(inputs[k]) is (bool if typ == "bool" else int), "INPUT_VALUE_TYPE")
        if typ == "bv32": require(0 <= inputs[k] <= MASK, "INPUT_VALUE_RANGE")
    require(evaluate(p["domain"], inputs), "OUTSIDE_INPUT_DOMAIN")
    require(type(reads) is dict, "READ_MAP")
    used, events, traces, ends, po, rmw = set(), [], [], [], set(), set()
    def emit(eid, tid, kind, obj=None, value=None, atomic=False, initial=False):
        events.append({"id": eid, "thread": tid, "kind": kind, "obj": obj, "value": value,
                       "atomic": atomic, "initial": initial})
    for obj, value in p["objects"].items():
        emit("I:" + obj, "I:" + obj, "W", obj, evaluate(value, inputs), initial=True)
    for tid, body in enumerate(p["threads"]):
        env, trace, order = dict(inputs), [], []
        def run(seq):
            for n in seq:
                op, sid = n["op"], n["id"]
                if op == "if":
                    choice = evaluate(n["guard"], env)
                    trace.append([sid, choice]); run(n["then"] if choice else n["else"])
                    continue
                trace.append([sid])
                if op == "set": env[n["dst"]] = evaluate(n["value"], env); continue
                if op == "fence":
                    eid = sid + ":F"; emit(eid, tid, "F"); order.append(eid); continue
                value = evaluate(n["value"], env) if "value" in n else None
                if op in ("load", "faa"):
                    r = sid + ":R"
                    require(r in reads and type(reads[r]) is int and 0 <= reads[r] <= MASK, "READ_VALUE")
                    used.add(r); old = reads[r]
                    emit(r, tid, "R", n["obj"], old, op == "faa"); order.append(r)
                    env[n["dst"]] = old
                if op in ("store", "faa"):
                    w = sid + ":W"
                    emit(w, tid, "W", n["obj"], ((old + value) & MASK) if op == "faa" else value, op == "faa")
                    order.append(w)
                    if op == "faa": rmw.add((r, w))
        run(body)
        po.update((a, b) for i, a in enumerate(order) for b in order[i + 1:])
        traces.append(trace); ends.append(env)
    require(used == set(reads), "READ_ACTIVE_COVERAGE")
    return events, traces, ends, po, rmw


def inspect(p, core):
    """The independent core has only inputs/reads/rf/co, never candidate events."""
    fields(core, "inputs reads rf co")
    events, traces, ends, po, rmw = rebuild(p, core["inputs"], core["reads"])
    byid = {e["id"]: e for e in events}
    rs = {i for i, e in byid.items() if e["kind"] == "R"}
    ws = {i for i, e in byid.items() if e["kind"] == "W"}
    memory = rs | ws
    require(type(core["rf"]) is dict and set(core["rf"]) == rs, "RF_COMPLETE")
    rf = set()
    for r, w in core["rf"].items():
        require(type(w) is str and w in ws, "RF_WRITE")
        require(byid[w]["obj"] == byid[r]["obj"] and byid[w]["value"] == byid[r]["value"], "RF_OBJECT_VALUE")
        rf.add((w, r))
    require(type(core["co"]) is dict and set(core["co"]) == set(p["objects"]), "CO_OBJECTS")
    co, final = set(), {}
    for obj, order in core["co"].items():
        require(type(order) is list and all(type(x) is str for x in order), "CO_LIST")
        writes = {w for w in ws if byid[w]["obj"] == obj}
        require(len(order) == len(writes) and set(order) == writes, "CO_COMPLETE")
        require(order[0] == "I:" + obj, "INIT_FIRST")
        co.update((a, b) for i, a in enumerate(order) for b in order[i + 1:])
        final[obj] = byid[order[-1]]["value"]
    fr = {(r, v) for u, r in rf for a, v in co if a == u}
    ext = lambda edge: byid[edge[0]]["thread"] != byid[edge[1]]["thread"]
    rfe, fre, coe = ({x for x in rel if ext(x)} for rel in (rf, fr, co))
    poloc = {(a, b) for a, b in po if a in memory and b in memory and byid[a]["obj"] == byid[b]["obj"]}
    fence = {(a, b) for a, f in po for f2, b in po if f == f2 and byid[f]["kind"] == "F" and a in memory and b in memory}
    k = {(a, b) for a, b in po if a in memory and b in memory and
         (a in rs or b in ws or byid[a]["atomic"] or byid[b]["atomic"])} | fence
    require(acyclic(byid, poloc | rf | co | fr), "CAT_SC_PER_LOCATION")
    forbidden = {(r, w) for r, v in fre for v2, w in coe if v == v2}
    require(not (rmw & forbidden), "CAT_RMW_ATOMICITY")
    require(acyclic(byid, k | co | fr | rfe), "CAT_TSO_CYCLE")
    obs = [core["inputs"][x] for x in sorted(p["inputs"])]
    obs += [final[x] for x in p["observe"]["objects"]]
    obs += [ends[t][v] for t, vs in enumerate(p["observe"]["locals"]) for v in vs]
    relations = {"po": po, "rf": rf, "co": co, "fr": fr, "rmw": rmw, "mfence": fence, "K": k}
    return {"events": events, "paths": traces, "observation": obs,
            "relations": {r: sorted(map(list, es)) for r, es in relations.items()}}


def seal(p, core):
    result = inspect(p, core)
    return {"version": "dsl-execution-1", "program_sha256": digest(p), "core": core, **result}


def verify(p, certificate):
    fields(certificate, "version program_sha256 core events paths observation relations")
    require(certificate["version"] == "dsl-execution-1" and certificate["program_sha256"] == digest(p), "PROGRAM_BINDING")
    actual = inspect(p, certificate["core"])
    # Strict JSON equality also distinguishes bool values from integers.
    from .dsl import canonical
    for field in actual:
        require(canonical(actual[field]) == canonical(certificate[field]), "RECONSTRUCTION_MISMATCH:" + field)
    return actual

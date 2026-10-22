"""Induced relation patterns witnessed by full independently checked graphs."""
import itertools
from .dsl import canonical, require
from .witness import verify

RELATIONS = ("po", "rf", "co", "fr", "rmw", "mfence", "K")


def pattern(graph, subset):
    events = {e["id"]: e for e in graph["events"]}
    rels = {r: set(map(tuple, graph["relations"][r])) for r in RELATIONS}
    codes = []
    for order in itertools.permutations(subset):
        colors = "".join(e["kind"] + str(int(e["atomic"])) + str(int(e["initial"])) for e in [events[x] for x in order])
        pairs = []
        for a, b in itertools.product(order, repeat=2):
            ea, eb = events[a], events[b]
            pairs.append("".join(str(int(v)) for v in [ea["thread"] == eb["thread"], ea["obj"] == eb["obj"]] + [(a, b) in rels[r] for r in RELATIONS]))
        codes.append(str(len(order)) + ":" + colors + ":" + "/".join(pairs))
    return min(codes)


def extract(p, result, maximum=3):
    require(result["status"] == "COMPLETE", "FEATURE_REQUIRES_COMPLETENESS")
    sets = {i: set() for i in range(1, maximum + 1)}
    witnesses = {}
    heldout = set()
    for number, certificate in enumerate(result["graphs"]):
        graph = verify(p, certificate)
        mem = [e["id"] for e in graph["events"] if e["kind"] != "F"]
        for k in sets:
            for subset in itertools.combinations(mem, k):
                code = pattern(graph, subset); sets[k].add(code)
                witnesses.setdefault(code, {"graph": number, "subset": list(subset)})
        # Separate coarse behavioral probes, not used by selection.
        locs = certificate["observation"][len(p["inputs"]) + len(p["observe"]["objects"]):]
        heldout.add("terminal-zero:" + str(tuple(v == 0 for v in locs)))
        heldout.add("active-counts:" + str(tuple(sum(e["kind"] == "R" for e in graph["events"] if e["thread"] == t) for t in range(len(p["threads"])))))
        heldout.add("branch-choices:" + str(tuple(b[1] for tr in graph["paths"] for b in tr if len(b) == 2)))
    heldout.add("outcome-count:" + str(len(result["observations"])))
    return {"objective": sorted(sets[1] | sets[2]), "heldout_three": sorted(sets[3]),
            "heldout_behavior": sorted(heldout), "witnesses": witnesses}


def syntax_features(p):
    from .dsl import walk
    features = {"threads:" + str(len(p["threads"])), "objects:" + str(len(p["objects"]))}
    for t in p["threads"]:
        nodes = list(walk(t))
        features.update("op:" + n["op"] for n in nodes)
        features.update("adj:" + a["op"] + ":" + b["op"] for a, b in zip(nodes, nodes[1:]))
        features.update("address:" + a["op"] + ":" + b["op"] + ":" + str(a["obj"] == b["obj"])
                        for a, b in zip(nodes, nodes[1:]) if "obj" in a and "obj" in b)
    return sorted(features)


def select(records, strategy, budget, seed):
    import random
    order = sorted(records); random.Random(seed).shuffle(order)
    remaining, chosen, covered, trace = list(order), [], set(), []
    key = "objective" if strategy == "semantic" else "syntax"
    while remaining and len(chosen) < budget:
        if strategy == "random": winner = remaining[0]; gain = None
        else:
            winner = max(remaining, key=lambda i: len(set(records[i][key]) - covered))
            gain = len(set(records[winner][key]) - covered)
        # Fixed exact budget: zero-gain ties filled by the same seeded order.
        chosen.append(winner); remaining.remove(winner)
        if strategy != "random": covered.update(records[winner][key])
        trace.append({"id": winner, "gain": gain})
    metrics = {key: len(set().union(*(set(records[i][key]) for i in chosen))) for key in ("objective", "heldout_three", "heldout_behavior", "syntax")}
    return {"strategy": strategy, "budget": budget, "seed": seed, "chosen": chosen, "trace": trace, "coverage": metrics}

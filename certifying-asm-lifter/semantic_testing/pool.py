"""Deterministic finite Cartesian grammar; freeze before oracle execution."""
import copy
import json
from pathlib import Path
from .dsl import CAT, FENCES, digest, validate


def op(kind, sid, obj=None, dst=None, value=None):
    n = dict(op=kind, id=sid)
    if obj is not None: n["obj"] = obj
    if dst is not None: n["dst"] = dst
    if value is not None: n["value"] = value
    return n


def program(threads, outputs, inputs=None, objects=None, domain=True):
    return {"version": "finite-tso-1", "inputs": inputs or {}, "domain": domain,
            "objects": objects or {"x": 0, "y": 0}, "threads": threads,
            "observe": {"objects": list((objects or {"x": 0, "y": 0}).keys()), "locals": outputs}}


def template(index, tid):
    x, y = ("x", "y") if tid == 0 else ("y", "x")
    def n(kind, suffix, obj=None, dst=None, value=None): return op(kind, f"t{tid}_{suffix}", obj, dst, value)
    L = lambda suffix, obj, dst: n("load", suffix, obj, dst)
    W = lambda suffix, obj, val: n("store", suffix, obj, value=val)
    A = lambda suffix, obj, dst, val: n("faa", suffix, obj, dst, val)
    if index == 0: return [L("a", x, "r")], ["r"]
    if index == 1: return [W("a", x, 1)], []
    if index == 2: return [A("a", x, "r", 1)], ["r"]
    if index == 3: return [W("a", x, 1), L("b", y, "r")], ["r"]
    if index == 4: return [W("a", x, 1), n("fence", "f"), L("b", y, "r")], ["r"]
    if index == 5: return [L("a", x, "r"), W("b", y, 1)], ["r"]
    if index == 6: return [A("a", x, "r", 1), L("b", y, "s")], ["r", "s"]
    if index == 7: return [A("a", x, "r", 1), A("b", y, "s", 2)], ["r", "s"]
    guard = "b" if index == 8 else ["eq", "r", 0]
    branch = {"op": "if", "id": f"t{tid}_choice", "guard": guard,
              "then": [A("yes", y, "s", 1)], "else": [A("no", y, "s", 2)]}
    if index == 8: return [branch, L("b", x, "r")], ["r", "s"]
    return [L("a", x, "r"), branch], ["r", "s"]


def candidate_pool():
    out = {}
    for i in range(10):
        for j in range(10):
            a, av = template(i, 0); b, bv = template(j, 1)
            p = program([a, b], [av, bv], inputs={"b": "bool"})
            validate(p); out[f"p{i:02d}_{j:02d}"] = p
    return out


def boundaries():
    a, av = template(3, 0); b, bv = template(3, 1)
    sb = program([a, b], [av, bv])
    a, av = template(4, 0); b, bv = template(4, 1)
    fenced = program([a, b], [av, bv])
    single = copy.deepcopy(fenced); single["threads"][0].pop(1)
    faa = program([[op("faa", "a", "x", "r", 1)], [op("faa", "b", "x", "r", 1)]], [["r"], ["r"]], objects={"x": 0})
    triple = copy.deepcopy(faa); triple["threads"].append([op("faa", "c", "x", "r", 1)]); triple["observe"]["locals"].append(["r"])
    wrap = copy.deepcopy(faa); wrap["objects"]["x"] = 4294967295
    branch = program([[{"op": "if", "id": "d", "guard": "b", "then": [op("faa", "yes", "x", "r", 1)],
                        "else": [op("faa", "no", "x", "r", 2)]}, op("set", "use", dst="s", value=["add", "r", 1])],
                       [op("faa", "other", "x", "r", 1)]], [["r", "s"], ["r"]], {"b": "bool"}, {"x": 0})
    conditional = program([[op("set", "zero", dst="r", value=0), {"op": "if", "id": "d", "guard": "b",
        "then": [op("faa", "yes", "x", "r", 1)], "else": []}], [op("load", "other", "x", "r")]], [["r"], ["r"]], {"b": "bool"}, {"x": 0})
    sequential = program([[op("faa", "a", "x", "r", 1), op("faa", "b", "x", "s", 1)],
                          [op("load", "other", "x", "v")]], [["r", "s"], ["v"]], objects={"x": 0})
    return dict(sb=sb, fenced=fenced, one_fence=single, faa=faa, triple=triple, wrap=wrap,
                diamond=branch, conditional=conditional, sequential=sequential)


def freeze(directory):
    directory = Path(directory); directory.mkdir(parents=True, exist_ok=False)
    pool, suite = candidate_pool(), boundaries()
    for category, ps in (("pool", pool), ("boundary", suite)):
        (directory / category).mkdir()
        for key, p in ps.items(): (directory / category / (key + ".json")).write_text(json.dumps(p, indent=2), encoding="utf-8")
    manifest = {"baseline": "8926dab258760d36ce77334362738cfe53b6a3f7", "model": [CAT, FENCES],
        "pool": {k: digest(p) for k, p in pool.items()}, "boundary": {k: digest(p) for k, p in suite.items()},
        "pool_construction": "10x10 Cartesian product of pool.template; all 100 retained",
        "input_domain": "both Boolean b values; reads are full bv32, no read bound",
        "budgets": [5, 10, 20], "seeds": [11, 29, 47, 71, 101], "strategies": ["random", "syntax", "semantic"],
        "oracle_seconds": 60, "explicit_seconds": 60, "max_graphs": 10000, "max_paths": 4096,
        "objective": "all induced patterns of 1 or 2 active memory endpoints, unit weight",
        "heldout": ["induced three-endpoint patterns", "terminal zero/active-count/branch/outcome-count probes"],
        "cost_policy": "same fixed pool, exact count budget; all preprocessing charged separately, no speedup claim",
        "completion_policy": "any UNKNOWN retained in denominator; no incomplete-pool approximation theorem",
        "go_policy": "oracle consistency and transforms necessary; self-objective gain alone insufficient; heldout benefit and preprocessing cost reported; no real tools"}
    (directory / "manifest.json").write_text(json.dumps(manifest, indent=2), encoding="utf-8")
    return manifest

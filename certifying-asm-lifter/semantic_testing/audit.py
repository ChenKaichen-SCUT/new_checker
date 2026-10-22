"""Independent evidence entry point: raw DSL, whole graph space, SMT bindings,
feature witnesses, transform sides and selection choices. No candidate flags trusted.
"""
import argparse
import random
import time
from pathlib import Path
import z3
from .dsl import CAT, FENCES, canonical, digest, path_products, require
from .exhaustive import compare
from .features import extract, pattern, syntax_features
from .run import load, save
from .symbolic import Encoding
from .transforms import verify_rule
from .witness import verify


def assertions(solver):
    # raw_smt preserves assertions exactly; do not use solver simplification as
    # canonicalization (commutative child order can depend on AST allocation).
    return [x.sexpr() for x in solver.assertions()]


def check_case(directory):
    directory = Path(directory); p = load(directory / "input.json"); r = load(directory / "result.json")
    require(r["version"] == "oracle-B-1" and r["model"] == [CAT, FENCES], "AUDIT_MODEL_BINDING")
    require(r["program_sha256"] == digest(p), "AUDIT_PROGRAM_BINDING")
    for c in r["graphs"]: verify(p, c)
    a = compare(p, r)
    require(r["status"] != "COMPLETE" or a["status"] == "AGREEMENT", "AUDIT_INCOMPLETE_GRAPH_SET")
    path_list = path_products(p); obligations = []; assigned = 0
    for i, path in enumerate(path_list):
        base = directory / f"path-{i:03d}.smt2"
        if not base.exists():
            require(r["status"] != "COMPLETE", "AUDIT_MISSING_PATH_FORMULA"); continue
        enc = Encoding(p, path)
        saved = z3.Solver(); saved.add(z3.parse_smt2_file(str(base)))
        require(assertions(enc.solver) == assertions(saved), "AUDIT_BASE_FORMULA_BINDING")
        traces = [[[n["id"], n["choice"]] if n["op"] == "guard" else [n["id"]] for n in tr] for tr in path]
        active = [c for c in r["graphs"] if c["paths"] == traces]; assigned += len(active)
        blockers = []
        for c in active:
            core = c["core"]; assignment = []
            assignment.extend((expr, core["inputs"][k]) for k, expr in enc.inputs.items())
            assignment.extend((expr, core["reads"][k]) for k, expr in enc.reads.items())
            assignment.extend((expr, core["rf"][enc.events[read]["id"]] == enc.events[write]["id"]) for (write, read), expr in enc.rf.items())
            assignment.extend((expr, core["co"][enc.events[idx]["obj"]].index(enc.events[idx]["id"])) for idx, expr in enc.co.items())
            blockers.append(z3.Or(*[expr != (z3.BoolVal(val) if z3.is_bool(expr) else z3.BitVecVal(val, expr.size()))
                                    for expr, val in assignment]))
        blockfile = directory / f"path-{i:03d}.blocks.smt2"
        if blockfile.exists():
            saved_blocks = z3.Solver()
            # Declare variables via the base before reading the assertion-only block stream.
            base_text = base.read_text(encoding="utf-8").replace("(check-sat)", "")
            saved_blocks.add(z3.parse_smt2_string(base_text + blockfile.read_text(encoding="utf-8")))
            recomposed = z3.Solver(); recomposed.add(*enc.solver.assertions(), *blockers)
            require(assertions(saved_blocks) == assertions(recomposed), "AUDIT_BLOCKER_BINDING")
        else: require(not blockers, "AUDIT_MISSING_BLOCKERS")
        enc.solver.add(*blockers)
        final = directory / f"path-{i:03d}.final.smt2"
        if final.exists():
            saved_final = z3.Solver(); saved_final.add(z3.parse_smt2_file(str(final)))
            require(assertions(enc.solver) == assertions(saved_final), "AUDIT_FINAL_FORMULA_BINDING")
            saved_final.set(timeout=60000); status = str(saved_final.check())
            require(status == "unsat", "AUDIT_FINAL_NOT_UNSAT")
            obligations.append({"path": i, "base_and_blockers_bound": True, "final": status})
        else: require(r["status"] != "COMPLETE", "AUDIT_MISSING_FINAL")
    require(assigned == len(r["graphs"]), "AUDIT_PATH_WITNESS_COVERAGE")
    observation_union = sorted({canonical(verify(p, c)["observation"]) for c in r["graphs"]})
    require(observation_union == sorted(canonical(o) for o in r["observations"]), "AUDIT_OBSERVATION_COVERAGE")
    featurefile = directory / "features.json"
    if featurefile.exists():
        f = load(featurefile); actual = extract(p, r)
        for field in ("objective", "heldout_three", "heldout_behavior", "witnesses"):
            require(canonical(f[field]) == canonical(actual[field]), "AUDIT_FEATURE_COMPLETENESS")
        require(f["syntax"] == syntax_features(p), "AUDIT_SYNTAX")
        for code, w in f["witnesses"].items():
            g = verify(p, r["graphs"][w["graph"]])
            require(code == pattern(g, w["subset"]), "AUDIT_PATTERN_EMBEDDING")
    transformfile = directory / "transform.json"
    if transformfile.exists():
        t = load(transformfile); source = load(directory.parent / t["source"] / "input.json")
        actual = verify_rule(source, p, t["claim"])
        require(canonical(actual) == canonical(t["rule_check"]), "AUDIT_TRANSFORM")
    return {"case": directory.name, "candidate_status": r["status"], "explicit": a["status"],
            "graphs_verified": len(r["graphs"]), "final_queries": obligations, "feature_rebuilt": featurefile.exists()}


def check_selection(root, frozen):
    root, frozen = Path(root), Path(frozen)
    manifest = load(frozen / "manifest.json"); s = load(root / "selection.json")
    require(s["status"] == "COMPLETE" and s["denominator"] == len(manifest["pool"]), "SELECTION_COMPLETE_POOL")
    records = {}
    for key, sha in manifest["pool"].items():
        require(digest(load(root / key / "input.json")) == sha, "SELECTION_FROZEN_POOL")
        records[key] = load(root / key / "features.json")
    tested = set()
    for run in s["runs"]:
        b, seed, strategy = run["budget"], run["seed"], run["strategy"]
        require(b in manifest["budgets"] and seed in manifest["seeds"] and strategy in manifest["strategies"], "SELECTION_PROTOCOL")
        key = (b, seed, strategy); require(key not in tested, "SELECTION_DUPLICATE"); tested.add(key)
        order = sorted(records); random.Random(seed).shuffle(order)
        covered = set(); trace = []; field = "objective" if strategy == "semantic" else "syntax"
        require(len(run["chosen"]) == b and len(set(run["chosen"])) == b, "SELECTION_COUNT")
        for selected in run["chosen"]:
            require(selected in order, "SELECTION_MEMBERSHIP")
            gains = {i: len(set(records[i][field]) - covered) for i in order}
            firstbest = order[0] if strategy == "random" else next(i for i in order if gains[i] == max(gains.values()))
            require(firstbest == selected, "SELECTION_GREEDY_OR_SEED")
            trace.append({"id": selected, "gain": None if strategy == "random" else gains[selected]})
            if strategy != "random": covered.update(records[selected][field])
            order.remove(selected)
        require(trace == run["trace"], "SELECTION_TRACE")
        for field in ("objective", "heldout_three", "heldout_behavior", "syntax"):
            union = set()
            for selected in run["chosen"]: union.update(records[selected][field])
            require(len(union) == run["coverage"][field], "SELECTION_COVERAGE")
    require(len(tested) == len(manifest["budgets"]) * len(manifest["seeds"]) * len(manifest["strategies"]), "SELECTION_RUN_COVERAGE")
    return {"status": "SELECTION_VERIFIED", "runs": len(tested), "denominator": len(records)}


def main():
    start, cpu = time.perf_counter(), time.process_time()
    parser = argparse.ArgumentParser(); parser.add_argument("--input", required=True); parser.add_argument("--output", required=True); parser.add_argument("--frozen")
    args = parser.parse_args(); root = Path(args.input); cases = []
    for f in sorted(root.rglob("result.json")):
        print("audit", str(f.parent), flush=True); cases.append(check_case(f.parent))
    report = {"status": "VERIFIED", "cases": cases}
    if (root / "selection.json").exists(): report["selection"] = check_selection(root, args.frozen)
    report["wall_seconds"] = time.perf_counter() - start
    report["cpu_seconds"] = time.process_time() - cpu
    save(args.output, report)


if __name__ == "__main__": main()

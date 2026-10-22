"""Reproducible DSL-only commands. No compiler/backend executable entry points."""
import argparse
import copy
import csv
import json
import platform
import statistics
import sys
import time
from pathlib import Path
import z3
from .dsl import Invalid, canonical, digest, require
from .exhaustive import compare
from .expectations import expected, reachable, relation
from .features import extract, select, syntax_features
from .pool import freeze, op
from .symbolic import decide
from .transforms import duplicate, merge, pure_add_zero, rename, verify_rule
from .witness import verify


def save(path, data):
    Path(path).write_text(json.dumps(data, indent=2, ensure_ascii=False), encoding="utf-8")


def load(path):
    return json.loads(Path(path).read_text(encoding="utf-8"))


def env():
    return {"python": sys.version, "executable": sys.executable, "z3": z3.get_version_string(),
            "platform": platform.platform(), "machine": platform.machine(), "processor": platform.processor(),
            "clock": "perf_counter wall / process_time CPU; per-process peak memory when available", "real_tool_calls": 0}


def memory():
    # Peak RSS is process cumulative, explicitly not a per-candidate isolated measurement.
    if sys.platform == "win32":
        import ctypes
        from ctypes import wintypes
        class Counters(ctypes.Structure):
            _fields_ = [("cb", wintypes.DWORD), ("faults", wintypes.DWORD)] + [(x, ctypes.c_size_t) for x in
                ("peak", "working", "peakPaged", "paged", "peakNonPaged", "nonPaged", "pagefile", "peakPagefile")]
        c = Counters(); c.cb = ctypes.sizeof(c)
        kernel = ctypes.WinDLL("kernel32"); kernel.GetCurrentProcess.restype = wintypes.HANDLE
        getinfo = ctypes.WinDLL("psapi").GetProcessMemoryInfo
        getinfo.argtypes = [wintypes.HANDLE, ctypes.POINTER(Counters), wintypes.DWORD]
        if getinfo(kernel.GetCurrentProcess(), ctypes.byref(c), c.cb): return c.peak
    return None


def task(p, output, manifest, with_features=False):
    task_start, task_cpu = time.perf_counter(), time.process_time()
    result = decide(p, output, manifest["oracle_seconds"], manifest["max_graphs"], manifest["max_paths"])
    phase = time.perf_counter()
    audit = compare(p, result, manifest["explicit_seconds"])
    save(Path(output) / "independent-A.json", audit)
    independent_phase = time.perf_counter() - phase
    phase = time.perf_counter()
    if result["status"] == "COMPLETE":
        save(Path(output) / "expectations.json", expected(p, result))
    expectation_phase = time.perf_counter() - phase
    feature = None
    if with_features and result["status"] == "COMPLETE" and audit["status"] == "AGREEMENT":
        start = time.perf_counter(); cpu = time.process_time()
        feature = extract(p, result); feature["syntax"] = syntax_features(p)
        feature["feature_seconds"] = time.perf_counter() - start
        feature["feature_cpu_seconds"] = time.process_time() - cpu
        save(Path(output) / "features.json", feature)
    save(Path(output) / "resource.json", {"process_peak_working_set_bytes": memory(),
        "task_wall_seconds_before_resource_write": time.perf_counter() - task_start,
        "task_cpu_seconds_before_resource_write": time.process_time() - task_cpu,
        "independent_phase_seconds": independent_phase, "expectation_phase_seconds": expectation_phase,
        "evidence_bytes_before_resource": sum(f.stat().st_size for f in Path(output).rglob("*") if f.is_file())})
    return result, audit, feature


def acceptance(frozen, output):
    frozen, output = Path(frozen), Path(output); output.mkdir(parents=True, exist_ok=False)
    manifest = load(frozen / "manifest.json"); save(output / "environment.json", env())
    results, programs, audits = {}, {}, {}
    for key, sha in manifest["boundary"].items():
        p = load(frozen / "boundary" / (key + ".json")); require(digest(p) == sha, "FROZEN_INPUT")
        result, audit, _ = task(p, output / key, manifest)
        programs[key], results[key], audits[key] = p, result, audit
        print(key, result["status"], len(result["graphs"]), audit["status"], flush=True)
    checks = []
    def check(label, truth): checks.append({"check": label, "pass": bool(truth)})
    for key in results:
        check(key + ":complete-crosscheck", results[key]["status"] == "COMPLETE" and audits[key]["status"] == "AGREEMENT")
    obs = lambda key: {tuple(v) for v in results[key]["observations"]}
    check("SB_00_allowed", (1, 1, 0, 0) in obs("sb"))
    check("two_Fences_00_forbidden", (1, 1, 0, 0) not in obs("fenced"))
    check("one_Fence_00_allowed", (1, 1, 0, 0) in obs("one_fence"))
    check("FAA_two_linearizations", obs("faa") == {(2, 0, 1), (2, 1, 0)})
    check("FAA_three_threads", len(obs("triple")) == 6 and all(o[0] == 3 for o in obs("triple")))
    check("FAA_wrap32", obs("wrap") == {(1, 4294967295, 0), (1, 0, 4294967295)})
    reach = [reachable(programs["faa"], results["faa"], "a:R", v) for v in (0, 1, 7)]
    check("open7_unreachable", reach[2]["status"] == "UNREACHABLE_OPEN_ASSIGNMENT")
    save(output / "reachability.json", reach)
    transforms = []
    source = programs["diamond"]
    merged, claim = merge(source, "d", "merged")
    variants = [("merge", source, merged, claim, "diamond")]
    dup, claim = duplicate(merged, "merged", "copy", "copyT", "copyF")
    variants += [("duplicate", merged, dup, claim, "merge")]
    pure, claim = pure_add_zero(source, "yes")
    variants += [("pure", source, pure, claim, "diamond")]
    alpha, claim = rename(source, 0, "r", "renamed")
    variants += [("alpha", source, alpha, claim, "diamond")]
    for label, p, q, claim, source_key in variants:
        rule = verify_rule(p, q, claim)
        qr, audit, _ = task(q, output / label, manifest)
        pr = results[source_key]
        rel = relation(p, pr, q, qr)
        save(output / label / "transform.json", {"claim": claim, "rule_check": rule, "relation": rel, "source": source_key})
        check(label + ":equivalence", rel["status"] == "EQ_OBS" and audit["status"] == "AGREEMENT")
        results[label] = qr; programs[label] = q; transforms.append(rel)
    # Invalid mathematical transformations, not injected faults in any real verifier.
    swapped = copy.deepcopy(merged); swapped["threads"][0][0]["value"][2:] = [2, 1]
    dropped = copy.deepcopy(programs["conditional"]); dropped["threads"][0] = [op("faa", "always", "x", "r", 1)]
    fused = copy.deepcopy(programs["sequential"]); fused["threads"][0] = [op("faa", "fused", "x", "r", 2), op("set", "repair", dst="s", value=["add", "r", 1])]
    returned = copy.deepcopy(merged); returned["threads"][0].insert(1, op("set", "wrongReturn", dst="r", value=["add", "r", 1]))
    for label, q, key in [("wrong_ite", swapped, "diamond"), ("guard_removed", dropped, "conditional"),
                          ("active_fusion", fused, "sequential"), ("new_return", returned, "diamond")]:
        qr, audit, _ = task(q, output / label, manifest)
        rel = relation(programs[key], results[key], q, qr)
        save(output / label / "difference.json", {"source": key, "relation": rel, "category": "DSL_SIDE_CONDITION_COUNTEREXAMPLE"})
        check(label + ":difference", rel["status"] == "OBSERVATION_DIFFERENCE_DSL" and audit["status"] == "AGREEMENT")
    # Reject a real source-inconsistent rule claim separately from deciding inequality.
    try:
        verify_rule(source, swapped, {"rule": "FAA_DIAMOND", "source_site": "d", "target_site": "merged"})
        check("bad_rule_rejected", False)
    except Invalid as e:
        check("bad_rule_rejected", True); save(output / "rejected-rule.json", {"reason": str(e)})
    # Resource bound and empty input are never complete SAFE.
    limited = decide(programs["faa"], output / "limited", seconds=60, max_graphs=1)
    check("limit_unknown", limited["status"] == "UNKNOWN")
    check("limited_reach7_unknown", reachable(programs["faa"], limited, "a:R", 7)["status"] == "UNKNOWN")
    empty = copy.deepcopy(source); empty["domain"] = False
    er = decide(empty, output / "empty", seconds=60)
    check("empty_domain_not_safe", er["status"] == "EMPTY_INPUT_DOMAIN")
    summary = {"checks": checks, "pass": all(x["pass"] for x in checks), "scope": "DSL_ONLY"}
    save(output / "summary.json", summary)
    return summary


def campaign(frozen, output):
    campaign_start, campaign_cpu = time.perf_counter(), time.process_time()
    frozen, output = Path(frozen), Path(output); output.mkdir(parents=True, exist_ok=False)
    manifest = load(frozen / "manifest.json"); save(output / "environment.json", env())
    rows, records = [], {}
    for key, sha in manifest["pool"].items():
        p = load(frozen / "pool" / (key + ".json")); require(digest(p) == sha, "FROZEN_INPUT")
        r, audit, f = task(p, output / key, manifest, True)
        row = dict(id=key, status=r["status"], reason=r["reason"], independent=audit["status"], graphs=len(r["graphs"]), observations=len(r["observations"]),
                   **r["metrics"], explicit_seconds=audit["explicit"]["wall_seconds"], feature_seconds=f["feature_seconds"] if f else None,
                   evidence_bytes=sum(x.stat().st_size for x in (output / key).rglob("*") if x.is_file()))
        rows.append(row)
        if f: records[key] = f
        print(key, row["status"], row["graphs"], row["independent"], flush=True)
        save(output / "progress.json", rows)
    save(output / "tasks.json", rows)
    with (output / "tasks.csv").open("w", newline="", encoding="utf-8") as file:
        writer = csv.DictWriter(file, fieldnames=list(rows[0])); writer.writeheader(); writer.writerows(rows)
    # No post-hoc removal of UNKNOWN or failed cases to claim complete-pool selection.
    if len(records) != len(manifest["pool"]):
        save(output / "selection.json", {"status": "NO_GO_INCOMPLETE_POOL", "denominator": len(manifest["pool"]), "eligible": len(records)})
        return
    selections = []
    for budget in manifest["budgets"]:
        for seed in manifest["seeds"]:
            for strategy in manifest["strategies"]:
                start, cpu = time.perf_counter(), time.process_time()
                s = select(records, strategy, budget, seed)
                s["selection_seconds"] = time.perf_counter() - start; s["selection_cpu_seconds"] = time.process_time() - cpu
                s["selected_oracle_seconds"] = sum(rows[list(manifest["pool"]).index(i)]["wall_seconds"] for i in s["chosen"])
                s["selected_evidence_bytes"] = sum(rows[list(manifest["pool"]).index(i)]["evidence_bytes"] for i in s["chosen"])
                s["effective_ratio"] = 1.0
                selections.append(s)
    summary = []
    for b in manifest["budgets"]:
        for s in manifest["strategies"]:
            group = [r for r in selections if r["budget"] == b and r["strategy"] == s]
            item = {"budget": b, "strategy": s}
            for k in ("objective", "heldout_three", "heldout_behavior", "syntax"):
                xs = [r["coverage"][k] for r in group]; item[k] = {"median": statistics.median(xs), "min": min(xs), "max": max(xs)}
            summary.append(item)
    save(output / "selection.json", {"status": "COMPLETE", "runs": selections, "summary": summary,
         "denominator": len(records), "preprocessing": {"oracle_wall_seconds": sum(r["wall_seconds"] for r in rows),
         "explicit_seconds": sum(r["explicit_seconds"] for r in rows), "feature_seconds": sum(r["feature_seconds"] for r in rows),
         "total_evidence_bytes": sum(r["evidence_bytes"] for r in rows)},
         "feature_unions": {k: len(set().union(*(set(v[k]) for v in records.values()))) for k in ("objective", "heldout_three", "heldout_behavior", "syntax")}})
    save(output / "campaign-resource.json", {"wall_seconds": time.perf_counter() - campaign_start,
        "cpu_seconds": time.process_time() - campaign_cpu, "peak_working_set_bytes": memory(),
        "scope": "all 100 candidate preprocessing, all 45 selection runs, input/result I/O; excludes later independent replay"})


def replay(directory):
    root = Path(directory); report = []; start = time.perf_counter()
    for resultfile in sorted(root.rglob("result.json")):
        r = load(resultfile); p = load(resultfile.parent / "input.json")
        for cert in r["graphs"]: verify(p, cert)
        audit = compare(p, r)
        # Re-run saved final SMT exclusions; A additionally detects omitted paths/models.
        finals = []
        for file in sorted(resultfile.parent.glob("path-*.final.smt2")):
            s = z3.Solver(); s.set(timeout=60000); s.add(z3.parse_smt2_file(str(file)))
            finals.append({"file": file.name, "result": str(s.check())})
        claimed = sorted(canonical(o) for o in r["observations"])
        actual = sorted({canonical(c["observation"]) for c in r["graphs"]})
        require(claimed == actual, "REPLAY_OBSERVATION_COVERAGE")
        require(r["status"] != "COMPLETE" or (audit["status"] == "AGREEMENT" and len(finals) == r["path_count"] and all(x["result"] == "unsat" for x in finals)), "REPLAY_COMPLETENESS")
        report.append({"case": str(resultfile.parent.relative_to(root)), "graphs_verified": len(r["graphs"]), "A": audit["status"], "final_queries": finals})
    return {"cases": report, "seconds": time.perf_counter() - start, "status": "REPLAY_COMPLETE"}


def main():
    parser = argparse.ArgumentParser(); parser.add_argument("command", choices=["freeze", "acceptance", "campaign", "replay"])
    parser.add_argument("--frozen"); parser.add_argument("--output", required=True); parser.add_argument("--input")
    args = parser.parse_args()
    if args.command == "freeze": freeze(args.output)
    elif args.command == "acceptance":
        r = acceptance(args.frozen, args.output)
        if not r["pass"]: raise SystemExit(1)
    elif args.command == "campaign": campaign(args.frozen, args.output)
    else: save(args.output, replay(args.input))


if __name__ == "__main__": main()

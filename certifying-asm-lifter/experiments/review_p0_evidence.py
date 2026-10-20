"""Read-only review of the five real runs; no compiler/backend execution or fake objects."""
import json
import platform
import sys
from pathlib import Path
import z3
from certification.evidence import save_json
from certification.interface import sha
from certification.provenance import require
from certification.run_pipeline import ROOT, implementation_hashes


def load(path):
    return json.loads(path.read_bytes())


def differences(a, b, path=""):
    if type(a) is not type(b):
        return [{"path": path, "before": a, "after": b}]
    if isinstance(a, dict):
        result = []
        for k in sorted(a.keys() | b.keys()):
            if k not in a or k not in b:
                result.append({"path": path + "/" + k, "before": a.get(k), "after": b.get(k)})
            else:
                result.extend(differences(a[k], b[k], path + "/" + k))
        return result
    if isinstance(a, list):
        if len(a) != len(b):
            return [{"path": path + "/length", "before": len(a), "after": len(b)}]
        return [d for i, (x, y) in enumerate(zip(a, b)) for d in differences(x, y, path + "/" + str(i))]
    return [] if a == b else [{"path": path, "before": a, "after": b}]


def main():
    root = ROOT / "experiments/p0"
    final = root / "final-reviewed"
    out = root / "evidence-review"
    out.mkdir(parents=True, exist_ok=False)
    result = {"result": "REJECT", "scope": "static evidence review, not a semantic proof",
              "python": sys.version, "platform": platform.platform(), "local_z3": z3.get_version_string()}
    try:
        safe = (root / "capture-safe-01/source.c").read_bytes()
        unsafe = (root / "capture-unsafe-01/source.c").read_bytes()
        require(safe.count(b"__VERIFIER_assert(x == 2);") == 1
                and safe.replace(b"__VERIFIER_assert(x == 2);", b"__VERIFIER_assert(x != 2);") == unsafe,
                "unsafe source is not a single property change")
        current = implementation_hashes()
        for extra in ("experiments/certify_p0.py", "experiments/capture_ck.py"):
            current[extra] = sha((ROOT / extra).read_bytes())
        for case in ("safe", "unsafe", "missing-main-assert", "wrong-join", "wrong-query"):
            run = final / case
            recorded = load(run / "implementation.json")
            require(recorded == current, "final run used different checker: " + case)
            require(all(sha((run / "implementation-sources" / p).read_bytes()) == h for p, h in recorded.items()),
                    "checker source snapshot mismatch")
            backend = load(run / "backend/backend-receipt.json")
            for p, h in backend["snapshots"].items():
                require(sha((run / "backend/snapshots" / p).read_bytes()) == h, "raw snapshot changed")
            for p, h in backend["queries"].items():
                require(sha((run / "backend" / p).read_bytes()) == h, "raw SMT changed")
            require(load(run / "regions/coverage.json")["result"] == "SUPPORTED_WORKERS_EXACT", "fault crossed worker coverage")
        isolation = {}
        for case in ("missing-main-assert", "wrong-join", "wrong-query"):
            p = final / case / "backend/snapshots"
            before, after = load(p / "pre-fault.json"), load(p / "post-fault.json")
            if case == "missing-main-assert":
                be = {e["id"]: e for t in before["threads"] for e in t["events"]}
                ae = {e["id"]: e for t in after["threads"] for e in t["events"]}
                missing = sorted(be.keys() - ae.keys())
                require(len(missing) == 1 and not ae.keys() - be.keys()
                        and be[missing[0]]["class"] == "Assert"
                        and be[missing[0]]["error_message"] == "user assertion", "nonisolated monitor deletion")
                changes = [{"event": n, "changes": differences(be[n], ae[n])}
                           for n in sorted(ae) if be[n] != ae[n]]
                require(len(changes) == 1 and changes[0]["changes"] == [{
                    "path": "/successor", "before": missing[0], "after": be[missing[0]]["successor"]}],
                    "monitor deletion changed more than linked-list repair")
                # Every non-event field, and every thread's remaining event sequence, is unchanged.
                normalized = json.loads(json.dumps(before))
                for t in normalized["threads"]:
                    t["events"] = [e for e in t["events"] if e["id"] != missing[0]]
                    for e in t["events"]:
                        if e["successor"] == missing[0]:
                            e["successor"] = be[missing[0]]["successor"]
                require(normalized == after, "extra fault metadata/object mutation")
                isolation[case] = {"removed_actual_event": be[missing[0]], "changes": changes}
            else:
                d = differences(before, after)
                if case == "wrong-query":
                    require(d == [], "query fault also mutated Program")
                    audit = load(p / "query-audit.json")
                    require(audit["queries"][0]["result"] == "UNSAT"
                            and audit["queries"][1]["result"] == "UNSAT", "query fault did not produce misleading UNSATs")
                    isolation[case] = {"program_differences": [], "actual_assumptions": audit["queries"][0]["assumptions"],
                                       "nominal_literal": audit["components"]["assumption_literal"]}
                else:
                    require(len(d) == 1 and d[0]["path"].endswith("/joined_thread"), "join fault has other mutations")
                    isolation[case] = d
        save_json(out / "fault-isolation.json", isolation)
        run = final / "unsafe"
        q = load(run / "backend/snapshots/before-encoding.json")
        h = load(run / "host/certificate.json")
        audit = load(run / "backend/snapshots/query-audit.json")
        values = {e["event"]: e for e in audit["queries"][0]["actual_model_values"]}
        witness = [{"thread": t["id"], "event": e["id"], "class": e["class"],
                    "source": e.get("source"), "actual_model": values[e["id"]]}
                   for t in q["threads"] for e in t["events"]
                   if e["id"] in h["all_assertions"] or e.get("addr", {}).get("name") in h["objects"]]
        require(any(r["event"] in h["user_assertions"] and r["actual_model"].get("executed") is True
                    and r["actual_model"].get("condition") is False for r in witness),
                "no actual executed user violation")
        save_json(out / "actual-counterexample-projection.json", {
            "run_id": q["run_id"], "rows": witness,
            "note": "Projection from same-run actual model, not a synthetic Program or general source-witness validator.",
            "source_witness": "Independent analytic source schedule and TSO proof in docs/p0/02-acceptance.md."})
        summaries = []
        for case in ("safe", "unsafe", "missing-main-assert", "wrong-join", "wrong-query"):
            p = final / case
            cert = load(p / "program-certificate.json")
            counts = {}
            for group in ("translation", "regions", "host", "queries"):
                obligations = [o for f in (p / group).rglob("certificate.json") for o in load(f).get("obligations", [])]
                counts[group] = {"count": len(obligations), "results": {
                    answer: sum(o.get("result") == answer for o in obligations)
                    for answer in sorted({str(o.get("result")) for o in obligations})}}
            summaries.append({"case": case, "result": cert["result"], "reason": cert.get("reason"),
                              "obligations": counts})
        result.update(result="REVIEWED", cases=summaries, single_source_property_change=True,
                      final_checker_sources_identical=True, actual_faults_isolated=True,
                      all_worker_certificates_unchanged_in_scope=True)
    except Exception as error:
        result["reason"] = str(error)
    save_json(out / "review.json", result)
    print(json.dumps(result, indent=2))
    require(result["result"] == "REVIEWED", "P0 evidence review failed")


if __name__ == "__main__":
    main()

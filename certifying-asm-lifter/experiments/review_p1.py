"""Static audit of real P1 evidence. Does not launch compiler/backend/SMT."""
import json
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.provenance import require
from certification.evidence import save_json
from experiments.certify_p0 import GAMMA, THEOREM_SHA256


def read(path):
    return json.loads(path.read_bytes())


def fault_diff(directory):
    p = directory / "backend/snapshots"
    before, after = read(p / "pre-fault.json"), read(p / "post-fault.json")
    require(before["memory"] == after["memory"], "fault changed global allocation/initialization")
    def events(q):
        return {e["id"]: (t["id"], e) for t in q["threads"] for e in t["events"]}
    a, b = events(before), events(after)
    require(set(b) <= set(a), "fault unexpectedly added event identities")
    changed = [{"event": i, "thread": a[i][0],
                "fields": sorted(k for k in set(a[i][1]) | set(b[i][1])
                                 if a[i][1].get(k) != b[i][1].get(k))}
               for i in sorted(set(a) & set(b)) if a[i] != b[i]]
    removed = [{"event": i, "thread": a[i][0], "class": a[i][1]["class"]}
               for i in sorted(set(a) - set(b))]
    def rmws(q):
        return {str(t["id"]): len([e for e in t["events"] if e["class"] == "RMWStore"
                                 and e.get("addr", {}).get("name") == "x"])
                for t in q["threads"] if t["name"] == "worker"}
    return {"changed": changed, "removed": removed, "before_rmw": rmws(before), "after_rmw": rmws(after),
            "memory_unchanged": True}


def review_suite(path):
    result, rows = [], read(path / "results.json")
    for row in rows:
        directory = path / row["case"]
        cert = read(directory / "program-certificate.json")
        require(cert["result"] == row["expected"] and cert["external_assumptions"] == GAMMA,
                "result or original Gamma mismatch")
        require(not cert["unconditional_safe"] and not cert["external_semantic_assumptions_proved"],
                "unconditional claim")
        implementation = read(directory / "implementation.json")
        for name, digest in implementation.items():
            require(sha((directory / "implementation-sources" / name).read_bytes()) == digest,
                    "implementation snapshot mismatch")
        backend = cert.get("backend")
        entry = {"case": row["case"], "result": cert["result"], "backend": row["backend_observation"]}
        if backend:
            p = directory / "backend"
            require(sha((directory / "preparation/translation/candidate.ll").read_bytes()) == backend["candidate_sha256"],
                    "actual transformed input hash")
            for name, digest in backend["snapshots"].items():
                require(sha((p / "snapshots" / name).read_bytes()) == digest, "actual snapshot digest")
            for name, digest in backend["queries"].items():
                require(sha((p / name).read_bytes()) == digest, "actual query digest")
            before, after = read(p / "snapshots/before-encoding.json"), read(p / "snapshots/after-encoding.json")
            require(before == after and before["run_id"] == backend["run_id"], "same-run actual object binding")
            if cert["controlled_fault"]:
                entry["fault_isolation"] = fault_diff(directory)
        if cert["result"] in {"CONDITIONAL_SAFE", "SAFETY_QUERY_SAT_NO_SAFE_TRANSFER"}:
            region = read(directory / "regions/certificate.json")
            require(region["result"] == "TYPED_WORKERS_EXACT" and all(
                o["result"] == "unsat" for o in region["obligations"]), "open worker obligations")
            keys = [(c["thread"], c["llvm_line_index"]) for c in region["regions"]]
            endpoints = [e for c in region["regions"] for e in (c["read"], c["write"])]
            require(len(set(keys)) == len(keys) and len(set(endpoints)) == len(endpoints), "certificate reuse")
            host = read(directory / "host/certificate.json")
            query = read(directory / "queries/certificate.json")
            require(host["result"] == cert["domain"] + "_OPEN_HOST_EXACT", "host domain")
            expected = "BOUND_SAFETY_AND_BOUND_UNSAT" if cert["result"] == "CONDITIONAL_SAFE" else "BOUND_SAFETY_QUERY_SAT"
            require(query["result"] == expected, "query result binding")
            entry.update(static_sites=len({k[1] for k in keys}), activations=len(region["actual_worker_threads"]),
                         separate_regions=len(keys), user_monitors=len(host["user_assertions"]))
            if cert["result"] == "CONDITIONAL_SAFE":
                require(sha((ROOT / cert["theorem"]).read_bytes()) == cert["theorem_sha256"], "new theorem changed")
        result.append(entry)
    return result


def main():
    require(sha((ROOT / "docs/system-review/01-end-to-end-guarantee.md").read_bytes()) == THEOREM_SHA256,
            "original theorem changed")
    a = review_suite(ROOT / "experiments/p1b/regression-p1a")
    b = review_suite(ROOT / "experiments/p1b/acceptance-01")
    by_case = {x["case"]: x for x in b}
    for name in ("swapped-returns", "wrong-second-input", "lost-cross-read", "wrong-continuation", "wrong-query"):
        require(not by_case[name]["fault_isolation"]["removed"], "non-omission fault removed an event")
    require(not by_case["wrong-query"]["fault_isolation"]["changed"], "query fault mutated Program")
    static = by_case["missing-static-call"]["fault_isolation"]
    dynamic = by_case["missing-call-activation"]["fault_isolation"]
    require(sorted(static["before_rmw"].values()) == [2, 2] and sorted(static["after_rmw"].values()) == [1, 1],
            "static omission not isolated to the second call")
    require(sorted(dynamic["before_rmw"].values()) == [2, 2] and sorted(dynamic["after_rmw"].values()) == [1, 2],
            "dynamic omission did not isolate one call activation")
    require(by_case["different-worker-contexts"]["backend"] is None, "unsupported case reached backend")
    p0 = read(ROOT / "experiments/p1b/regression-p0/results.json")
    require(len(p0) == 5 and all(x["actual"] == x["expected"] for x in p0), "P0 regression incomplete")
    report = {"result": "REVIEWED", "original_theorem_sha256": THEOREM_SHA256,
              "p1a_final_regression": a, "p1b_acceptance": b, "p0_regression": p0,
              "note": "Static artifact checks and fault isolation; not a proof of Gamma or serialization."}
    save_json(ROOT / "experiments/p1b/evidence-review.json", report)
    print(json.dumps({"result": report["result"], "p1a_cases": len(a), "p1b_cases": len(b), "p0_cases": len(p0)}))


if __name__ == "__main__":
    main()

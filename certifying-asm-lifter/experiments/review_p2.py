"""Static independent evidence audit; never infer semantics from PASS."""
import json
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.evidence import save_json
from certification.provenance import require
from experiments.certify_p0 import GAMMA, THEOREM_SHA256


def read(p):
    return json.loads(p.read_bytes())


def delta(path):
    a, b = [read(path / "backend/snapshots" / (s + ".json")) for s in ("pre-fault", "post-fault")]
    require(a["memory"] == b["memory"], "fault changed object allocation")
    events = lambda q: {e["id"]: e for t in q["threads"] for e in t["events"]}
    x, y = events(a), events(b)
    require(set(y) <= set(x), "unplanned added event")
    rows = [{"event": i, "class_before": x[i]["class"], "class_after": y[i]["class"],
             "fields": sorted(k for k in x[i].keys() | y[i].keys() if x[i].get(k) != y[i].get(k))}
            for i in sorted(x.keys() & y.keys()) if x[i] != y[i]]
    return {"changed": rows, "removed": sorted(x.keys() - y.keys()), "objects_unchanged": True}, x, y


def main():
    root = ROOT / "experiments/p2"
    rows, fault_rows = [], []
    require(sha((ROOT / "docs/system-review/01-end-to-end-guarantee.md").read_bytes()) == THEOREM_SHA256,
            "frozen theorem changed")
    for suite, count in [("final-readonly", 6), ("final-multi", 9), ("final-workers", 12),
                         ("regression-legacy-p1", 16), ("regression-p0", 5)]:
        results = read(root / (suite + "-02") / "results.json")
        require(len(results) == count, "incomplete suite " + suite)
        for row in results:
            p = root / (suite + "-02") / row["case"]
            c = read(p / "program-certificate.json")
            require(c["result"] == row["expected"] == row["actual"], "wrong recorded result")
            require(c["external_assumptions"] == GAMMA and len(GAMMA) == 8
                    and not c["unconditional_safe"] and not c["external_semantic_assumptions_proved"], "Gamma drift")
            require(c["program_verdict_eligible"] is (c["result"] == "CONDITIONAL_SAFE"), "unsafe authorization")
            impl = read(p / "implementation.json")
            for name, digest in impl.items():
                require(sha((p / "implementation-sources" / name).read_bytes()) == digest,
                        "implementation snapshot changed")
                require(sha((ROOT / name).read_bytes()) == digest, "final check used stale implementation " + name)
            for f in p.rglob("certificate.json"):
                for o in read(f).get("obligations", []):
                    if "file" in o:
                        require(sha((f.parent / o["file"]).read_bytes()) == o["smt_sha256"], "SMT file mismatch")
            if "backend" in c:
                q = read(p / "backend/snapshots/before-encoding.json")
                require(q == read(p / "backend/snapshots/after-encoding.json"), "not same Program")
            if c["result"] in {"CONDITIONAL_SAFE", "SAFETY_QUERY_SAT_NO_SAFE_TRANSFER"}:
                queries = read(p / "queries/certificate.json")
                require(all(v["actual_result"].lower() == v["replay"] for v in queries["queries"]), "query disagreement")
                require(sha((ROOT / c.get("theorem", "docs/p2/02-restricted-proof.md").partition(":")[0]).read_bytes())
                        == c.get("theorem_sha256", sha((ROOT / "docs/p2/02-restricted-proof.md").read_bytes())), "proof changed")
                if suite != "regression-p0":
                    entry = read(p / "preparation/entry/certificate.json")
                    require(entry["source_conflict_check"]["result"] == "ORDINARY_C_CONFLICT_FREE"
                            and not entry["source_conflict_check"]["overlap"], "source premise missing")
                    reg = read(p / "regions/certificate.json")
                    keys = [(r["create_index"], r["worker_definition"], r["llvm_line_index"], r["thread"]) for r in reg["regions"]]
                    require(len(keys) == len(set(keys)), "certificate identity reused")
                    ends = [v for r in reg["regions"] for v in (r["read"], r["write"])]
                    require(len(ends) == len(set(ends)), "endpoint reused")
                    if suite == "final-workers":
                        require(len(keys) == 2 and len({k[1] for k in keys}) == 2, "distinct workers absent")
                    if suite == "final-multi":
                        require(len(keys) == 4, "dependent multiple-call coverage missing")
            if suite.startswith("final-") and row.get("fault"):
                d, x, y = delta(p)
                mode = row["fault"]
                if mode == "a-only":
                    require(len(d["changed"]) == 2 and not d["removed"], "atomic-only cardinality")
                    for r in d["changed"]:
                        require(r["fields"] == ["tags"] and set(x[r["event"]]["tags"]) - set(y[r["event"]]["tags"]) == {"A"}, "atomic-only isolation")
                        require(x[r["event"]].get("rmw_load") == y[r["event"]].get("rmw_load"), "pair changed with A")
                elif mode == "safety-query-binding":
                    require(not d["changed"] and not d["removed"], "query fault changed Program")
                elif mode in {"thread-argument", "input-alias", "entry-ssa", "operand-only", "second-operand", "live-use-only"}:
                    require(len(d["changed"]) == 1 and not d["removed"], "single event fault isolation")
                elif mode in {"omit-call", "omit-activation", "omit-worker-call"}:
                    require(len(d["removed"]) == (2 if mode == "omit-call" else 1), "omission isolation")
                    require(all(x[i]["class"] == "RMWStore" for i in d["removed"]), "unexpected deleted class")
                fault_rows.append({"suite": suite, "case": row["case"], "mode": mode, **d})
            rows.append({"suite": suite, **row})
    ext = read(root / "external-client/scope-certificate.json")
    require(ext["result"] == "REJECT" and not ext["program_verdict_eligible"]
            and ext["all_pinned_upstream_bytes_unchanged"] and not ext["backend_invoked"], "external scope claim")
    save_json(root / "evidence-review.json", {"result": "REVIEWED", "cases": rows,
              "fault_isolation": fault_rows, "external": {k: ext[k] for k in ("result", "reason", "denominator", "accepted")},
              "original_theorem_sha256": THEOREM_SHA256,
              "note": "All raw objects checked by production gate; this script audits integrity/coverage, not universal semantics."})
    print(json.dumps({"result": "REVIEWED", "cases": len(rows), "actual_faults": len(fault_rows)}))


if __name__ == "__main__":
    main()

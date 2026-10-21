"""Independent evidence integrity, real fault isolation and paired-input review."""
import json
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.evidence import save_json
from certification.provenance import require
from experiments.certify_p0 import GAMMA, THEOREM_SHA256
from experiments.review_p2 import delta


def read(p): return json.loads(p.read_bytes())


def main():
    root = ROOT / "experiments/hcc/final-01"
    rows = read(root / "results.json")
    require(len(rows) == 22, "incomplete fixed acceptance")
    require(sha((ROOT / "docs/system-review/01-end-to-end-guarantee.md").read_bytes()) == THEOREM_SHA256, "theorem changed")
    faults, safe, local_only, obligations = [], [], [], 0
    for row in rows:
        p = root / row["case"]
        c = read(p / "program-certificate.json")
        require(c["result"] == row["expected"] == row["result"], "unexpected case")
        require(c["external_assumptions"] == GAMMA and not c["unconditional_safe"]
                and not c["external_semantic_assumptions_proved"], "trust drift")
        require(c["program_verdict_eligible"] is (c["result"] == "CONDITIONAL_SAFE"), "wrong gate")
        for name, digest in read(p / "implementation.json").items():
            require(sha((p / "implementation-sources" / name).read_bytes()) == digest
                    and sha((ROOT / name).read_bytes()) == digest, "stale implementation " + name)
        for f in p.rglob("certificate.json"):
            certificate = read(f)
            ref = certificate.get("template_reference")
            base = ROOT / ref["evidence_directory"] if ref else f.parent
            if ref:
                original = read(base / "certificate.json")
                require(sha((base / "certificate.json").read_bytes()) == ref["certificate_sha256"], "template ref mutation")
                sig = read(base / "signature.json")
                require(sha(json.dumps(sig, sort_keys=True, separators=(",", ":")).encode()) == ref["key"], "template key mismatch")
                require(certificate["obligations"] == original["obligations"], "template obligations altered")
            for o in certificate.get("obligations", []):
                if "file" in o:
                    require(sha((base / o["file"]).read_bytes()) == o["smt_sha256"], "SMT bytes mismatch")
                    obligations += 1
        if c.get("backend"):
            q = read(p / "backend/snapshots/before-encoding.json")
            require(q == read(p / "backend/snapshots/after-encoding.json"), "Program changed during solve")
        if c["result"] in {"CONDITIONAL_SAFE", "SAFETY_QUERY_SAT_NO_SAFE_TRANSFER"}:
            queries = read(p / "queries/certificate.json")
            require(all(v["actual_result"].lower() == v["replay"] for v in queries["queries"]), "query result mismatch")
            r = read(p / "regions/certificate.json")
            identities = [(v["create_index"], v["worker_definition"], v["llvm_line_index"], v["thread"]) for v in r["regions"]]
            ends = [i for v in r["regions"] for i in (v["read"], v["write"])]
            require(len(identities) == len(set(identities)) and len(ends) == len(set(ends)), "instance evidence reused")
            if row["module"] == "certify_hcc":
                require(c["hcc"]["additional_trusted_semantics"] == []
                        and c["hcc"]["q_sha256"] == sha((p / "backend/snapshots/before-encoding.json").read_bytes()), "HCC binding")
                require(c["reuse"]["distinct_template_proofs"] == 1 and c["reuse"]["site_requests"] == 2
                        and c["reuse"]["instantiation_checks_skipped"] == 0, "reuse scope")
            if c["result"] == "CONDITIONAL_SAFE": safe.append(row["case"])
        if c.get("local_result") == "LOCAL_PORTS_EXACT":
            local_only.append(row["case"])
            require(not c["program_verdict_eligible"] and "backend" not in c, "local-only leaked SAFE")
        if row["fault"]:
            d, x, y = delta(p)
            mode = row["fault"]
            if mode == "a-only":
                require(len(d["changed"]) == 2 and not d["removed"], "A-only count")
                for e in d["changed"]:
                    require(e["fields"] == ["tags"] and set(x[e["event"]]["tags"]) - set(y[e["event"]]["tags"]) == {"A"}, "A-only fields")
                    require(x[e["event"]].get("rmw_load") == y[e["event"]].get("rmw_load"), "pair also changed")
            elif mode == "safety-query-binding": require(not d["changed"] and not d["removed"], "query also mutated Program")
            elif mode in {"thread-argument", "input-alias", "entry-ssa", "live-use-only", "second-operand"}:
                require(len(d["changed"]) == 1 and not d["removed"], "nonisolated scalar fault")
            elif mode in {"omit-call", "omit-worker-call"}:
                require(len(d["removed"]) == (2 if mode == "omit-call" else 1)
                        and all(x[i]["class"] == "RMWStore" for i in d["removed"]), "nonisolated omission")
            faults.append({"case": row["case"], "mode": mode, **d})
    comparisons = []
    for a, b in [("workers-safe", "d2-workers"), ("multi-safe", "d2-multi")]:
        ca, cb = [read(root / p / "program-certificate.json") for p in (a, b)]
        candidates = [root / p / "preparation/translation/candidate.ll" for p in (a, b)]
        require(candidates[0].read_bytes() == candidates[1].read_bytes(), "paired inputs differ")
        block_certs = list((root / b / "preparation/translation").glob("call-*/block/certificate.json"))
        require(len(block_certs) == 2, "baseline proof count")
        comparisons.append({"hcc": a, "d2": b, "same_candidate_sha256": sha(candidates[0].read_bytes()),
                            "baseline_block_proofs": 2, "hcc_block_proofs": ca["reuse"]["distinct_template_proofs"],
                            "baseline_block_seconds": sum(read(p)["seconds"] for p in block_certs),
                            "hcc_template_seconds": sum(r["seconds"] for r in ca["reuse"]["requests"]),
                            "hcc_wall_seconds": next(r["seconds"] for r in rows if r["case"] == a),
                            "d2_wall_seconds": next(r["seconds"] for r in rows if r["case"] == b)})
    ext = read(ROOT / "experiments/hcc/external-client-review.json")
    require(ext["programs_certified"] == 0 and ext["denominator"] == 1, "external coverage drift")
    branch_dir = ROOT / "experiments/hcc/branch-backend-01"
    branch = read(branch_dir / "observation.json")
    require(not branch["program_verdict_eligible"] and branch["backend"]["result"] == "REJECT"
            and "ITEExpr" in branch["backend"]["reason"], "branch incomplete-export rejection")
    require(read(branch_dir / "backend/snapshots/before-encoding.json") ==
            read(branch_dir / "backend/snapshots/after-encoding.json"), "branch same-run raw serialization")
    save_json(ROOT / "experiments/hcc/evidence-review.json", {"result": "REVIEWED", "cases": len(rows),
              "conditional_safe": safe, "local_only": local_only, "fault_isolation": faults,
              "obligation_references_checked": obligations, "paired_comparison": comparisons,
              "actual_fault_backend_PASS_but_rejected": sum(r["fault"] is not None and r["backend"] == "PASS" for r in rows),
              "branch_backend": "Raw PASS, export REJECT: ITEExpr incomplete; no certified Q or query binding",
              "external": "0/1; no HCC provider", "semantics_proved_by_this_audit": False})
    print(json.dumps({"result": "REVIEWED", "cases": len(rows), "faults": len(faults), "comparisons": comparisons}))


if __name__ == "__main__": main()

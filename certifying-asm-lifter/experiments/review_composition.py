"""Static raw-evidence review plus frozen-client barrier census. No new Q."""
import json
import re
from pathlib import Path
from collections import Counter
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.evidence import save_json
from certification.provenance import require, walk
from experiments.certify_p0 import GAMMA, THEOREM_SHA256

BASE = ROOT / "experiments/composition"


def read(p):
    return json.loads(p.read_bytes())


def audit_run(path):
    c = read(path / "composition-certificate.json")
    for name, expected in read(path / "implementation.json").items():
        require(sha((path / "implementation-sources" / name).read_bytes()) == expected
                and sha((ROOT / name).read_bytes()) == expected, "implementation drift " + name)
    require(c["external_assumptions"] == GAMMA, "Gamma changed")
    if "backend" in c:
        b = c["backend"]
        backend_dir = ROOT / c["replay_case"] / "backend" if c["mode"] == "REPLAY" else path / "backend"
        for name, expected in b["snapshots"].items():
            require(sha((backend_dir / "snapshots" / name).read_bytes()) == expected, "Q/audit hash drift")
        for name, expected in b["queries"].items():
            require(sha((backend_dir / name).read_bytes()) == expected, "query hash drift")
        require(read(backend_dir / "snapshots/before-encoding.json") == read(backend_dir / "snapshots/after-encoding.json"), "Q mutated")
        require(b["candidate_sha256"] == sha((path / "producer/local/translation/candidate.ll").read_bytes()), "candidate mismatch")
    count, failures = 0, []
    for f in path.rglob("certificate.json"):
        cert = read(f)
        ref = cert.get("template_reference")
        source = ROOT / ref["evidence_directory"] if ref else f.parent
        if ref:
            require(sha((source / "certificate.json").read_bytes()) == ref["certificate_sha256"], "template reference")
        for o in cert.get("obligations", []):
            if "file" in o:
                require(sha((source / o["file"]).read_bytes()) == o["smt_sha256"], "SMT changed")
                count += 1
                if o["result"] == "sat":
                    failures.append({"name": o["name"], "certificate": f.relative_to(ROOT).as_posix(),
                                     "model": o.get("model"), "file": (source / o["file"]).relative_to(ROOT).as_posix()})
    if c.get("transfer") == "COMPOSITIONAL_TRANSFER_EXACT":
        v = read(path / "verifier/composition/certificate.json")
        require(v["result"] == "COMPOSITIONAL_WORKERS_EXACT", "missing independent composition")
        host = read(path / "verifier/whole-q/certificate.json")
        require(host["result"] == "D2_OPEN_HOST_EXACT", "incomplete whole Q")
        event_sets = [set(host[k]) for k in ("main_events", "worker_events", "initialization_events")]
        require(all(not event_sets[i] & event_sets[j] for i in range(3) for j in range(i)), "Q partition overlap")
        q = read(backend_dir / "snapshots/before-encoding.json")
        require(set.union(*event_sets) == {e["id"] for t in q["threads"] for e in t["events"]}, "Q partition incomplete")
    if c["program_verdict_eligible"]:
        require(c["result"] == "ACTC_CONDITIONAL_SAFE" and not c["controlled_fault"]
                and c["mode"] == "FRESH_BACKEND" and c["query_result"] == "BOUND_SAFETY_AND_BOUND_UNSAT", "unsafe verdict release")
    return {"case": path.relative_to(BASE).as_posix(), "result": c["result"], "reason": c.get("reason"),
            "smt_references": count, "failed_open_obligations": failures,
            "backend_verdict": c.get("backend", {}).get("observed_verdict")}


def client():
    frozen = read(ROOT / "experiments/levels/frozen-sites.json")
    prior = read(ROOT / "experiments/levels/client-reuse-04/results.json")
    require(frozen["denominator"] == 113 and len(frozen["sites"]) == 113, "fixed denominator changed")
    tus = []
    for tu in (0, 1):
        base = ROOT / f"experiments/p2/external-client/tu-{tu}"
        raw = (base / "source.ll").read_bytes()
        sites = [s for s in frozen["sites"] if s["tu"] == tu]
        require(all(s["llvm_sha256"] == sha(raw) for s in sites), "frozen LLVM changed")
        lines = raw.decode("utf-8").splitlines()
        actual = {i for i, s in enumerate(lines) if re.search(r"\b(?:call|invoke|callbr)\b.*\basm\b", s)}
        require(actual == {s["llvm_line_index"] for s in sites}, "frozen asm site coverage changed")
        observer = read(base / "observer.json")
        kinds = Counter(n["kind"] for f in observer["functions"] for n in walk(f["body"]))
        source_lines = (base / "source.c").read_text(encoding="utf-8").splitlines()
        witnesses = [{"line": i+1, "text": s.strip()} for i, s in enumerate(source_lines)
                     if any(marker in s for marker in ("for (;;)", "while (", "pthread_create(", "syscall(", "ops->wait", "ck_ec_wait("))]
        tus.append({"tu": tu, "hashes": {p.name: sha(p.read_bytes()) for p in base.iterdir() if p.is_file()},
                    "all_surviving_asm": len(sites), "observer_functions_including_headers": len(observer["functions"]),
                    "loop_nodes_including_headers": {k: kinds[k] for k in ("ForStmt", "WhileStmt", "DoStmt")},
                    "original_source_barrier_witnesses": witnesses})
    result = {"result": "STATIC_BARRIERS_RECHECKED", "client_count": 1, "TU_count": 2,
              "all_asm": 113, "family_candidates": sum(s["supported_instruction_family"] for s in frozen["sites"]),
              "previous_L2": sum(s["achieved_level"] >= 2 for s in prior["sites"]),
              "new_client_L3": 0, "new_client_L4": 0, "new_client_ACTC": 0,
              "actual_complete_linked_Q_provided": False, "source_or_client_modified": False,
              "new_blockers_closed": [], "translation_units": tus,
              "missing": ["complete linked actual Q and queries", "all unsupported asm interfaces/effects",
                          "loop/error-prefix induction", "complete direct/indirect callback summaries",
                          "struct/object/alias/lifetime semantics", "futex/syscall/time and lifecycle contracts"],
              "conclusion": "No claim that Dat3M can never import it; no verified complete input/provider exists in this delivery."}
    save_json(BASE / "client-review.json", result)
    return result


def main():
    require(sha((ROOT / "docs/system-review/01-end-to-end-guarantee.md").read_bytes()) == THEOREM_SHA256, "old theorem changed")
    rows = read(BASE / "final-01/results.json")
    require(len(rows) == 9 and all(r["actual"] == r["expected"] for r in rows), "unexpected suite")
    cases = [BASE / "final-01" / r["name"] for r in rows]
    supplement = read(BASE / "supplement-01/results.json")
    require(len(supplement) == 2 and all(r["result"] == "REJECT" for r in supplement), "supplement")
    cases += [BASE / "supplement-01" / r["name"] for r in supplement]
    reports = [audit_run(p) for p in cases]
    log = (BASE / "unit-commands-02/000.stdout.log").read_text(encoding="utf-8")
    require("17 passed" in log, "focused unit suite not complete")
    original_client = client()
    save_json(BASE / "evidence-review.json", {"result": "REVIEWED", "cases": reports,
        "fresh_same_invocation_Clang_and_same_run_Dat3M": 3,
        "historical_actual_controlled_fault_replays": 8, "focused_tests": 17,
        "new_real_upstream_bugs_claimed": 0, "client_result": original_client["result"],
        "smt_references_checked": sum(r["smt_references"] for r in reports),
        "note": "Static evidence review, not proof of checker implementation or source counterexamples."})
    print(json.dumps({"cases": len(reports), "tests": 17, "SMT_references": sum(r["smt_references"] for r in reports),
                      "client": "unchanged 6 L2 / 113; no L3/L4/ACTC"}))


if __name__ == "__main__":
    main()

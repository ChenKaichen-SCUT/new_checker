"""Small ACTC run, or explicit replay of an original same-run capture.

No supplied proposal facts are semantic evidence. Verification reopens the
source capture, redoes L1/L2 and host interpretation and rebuilds the Q facts.
"""
import argparse
import json
from pathlib import Path
from certification.run_pipeline import ROOT, implementation_hashes, run_backend
from certification.interface import sha
from certification.evidence import Commands, save_certificate, save_json
from certification.provenance import require, mapped_path
from certification.local_ports import prepare_ports
from certification.templates import TemplatePool
from certification.property_source import prepare_property_source
from certification.composition import recover, propose, check
from certification.p0_host import program_main, Obligations
from certification.p0_queries import check_queries
from experiments.certify_p0 import GAMMA, THEOREM_SHA256
from experiments.run_dat3m import linux


def read(path):
    return json.loads(Path(path).read_bytes())


def load_front(capture, out):
    local = prepare_ports(capture, out / "local", TemplatePool(out / "templates"))
    prepared = prepare_property_source(capture, local, out / "source")
    return prepared, out / "local/translation/candidate.ll"


def run(capture, out, *, replay=None, merged=False):
    capture, out = Path(capture).resolve(), Path(out).resolve()
    out.mkdir(parents=True, exist_ok=False)
    implementation = implementation_hashes()
    for p in ("experiments/certify_composition.py", "docs/composition/01-model-proof.md"):
        implementation[p] = sha((ROOT / p).read_bytes())
    save_json(out / "implementation.json", implementation)
    for p, _ in implementation.items():
        target = out / "implementation-sources" / p
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes((ROOT / p).read_bytes())
    report = {"result": "REJECT", "program_verdict_eligible": False, "unconditional_safe": False,
              "original_levels_automatically_issued": False, "external_assumptions": GAMMA,
              "capture": capture.relative_to(ROOT).as_posix(), "mode": "REPLAY" if replay else "FRESH_BACKEND",
              "controlled_fault": None, "legacy_acceptance_scope_expanded": False}
    try:
        require(sha((ROOT / "docs/system-review/01-end-to-end-guarantee.md").read_bytes()) == THEOREM_SHA256,
                "original theorem changed")
        prepared, candidate = load_front(capture, out / "producer")
        report["local_levels"] = ["BLOCK_EXACT", "LLVM_SITE_EXACT"]
        if replay:
            case = Path(replay).resolve()
            backend_dir = case / "backend"
            backend = read(backend_dir / "backend-receipt.json")
            require(backend["candidate_sha256"] == sha(candidate.read_bytes()), "replay candidate mismatch")
            report["replay_case"] = case.relative_to(ROOT).as_posix()
        else:
            tool = ROOT / "vendor/clang-local/root/usr"
            Commands(out / "clang-validation").run([
                "wsl", "-d", "Ubuntu", "--exec", "env",
                "LD_LIBRARY_PATH=" + linux(tool / "lib/x86_64-linux-gnu"), linux(tool / "bin/clang-21"),
                "-cc1", "-emit-llvm-bc", "-disable-llvm-passes", "-x", "ir", linux(candidate),
                "-o", linux(out / "validated.bc")])
            backend_dir = out / "backend"
            backend = run_backend(candidate, ROOT / "vendor/Dat3M-levels-positive-v1",
                                  ROOT / "experiments/levels/build-positive-01/build-receipt.json", backend_dir)
        report["backend"] = backend
        report["controlled_fault"] = backend.get("controlled_fault")
        require(backend["result"] == "ACTUAL_BACKEND_CAPTURED", "backend capture incomplete: " + backend.get("reason", ""))
        qfile = backend_dir / "snapshots/before-encoding.json"
        raw_q = qfile.read_bytes()
        q = json.loads(raw_q)
        require(sha(raw_q) == backend["snapshots"]["before-encoding.json"]
                and q == read(backend_dir / "snapshots/after-encoding.json")
                and q["run_id"] == backend["run_id"], "actual Q identity")
        binding = {"source": prepared["receipt"]["artifacts"]["source.c"],
                   "capture": sha((capture / "compiler-receipt.json").read_bytes()),
                   "L": sha(prepared["module"]), "Lprime": sha(candidate.read_bytes()),
                   "Q": sha(raw_q), "run": q["run_id"], "phi": "all-user-assertions",
                   "model": backend["build"]["cat_pins"]}
        facts = recover(q, prepared, out / "producer/facts")
        plan = propose(facts, binding, merged=merged)
        save_json(out / "proposal.json", plan)
        # Independent verification starts here: no producer-side facts survive.
        checked, checked_candidate = load_front(capture, out / "verifier")
        require(checked_candidate.read_bytes() == candidate.read_bytes(), "independent LLVM reconstruction drift")
        independent_q = read(qfile)
        coverage = check(independent_q, checked, binding, read(out / "proposal.json"), out / "verifier/composition")
        require(coverage["result"] == "COMPOSITIONAL_WORKERS_EXACT", coverage.get("reason", "worker composition"))
        host = {"result": "REJECT", "program_verdict_eligible": False}
        try:
            host.update(program_main(independent_q, checked["main_ops"], checked["objects"], coverage,
                                     Obligations(host), mapped_path(checked["receipt"]["source_path"], checked["receipt"])))
            # The existing query API checks this internal host profile. The public
            # output remains a separate ACTC certificate, not an automatic L4 label.
            host["result"] = "D2_OPEN_HOST_EXACT"
        finally:
            save_certificate(out / "verifier/whole-q", host)
        report.update(transfer="COMPOSITIONAL_TRANSFER_EXACT", binding=binding,
                      region_count=coverage["region_count"], asm_instances=len(coverage["regions"]),
                      boundary_ports=coverage["boundary_ports"],
                      complete_q_nodes=sum(len(t["events"]) for t in q["threads"]),
                      actual_user_monitors=host["user_assertions"])
        query = check_queries(independent_q, backend_dir / "snapshots/query-audit.json", backend,
                              host, out / "verifier/queries", host_profile="D2")
        report["query_result"] = query["result"]
        require(query["result"] in {"BOUND_SAFETY_QUERY_SAT", "BOUND_SAFETY_AND_BOUND_UNSAT"},
                query.get("reason", "query binding failed"))
        require(qfile.read_bytes() == raw_q, "actual Q mutated during certification")
        if report["controlled_fault"]:
            report["result"] = "ACTC_TRANSFER_TEST_ONLY"
        elif query["result"] == "BOUND_SAFETY_QUERY_SAT":
            report["result"] = "ACTC_QUERY_SAT_NO_SAFE"
        elif replay:
            report["result"] = "ACTC_BOUND_SAFE_REPLAYED"
        else:
            report.update(result="ACTC_CONDITIONAL_SAFE", program_verdict_eligible=True)
    except Exception as error:
        report["reason"] = str(error)
    require(all(sha((ROOT / p).read_bytes()) == h for p, h in implementation.items()), "implementation changed during run")
    save_json(out / "composition-certificate.json", report)
    print(json.dumps({k: report[k] for k in ("result", "reason", "asm_instances", "region_count", "boundary_ports") if k in report}), flush=True)
    return report


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("--capture", required=True, type=Path)
    p.add_argument("--out", required=True, type=Path)
    p.add_argument("--replay", type=Path)
    p.add_argument("--merged", action="store_true")
    a = p.parse_args()
    run(a.capture, a.out, replay=a.replay, merged=a.merged)

"""Final replay of the SAME captured objects. No compiler/backend invocation."""
import json
import platform
import sys
from pathlib import Path
import z3
from certification.run_pipeline import ROOT, implementation_hashes, verify_build
from certification.prepare import prepare_observed
from certification.coverage import certify_workers
from certification.host_contracts import check_host_objects
from certification.provenance import require
from certification.evidence import save_json
from certification.interface import sha
from experiments.ck_negative_checks import component_checks
from experiments.controlled_faults import isolated_diff

BASE = ROOT / "experiments/ck-provenance"


def run():
    out = BASE / "reviewed"
    out.mkdir(exist_ok=False)
    implementation = implementation_hashes()
    for rel in ("experiments/build_clang_observer.py", "experiments/capture_ck.py",
                "experiments/certify_ck.py", "experiments/ck_negative_checks.py",
                "experiments/review_ck_objects.py", "experiments/controlled_faults.py"):
        implementation[rel] = sha((ROOT / rel).read_bytes())
    save_json(out / "implementation.json", implementation)
    for rel, digest in implementation.items():
        target = out / "implementation-sources" / rel
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes((ROOT / rel).read_bytes())
        require(sha(target.read_bytes()) == digest, "source changed while sealing")
    capture, accepted = BASE / "capture-04", BASE / "acceptance-01"
    evidence = prepare_observed(capture, out / "translation")
    actual = (accepted / "translation/candidate.ll").read_bytes()
    require(evidence["candidate_llvm"].encode() == actual,
            "today's checked transformation differs from the actual backend input")
    interface = evidence["interface"]
    module = (capture / "source.ll").read_bytes().decode()
    receipt = json.loads((accepted / "backend/backend-receipt.json").read_bytes())
    require(receipt["result"] == "ACTUAL_BACKEND_CAPTURED" and receipt["controlled_fault"] is None,
            "positive run was not the normal backend")
    build = verify_build(ROOT / "vendor/Dat3M-minimal-acceptance-v3",
                         ROOT / "experiments/minimal-acceptance/build-03/build-receipt.json")
    require(build == receipt["build"] and sha(actual) == receipt["candidate_sha256"], "backend/input changed")
    for name, digest in receipt["snapshots"].items():
        require(sha((accepted / "backend/snapshots" / name).read_bytes()) == digest, "snapshot changed")
    for rel, digest in receipt["queries"].items():
        require(sha((accepted / "backend" / rel).read_bytes()) == digest, "backend query changed")
    before, after = [json.loads((accepted / "backend/snapshots" / name).read_bytes())
                     for name in ["before-encoding.json", "after-encoding.json"]]
    require(before["run_id"] == receipt["run_id"] and before == after, "not same-run actual objects")
    coverage = certify_workers(module, interface, before, after, out / "regions")
    require(coverage["result"] == "SUPPORTED_WORKERS_EXACT", "final coverage failed")
    host = check_host_objects(module, interface, before, coverage)
    require(host["result"] == "STRUCTURAL_HOST_CONTRACTS_CHECKED", "final host checks failed")
    save_json(out / "host-contracts.json", host)
    evidence.pop("candidate_llvm")
    save_json(out / "translation/evidence.json", evidence)
    components = component_checks(capture, out / "component-faults")
    faults = []
    for mode in ["live-use-only", "omit-instance"]:
        origin = BASE / "negative-01/actual" / mode
        q = [json.loads((origin / "backend/snapshots" / (phase + ".json")).read_bytes())
             for phase in ["pre-fault", "post-fault", "before-encoding", "after-encoding"]]
        br = json.loads((origin / "backend/backend-receipt.json").read_bytes())
        require(br["result"] == "ACTUAL_BACKEND_CAPTURED" and br["controlled_fault"] == mode,
                "missing actual fault run")
        require(br["candidate_sha256"] == sha(actual)
                and all(obj["run_id"] == br["run_id"] for obj in q), "fault source/run identity")
        for name, digest in br["snapshots"].items():
            require(sha((origin / "backend/snapshots" / name).read_bytes()) == digest, "fault snapshot changed")
        for rel, digest in br["queries"].items():
            require(sha((origin / "backend" / rel).read_bytes()) == digest, "fault SMT changed")
        require(q[1] == q[2] == q[3], "fault Program changed after mutation")
        target = out / "actual-faults" / mode
        diff = isolated_diff(q[0], q[1], mode)
        save_json(target / "isolation.json", diff)
        control = certify_workers(module, interface, q[0], q[0], target / "control")
        faulty = certify_workers(module, interface, q[2], q[3], target / "check")
        require(control["result"] == "SUPPORTED_WORKERS_EXACT" and faulty["result"] == "REJECT",
                "final actual fault discrimination failed")
        faults.append({"mode": mode, "original_capture": origin.relative_to(ROOT).as_posix(),
                       "control": control["result"], "result": faulty["result"], "reason": faulty["reason"],
                       "isolated": diff["result"]})
    obligations = []
    for p in (out / "translation").rglob("certificate.json"):
        obligations += json.loads(p.read_bytes()).get("obligations", [])
    for p in (out / "regions").rglob("certificate.json"):
        obligations += json.loads(p.read_bytes()).get("obligations", [])
    counts = {r: sum(o["result"] == r for o in obligations) for r in {"sat", "unsat", "unknown"}}
    summary = {
        "result": "CK_SCOPED_CHAIN_CHECKED_UNDER_DECLARED_TCB",
        "program_verdict_eligible": False, "novelty_confirmed": False,
        "compiler_capture": capture.relative_to(ROOT).as_posix(),
        "actual_positive_backend": (accepted / "backend").relative_to(ROOT).as_posix(),
        "compiler_or_backend_rerun": False, "candidate_sha256": sha(actual),
        "all_ast_asm_sites": interface["provenance"]["all_ast_asm_sites"],
        "static_inline_sites": 1, "potential_worker_activations": coverage["scope"]["expected_instances"],
        "binding": interface["bindings"], "positive_local_obligations": counts,
        "actual_regions": [{"thread": r["thread"], "first": r["first"], "last": r["last"], "exit": r["exit"]}
                           for r in coverage["regions"]],
        "actual_continuations": [{"llvm_result": c["llvm_result"], "projection": c["projection"],
                                 "assertion_events": c["assertion_events"]} for c in coverage["continuations"]],
        "component_faults": components, "actual_faults": faults,
        "runtime": {"python": sys.version, "z3": z3.get_version_string(), "platform": platform.platform()},
        "external_assumptions": json.loads((accepted / "acceptance.json").read_bytes())["trusted_not_proved"],
        "stop": "milestone delivered; no arbitrary static-site/CFG/instruction or benchmark expansion"}
    for rel, digest in implementation.items():
        require(sha((ROOT / rel).read_bytes()) == digest, "implementation changed during final replay")
    save_json(out / "summary.json", summary)
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    run()

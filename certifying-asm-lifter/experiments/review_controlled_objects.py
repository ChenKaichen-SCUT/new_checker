"""Review final checker against the unchanged ACTUAL captured objects.

No compiler/backend rerun, no edited snapshot. This replays local proof
obligations after code review and seals the exact current checker sources.
"""
import json
from certification.run_pipeline import ROOT, implementation_hashes
from certification.prepare import prepare
from certification.interface import sha, source_interface
from certification.coverage import certify_workers
from certification.host_contracts import check_host_objects
from certification.evidence import save_json
from experiments.controlled_faults import isolated_diff
from frontend.gnu import Reject


def require(x, reason):
    if not x:
        raise Reject(reason)


def read(path):
    return json.loads(path.read_bytes())


def authenticated_capture(run):
    receipt = read(run / "backend/backend-receipt.json")
    require(receipt["result"] == "ACTUAL_BACKEND_CAPTURED", "backend capture")
    for name, digest in receipt["snapshots"].items():
        require(sha((run / "backend/snapshots" / name).read_bytes()) == digest, "snapshot digest")
    for name, digest in receipt["queries"].items():
        require(sha((run / "backend" / name).read_bytes()) == digest, "query digest")
    a = read(run / "backend/snapshots/before-encoding.json")
    b = read(run / "backend/snapshots/after-encoding.json")
    require(a == b and a["run_id"] == receipt["run_id"], "same-run actual object")
    return a, b, receipt


def run():
    base = ROOT / "experiments/controlled-round"
    out = base / "reviewed"
    out.mkdir(exist_ok=False)
    implementation = implementation_hashes()
    for rel, digest in implementation.items():
        data = (ROOT / rel).read_bytes()
        require(sha(data) == digest, "source copy")
        target = out / "implementation-sources" / rel
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(data)
    save_json(out / "implementation.json", implementation)
    rows = []
    for name in ["live-01", "cas-success-01", "cas-failure-01", "live-unsupported"]:
        capture = base / name
        target = out / name
        compiler = read(capture / "compiler-receipt.json")
        for file, key in [("source.c", "source_sha256"), ("source.ast.json", "ast_sha256"),
                          ("source.ll", "llvm_sha256")]:
            require(sha((capture / file).read_bytes()) == compiler[key], "compiler object hash")
        llvm = (capture / "source.ll").read_bytes().decode("utf8")
        prepared = prepare((capture / "source.c").read_bytes(), read(capture / "source.ast.json"),
                           llvm, target / "translation")
        candidate = (capture / "translation/candidate.ll").read_bytes()
        require(prepared["candidate_llvm"].encode() == candidate, "candidate frame/reconstruction")
        interface = prepared["interface"]
        interface["source_path"] = read(capture / "translation/interface.json")["source_path"]
        save_json(target / "translation/interface.json", interface)
        a, b, backend = authenticated_capture(capture)
        require(sha(candidate) == backend["candidate_sha256"], "solver actual module")
        coverage = certify_workers(llvm, interface, a, b, target / "regions")
        host = check_host_objects(llvm, interface, a, coverage)
        save_json(target / "host-contracts.json", host)
        expected = "REJECT" if name == "live-unsupported" else "SUPPORTED_WORKERS_EXACT"
        require(coverage["result"] == expected, "positive/unsupported discrimination")
        if expected != "REJECT":
            require(host["result"] == "STRUCTURAL_HOST_CONTRACTS_CHECKED", "host contracts")
        rows.append({"case": name, "actual_capture": capture.relative_to(ROOT).as_posix(),
                     "result": coverage["result"], "reason": coverage.get("reason"),
                     "run_id": backend["run_id"], "candidate_sha256": sha(candidate),
                     "output_correspondence": [r.get("output_projection") for r in coverage["regions"]],
                     "program_verdict_eligible": False})
    faults = []
    for row in read(base / "single-factor/summary.json"):
        mode = row["mode"]
        capture = base / "single-factor" / mode
        a, b, backend = authenticated_capture(capture)
        pre = read(capture / "backend/snapshots/pre-fault.json")
        post = read(capture / "backend/snapshots/post-fault.json")
        require(post == a, "faulted actual Program unchanged before encoding")
        isolated_diff(pre, post, mode)
        positive = ROOT / row["positive_run"]
        require(sha((positive / "translation/candidate.ll").read_bytes()) == backend["candidate_sha256"],
                "negative actual module")
        llvm = (positive / "source.ll").read_bytes().decode("utf8")
        interface = read(positive / "translation/interface.json")
        control = certify_workers(llvm, interface, pre, pre, out / "faults" / mode / "control")
        bad = certify_workers(llvm, interface, a, b, out / "faults" / mode / "fault")
        require(control["result"] == "SUPPORTED_WORKERS_EXACT" and bad["result"] == "REJECT",
                "negative detection")
        faults.append({"fault": mode, "control": control["result"],
                       "result": bad["result"], "reason": bad.get("reason")})
    ck = base / "ck-admission-05"
    comp = read(ck / "compiler-receipt.json")
    for file, key in [("source.c", "source_sha256"), ("source.ast.json", "ast_sha256"),
                      ("source.ll", "llvm_sha256")]:
        require(sha((ck / file).read_bytes()) == comp[key], "CK actual compiler object")
    for dep in comp["dependencies"].values():
        require(sha((ck / dep["file"]).read_bytes()) == dep["sha256"], "CK dependency")
    try:
        source_interface((ck / "source.c").read_bytes(), read(ck / "source.ast.json"))
    except Reject as error:
        ck_reason = str(error)
    else:
        raise Reject("unsupported original CK interface accepted")
    require(implementation == implementation_hashes(), "checker changed during review")
    summary = {"result": "CONTROLLED_REVIEW_COMPLETE_WITH_THIRD_PARTY_REJECTION",
               "positives_and_unsupported": rows, "single_factor_faults": faults,
               "third_party": {"result": "REJECT", "reason": ck_reason},
               "new_compiler_or_backend_execution": False, "program_verdict_eligible": False}
    save_json(out / "summary.json", summary)
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    run()

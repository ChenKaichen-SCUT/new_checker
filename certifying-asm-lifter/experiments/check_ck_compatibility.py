"""Small replay regression for the shared prepare/coverage changes; no tool runs."""
import json
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.prepare import prepare
from certification.coverage import certify_workers
from certification.interface import sha
from certification.evidence import save_json
from frontend.gnu import Reject


def run():
    out = ROOT / "experiments/ck-provenance/compatibility"
    out.mkdir(exist_ok=False)
    base = ROOT / "experiments/controlled-round"
    cases = [ROOT / "experiments/minimal-acceptance/final",
             *[base / s for s in ["live-01", "cas-success-01", "cas-failure-01", "live-unsupported"]]]
    rows = []
    for capture in cases:
        expected = "REJECT" if capture.name == "live-unsupported" else "SUPPORTED_WORKERS_EXACT"
        source = (capture / "source.c").read_bytes()
        ast = json.loads((capture / "source.ast.json").read_bytes())
        llvm = (capture / "source.ll").read_bytes().decode()
        ev = prepare(source, ast, llvm, out / capture.name / "translation")
        if ev["candidate_llvm"].encode() != (capture / "translation/candidate.ll").read_bytes():
            raise Reject("legacy transformation bytes changed")
        interface = ev["interface"]
        old = json.loads((capture / "translation/interface.json").read_bytes())
        interface["source_path"] = old["source_path"]
        before, after = [json.loads((capture / "backend/snapshots" / (phase + ".json")).read_bytes())
                         for phase in ["before-encoding", "after-encoding"]]
        cov = certify_workers(llvm, interface, before, after, out / capture.name / "regions")
        row = {"capture": capture.relative_to(ROOT).as_posix(), "expected": expected,
               "result": cov["result"], "reason": cov.get("reason"),
               "candidate_byte_identical": True, "program_verdict_eligible": False}
        rows.append(row)
        if row["result"] != expected:
            raise Reject("legacy scope regression: " + capture.name)
    old_ck = base / "ck-admission-05"
    try:
        prepare((old_ck / "source.c").read_bytes(), json.loads((old_ck / "source.ast.json").read_bytes()),
                (old_ck / "source.ll").read_bytes().decode())
    except Reject as error:
        rows.append({"capture": old_ck.relative_to(ROOT).as_posix(), "entry": "legacy direct-source API",
                     "result": "REJECT", "reason": str(error),
                     "new_observer_provenance_not_bypassed": True})
    else:
        raise Reject("legacy entry bypassed observer provenance")
    save_json(out / "summary.json", {"result": "SHARED_PATH_COMPATIBILITY_CHECKED",
                                   "compiler_or_backend_run": False, "cases": rows})
    print(json.dumps(rows, indent=2))


if __name__ == "__main__":
    run()

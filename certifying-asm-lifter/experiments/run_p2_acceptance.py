"""Fixed controlled cases. No performance/competition campaign."""
import argparse
import json
import sys
from pathlib import Path
from certification.evidence import Commands, save_json
from certification.run_pipeline import ROOT
from certification.provenance import require

SAFE = "CONDITIONAL_SAFE"
SAT = "SAFETY_QUERY_SAT_NO_SAFE_TRANSFER"
CASES = {
    "readonly": [("safe", "readonly", None, SAFE, None),
                 ("unsafe", "readonly-unsafe", None, SAT, None),
                 ("wrong-entry", "readonly", "entry-ssa", "REJECT", "-write-value"),
                 ("wrong-operand", "readonly", "operand-only", "REJECT", "-write-value"),
                 ("wrong-assert", "readonly", "assert-only", "REJECT", "-monitor-"),
                 ("wrong-query", "readonly-unsafe", "safety-query-binding", "REJECT", "actual-safety-assumption-binding")],
    "multi": [("safe", "readonly-multi", None, SAFE, None),
              ("unsafe", "readonly-multi-unsafe", None, SAT, None)] + [
        (name, "readonly-multi-unsafe" if fault == "safety-query-binding" else "readonly-multi",
         fault, "REJECT", reason) for name, fault, reason in [
            ("swapped-returns", "swap-returns", "-monitor-"),
            ("wrong-second-input", "second-operand", "-write-value"),
            ("missing-static-call", "omit-call", "effect census"),
            ("missing-call-activation", "omit-activation", "effect census"),
            ("lost-cross-read", "cross-read", "ordinary read tags/width"),
            ("wrong-continuation", "continuation-assert", "-monitor-"),
            ("wrong-query", "safety-query-binding", "actual-safety-assumption-binding")]],
    "workers": [("safe", "workers", None, SAFE, None),
                ("unsafe", "workers-unsafe", None, SAT, None),
                ("source-alias", "workers-alias", None, "REJECT", "MIXED_C_ASM_CONFLICT"),
                ("source-cross-alias", "workers-crossalias", None, "REJECT", "MIXED_C_ASM_CONFLICT"),
                ("source-width", "workers-width", None, "REJECT", "roundtrip")] + [
        (name, "workers-unsafe" if fault == "safety-query-binding" else "workers", fault, "REJECT", reason)
        for name, fault, reason in [
            ("wrong-thread-argument", "thread-argument", "thread-argument"),
            ("wrong-input-object", "input-alias", "-read-0-address"),
            ("wrong-entry", "entry-ssa", "-write-value"),
            ("missing-worker-call", "omit-worker-call", "effect census"),
            ("wrong-live-output", "live-use-only", "-monitor-"),
            ("lost-atomic-label", "a-only", "RMW read width/labels"),
            ("wrong-query", "safety-query-binding", "actual-safety-assumption-binding")]],
}


def execute(out, cases):
    out.mkdir(parents=True, exist_ok=False)
    log, rows = Commands(out / "commands"), []
    save_json(out / "fixed-cases.json", cases)
    for name, capture, fault, expected, reason in cases:
        build, receipt = (("vendor/Dat3M-p2-fault-v1", "experiments/p2/build-fault-01") if fault else
                          ("vendor/Dat3M-p0-positive-v1", "experiments/p0/build-positive-01"))
        command = [sys.executable, "-m", "experiments.certify_p1", "--capture", str(ROOT / capture),
                   "--out", str(out / name), "--dat3m", str(ROOT / build),
                   "--build-receipt", str(ROOT / receipt / "build-receipt.json")]
        if fault:
            command += ["--fault", fault]
        code, _, _ = log.run(command, timeout=240, allow_failure=True)
        cert = json.loads((out / name / "program-certificate.json").read_bytes())
        row = {"case": name, "capture": capture, "fault": fault, "expected": expected,
               "actual": cert["result"], "reason": cert.get("reason"), "returncode": code,
               "backend_observation": cert.get("backend", {}).get("observed_verdict"),
               "program_verdict_eligible": cert["program_verdict_eligible"]}
        rows.append(row)
        save_json(out / "results.json", rows)
        print(json.dumps(row), flush=True)
        require(cert["result"] == expected and code == (1 if expected == "REJECT" else 0), "unexpected result")
        require(not reason or reason in cert.get("reason", ""), "did not reach intended independent rejection")
        require(cert["program_verdict_eligible"] is (expected == SAFE), "wrong authorization")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", required=True, type=Path)
    ap.add_argument("--stage", choices=[*CASES, "legacy"], required=True)
    a = ap.parse_args()
    if a.stage == "legacy":
        # Invoke every historical P1 case with its original real capture; the
        # newly enforced source premise supersedes old program eligibility.
        cases = []
        for suite in ("readonly", "multi"):
            for name, source, fault, _, _ in CASES[suite]:
                capture = ("experiments/p1a/capture-" + ("unsafe-01" if "unsafe" in source else "safe-01")
                           if suite == "readonly" else
                           "experiments/p1b/capture-" + ("unsafe-01" if "unsafe" in source else "safe-02"))
                cases.append((suite + "-" + name, capture, fault, "REJECT", "MIXED_C_ASM_CONFLICT"))
        cases.append(("different-worker-contexts", "experiments/p1b/capture-contexts-01", None,
                      "REJECT", "MIXED_C_ASM_CONFLICT"))
    else:
        cases = [(n, "experiments/p2/capture-" + c, f, e, r) for n, c, f, e, r in CASES[a.stage]]
    execute(a.out.resolve(), cases)


if __name__ == "__main__":
    main()

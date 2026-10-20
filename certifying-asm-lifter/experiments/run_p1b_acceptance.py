"""Finite P1b capability/fault acceptance, not a performance campaign."""
import argparse
import json
import sys
from pathlib import Path
from certification.evidence import Commands, save_json
from certification.run_pipeline import ROOT
from certification.provenance import require


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", required=True, type=Path)
    args = parser.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=False)
    log, rows = Commands(out / "commands"), []
    cases = [
        ("safe", "safe-02", None, "CONDITIONAL_SAFE", None),
        ("unsafe", "unsafe-01", None, "SAFETY_QUERY_SAT_NO_SAFE_TRANSFER", None),
        ("swapped-returns", "safe-02", "swap-returns", "REJECT", "-monitor-"),
        ("wrong-second-input", "safe-02", "second-operand", "REJECT", "-write-value"),
        ("missing-static-call", "safe-02", "omit-call", "REJECT", "effect census"),
        ("missing-call-activation", "safe-02", "omit-activation", "REJECT", "effect census"),
        ("lost-cross-read", "safe-02", "cross-read", "REJECT", "ordinary read tags/width"),
        ("wrong-continuation", "safe-02", "continuation-assert", "REJECT", "-monitor-"),
        ("wrong-query", "unsafe-01", "safety-query-binding", "REJECT", "actual-safety-assumption-binding"),
        ("different-worker-contexts", "contexts-01", None, "REJECT", "one worker definition"),
    ]
    for name, source, fault, expected, reason in cases:
        build = ("vendor/Dat3M-p1b-fault-v1", "experiments/p1b/build-fault-01") if fault else (
            "vendor/Dat3M-p0-positive-v1", "experiments/p0/build-positive-01")
        command = [sys.executable, "-m", "experiments.certify_p1",
                   "--capture", str(ROOT / f"experiments/p1b/capture-{source}"),
                   "--out", str(out / name), "--dat3m", str(ROOT / build[0]),
                   "--build-receipt", str(ROOT / build[1] / "build-receipt.json")]
        if fault:
            command += ["--fault", fault]
        code, _, _ = log.run(command, timeout=240, allow_failure=True)
        cert = json.loads((out / name / "program-certificate.json").read_bytes())
        row = {"case": name, "returncode": code, "expected": expected, "actual": cert["result"],
               "reason": cert.get("reason"), "backend_observation": cert.get("backend", {}).get("observed_verdict"),
               "program_verdict_eligible": cert["program_verdict_eligible"]}
        rows.append(row)
        save_json(out / "results.json", rows)
        print(json.dumps(row), flush=True)
        require(row["actual"] == expected and code == (1 if expected == "REJECT" else 0),
                "unexpected P1b outcome")
        require(not reason or reason in (row["reason"] or ""), "fault rejected at wrong premise")
        require(row["program_verdict_eligible"] is (name == "safe"), "unexpected SAFE release")


if __name__ == "__main__":
    main()

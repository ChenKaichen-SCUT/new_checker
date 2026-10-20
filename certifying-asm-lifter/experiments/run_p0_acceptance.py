"""Exactly the five authorized cases, with separate fresh raw evidence directories."""
import json
import sys
import argparse
from pathlib import Path
from certification.evidence import Commands, save_json
from certification.run_pipeline import ROOT
from certification.provenance import require


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", type=Path, default=ROOT / "experiments/p0/final-run")
    args = ap.parse_args()
    out = args.out.resolve()
    out.mkdir(parents=True, exist_ok=False)
    log = Commands(out / "commands")
    rows = []
    cases = [
        ("safe", "safe", None, "CONDITIONAL_SAFE", None),
        ("unsafe", "unsafe", None, "SAFETY_QUERY_SAT_NO_SAFE_TRANSFER", None),
        ("missing-main-assert", "unsafe", "main-assert-omission", "REJECT", "main operation/event census"),
        ("wrong-join", "safe", "join-association", "REJECT", "Program join association"),
        ("wrong-query", "unsafe", "safety-query-binding", "REJECT", "actual-safety-assumption-binding"),
    ]
    for name, source, fault, expected, reason in cases:
        build = "fault" if fault else "positive"
        command = [sys.executable, "-m", "experiments.certify_p0",
                   "--capture", str(ROOT / f"experiments/p0/capture-{source}-01"),
                   "--out", str(out / name),
                   "--dat3m", str(ROOT / f"vendor/Dat3M-p0-{build}-v1"),
                   "--build-receipt", str(ROOT / f"experiments/p0/build-{build}-01/build-receipt.json")]
        if fault:
            command += ["--fault", fault]
        code, stdout, stderr = log.run(command, timeout=180, allow_failure=True)
        cert = json.loads((out / name / "program-certificate.json").read_bytes())
        row = {"case": name, "returncode": code, "expected": expected, "actual": cert["result"],
               "reason": cert.get("reason"), "backend_observation": cert.get("backend", {}).get("observed_verdict"),
               "program_verdict_eligible": cert["program_verdict_eligible"]}
        rows.append(row)
        save_json(out / "results.json", rows)
        print(json.dumps(row), flush=True)
        require(cert["result"] == expected and code == (1 if expected == "REJECT" else 0),
                "P0 expected outcome mismatch")
        if reason:
            require(reason in cert.get("reason", ""), "fault did not reach its independent semantic rejection")
        require(cert["program_verdict_eligible"] is (name == "safe"), "unexpected SAFE authorization")


if __name__ == "__main__":
    main()

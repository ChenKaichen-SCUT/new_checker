"""Only the six discriminating P1a cases; every run saves actual raw objects."""
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
    for name, source, fault, expected, reason in [
        ("safe", "safe", None, "CONDITIONAL_SAFE", None),
        ("unsafe", "unsafe", None, "SAFETY_QUERY_SAT_NO_SAFE_TRANSFER", None),
        ("wrong-entry", "safe", "entry-ssa", "REJECT", "-write-value"),
        ("wrong-operand", "safe", "operand-only", "REJECT", "-write-value"),
        ("wrong-assert", "safe", "assert-only", "REJECT", "-monitor-"),
        ("wrong-query", "unsafe", "safety-query-binding", "REJECT", "actual-safety-assumption-binding"),
    ]:
        build = ("vendor/Dat3M-p1a-fault-v2", "experiments/p1a/build-fault-02") if fault else (
            "vendor/Dat3M-p0-positive-v1", "experiments/p0/build-positive-01")
        command = [sys.executable, "-m", "experiments.certify_p1",
                   "--capture", str(ROOT / f"experiments/p1a/capture-{source}-01"),
                   "--out", str(out / name), "--dat3m", str(ROOT / build[0]),
                   "--build-receipt", str(ROOT / build[1] / "build-receipt.json")]
        if fault:
            command += ["--fault", fault]
        code, _, _ = log.run(command, timeout=180, allow_failure=True)
        cert = json.loads((out / name / "program-certificate.json").read_bytes())
        row = {"case": name, "returncode": code, "expected": expected, "actual": cert["result"],
               "reason": cert.get("reason"), "backend_observation": cert.get("backend", {}).get("observed_verdict"),
               "program_verdict_eligible": cert["program_verdict_eligible"]}
        rows.append(row)
        save_json(out / "results.json", rows)
        print(json.dumps(row), flush=True)
        require(row["actual"] == expected and code == (1 if expected == "REJECT" else 0),
                "unexpected P1a outcome")
        require(not reason or reason in (row["reason"] or ""), "fault failed at wrong premise")
        require(row["program_verdict_eligible"] is (name == "safe"), "unexpected SAFE release")


if __name__ == "__main__":
    main()

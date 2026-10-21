"""Fixed minimal Scheme A acceptance and paired D2 comparison, not a benchmark campaign."""
import argparse
import json
import sys
import time
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.evidence import Commands, save_json
from certification.hcc import declaration
from certification.provenance import require

CASES = [
    ("workers-safe", "p2/capture-workers", None, "CONDITIONAL_SAFE", None),
    ("multi-safe", "p2/capture-readonly-multi", None, "CONDITIONAL_SAFE", None),
    ("workers-unsafe", "p2/capture-workers-unsafe", None, "SAFETY_QUERY_SAT_NO_SAFE_TRANSFER", None),
    ("wrong-entry", "p2/capture-workers", "entry-ssa", "REJECT", "write-value"),
    ("wrong-thread", "p2/capture-workers", "thread-argument", "REJECT", "thread-argument"),
    ("wrong-object", "p2/capture-workers", "input-alias", "REJECT", "read-0-address"),
    ("wrong-live-output", "p2/capture-workers", "live-use-only", "REJECT", "monitor-"),
    ("missing-worker", "p2/capture-workers", "omit-worker-call", "REJECT", "effect census"),
    ("lost-atomic", "p2/capture-workers", "a-only", "REJECT", "RMW read width/labels"),
    ("wrong-query", "p2/capture-workers-unsafe", "safety-query-binding", "REJECT", "actual-safety-assumption-binding"),
    ("swapped-returns", "p2/capture-readonly-multi", "swap-returns", "REJECT", "monitor-"),
    ("missing-second", "p2/capture-readonly-multi", "omit-call", "REJECT", "effect census"),
    ("wrong-second-input", "p2/capture-readonly-multi", "second-operand", "REJECT", "write-value"),
    ("lost-cross-read", "p2/capture-readonly-multi", "cross-read", "REJECT", "ordinary read tags/width"),
    ("branch-local-only", "hcc/capture-branch", None, "REJECT", "HCC_UNDISCHARGED"),
]


def execute(out):
    out.mkdir(parents=True, exist_ok=False)
    logs = Commands(out / "commands")
    save_json(out / "fixed-cases.json", CASES)
    rows = []

    def run(name, capture, fault, expected, reason, module="certify_hcc", hcc=None):
        capture = ROOT / "experiments" / capture
        build, receipt = (("vendor/Dat3M-p2-fault-v1", "experiments/p2/build-fault-01") if fault else
                          ("vendor/Dat3M-p0-positive-v1", "experiments/p0/build-positive-01"))
        command = [sys.executable, "-m", "experiments." + module, "--capture", str(capture),
                   "--out", str(out / name), "--dat3m", str(ROOT / build),
                   "--build-receipt", str(ROOT / receipt / "build-receipt.json")]
        if fault: command += ["--fault", fault]
        if hcc:
            path = out / (name + "-declaration.json")
            save_json(path, hcc)
            command += ["--hcc-file", str(path)]
        started = time.perf_counter()
        code, _, _ = logs.run(command, timeout=240, allow_failure=True)
        cert = json.loads((out / name / "program-certificate.json").read_bytes())
        row = {"case": name, "module": module, "seconds": time.perf_counter() - started,
               "result": cert["result"], "expected": expected, "reason": cert.get("reason"),
               "local_result": cert.get("local_result"), "reuse": cert.get("reuse"),
               "backend": cert.get("backend", {}).get("observed_verdict"),
               "capture": capture.relative_to(ROOT).as_posix(), "fault": fault}
        rows.append(row)
        save_json(out / "results.json", rows)
        print(json.dumps(row), flush=True)
        require(cert["result"] == expected and code == (1 if expected == "REJECT" else 0), "unexpected acceptance")
        require(not reason or reason in cert.get("reason", ""), "wrong rejection mechanism")
        require(cert["program_verdict_eligible"] is (expected == "CONDITIONAL_SAFE"), "eligibility mismatch")

    for case in CASES: run(*case)
    for name, capture in [("workers", "p2/capture-workers"), ("multi", "p2/capture-readonly-multi")]:
        run("d2-" + name, capture, None, "CONDITIONAL_SAFE", None, module="certify_p1")
    run("d2-unsafe", "p2/capture-workers-unsafe", None, "SAFETY_QUERY_SAT_NO_SAFE_TRANSFER", None, module="certify_p1")
    run("d2-branch", "hcc/capture-branch", None, "REJECT", "unconsumed C worker statement", module="certify_p1")
    for mode in ("unavailable", "wrong-artifact", "self-attested"):
        d = declaration(ROOT / "experiments/p2/capture-workers")
        if mode == "unavailable": d["provider"] = "unavailable"
        if mode == "wrong-artifact": d["artifacts"]["source.c"] = "0" * 64
        if mode == "self-attested": d["extra_assumptions"] = ["all host compilation is correct"]
        run("hcc-" + mode, "p2/capture-workers", None, "REJECT",
            "HCC_UNDISCHARGED" if mode == "unavailable" else "HCC declaration/artifact/scope mismatch", hcc=d)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", required=True, type=Path)
    execute(ap.parse_args().out.resolve())

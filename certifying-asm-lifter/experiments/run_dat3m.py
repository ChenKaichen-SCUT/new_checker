"""Exploratory fixed-version backend runs. No BenchExec score/performance claims."""
import argparse
import json
import os
import re
import subprocess
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
VENDOR = ROOT / "vendor/Dat3M-b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8"


def linux(path):
    p = Path(path).resolve()
    if os.name != "nt":
        return str(p)
    return "/mnt/" + p.drive[0].lower() + str(p)[2:].replace("\\", "/")


def run(path, model="tso", extra=(), timeout=40):
    home = linux(VENDOR)
    command = ["wsl", "-d", "Ubuntu", "--", "env", "DAT3M_HOME=" + home,
               "DAT3M_OUTPUT=" + linux(ROOT / "experiments/backend-output"),
               "java", "-jar", home + "/dartagnan/target/dartagnan.jar",
               home + "/cat/" + model + ".cat", linux(path),
               "--target=" + ("tso" if model == "sc" else model),
               "--property=program_spec", "--method=eager", "--solver=z3", *extra]
    start = time.perf_counter()
    try:
        from certification.platform_launch import native_args
        p = subprocess.run(native_args(command), capture_output=True, timeout=timeout)
        output = p.stdout.decode("utf-8", errors="replace") + p.stderr.decode("utf-8", errors="replace")
        verdicts = re.findall(r"Result:\s*(PASS|FAIL|UNKNOWN|ERROR)", output)
        verdict = verdicts[-1] if verdicts else "ERROR"
        exitcode = p.returncode
    except subprocess.TimeoutExpired as e:
        output = (e.stdout or b"").decode("utf-8", errors="replace") + "\nTIMEOUT"
        verdict, exitcode = "TIMEOUT", None
    return {"file": str(Path(path).resolve().relative_to(ROOT)), "model": model, "result": verdict,
            "seconds": time.perf_counter() - start, "exit_code": exitcode,
            "command": command, "output": output}


def main():
    p = argparse.ArgumentParser()
    p.add_argument("files", nargs="*", type=Path)
    p.add_argument("--smoke", action="store_true")
    p.add_argument("--print-ir", action="store_true")
    args = p.parse_args()
    files = args.files or ([VENDOR / "litmus/X86/SB.litmus"] if args.smoke else
                          sorted((ROOT / "benchmarks/backend").glob("*.ll")))
    results = []
    logdir = ROOT / "experiments/backend-logs"
    logdir.mkdir(exist_ok=True)
    for file in files:
        result = run(file, extra=("--printer.afterProcessing=true",) if args.print_ir else ())
        (logdir / (file.stem + ".log")).write_text(result["output"], encoding="utf-8")
        print(file.name, result["result"], round(result["seconds"], 3), flush=True)
        results.append(result)
    (ROOT / "experiments/backend-results.json").write_text(json.dumps(results, indent=2), encoding="utf-8")


if __name__ == "__main__":
    main()

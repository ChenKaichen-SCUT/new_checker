"""Capture actual backend on a locally certified complex host; never release SAFE."""
import json
import argparse
from pathlib import Path
from certification.run_pipeline import ROOT, run_backend
from certification.interface import sha
from certification.evidence import save_json, Commands
from certification.provenance import require
from experiments.run_dat3m import linux


def main(out):
    case = ROOT / "experiments/hcc/final-01/branch-local-only"
    local = case / "local/translation/candidate.ll"
    cert = json.loads((case / "program-certificate.json").read_bytes())
    require(cert["result"] == "REJECT" and cert["local_result"] == "LOCAL_PORTS_EXACT", "missing local-only result")
    out.mkdir(exist_ok=False)
    tool = ROOT / "vendor/clang-local/root/usr"
    log = Commands(out / "commands")
    log.run(["wsl", "-d", "Ubuntu", "--exec", "env", "LD_LIBRARY_PATH=" + linux(tool / "lib/x86_64-linux-gnu"),
             linux(tool / "bin/clang-21"), "-cc1", "-emit-llvm-bc", "-disable-llvm-passes",
             "-x", "ir", linux(local), "-o", linux(out / "validated.bc")])
    backend = run_backend(local, ROOT / "vendor/Dat3M-p0-positive-v1",
                          ROOT / "experiments/p0/build-positive-01/build-receipt.json", out / "backend")
    save_json(out / "observation.json", {"result": "OBSERVATION_ONLY_HCC_MISSING", "program_verdict_eligible": False,
              "candidate_sha256": sha(local.read_bytes()), "backend": backend,
              "region_or_query_certification": False,
              "reason": "No open host provider for the branch/continuation; captured Program and raw query results do not discharge HCC."})
    print(json.dumps({"capture_status": backend["result"], "reason": backend.get("reason"),
                      "backend": backend.get("observed_verdict"), "SAFE_authorized": False}))


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", required=True, type=Path)
    main(ap.parse_args().out.resolve())

"""Controlled original CK admission through the existing real backend path."""
import argparse
import json
from pathlib import Path
from certification.prepare import prepare_observed
from certification.run_pipeline import ROOT, implementation_hashes, run_backend
from certification.evidence import Commands, save_json
from certification.interface import sha
from certification.coverage import certify_workers
from certification.host_contracts import check_host_objects
from experiments.run_dat3m import linux
from frontend.gnu import Reject


def run(capture, out):
    out.mkdir(parents=True, exist_ok=False)
    logs = Commands(out / "commands")
    implementation = implementation_hashes()
    save_json(out / "implementation.json", implementation)
    result = {"result": "REJECT", "program_verdict_eligible": False,
              "capture": capture.resolve().relative_to(ROOT).as_posix(), "layers": {}}
    try:
        evidence = prepare_observed(capture, out / "translation")
        interface = evidence["interface"]
        result["layers"].update(provenance=interface["provenance"]["result"],
                                interface="INTERFACE_MATCH", block="BLOCK_EXACT",
                                llvm_fragment="LLVM_FRAGMENT_EXACT",
                                c_inline_continuation="C_INLINE_CONTINUATION_EXACT")
        candidate = out / "translation/candidate.ll"
        if sha(candidate.read_bytes()) != evidence["frame"]["target_module_sha256"]:
            raise Reject("candidate changed")
        tool = ROOT / "vendor/clang-local/root/usr"
        logs.run(["wsl", "-d", "Ubuntu", "--exec", "env",
                  "LD_LIBRARY_PATH=" + linux(tool / "lib/x86_64-linux-gnu"),
                  linux(tool / "bin/clang-21"), "-cc1", "-emit-llvm-bc", "-disable-llvm-passes",
                  "-x", "ir", linux(candidate), "-o", linux(out / "validated.bc")])
        evidence.pop("candidate_llvm")
        save_json(out / "translation/evidence.json", evidence)
        backend = run_backend(candidate, ROOT / "vendor/Dat3M-minimal-acceptance-v3",
                              ROOT / "experiments/minimal-acceptance/build-03/build-receipt.json",
                              out / "backend")
        result["backend"] = backend
        if backend["result"] != "ACTUAL_BACKEND_CAPTURED":
            raise Reject("actual backend capture: " + backend.get("reason", "unknown"))
        before = json.loads((out / "backend/snapshots/before-encoding.json").read_bytes())
        after = json.loads((out / "backend/snapshots/after-encoding.json").read_bytes())
        module = (capture / "source.ll").read_bytes().decode("utf-8")
        coverage = certify_workers(module, interface, before, after, out / "regions")
        result["coverage"] = coverage
        if coverage["result"] != "SUPPORTED_WORKERS_EXACT":
            raise Reject("actual region/instance coverage: " + coverage.get("reason", "unknown"))
        host = check_host_objects(module, interface, before, coverage)
        result["host_contracts"] = host
        save_json(out / "host-contracts.json", host)
        if host["result"] != "STRUCTURAL_HOST_CONTRACTS_CHECKED":
            raise Reject("host contract: " + host.get("reason", "unknown"))
        result["layers"].update(regions="REGION_EXACT", continuation="CONTINUATION_EXACT",
                                coverage="ALL_SUPPORTED_INSTANCES_CHECKED", host=host["result"])
        if implementation_hashes() != implementation:
            raise Reject("checker changed during run")
        result["result"] = "CK_SCOPED_CHAIN_CHECKED_UNDER_DECLARED_TCB"
        result["trusted_not_proved"] = [
            "Clang and read-only observer faithfully expose AST/metadata and compile ordinary host C",
            "local OS, pinned build and artifact capture",
            "restricted ISA interpretation, valid aligned WB objects and ISA/CAT correspondence",
            "Dat3M ordinary host/pthread semantics, exporter, CAT parsing and encoding",
            "Python/Java implementation refinement and SMT solver correctness"]
    except Exception as error:
        result["reason"] = str(error)
    save_json(out / "acceptance.json", result)
    print(json.dumps({k: result[k] for k in ("result", "layers", "reason") if k in result}, indent=2))
    return result


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--capture", required=True, type=Path)
    ap.add_argument("--out", required=True, type=Path)
    args = ap.parse_args()
    raise SystemExit(0 if run(args.capture, args.out)["result"] != "REJECT" else 1)

"""Exactly four mechanical faults in the REAL generated module; no synthetic Q.

Downstream runs after a rejection are explicitly diagnostic. They can never
override a failed certificate. No new C input and no instruction extension.
"""
import argparse
import difflib
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
from certification.interface import sha
from certification.lowering import check_fragment
from certification.coverage import certify_workers
from certification.evidence import Commands, save_certificate, save_json
from certification.run_pipeline import run_backend, implementation_hashes
from experiments.run_dat3m import linux
from frontend.gnu import Reject


def variants(module):
    """Derive all syntax and operands from the actual emitter output."""
    pattern = (r"^(\s*)(%[-\w.]+) = atomicrmw add (i32\*|ptr) (@[-\w.]+), i32 (1) monotonic"
               r"(, !dbg !\d+)$")
    matches = list(re.finditer(pattern, module, re.M))
    if len(matches) != 1:
        raise Reject("negative fixture requires this input's single generated xadd")
    m = matches[0]
    indent, old, ptr, addr, delta, dbg = m.groups()
    load = f"{indent}{old} = load atomic i32, {ptr} {addr} monotonic, align 4{dbg}"
    lost_write = module[:m.start()] + load + module[m.end():]
    wrong_update = module[:m.start()] + m[0].replace("atomicrmw add ", "atomicrmw xchg ") + module[m.end():]
    temporary = old + "_mutated_sum"
    if temporary in module:
        raise Reject("negative SSA collision")
    split = (load + f"\n{indent}{temporary} = add i32 {old}, {delta}{dbg}"
             + f"\n{indent}store atomic i32 {temporary}, {ptr} {addr} monotonic, align 4{dbg}")
    lost_atomic = module[:m.start()] + split + module[m.end():]
    # Route just the second real creation to a mechanically cloned worker whose
    # RMW has been deleted. Both threads still run and join; one source instance
    # has no certified asm region. This also intentionally breaks the host frame.
    function = re.search(r"^define [^\n]*@worker\([^\n]*\{\n.*?^\}", module, re.M | re.S)
    if not function or function[0].count("atomicrmw add") != 1:
        raise Reject("cannot identify the actual worker definition")
    clone = function[0].replace("@worker(", "@worker_omitted(", 1)
    clone = re.sub(r"%[-\w.]+ = atomicrmw add[^\n]*", old + " = add i32 0, 0", clone)
    clone = re.sub(r"(?:,)?\s*!dbg !\d+", "", clone)
    creates = list(re.finditer(r"^.*call i32 @pthread_create\([^\n]*@worker,[^\n]*$", module, re.M))
    if len(creates) != 2 or "@worker_omitted" in module:
        raise Reject("negative fixture requires exactly two actual creations")
    second = creates[1]
    uncovered = (module[:second.start()] + second[0].replace("@worker,", "@worker_omitted,")
                 + module[second.end():] + "\n" + clone + "\n")
    return {"lost-shared-write": lost_write, "wrong-rmw-update": wrong_update,
            "lost-atomic-order-and-pair": lost_atomic, "uncovered-instance": uncovered}


def run(base, out, dat3m, receipt):
    base, out, dat3m = map(lambda p: Path(p).resolve(), (base, out, dat3m))
    if out.exists():
        raise Reject("fresh negative evidence directory required")
    acceptance = json.loads((base / "acceptance.json").read_bytes())
    if acceptance["result"] != "SCOPED_CHAIN_CHECKS_PASSED_UNDER_DECLARED_TCB":
        raise Reject("a fully recorded positive scoped acceptance is required first")
    original = (base / "source.ll").read_bytes().decode("utf-8")
    positive = (base / "translation/candidate.ll").read_bytes().decode("utf-8")
    interface = json.loads((base / "translation/interface.json").read_bytes())
    lines = original.splitlines(keepends=True)
    index = interface["llvm_line_index"]
    prefix, suffix = "".join(lines[:index]), "".join(lines[index + 1:])
    out.mkdir(parents=True)
    implementation = implementation_hashes()
    implementation["experiments/minimal_acceptance_negatives.py"] = sha(Path(__file__).read_bytes())
    save_json(out / "implementation.json", implementation)
    summary = {"purpose": "four negative implementation checks; not a correctness proof",
               "base": str(base), "base_candidate_sha256": sha(positive), "cases": []}
    for name, mutant in variants(positive).items():
        directory = out / name
        directory.mkdir()
        candidate = directory / "candidate.ll"
        candidate.write_bytes(mutant.encode("utf-8"))
        patch = "".join(difflib.unified_diff(positive.splitlines(True), mutant.splitlines(True),
                                           fromfile="actual-positive.ll", tofile=name + ".ll"))
        (directory / "mutation.diff").write_bytes(patch.encode("utf-8"))
        row = {"name": name, "result": "REJECT", "candidate_sha256": sha(mutant),
               "diagnostic_only": True, "program_verdict_eligible": False}
        try:
            frame = mutant.startswith(prefix) and mutant.endswith(suffix)
            row["host_frame"] = "MATCH" if frame else "REJECT"
            if frame:
                fragment = mutant[len(prefix):len(mutant) - len(suffix)]
                cert = check_fragment(interface["normalized"], interface["width"], fragment,
                                      interface["bindings"], {"o0": interface["result_ssa"]})
                save_certificate(directory / "llvm-fragment", cert)
                row["llvm_fragment"] = cert["result"]
                row["llvm_reason"] = cert.get("reason")
            else:
                row["llvm_fragment"] = "NOT_ELIGIBLE_HOST_FRAME_REJECTED"
            clang = ROOT / "vendor/clang-local/root/usr"
            log = Commands(directory / "llvm-validation")
            log.run(["wsl", "-d", "Ubuntu", "--", "env",
                     "LD_LIBRARY_PATH=" + linux(clang / "lib/x86_64-linux-gnu"),
                     linux(clang / "bin/clang-21"), "-cc1", "-emit-llvm-bc", "-disable-llvm-passes",
                     "-x", "ir", linux(candidate), "-o", linux(directory / "validated.bc")])
            row["llvm_wellformed"] = "CLANG21_ACCEPTED_WITHOUT_PASSES"
            backend = run_backend(candidate, dat3m, receipt, directory / "backend")
            row["backend_capture"] = backend["result"]
            row["backend_observed_verdict"] = backend.get("observed_verdict")
            if backend["result"] != "ACTUAL_BACKEND_CAPTURED":
                raise Reject("negative backend capture failed: " + backend.get("reason", "unknown"))
            q0 = json.loads((directory / "backend/snapshots/before-encoding.json").read_bytes())
            q1 = json.loads((directory / "backend/snapshots/after-encoding.json").read_bytes())
            coverage = certify_workers(original, interface, q0, q1, directory / "regions")
            row["coverage"] = coverage["result"]
            row["coverage_reason"] = coverage.get("reason")
            if coverage["result"] != "REJECT" or row["llvm_fragment"] == "LLVM_FRAGMENT_EXACT":
                raise Reject("negative check unexpectedly accepted")
            row["result"] = "FAULT_DETECTED"
        except Exception as error:
            row["reason"] = str(error)
            row["result"] = "NEGATIVE_CHECK_INCOMPLETE"
        save_json(directory / "negative-result.json", row)
        summary["cases"].append(row)
        save_json(out / "negative-summary.json", summary)
        print(name, row["result"], row.get("coverage_reason", row.get("reason")), flush=True)
    return summary


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("--base", required=True, type=Path)
    p.add_argument("--out", required=True, type=Path)
    p.add_argument("--dat3m", required=True, type=Path)
    p.add_argument("--build-receipt", required=True, type=Path)
    args = p.parse_args()
    result = run(args.base, args.out, args.dat3m, args.build_receipt)
    raise SystemExit(0 if all(c["result"] == "FAULT_DETECTED" for c in result["cases"]) else 1)

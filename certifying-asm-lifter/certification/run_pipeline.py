"""Future execution entry point, deliberately NOT RUN in the current delivery.

This is an experimental Windows/WSL driver. Running it requires explicit user
approval; it captures compiler provenance, the actual candidate, actual solver
snapshots and supported-worker coverage. It never presents a whole-program
certified verdict while implementation validation remains pending.
"""
import argparse
import hashlib
import json
import re
import shlex
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
from certification.prepare import prepare
from certification.coverage import certify_workers
from certification.interface import sha
from experiments.run_dat3m import linux
from frontend.gnu import Reject


def run(source, out, dat3m, defines=()):
    source, out, dat3m = Path(source).resolve(), Path(out).resolve(), Path(dat3m).resolve()
    if out.exists():
        raise Reject("use a new output directory to avoid stale evidence")
    out.mkdir(parents=True)
    logs = []

    def invoke(args, timeout=120):
        p = subprocess.run(["wsl", "-d", "Ubuntu", "--", *args],
                           capture_output=True, timeout=timeout)
        logs.append({"args": args, "returncode": p.returncode,
                     "stderr": p.stderr.decode(errors="replace")})
        if p.returncode:
            raise Reject("external command failed: " + logs[-1]["stderr"])
        return p.stdout.decode("utf-8")

    try:
        clangroot = ROOT / "vendor/clang-local/root/usr"
        compiler = ["env", "LD_LIBRARY_PATH=" + linux(clangroot / "lib/x86_64-linux-gnu"),
                    linux(clangroot / "bin/clang-21")]
        version = invoke([*compiler, "--version"])
        if "clang version 21.1.8" not in version:
            raise Reject("compiler version outside pinned scope")
        if any(not re.fullmatch(r"[A-Za-z_]\w*=-?\d+", d) for d in defines):
            raise Reject("only integer NAME=VALUE preprocessor definitions are supported")
        flags = ["-std=gnu11", "-target", "x86_64-pc-linux-gnu", "-O1", "-gline-tables-only",
                 *["-D" + d for d in defines]]
        deptext = invoke([*compiler, *flags, "-M", "-MT", "CERT", linux(source)])
        if not deptext.startswith("CERT:"):
            raise Reject("unexpected compiler dependency syntax")
        deps = shlex.split(deptext.partition(":")[2].replace("\\\n", ""))
        if not deps:
            raise Reject("empty compiler dependency set")

        def dependency_hashes():
            output = invoke(["sha256sum", "--", *deps])
            hashes = [line.split()[0] for line in output.splitlines()]
            if len(hashes) != len(deps) or any(not re.fullmatch(r"[0-9a-f]{64}", h) for h in hashes):
                raise Reject("dependency hash capture failed")
            return dict(zip(deps, hashes))

        source_bytes = source.read_bytes()
        before = dependency_hashes()
        compiler_hash = invoke(["sha256sum", "--", compiler[-1]]).split()[0]
        ast_text = invoke([*compiler, *flags, "-Xclang", "-ast-dump=json", "-fsyntax-only", linux(source)])
        llvm_path = out / "source.ll"
        invoke([*compiler, *flags, "-S", "-emit-llvm", linux(source), "-o", linux(llvm_path)])
        after = dependency_hashes()
        if before != after or source.read_bytes() != source_bytes:
            raise Reject("source/dependencies changed during capture")
        ast = json.loads(ast_text)
        llvm = llvm_path.read_bytes().decode("utf-8")
        receipt = {"compiler_version": version, "compiler_binary_sha256": compiler_hash,
                   "flags": flags, "dependencies": before, "source_sha256": sha(source_bytes),
                   "ast_sha256": sha(ast_text), "llvm_sha256": sha(llvm),
                   "trust": "same-driver compiler/OS capture; hashes are not a proof of compiler correctness"}
        (out / "source.c").write_bytes(source_bytes)
        (out / "source.ast.json").write_bytes(ast_text.encode("utf-8"))
        (out / "compiler-receipt.json").write_text(json.dumps(receipt, indent=2), encoding="utf-8")
        evidence = prepare(source_bytes, ast, llvm)
        candidate = out / "candidate.ll"
        # Exact bytes, no platform newline translation after hashing.
        candidate.write_bytes(evidence.pop("candidate_llvm").encode("utf-8"))
        if sha(candidate.read_bytes()) != evidence["frame"]["target_module_sha256"]:
            raise Reject("candidate byte hash changed while writing")
        pins = json.loads((ROOT / "backend/dat3m/pins.json").read_text(encoding="utf-8"))
        for rel, expected in pins["files"].items():
            if rel.startswith("cat/") and sha((dat3m / rel).read_bytes()) != expected:
                raise Reject("CAT dependency differs from pinned model: " + rel)
        jar = dat3m / "dartagnan/target/dartagnan.jar"
        snapshots, solver_out = out / "snapshots", out / "solver-output"
        snapshots.mkdir()
        solver_out.mkdir()
        cmd = ["env", "DAT3M_HOME=" + linux(dat3m), "DAT3M_OUTPUT=" + linux(solver_out),
               "java", "-Dcert.snapshot.dir=" + linux(snapshots), "-jar", linux(jar),
               linux(dat3m / "cat/tso.cat"), linux(candidate),
               "--target=tso", "--method=eager", "--solver=z3", "--property=program_spec",
               "--smtlib2=true"]
        # FAIL is a valid verifier result and may have a nonzero process status.
        p = subprocess.run(["wsl", "-d", "Ubuntu", "--", *cmd], capture_output=True, timeout=120)
        text = (p.stdout + p.stderr).decode(errors="replace")
        (out / "backend.log").write_bytes(text.encode())
        logs.append({"args": cmd, "returncode": p.returncode})
        q0 = json.loads((snapshots / "before-encoding.json").read_bytes())
        q1 = json.loads((snapshots / "after-encoding.json").read_bytes())
        coverage = certify_workers(llvm, evidence["interface"], q0, q1)
        verdicts = re.findall(r"Result:\s*(PASS|FAIL|UNKNOWN|ERROR)", text)
        queries = list(solver_out.rglob("*.smt2"))
        if not verdicts or not queries:
            raise Reject("missing same-run solver verdict/query")
        build = {"jar_sha256": sha(jar.read_bytes()), "cat_pins": {
                    k: v for k, v in pins["files"].items() if k.startswith("cat/")},
                 "snapshot_sha256": sha((snapshots / "before-encoding.json").read_bytes()),
                 "queries": {p.relative_to(out).as_posix(): sha(p.read_bytes()) for p in queries},
                 "candidate_sha256": sha(candidate.read_bytes())}
        evidence.update(compiler_receipt=receipt, actual_backend=build, coverage=coverage,
                        backend_observed_verdict=verdicts[-1])
        evidence["release"] = {
            "status": "EXPERIMENTAL_CHAIN_EVIDENCE",
            "program_verdict_eligible": False,
            "reason": "implementation and host/solver TCB audit not independently validated",
        }
        (out / "chain-evidence.json").write_text(json.dumps(evidence, indent=2), encoding="utf-8")
        return evidence["release"]
    finally:
        (out / "commands.json").write_text(json.dumps(logs, indent=2), encoding="utf-8")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--source", required=True, type=Path)
    ap.add_argument("--dat3m", required=True, type=Path, help="pinned tree built with the read-only hooks")
    ap.add_argument("--out", required=True, type=Path)
    ap.add_argument("-D", dest="defines", action="append", default=[])
    ap.add_argument("--run-after-user-approval", action="store_true")
    args = ap.parse_args()
    if not args.run_after_user_approval:
        raise SystemExit("Execution gate closed. Obtain user approval before running experiments.")
    print(json.dumps(run(args.source, args.out, args.dat3m, args.defines), indent=2))

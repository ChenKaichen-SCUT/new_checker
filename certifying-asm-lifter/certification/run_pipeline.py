"""Controlled real-source acceptance; whole-program verdict stays closed."""
import argparse
import json
import re
import shlex
import sys
import uuid
import platform
import z3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
from certification.prepare import prepare
from certification.coverage import certify_workers
from certification.interface import sha
from certification.evidence import Commands, save_json
from certification.host_contracts import check_host_objects
from experiments.run_dat3m import linux
from frontend.gnu import Reject


def implementation_hashes():
    paths = []
    for package in ("certification", "frontend", "semantics", "checker", "lifter", "backend"):
        paths.extend((ROOT / package).rglob("*.py"))
    paths += [*sorted((ROOT / "backend/dat3m").glob("*.java")), ROOT / "backend/dat3m/pins.json"]
    paths += sorted((ROOT / "frontend/clang").glob("*.cpp"))
    return {p.relative_to(ROOT).as_posix(): sha(p.read_bytes()) for p in sorted(paths)}


def verify_build(dat3m, receipt_path, fault=None):
    receipt = json.loads(Path(receipt_path).read_bytes())
    pins = json.loads((ROOT / "backend/dat3m/pins.json").read_bytes())
    status = "BUILT_PINNED_WITH_CONTROLLED_FAULTS" if fault else "BUILT_PINNED_WITH_DECLARED_HOOKS"
    if receipt.get("status") != status or receipt["commit"] != pins["commit"]:
        raise Reject("missing successful pinned build receipt")
    inputs_path = Path(receipt_path).with_name("upstream-inputs.json")
    if sha(inputs_path.read_bytes()) != receipt["upstream_inputs_sha256"]:
        raise Reject("build input manifest changed")
    for rel, expected in receipt["runtime_artifacts"].items():
        if sha((dat3m / rel).read_bytes()) != expected:
            raise Reject("runtime artifact differs from recorded build: " + rel)
    for rel, expected in pins["files"].items():
        if rel.startswith("cat/") and sha((dat3m / rel).read_bytes()) != expected:
            raise Reject("CAT dependency differs from pinned model: " + rel)
    return {"receipt_sha256": sha(Path(receipt_path).read_bytes()),
            "commit": receipt["commit"], "runtime_artifacts": receipt["runtime_artifacts"],
            "cat_pins": {k: v for k, v in pins["files"].items() if k.startswith("cat/")}}


def run_backend(candidate, dat3m, receipt_path, out, fault=None):
    """Run exactly the supplied actual module; no synthetic event objects."""
    out = Path(out)
    out.mkdir(parents=True, exist_ok=False)
    logs = Commands(out / "commands")
    result = {"result": "REJECT", "program_verdict_eligible": False}
    try:
        if fault not in {None, "a-only", "pair-only", "guard-only", "live-use-only", "omit-instance",
                         "main-assert-omission", "join-association", "safety-query-binding"}:
            raise Reject("unknown controlled fault")
        build = verify_build(dat3m, receipt_path, fault)
        for rel, expected in build["cat_pins"].items():
            target = out / "model" / rel
            target.parent.mkdir(parents=True, exist_ok=True)
            data = (dat3m / rel).read_bytes()
            if sha(data) != expected:
                raise Reject("model changed while sealing")
            target.write_bytes(data)
        (out / "model/LICENCE").write_bytes((dat3m / "LICENCE").read_bytes())
        original = candidate.read_bytes()
        run_id = uuid.uuid4().hex
        snapshots, solver_out = out / "snapshots", out / "solver-output"
        snapshots.mkdir()
        solver_out.mkdir()
        jar = dat3m / "dartagnan/target/dartagnan.jar"
        cmd = ["wsl", "-d", "Ubuntu", "--", "env", "DAT3M_HOME=" + linux(dat3m),
               "DAT3M_OUTPUT=" + linux(solver_out), "java", "-Dcert.snapshot.dir=" + linux(snapshots),
               "-Dcert.run.id=" + run_id,
               *([] if fault is None else ["-Dcert.controlled.fault=" + fault]),
               "-jar", linux(jar), linux(dat3m / "cat/tso.cat"),
               linux(candidate), "--target=tso", "--method=eager", "--solver=z3",
               "--property=program_spec", "--smtlib2=true"]
        code, stdout, stderr = logs.run(cmd, timeout=120, allow_failure=True)
        result.update(run_id=run_id, command=cmd, returncode=code, controlled_fault=fault,
                      candidate_sha256=sha(original), build=build)
        text = (stdout + stderr).decode("utf-8", errors="replace")
        (out / "backend.log").write_bytes(stdout + stderr)
        if candidate.read_bytes() != original or verify_build(dat3m, receipt_path, fault) != build:
            raise Reject("input/build/model changed during solver run")
        q0 = json.loads((snapshots / "before-encoding.json").read_bytes())
        q1 = json.loads((snapshots / "after-encoding.json").read_bytes())
        if q0 != q1 or q0.get("run_id") != run_id:
            raise Reject("actual same-run object identity/content mismatch")
        def complete(value):
            if isinstance(value, dict):
                if value.get("complete") is False:
                    raise Reject("incomplete exported object: " + value.get("java_class", "unknown"))
                for child in value.values():
                    complete(child)
            elif isinstance(value, list):
                for child in value:
                    complete(child)
        complete(q0)
        if any("complete" not in e for t in q0["threads"] for e in t["events"]):
            raise Reject("snapshot lacks semantic-field completeness markers")
        config = dict(line.split("=", 1) for line in q0["config"].splitlines() if "=" in line)
        config = {k.strip(): v.strip() for k, v in config.items()}
        for key, value in {"target": "tso", "method": "eager", "solver": "z3",
                           "property": "program_spec", "smtlib2": "true"}.items():
            if config.get(key, "").lower() != value:
                raise Reject("actual solver config mismatch: " + key)
        verdicts = re.findall(r"Result:\s*(PASS|FAIL|UNKNOWN|ERROR)", text)
        queries = sorted(solver_out.rglob("*.smt2"))
        # Pinned ExitCode.java: normal PASS=0, program-spec assertion FAIL=10.
        # A valid negative verification is not an infrastructure failure.
        if (len(verdicts) != 1 or verdicts[0] not in {"PASS", "FAIL"} or not queries
                or code != {"PASS": 0, "FAIL": 10}[verdicts[0]]):
            raise Reject("no completed same-run solver result/query")
        result.update(result="ACTUAL_BACKEND_CAPTURED", observed_verdict=verdicts[0],
                      snapshots={p.name: sha(p.read_bytes()) for p in snapshots.glob("*.json")},
                      queries={p.relative_to(out).as_posix(): sha(p.read_bytes()) for p in queries})
    except Exception as error:
        result["result"] = "REJECT"
        result["reason"] = str(error)
    save_json(out / "backend-receipt.json", result)
    return result


def run(source, out, dat3m, build_receipt):
    source, out, dat3m = (Path(p).resolve() for p in (source, out, dat3m))
    authorized = {"backend-source.c", "live-output.c", "live-unsupported.c",
                  "cas-success.c", "cas-failure.c"}
    if source.parent != (ROOT / "benchmarks").resolve() or source.name not in authorized:
        raise Reject("source is outside the controlled acceptance allowlist")
    if out.exists():
        raise Reject("use a new evidence directory")
    out.mkdir(parents=True)
    logs = Commands(out / "compiler-commands")
    result = {"result": "REJECT", "program_verdict_eligible": False, "layers": {}}
    implementation = implementation_hashes()
    save_json(out / "implementation.json", {
        "files": implementation, "python": sys.version, "platform": platform.platform(),
        "z3": z3.get_version_string(), "purpose": "bind executed checker bytes; not a proof of code correctness"})

    def invoke(args):
        return logs.run(["wsl", "-d", "Ubuntu", "--", *args])[1].decode("utf-8")

    try:
        clangroot = ROOT / "vendor/clang-local/root/usr"
        compiler = ["env", "LD_LIBRARY_PATH=" + linux(clangroot / "lib/x86_64-linux-gnu"),
                    linux(clangroot / "bin/clang-21")]
        version = invoke([*compiler, "--version"])
        if "clang version 21.1.8" not in version:
            raise Reject("compiler outside fixed version")
        # Pinned Dat3M decodes LLVM \XX escapes one byte per Java char. Use an
        # explicit compiler debug-path map, so Unicode workspace paths cannot
        # silently corrupt provenance. This changes metadata, not source bytes.
        debug_root = "/cert-source"
        flags = ["-std=gnu11", "-target", "x86_64-pc-linux-gnu", "-O1", "-gline-tables-only",
                 "-fdebug-prefix-map=" + linux(ROOT.parent) + "=" + debug_root]
        deptext = invoke([*compiler, *flags, "-M", "-MT", "CERT", linux(source)])
        if not deptext.startswith("CERT:"):
            raise Reject("unexpected dependency syntax")
        deps = shlex.split(deptext.partition(":")[2].replace("\\\n", ""))
        if deps != [linux(source)]:
            raise Reject("minimal input must have no additional source/header dependencies")

        def dependency_hashes():
            output = invoke(["sha256sum", "--", *deps])
            hashes = [line.split()[0] for line in output.splitlines()]
            if len(hashes) != len(deps) or any(not re.fullmatch(r"[0-9a-f]{64}", h) for h in hashes):
                raise Reject("dependency hash capture failed")
            return dict(zip(deps, hashes))

        source_bytes = source.read_bytes()
        (out / "source.c").write_bytes(source_bytes)
        before = dependency_hashes()
        compiler_hash = invoke(["sha256sum", "--", compiler[-1]]).split()[0]
        ast_text = invoke([*compiler, *flags, "-Xclang", "-ast-dump=json", "-fsyntax-only", linux(source)])
        (out / "source.ast.json").write_bytes(ast_text.encode("utf-8"))
        llvm_path = out / "source.ll"
        invoke([*compiler, *flags, "-S", "-emit-llvm", linux(source), "-o", linux(llvm_path)])
        if before != dependency_hashes() or source.read_bytes() != source_bytes:
            raise Reject("source/dependencies changed during compiler capture")
        ast, llvm = json.loads(ast_text), llvm_path.read_bytes().decode("utf-8")
        receipt = {"compiler_version": version, "compiler_binary_sha256": compiler_hash,
                   "flags": flags, "dependencies": before, "source_sha256": sha(source_bytes),
                   "ast_sha256": sha(ast_text), "llvm_sha256": sha(llvm),
                   "trust": "controlled compiler/OS capture; no compiler correctness proof"}
        save_json(out / "compiler-receipt.json", receipt)
        evidence = prepare(source_bytes, ast, llvm, out / "translation")
        interface = evidence["interface"]
        interface["source_path"] = debug_root + "/" + source.relative_to(ROOT.parent).as_posix()
        save_json(out / "translation/interface.json", interface)
        result["layers"].update(interface="INTERFACE_MATCH", block="BLOCK_EXACT",
                                llvm_fragment="LLVM_FRAGMENT_EXACT", host_frame="BYTE_IDENTICAL_OUTSIDE_SITE")
        candidate = out / "translation/candidate.ll"
        if sha(candidate.read_bytes()) != evidence["frame"]["target_module_sha256"]:
            raise Reject("candidate byte mismatch")
        # Parse and verify the whole module with the same compiler. The bitcode
        # is a validation byproduct; Dat3M still receives the exact candidate.ll.
        invoke([*compiler, "-cc1", "-emit-llvm-bc", "-disable-llvm-passes", "-x", "ir",
                linux(candidate), "-o", linux(out / "validated.bc")])
        result["layers"]["llvm_wellformed"] = "CLANG21_ACCEPTED_WITHOUT_PASSES"
        evidence.pop("candidate_llvm")
        save_json(out / "translation/evidence.json", evidence)
        backend = run_backend(candidate, dat3m, build_receipt, out / "backend")
        result["backend"] = backend
        if backend["result"] != "ACTUAL_BACKEND_CAPTURED":
            raise Reject("backend capture rejected: " + backend.get("reason", "unknown"))
        q0 = json.loads((out / "backend/snapshots/before-encoding.json").read_bytes())
        q1 = json.loads((out / "backend/snapshots/after-encoding.json").read_bytes())
        coverage = certify_workers(llvm, interface, q0, q1, out / "regions")
        result["coverage"] = coverage
        if coverage["result"] != "SUPPORTED_WORKERS_EXACT":
            raise Reject("coverage rejected: " + coverage.get("reason", "unknown"))
        host = check_host_objects(llvm, interface, q0, coverage)
        save_json(out / "host-contracts.json", host)
        result["host_contracts"] = host
        if host["result"] != "STRUCTURAL_HOST_CONTRACTS_CHECKED":
            raise Reject("host contract rejected: " + host.get("reason", "unknown"))
        result["layers"].update(regions="REGION_EXACT", coverage="ALL_SUPPORTED_INSTANCES_CHECKED")
        result["layers"]["host_objects"] = host["result"]
        result["result"] = "SCOPED_CHAIN_CHECKS_PASSED_UNDER_DECLARED_TCB"
        result["external_assumptions"] = [
            "Clang GNU C/asm interface and host compilation", "trusted OS/build/capture pipeline",
            "restricted ISA interpretation and aligned valid WB memory", "Dat3M host/pthread semantics",
            "CAT parsing/encoding, Z3 UNSAT, Python/Java checkers and exporter",
            "no machine-checked implementation refinement or general ISA-to-CAT equivalence"]
        if implementation_hashes() != implementation:
            raise Reject("checker implementation changed during acceptance")
    except Exception as error:
        result["result"] = "REJECT"
        result["reason"] = str(error)
    finally:
        save_json(out / "acceptance.json", result)
    return result


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--source", required=True, type=Path)
    ap.add_argument("--dat3m", required=True, type=Path)
    ap.add_argument("--build-receipt", required=True, type=Path)
    ap.add_argument("--out", required=True, type=Path)
    ap.add_argument("--run-after-user-approval", action="store_true")
    args = ap.parse_args()
    if not args.run_after_user_approval:
        raise SystemExit("Execution gate closed: explicit user authorization required")
    result = run(args.source, args.out, args.dat3m, args.build_receipt)
    print(json.dumps({k: result[k] for k in ("result", "layers", "reason") if k in result}, indent=2))
    raise SystemExit(0 if result["result"] != "REJECT" else 1)

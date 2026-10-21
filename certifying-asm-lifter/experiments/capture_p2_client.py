"""Frozen original client, full upstream build flags, observation only; never execute it.

This is a scope rejection audit, not a substitute Program or an end-to-end cert.
Both required original TUs and every compiler dependency are preserved.
"""
import json
import posixpath
import shlex
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.evidence import Commands, save_json
from certification.interface import sha
from certification.provenance import require
from experiments.run_dat3m import linux


def main():
    base = ROOT / "experiments/p2"
    selection = json.loads((base / "external-selection.json").read_bytes())
    workers = json.loads((base / "final-workers/results.json").read_bytes())
    require(len(workers) == 12 and all(r["actual"] == r["expected"] for r in workers),
            "complete distinct-worker acceptance must precede client compilation")
    out = base / "external-client"
    out.mkdir(exist_ok=False)
    log = Commands(out / "commands")
    ck = ROOT / "vendor" / ("ck-" + selection["commit"])
    origin = json.loads((ROOT / "experiments/controlled-round/ck-origin/download.json").read_bytes())
    require(all(sha((ck / p).read_bytes()) == h for p, h in origin["files"].items()), "changed upstream")
    require(all(sha((ck / p).read_bytes()) == h for p, h in selection["files"].items()), "changed selection")
    work = ck / "regressions/ck_ec/validate"
    tool = ROOT / "vendor/clang-local/root/usr"
    observer = ROOT / "vendor/clang-observer.so"
    build = json.loads((ROOT / "experiments/ck-provenance/observer-build-05/receipt.json").read_bytes())
    require(sha(observer.read_bytes()) == build["binary_sha256"]
            and sha((ROOT / "frontend/clang/Observe.cpp").read_bytes()) == build["source_sha256"], "observer pin")

    def invoke(args, failure=False):
        return log.run(["wsl", "-d", "Ubuntu", "--cd", linux(work), "--exec", *args],
                       timeout=120, allow_failure=failure)

    _, make, _ = invoke(["make", "-n", "ck_ec_smoke_test"])
    lines = [x for x in make.decode("utf-8").splitlines() if x.startswith("clang-21 ")]
    require(len(lines) == 1, "unique original upstream compilation command")
    args = shlex.split(lines[0])
    require(args[-4:] == ["../../../src/ck_ec.c", "-o", "ck_ec_smoke_test", "ck_ec_smoke_test.c"],
            "unexpected original translation-unit/link set")
    flags = args[1:-4]
    require("-O2" in flags and "-fstrict-aliasing" in flags and "-pthread" in flags,
            "preserve upstream optimization and pthread configuration")
    compiler = ["env", "LD_LIBRARY_PATH=" + linux(tool / "lib/x86_64-linux-gnu"), linux(tool / "bin/clang-21")]
    _, version, _ = invoke([*compiler, "--version"])
    _, digest, _ = invoke(["sha256sum", "--", compiler[-1]])
    require("clang version 21.1.8" in version.decode() and digest.decode().split()[0] == build["clang_sha256"], "Clang pin")
    result = {"result": "REJECT", "program_verdict_eligible": False,
              "category": selection["category"], "denominator": 1, "accepted": 0,
              "selection_sha256": sha((base / "external-selection.json").read_bytes()),
              "original_build_command": args, "flags": flags, "compiler_version": version.decode(),
              "compiler_sha256": build["clang_sha256"], "translation_units": [],
              "backend_invoked": False, "no_synthetic_Q_or_SMT": True}
    # Original complete link, output kept outside Git. No client execution.
    code, _, _ = invoke([*compiler, *flags, "../../../src/ck_ec.c", "-o",
                         linux(ROOT / "vendor/p2-original-ck-ec-client"), "ck_ec_smoke_test.c"], True)
    result["original_link_returncode"] = code
    for ti, rel in enumerate(selection["required_translation_units"]):
        directory = out / f"tu-{ti}"
        directory.mkdir()
        source = ck / rel
        (directory / "source.c").write_bytes(source.read_bytes())
        _, dep, _ = invoke([*compiler, *flags, "-M", "-MT", "CERT", linux(source)])
        require(dep.startswith(b"CERT:"), "dependency target")
        dep_paths = shlex.split(dep.decode().partition(":")[2].replace("\\\n", ""))
        deps = {}
        for j, path in enumerate(dep_paths):
            path = posixpath.normpath(posixpath.join(linux(work), path))
            _, data, _ = invoke(["cat", "--", path])
            dest = directory / "dependencies" / (f"{j:03d}-" + path.rsplit("/", 1)[-1])
            dest.parent.mkdir(exist_ok=True)
            dest.write_bytes(data)
            deps[path] = {"file": dest.relative_to(directory).as_posix(), "sha256": sha(data)}
        observation_flags = ["-gline-tables-only", "-fdebug-prefix-map=" + linux(ROOT.parent) + "=/cert-source"]
        cmd = [*compiler, *flags, *observation_flags, "-Xclang", "-load", "-Xclang", linux(observer),
               "-Xclang", "-plugin-arg-cert-observe", "-Xclang", linux(directory / "observer.json"),
               "-S", "-emit-llvm", linux(source), "-o", linux(directory / "source.ll")]
        code, _, _ = invoke(cmd, True)
        _, after, _ = invoke(["sha256sum", "--", *deps])
        require([s.split()[0] for s in after.decode().splitlines()] == [r["sha256"] for r in deps.values()], "dependency changed")
        row = {"source": rel, "source_sha256": sha(source.read_bytes()), "command": cmd,
               "returncode": code, "dependencies": deps, "observational_flag_additions": observation_flags}
        if code == 0:
            obs = json.loads((directory / "observer.json").read_bytes())
            row["artifact_hashes"] = {n: sha((directory / n).read_bytes())
                                      for n in ("observer.json", "observer.json.ast.json", "source.ll")}
            row["asm_ast_count"] = len(obs["sites"])
            row["functions"] = [{"name": f["name"], "parameters": len(f["parameters"])} for f in obs["functions"]]
        save_json(directory / "receipt.json", row)
        result["translation_units"].append(row)
    # Domain admission is independent of whether the original compiler succeeded.
    result["reason"] = "OUTSIDE_D2: complete client requires multiple translation units, argc/argv main, aggregate objects, external callbacks/system calls and wait control flow; no complete host/lifecycle/query contract"
    result["scope_checks"] = {"single_translation_unit": len(selection["required_translation_units"]) == 1,
                              "main_signature": "int(int,char**) rather than admitted int(void)",
                              "complete_program_not_reduced": True}
    for rel in [*selection["files"], "LICENSE", "include/ck_md.h", "build/ck.build.x86_64"]:
        target = out / "upstream" / rel
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes((ck / rel).read_bytes())
    require(all(sha((ck / p).read_bytes()) == h for p, h in origin["files"].items()), "upstream changed during audit")
    require(sha(observer.read_bytes()) == build["binary_sha256"], "observer changed")
    result["all_pinned_upstream_bytes_unchanged"] = True
    save_json(out / "scope-certificate.json", result)
    print(json.dumps({k: result[k] for k in ("result", "reason", "original_link_returncode")}))


if __name__ == "__main__":
    main()

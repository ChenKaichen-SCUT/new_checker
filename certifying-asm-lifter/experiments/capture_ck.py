"""Unmodified upstream CK, all AST sites, and LLVM from ONE compiler invocation."""
import argparse
import json
import shlex
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.evidence import Commands, save_json
from certification.interface import sha
from experiments.run_dat3m import linux
from frontend.gnu import Reject


def capture(out, build_dir, source=None):
    out.mkdir(parents=True, exist_ok=False)
    logs = Commands(out / "commands")
    origin = json.loads((ROOT / "experiments/controlled-round/ck-origin/download.json").read_bytes())
    ck = ROOT / "vendor" / ("ck-" + origin["commit"])
    tool = ROOT / "vendor/clang-local/root/usr"
    binary = ROOT / "vendor/clang-observer.so"
    observer = ROOT / "frontend/clang/Observe.cpp"
    build = json.loads((build_dir / "receipt.json").read_bytes())
    source = Path(source).resolve() if source is not None else ROOT / "benchmarks/ck-live.c"
    if source.parent != ROOT / "benchmarks" or source.name not in {
            "ck-live.c", "ck-live-unsafe.c", "ck-input.c", "ck-input-unsafe.c",
            "ck-multi.c", "ck-multi-unsafe.c", "ck-contexts.c"}:
        raise Reject("CK capture outside authorized source cases")
    result = {"result": "REJECT", "program_verdict_eligible": False}

    def invoke(args):
        return logs.run(["wsl", "-d", "Ubuntu", "--exec", *args], timeout=120)[1]

    def unchanged_upstream():
        return all(sha((ck / p).read_bytes()) == h for p, h in origin["files"].items())

    try:
        if (build["result"] != "BUILT" or sha(binary.read_bytes()) != build["binary_sha256"]
                or sha(observer.read_bytes()) != build["source_sha256"]):
            raise Reject("observer build does not match source/binary")
        if not unchanged_upstream():
            raise Reject("original CK files modified")
        compiler = [ "env", "LD_LIBRARY_PATH=" + linux(tool / "lib/x86_64-linux-gnu"),
                    linux(tool / "bin/clang-21")]
        version = invoke([*compiler, "--version"]).decode()
        if "clang version 21.1.8" not in version:
            raise Reject("wrong Clang")
        compiler_hash = invoke(["sha256sum", "--", compiler[-1]]).decode().split()[0]
        if compiler_hash != build["clang_sha256"]:
            raise Reject("observer builder and capture Clang differ")
        flags = ["-std=gnu11", "-target", "x86_64-pc-linux-gnu", "-O1", "-gline-tables-only",
                 "-fdebug-prefix-map=" + linux(ROOT.parent) + "=/cert-source",
                 "-I", linux(ck / "include")]
        deptext = invoke([*compiler, *flags, "-M", "-MT", "CERT", linux(source)]).decode()
        deps = shlex.split(deptext.partition(":")[2].replace("\\\n", ""))
        if not deptext.startswith("CERT:") or linux(source) not in deps or len(set(deps)) != len(deps):
            raise Reject("invalid dependency census")
        dependencies = {}
        for i, path in enumerate(deps):
            data = invoke(["cat", "--", path])
            name = f"dependencies/{i:03d}-" + path.rsplit("/", 1)[-1]
            target = out / name
            target.parent.mkdir(exist_ok=True)
            target.write_bytes(data)
            dependencies[path] = {"file": name, "sha256": sha(data)}
        (out / "source.c").write_bytes(source.read_bytes())
        obs = out / "observer.json"
        llvm = out / "source.ll"
        # -load + AddBeforeMainAction: observer and CodeGen share the same AST/SM.
        command = [*compiler, *flags, "-Xclang", "-load", "-Xclang", linux(binary),
                   "-Xclang", "-plugin-arg-cert-observe", "-Xclang", linux(obs),
                   "-S", "-emit-llvm", linux(source), "-o", linux(llvm)]
        invoke(command)
        after = invoke(["sha256sum", "--", *deps]).decode().splitlines()
        if [s.split()[0] for s in after] != [dependencies[p]["sha256"] for p in deps]:
            raise Reject("compiler dependency changed")
        if (sha(binary.read_bytes()) != build["binary_sha256"] or not unchanged_upstream()
                or invoke(["sha256sum", "--", compiler[-1]]).decode().split()[0] != compiler_hash):
            raise Reject("compiler/observer/upstream changed during capture")
        # Preserve build and configure provenance without rerunning configure.
        for name, data in {
            "observer-source.cpp": observer.read_bytes(),
            "observer-build-receipt.json": (build_dir / "receipt.json").read_bytes(),
            "upstream-download.json": (ROOT / "experiments/controlled-round/ck-origin/download.json").read_bytes(),
            "upstream-configure": (ck / "configure").read_bytes(),
            "upstream-config-template.h": (ck / "include/ck_md.h.in").read_bytes(),
            "upstream-LICENSE": (ck / "LICENSE").read_bytes(),
        }.items():
            (out / name).write_bytes(data)
        result.update(result="SAME_INVOCATION_CAPTURED", ck_commit=origin["commit"],
                      command=command, compiler_version=version,
                      compiler_binary_sha256=compiler_hash, dependencies=dependencies,
                      observer_build=build, all_upstream_bytes_unchanged=True,
                      flags=flags, source_path=linux(source),
                      debug_prefix={"from": linux(ROOT.parent), "to": "/cert-source"},
                      artifacts={p.name: sha(p.read_bytes()) for p in
                                 [obs, Path(str(obs) + ".ast.json"), llvm, out / "source.c"]},
                      trust="read-only observer, Clang metadata/host compilation, OS/build capture")
    except Exception as error:
        result["reason"] = str(error)
    save_json(out / "compiler-receipt.json", result)
    print(json.dumps({k: v for k, v in result.items() if k in {"result", "reason", "artifacts"}}, indent=2))
    return result


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", required=True, type=Path)
    ap.add_argument("--build", required=True, type=Path)
    ap.add_argument("--source", type=Path)
    args = ap.parse_args()
    raise SystemExit(0 if capture(args.out, args.build, args.source)["result"] != "REJECT" else 1)

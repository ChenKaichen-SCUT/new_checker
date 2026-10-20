"""Original CK header admission, never rewrite a macro or bypass interface failure."""
import json
import re
import shlex
from pathlib import Path
from certification.run_pipeline import ROOT, implementation_hashes
from certification.evidence import Commands, save_json
from certification.interface import sha, nodes, direct_range
from certification.prepare import prepare
from experiments.run_dat3m import linux
from frontend.gnu import Reject


def run():
    base = ROOT / "experiments/controlled-round"
    origin = json.loads((base / "ck-origin/download.json").read_bytes())
    ck = ROOT / "vendor" / ("ck-" + origin["commit"])
    source = ROOT / "benchmarks/ck-live.c"
    out = base / "ck-admission-05"
    out.mkdir(exist_ok=False)
    logs = Commands(out / "commands")
    result = {"result": "REJECT", "program_verdict_eligible": False,
              "routine": "ck_pr_faa_32", "ck_commit": origin["commit"],
              "related_work_checkpoint": "docs/revision/07-cas-and-related-work.md",
              "backend_executed": False, "original_interface_modified": False}

    def invoke(args, cwd=None):
        cmd = ["wsl", "-d", "Ubuntu"]
        if cwd:
            cmd += ["--cd", str(cwd) if str(cwd).startswith("/") else linux(cwd)]
        return logs.run([*cmd, "--exec", *args], timeout=120)[1]

    try:
        clangroot = ROOT / "vendor/clang-local/root/usr"
        compiler = clangroot / "bin/clang-21"
        env = ["env", "LD_LIBRARY_PATH=" + linux(clangroot / "lib/x86_64-linux-gnu")]
        version = invoke([*env, linux(compiler), "--version"]).decode()
        if "clang version 21.1.8" not in version:
            raise Reject("wrong compiler")
        # Only original configure probes; no library/regression/benchmark build.
        # Upstream configure does not quote its output paths. A fresh, recorded
        # whitespace-free symlink preserves the original files and script.
        alias = "/tmp/cert-ck-" + origin["commit"] + "-admission05"
        invoke(["ln", "-s", "--", linux(ck), alias])
        invoke([*env, "PATH=" + linux(compiler.parent) + ":/usr/bin:/bin",
                "GIT_CEILING_DIRECTORIES=" + linux(ck.parent), "CC=clang-21",
                "PWD=" + alias, "sh", "./configure"], cwd=alias)
        changed = [rel for rel, digest in origin["files"].items()
                   if sha((ck / rel).read_bytes()) != digest]
        if changed:
            raise Reject("configure modified original source: " + str(changed))
        save_json(out / "implementation.json", implementation_hashes())
        for rel in ["configure", "include/ck_md.h.in", "include/ck_md.h", "LICENSE"]:
            target = out / "ck-build-inputs" / rel
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes((ck / rel).read_bytes())
        flags = ["-std=gnu11", "-target", "x86_64-pc-linux-gnu", "-O1", "-gline-tables-only",
                 "-fdebug-prefix-map=" + linux(ROOT.parent) + "=/cert-source",
                 "-I", linux(ck / "include")]
        deptext = invoke([*env, linux(compiler), *flags, "-M", "-MT", "CERT", linux(source)]).decode()
        deps = shlex.split(deptext.partition(":")[2].replace("\\\n", ""))
        if not deptext.startswith("CERT:") or linux(source) not in deps:
            raise Reject("invalid dependency capture")
        # Preserve every actual dependency, including system headers and config.
        dependencies = {}
        for i, path in enumerate(deps):
            data = invoke(["cat", "--", path])
            name = f"dependencies/{i:03d}-" + path.rsplit("/", 1)[-1]
            target = out / name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(data)
            dependencies[path] = {"file": name, "sha256": sha(data)}
        (out / "source.c").write_bytes(source.read_bytes())
        ast_bytes = invoke([*env, linux(compiler), *flags, "-Xclang", "-ast-dump=json",
                            "-fsyntax-only", linux(source)])
        (out / "source.ast.json").write_bytes(ast_bytes)
        llvm_path = out / "source.ll"
        invoke([*env, linux(compiler), *flags, "-S", "-emit-llvm", linux(source), "-o", linux(llvm_path)])
        hashes = invoke(["sha256sum", "--", *deps]).decode().splitlines()
        if [s.split()[0] for s in hashes] != [dependencies[p]["sha256"] for p in deps]:
            raise Reject("dependencies changed during actual compiler invocation")
        llvm = llvm_path.read_bytes().decode("utf8")
        ast = json.loads(ast_bytes)
        calls = [line for line in llvm.splitlines() if re.search(r"\bcall\b.*\basm\b", line)]
        functions = [n for n in nodes(ast) if n.get("kind") == "FunctionDecl"
                     and n.get("name") == "ck_pr_faa_32"]
        if len(functions) != 1 or len(calls) != 1 or "xaddl" not in calls[0]:
            raise Reject("selected real nonempty routine did not survive compilation uniquely")
        sites = [n for n in nodes(functions[0]) if n.get("kind") == "GCCAsmStmt"]
        if len(sites) != 1:
            raise Reject("selected routine AST is not unique")
        range_status = "DIRECT"
        try:
            direct_range(sites[0])
        except Reject as error:
            range_status = str(error)
        save_json(out / "selected-routine.json", {
            "function": functions[0], "actual_llvm_call": calls[0],
            "all_ast_asm_sites": sum(n.get("kind") == "GCCAsmStmt" for n in nodes(ast)),
            "selected_asm_range_status": range_status,
            "selection_is_diagnostic_not_an_interface_certificate": True})
        save_json(out / "compiler-receipt.json", {
            "compiler_version": version, "flags": flags, "dependencies": dependencies,
            "compiler_binary_sha256": invoke(["sha256sum", "--", linux(compiler)]).decode().split()[0],
            "source_sha256": sha(source.read_bytes()), "ast_sha256": sha(ast_bytes),
            "llvm_sha256": sha(llvm), "all_upstream_bytes_unchanged": True})
        # Use exactly the production checker. No site filtering, source flattening,
        # handwritten LLVM or inferred GNU interface is supplied to it.
        prepare(source.read_bytes(), ast, llvm, out / "translation")
        raise Reject("unexpected interface acceptance; no authorized third-party backend path implemented")
    except Exception as error:
        result["reason"] = str(error)
    save_json(out / "admission.json", result)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    run()

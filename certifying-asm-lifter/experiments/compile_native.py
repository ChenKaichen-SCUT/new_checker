"""Compile genuine GNU C to LLVM and native code to validate the bug reproducer."""
import json
import subprocess
from pathlib import Path
from run_dat3m import ROOT, linux


def invoke(args, timeout=40):
    p = subprocess.run(["wsl", "-d", "Ubuntu", "--", *args],
                       capture_output=True, timeout=timeout)
    return dict(command=args, returncode=p.returncode,
                output=p.stdout.decode(errors="replace") + p.stderr.decode(errors="replace"))


def main():
    src = linux(ROOT / "benchmarks/backend-source.c")
    clangroot = ROOT / "vendor/clang-local/root/usr"
    clang = linux(clangroot / "bin/clang-21")
    ld = linux(clangroot / "lib/x86_64-linux-gnu")
    output = []
    for expect in (0, 2):
        name = "clang-raw-" + ("safe" if expect == 2 else "unsafe")
        ll = ROOT / "benchmarks/backend" / (name + ".ll")
        r = invoke(["env", "LD_LIBRARY_PATH=" + ld, clang, "-O1", "-S", "-emit-llvm",
                    "-DEXPECT=" + str(expect), src, "-o", linux(ll)])
        output.append(r)
        print(name, "clang", r["returncode"], r["output"][:300], flush=True)
        executable = ROOT / "experiments" / (name + ".native")
        r = invoke(["gcc", "-O2", "-pthread", "-DEXPECT=" + str(expect), src,
                    linux(ROOT / "benchmarks/native-error.c"), "-o", linux(executable)])
        output.append(r)
        if r["returncode"] == 0:
            r = invoke([linux(executable)])
            r["expected_exit"] = 0 if expect == 2 else 42
            output.append(r)
            print(name, "native exit", r["returncode"], flush=True)
    (ROOT / "experiments/native-results.json").write_text(json.dumps(output, indent=2), encoding="utf-8")


if __name__ == "__main__":
    main()

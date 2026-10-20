"""Build the read-only observer against the exact locally unpacked SDK."""
import argparse
import json
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.evidence import Commands, save_json
from certification.interface import sha
from experiments.run_dat3m import linux


def build(out):
    out.mkdir(parents=True, exist_ok=False)
    logs = Commands(out / "commands")
    tool = ROOT / "vendor/clang-local/root/usr"
    sdk = ROOT / "vendor/clang-observer-sdk"
    source = ROOT / "frontend/clang/Observe.cpp"
    binary = ROOT / "vendor/clang-observer.so"
    data = source.read_bytes()
    (out / "Observe.cpp").write_bytes(data)
    cmd = ["wsl", "-d", "Ubuntu", "--exec", "env",
           "LD_LIBRARY_PATH=" + linux(tool / "lib/x86_64-linux-gnu"),
           linux(tool / "bin/clang-21"), "--driver-mode=g++", "-std=c++17",
           "-shared", "-fPIC", "-O1", "-I" + linux(sdk / "usr/lib/llvm-21/include"),
           linux(source), "-L" + linux(tool / "lib/x86_64-linux-gnu"),
           "-l:libclang-cpp.so.21.1", "-o", linux(binary)]
    code, _, _ = logs.run(cmd, timeout=120, allow_failure=True)
    result = {"result": "BUILT" if code == 0 else "BUILD_FAILED",
              "source_sha256": sha(data), "command": cmd,
              "clang_sha256": sha((tool / "lib/llvm-21/bin/clang").read_bytes())
              if (tool / "lib/llvm-21/bin/clang").exists() else None}
    if code == 0:
        if source.read_bytes() != data:
            raise RuntimeError("observer changed during build")
        result["binary_sha256"] = sha(binary.read_bytes())
    save_json(out / "receipt.json", result)
    print(json.dumps(result, indent=2))
    return code


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", required=True, type=Path)
    raise SystemExit(build(ap.parse_args().out))

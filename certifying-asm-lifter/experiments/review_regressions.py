"""Reproduce the submitted review against the pinned original and repaired code."""
import argparse
import hashlib
import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
from checker.check import check
from experiments.run_dat3m import linux

SOURCE = '''__asm__ __volatile__("movl $0,%0; lock xaddl %0,%1"
 : "=&r"(result), "+m"(*p) : : "cc", "memory");'''
IR = {"format": "event-ir-v1", "width": 32, "compiler_barrier": True, "code": [
    {"op": "set", "dest": "o0", "value": 0},
    {"op": "rmw", "mode": "tso", "width": 32, "addr": "p1", "old": "o0",
     "has_write": True, "value": ["add", 0, "o0"]},
]}
SPELLINGS = ['asm("mfence" ::: "memory");', 'asm ("mfence" ::: "memory");',
             '__asm__("mfence" ::: "memory");',
             '__asm__ __volatile__("mfence" ::: "memory");',
             '__asm ("mfence" ::: "memory");']
BASE = "9c51fcbac7cff2b4d0e0906e27c9f43c9b22c05a"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--baseline", action="store_true")
    args = ap.parse_args()
    out = ROOT / "experiments/review-regressions" / ("before" if args.baseline else "after")
    out.mkdir(parents=True, exist_ok=True)
    loaded = {}
    hashes = {}
    for rel in ("backend/llvm_tso.py", "experiments/evaluate.py"):
        if args.baseline:
            data = subprocess.check_output(
                ["git", "show", f"{BASE}:certifying-asm-lifter/{rel}"], cwd=ROOT)
        else:
            data = (ROOT / rel).read_bytes()
        ns = {"__file__": str(ROOT / rel), "__name__": "review_loaded"}
        exec(compile(data, rel, "exec"), ns)
        loaded[rel] = ns
        hashes[rel] = hashlib.sha256(data).hexdigest()
    cert = check(SOURCE, IR, output_dir=out / "certificate")
    code, env = loaded["backend/llvm_tso.py"]["emit"](IR, {"p1": "%p"})
    (out / "candidate.json").write_text(json.dumps(IR, indent=2), encoding="utf-8")
    (out / "original.c").write_text(
        '#include <stdint.h>\nuint32_t original(uint32_t *p) {\nuint32_t result;\n'
        + SOURCE + '\nreturn result;\n}\n', encoding="utf-8")
    (out / "lowered.ll").write_text(
        'target triple = "x86_64-pc-linux-gnu"\ndefine i32 @lowered(i32* %p) {\n'
        + code + '\n ret i32 ' + env["o0"] + '\n}\n', encoding="utf-8")
    (out / "harness.c").write_text(
        '#include <stdint.h>\n#include <stdio.h>\n'
        'uint32_t original(uint32_t*); uint32_t lowered(uint32_t*);\n'
        'int main(void) { uint32_t a=7,b=7; uint32_t x=original(&a),y=lowered(&b);\n'
        'printf("source: memory=%u return=%u\\nlowered: memory=%u return=%u\\n",a,x,b,y);\n'
        'return a!=b || x!=y; }\n', encoding="utf-8")
    clangroot = ROOT / "vendor/clang-local/root/usr"
    commands = [
        ["env", "LD_LIBRARY_PATH=" + linux(clangroot / "lib/x86_64-linux-gnu"),
         linux(clangroot / "bin/clang-21"), "-c", linux(out / "lowered.ll"),
         "-o", linux(out / "lowered.o")],
        ["gcc", "-O2", linux(out / "original.c"), linux(out / "harness.c"),
         linux(out / "lowered.o"), "-o", linux(out / "compare.native")],
        [linux(out / "compare.native")],
    ]
    runs = []
    for i, cmd in enumerate(commands):
        p = subprocess.run(["wsl", "-d", "Ubuntu", "--", *cmd], capture_output=True, timeout=40)
        runs.append({"command": cmd, "returncode": p.returncode,
                     "output": (p.stdout + p.stderr).decode(errors="replace")})
        if i < 2 and p.returncode:
            raise RuntimeError(runs[-1])
    result = {"baseline_commit": BASE if args.baseline else None,
              "implementation_sha256": hashes, "checker": cert["result"],
              "emitted": code, "runs": runs,
              "extraction": [{"text": s, "count": len(list(loaded["experiments/evaluate.py"]["extract"](s)))}
                             for s in SPELLINGS]}
    (out / "result.json").write_text(json.dumps(result, indent=2), encoding="utf-8")
    print(json.dumps({"checker": result["checker"], "native": runs[-1],
                      "extraction": result["extraction"]}, indent=2))
    assert cert["result"] == "EXACT"
    assert runs[-1]["returncode"] == (1 if args.baseline else 0)


if __name__ == "__main__":
    main()

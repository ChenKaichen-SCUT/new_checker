"""Generate small concurrent LLVM harnesses and certify every lifted block first."""
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
from frontend.gnu import parse
from lifter.lift import lift
from checker.check import check
from backend.llvm_tso import emit

OUT = ROOT / "benchmarks/backend"
OUT.mkdir(exist_ok=True)
HEADER = '''target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"
@x = global i32 0, align 4
@y = global i32 0, align 4
@z0 = global i32 0, align 4
@z1 = global i32 0, align 4
@r0 = global i32 0, align 4
@r1 = global i32 0, align 4
declare i32 @pthread_create(i64*, i8*, i8* (i8*)*, i8*)
declare i32 @pthread_join(i64, i8**)
declare void @__VERIFIER_assert(i32)
'''
MAIN = '''define i32 @main() {
  %t0 = alloca i64, align 8
  %t1 = alloca i64, align 8
  %c0 = call i32 @pthread_create(i64* %t0, i8* null, i8* (i8*)* @thread0, i8* null)
  %c1 = call i32 @pthread_create(i64* %t1, i8* null, i8* (i8*)* @thread1, i8* null)
  %id0 = load i64, i64* %t0
  %id1 = load i64, i64* %t1
  %j0 = call i32 @pthread_join(i64 %id0, i8** null)
  %j1 = call i32 @pthread_join(i64 %id1, i8** null)
CHECK
  %ok = xor i1 %bad, true
  %ok32 = zext i1 %ok to i32
  call void @__VERIFIER_assert(i32 %ok32)
  ret i32 0
}
'''


def program(body0, body1, check):
    threads = ""
    for i, body in enumerate((body0, body1)):
        threads += f"define i8* @thread{i}(i8* %arg) {{\n{body}\n  ret i8* null\n}}\n"
    return HEADER + threads + MAIN.replace("CHECK", check)


manifest = []


def save(name, code, expected, reason):
    (OUT / (name + ".ll")).write_text(code, encoding="utf-8")
    manifest.append({"name": name, "expected_for_intended_source": expected, "reason": reason})


def certified(name, text, bindings):
    ir = lift(parse(text))
    cert = check(text, ir, output_dir=ROOT / "certificates" / name)
    assert cert["result"] == "EXACT", cert
    return emit(ir, bindings, prefix=name)[0]


def main():
    xaddtext = (ROOT / "benchmarks/xadd.asm").read_text()
    xadd = certified("backend-xadd", xaddtext, {"o0": "1", "p1": "@x"})
    raw = '  %a = call i32 asm sideeffect "lock; xaddl $0, $1", "=r,=*m,0,~{memory},~{cc}"(i32* @x, i32 1)'
    for label, body in [("raw", raw), ("lifted", xadd)]:
        safe = "  %v = load atomic i32, i32* @x monotonic, align 4\n  %bad = icmp ne i32 %v, 2"
        unsafe = "  %v = load atomic i32, i32* @x monotonic, align 4\n  %bad = icmp ne i32 %v, 0"
        save("xadd-two-" + label + "-safe", program(body, body, safe), "PASS",
             "Two locked increments complete; final x=2.")
        save("xadd-two-" + label + "-unsafe", program(body, body, unsafe), "FAIL",
             "The assertion x==0 is false after two locked increments.")
    # Ablation: intentionally bypass certification for bad candidates.
    ir = lift(parse(xaddtext))
    ir["code"] = []
    rejection = check(xaddtext, ir, output_dir=ROOT / "certificates/mutant-drop")
    assert rejection["result"] == "REJECT"
    save("ablation-unchecked-drop-unsafe", program("", "", unsafe), "FAIL",
         "Expected for original asm, but unchecked candidate deletes both increments.")
    ir = lift(parse(xaddtext))
    ir["code"] = [
        {"op": "read", "mode": "tso", "width": 32, "addr": "p1", "dest": "tmp0"},
        {"op": "write", "mode": "tso", "width": 32, "addr": "p1", "value": ["add", "tmp0", "o0"]},
        {"op": "set", "dest": "o0", "value": "tmp0"}
    ]
    rejection = check(xaddtext, ir, output_dir=ROOT / "certificates/mutant-split")
    assert rejection["result"] == "REJECT"
    split, _ = emit(ir, {"o0": "1", "p1": "@x"}, "split")
    save("ablation-unchecked-split-safe", program(split, split, safe), "PASS",
         "Expected for original locked asm; split candidate admits lost update.")
    sbcheck = ("  %a = load i32, i32* @r0\n  %b = load i32, i32* @r1\n"
               "  %ca = icmp eq i32 %a, 0\n  %cb = icmp eq i32 %b, 0\n  %bad = and i1 %ca, %cb")
    for variant, mid, expected in [
        ("none", "", "FAIL"),
        ("compiler-barrier", '  call void asm sideeffect "", "~{memory}"()', "FAIL"),
        ("mfence", "  fence seq_cst", "PASS"),
        ("sfence", '  call void asm sideeffect "sfence", "~{memory}"()', "FAIL"),
    ]:
        bodies = []
        for i, (own, other) in enumerate((("x", "y"), ("y", "x"))):
            bodies.append(f"  store atomic i32 1, i32* @{own} monotonic, align 4\n{mid}\n"
                          f"  %v = load atomic i32, i32* @{other} monotonic, align 4\n"
                          f"  store i32 %v, i32* @r{i}, align 4")
        save("SB-" + variant, program(*bodies, sbcheck), expected, "04-C3/C4 analytic argument.")
    castext = (ROOT / "benchmarks/cmpxchg.asm").read_text()
    for variant in ("locked", "mutant-plain-read"):
        bodies = []
        for i, (own, other) in enumerate((("x", "y"), ("y", "x"))):
            mid = certified("cas" + str(i), castext, {"o0": "1", "o2": "2", "p1": "@z" + str(i)})
            if variant == "mutant-plain-read":
                mid = f"  %discard = load atomic i32, i32* @z{i} monotonic, align 4"
            bodies.append(f"  store atomic i32 1, i32* @{own} monotonic, align 4\n{mid}\n"
                          f"  %v = load atomic i32, i32* @{other} monotonic, align 4\n"
                          f"  store i32 %v, i32* @r{i}, align 4")
        save("SB-failed-CAS-" + variant, program(*bodies, sbcheck),
             "PASS" if variant == "locked" else "FAIL", "04-C6 analytic ordering counterexample.")
    (OUT / "manifest.json").write_text(json.dumps(manifest, indent=2), encoding="utf-8")


if __name__ == "__main__":
    main()

"""Predeclared small ACTC scope; fresh real positives and labelled fault replay."""
import argparse
import json
import sys
from pathlib import Path
from certification.evidence import Commands, save_json
from certification.run_pipeline import ROOT
from certification.provenance import require

FRESH = [
    ("workers", "ck-workers.c", "ACTC_CONDITIONAL_SAFE"),
    ("branch", "ck-hcc-branch.c", "ACTC_CONDITIONAL_SAFE"),
    ("unsafe", "ck-workers-unsafe.c", "ACTC_QUERY_SAT_NO_SAFE"),
]
REPLAY = [
    ("wrong-return", "hcc/capture-branch", "property/final-02/cross-return"),
    ("missing-read", "hcc/capture-branch", "property/final-02/cross-read"),
    ("missing-instance", "hcc/capture-branch", "property/final-02/missing-instance"),
    ("wrong-condition", "hcc/capture-branch", "property/final-02/branch-condition"),
    ("atomic-tag", "property/capture-owned", "property/final-02/private-a"),
    ("query-binding", "property/capture-unsafe", "property/final-02/query-binding"),
]


def main(out):
    out = Path(out).resolve()
    out.mkdir(parents=True, exist_ok=False)
    save_json(out / "fixed-cases.json", {"fresh": FRESH, "historical_actual_fault_replay": REPLAY,
        "purpose": "small correctness scope; not performance/coverage experiment",
        "third_party_client": "frozen CK event-counter; static barrier analysis only"})
    commands = Commands(out / "commands")
    rows = []

    def record(name, expected, category):
        cert = json.loads((out / name / "composition-certificate.json").read_bytes())
        rows.append({"name": name, "category": category, "expected": expected, "actual": cert["result"],
                     "reason": cert.get("reason"), "transfer": cert.get("transfer"),
                     "asm_instances": cert.get("asm_instances"), "region_count": cert.get("region_count")})
        save_json(out / "results.json", rows)
        print(json.dumps(rows[-1]), flush=True)

    for name, source, expected in FRESH:
        capture = out / ("capture-" + name)
        commands.run([sys.executable, "-m", "experiments.capture_ck", "--out", str(capture),
                      "--build", str(ROOT / "experiments/ck-provenance/observer-build-05"),
                      "--source", str(ROOT / "benchmarks" / source)], timeout=240)
        commands.run([sys.executable, "-m", "experiments.certify_composition", "--capture", str(capture),
                      "--out", str(out / name)], timeout=240)
        record(name, expected, "fresh real Clang AST/LLVM and same-run backend Q/query")
    for name, capture, replay in REPLAY:
        commands.run([sys.executable, "-m", "experiments.certify_composition",
                      "--capture", str(ROOT / "experiments" / capture), "--replay", str(ROOT / "experiments" / replay),
                      "--out", str(out / name)], timeout=180)
        record(name, "REJECT", "historical real backend controlled fault; newly checked, not newly discovered")
    require(all(r["actual"] == r["expected"] for r in rows), "unexpected ACTC outcome; preserve outputs")


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("--out", required=True, type=Path)
    main(p.parse_args().out)

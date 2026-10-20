"""Reproducible exploratory checker evaluation; never a proof or SV-COMP score."""
import csv
import hashlib
import json
import platform
import re
import statistics
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
from frontend.gnu import parse, Reject
from lifter.lift import lift
from checker.check import check


def extract(text):
    """Find balanced standalone asm occurrences; preserve raw expressions."""
    # Replace comments with spaces to avoid treating commented-out examples as code.
    clean = re.sub(r"/\*.*?\*/|//[^\n]*", lambda m: " " * len(m[0]), text, flags=re.S)
    for m in re.finditer(r"\b(?:__asm__|asm)\s+(?:(?:__volatile__|volatile)\s*)?\(", clean):
        start = m.start()
        i = m.end()
        depth, quoted, escape = 1, False, False
        while i < len(clean) and depth:
            c = clean[i]
            if quoted:
                if escape:
                    escape = False
                elif c == "\\":
                    escape = True
                elif c == '"':
                    quoted = False
            elif c == '"':
                quoted = True
            elif c == "(":
                depth += 1
            elif c == ")":
                depth -= 1
            i += 1
        if depth == 0:
            raw = text[start:i] + ";"
            raw = re.sub(r"\\\r?\n", " ", raw)
            yield text.count("\n", 0, start) + 1, raw


def measure(name, text, width, category, origin, repeats=1):
    tick = time.perf_counter()
    try:
        b = parse(text, width)
        parsed = True
        ir = lift(b)
        lifted = True
        lift_time = time.perf_counter() - tick
        samples = []
        for _ in range(repeats):
            cert = check(text, ir, width)
            samples.append(cert["seconds"])
        result = cert["result"]
        reason = cert.get("reason", "")
        obligations = len(cert["obligations"])
    except (Reject, ValueError, KeyError) as e:
        parsed = locals().get("parsed", False)
        lifted = False
        result, reason, obligations = "REJECT", str(e), 0
        lift_time = time.perf_counter() - tick
        samples = []
    return dict(name=name, category=category, origin=origin, width=width,
                source_sha256=hashlib.sha256(text.encode()).hexdigest(),
                parsed=parsed, lifted=lifted, result=result, reason=reason,
                lift_seconds=lift_time, checker_median_seconds=statistics.median(samples) if samples else None,
                repetitions=repeats if samples else 0, obligations=obligations)


def main():
    rows = []
    rawdir = ROOT / "benchmarks/raw-extracted"
    rawdir.mkdir(exist_ok=True)
    for f in sorted((ROOT / "benchmarks/upstream").glob("*.h")):
        for line, text in extract(f.read_text(encoding="utf-8")):
            name = f.stem + "-" + str(line)
            (rawdir / (name + ".asm")).write_text(text, encoding="utf-8")
            # Raw extraction lacks type context. 64 is an explicit exploration setting.
            rows.append(measure(name, text, 64, "raw_statement_without_C_type_context", f"{f.name}:{line}"))
    normalized = json.loads((ROOT / "benchmarks/normalized.json").read_text(encoding="utf-8"))
    for item in normalized:
        rows.append(measure(item["name"], item["asm"], item["width"],
                            "manually_normalized_interface", item["origin"], repeats=5))
    summary = {
        "date": "2026-10-20", "environment": platform.platform(),
        "python": sys.version, "formal_performance_claim": False,
        "note": "Exploratory wall time, no BenchExec/cgroup. Normalized cases are not whole upstream programs.",
        "rows": rows,
    }
    (ROOT / "experiments/checker-results.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    with (ROOT / "experiments/checker-results.csv").open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)
    for category in sorted({r["category"] for r in rows}):
        rs = [r for r in rows if r["category"] == category]
        print(category, "total", len(rs), "EXACT", sum(r["result"] == "EXACT" for r in rs),
              "parsed", sum(r["parsed"] for r in rs), "lifted", sum(r["lifted"] for r in rs))


if __name__ == "__main__":
    main()

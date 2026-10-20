"""Official task inventory plus actual block certification; no full verifier rerun."""
import collections
import hashlib
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
from frontend.gnu import parse
from lifter.lift import lift
from checker.check import check


def main():
    html = (ROOT / "experiments/svcomp26-deagle-concurrency.html").read_text(encoding="utf-8")
    m = re.search(r"const data\s*=\s*", html)
    data = json.JSONDecoder().raw_decode(html[m.end():])[0]
    rows = data["rows"]
    missing = [r for r in rows if r["results"][0]["category"] == "missing"]
    summary = {
        "official_all_task_property_rows": len(rows),
        "deagle_missing_rows": len(missing),
        "deagle_present_rows": len(rows) - len(missing),
        "unique_yaml_paths": len({r["id"][0] for r in rows}),
        "property_counts": dict(collections.Counter(r["id"][1] for r in rows)),
        "statuses": dict(collections.Counter(r["results"][0]["category"] for r in rows)),
        "execution_status": "NOT_RUN: no certified whole-C backend adapter",
        "whole_dataset_verdict_claim": None,
    }
    previous = json.loads((ROOT.parent / "research/svcomp/summary.json").read_text(encoding="utf-8"))
    demo = []
    for item in previous["inventory"]:
        for template in item["distinct_executable_asm_texts"]:
            cert = check(template, lift(parse(template)))
            demo.append({"source_file": item["file"], "source_sha256": item["sha256"],
                         "template_sha256": hashlib.sha256(template.encode()).hexdigest(),
                         "block_result": cert["result"], "whole_program_result": "NOT_RUN"})
    summary["huawei_demo"] = {
        "task_property_instances": previous["task_instances"],
        "unique_sources": previous["unique_source_files"],
        "unique_asm_templates": len({x["template_sha256"] for x in demo}),
        "block_checks": demo,
        "new_verified_programs": None,
        "note": "Empty-barrier certification is not equivalent to verifying the 52 task instances."
    }
    (ROOT / "experiments/competition-audit.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print(json.dumps({k: v for k, v in summary.items() if k != "huawei_demo"}, indent=2))


if __name__ == "__main__":
    main()

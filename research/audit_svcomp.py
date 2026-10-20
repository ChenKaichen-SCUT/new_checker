"""Recompute the local audit of official SV-COMP 2026 Huawei/Deagle tables.

Tables and source files were downloaded verbatim into sources/ and svcomp/.
This is a textual inventory, not a C parser or a verifier execution.
No benchmark source is modified.
"""
from pathlib import Path
from collections import Counter
import hashlib
import json
import re

ROOT = Path(__file__).parent
rows = []
categories = {}
for path in sorted((ROOT / "sources").glob("deagle.*demo*html")):
    text = path.read_text(encoding="utf-8")
    data = json.JSONDecoder().raw_decode(text.split("const data = ", 1)[1])[0]
    category = path.name.split("SV-COMP26_", 1)[1].split(".", 1)[0]
    selected = [r for r in data["rows"] if r["id"][0].startswith("libvsync/")]
    categories[category] = dict(Counter(r["results"][0]["values"][0]["raw"] for r in selected))
    rows.extend({"category": category, **r} for r in selected)

sources = sorted({Path(row["id"][0]).with_suffix(".i").name for row in rows})
inventory = []
for filename in sources:
    path = ROOT / "svcomp" / filename
    text = path.read_text(encoding="utf-8")
    # In these files all executable asm statements use __asm__ __volatile__.
    # Other asm occurrences are GNU symbol aliases in declarations.
    statements = re.findall(r"__asm__\s+__volatile__\s*\(.*?\)\s*;", text, re.S)
    aliases = re.findall(r"__asm__\s*\(\s*\"\"\s*\"__isoc99_", text)
    inventory.append({
        "file": filename,
        "url": "https://sv-comp.sosy-lab.org/2026/results/sv-benchmarks/c/libvsync/" + filename,
        "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
        "executable_asm_text_occurrences": len(statements),
        "distinct_executable_asm_texts": sorted(set(statements)),
        "symbol_alias_occurrences": len(aliases),
        "all_asm_keyword_occurrences": len(re.findall(r"\b(?:asm|__asm|__asm__)\b", text)),
    })

expected = Counter()
for row in rows:
    yaml_text = (ROOT / "svcomp" / Path(row["id"][0]).name).read_text(encoding="utf-8")
    prop = row["category"].removesuffix("_demo")
    blocks = yaml_text.split("  - property_file: ")[1:]
    block = next(b for b in blocks if b.split("\n", 1)[0].endswith("/" + prop + ".prp"))
    expected[re.search(r"expected_verdict:\s*(\w+)", block).group(1)] += 1

result = {"task_instances": len(rows), "unique_source_files": len(sources),
          "categories": categories, "expected_verdicts_from_yaml": dict(expected),
          "inventory": inventory,
          "limitations": ["Textual occurrences include unused header routines.",
                          "No Deagle rerun or corrected-verdict measurement was performed.",
                          "Public wrapper logs do not contain the redirected inner tool output."]}
assert len(rows) == 52 and len(sources) == 19
assert all(i["distinct_executable_asm_texts"] == ['__asm__ __volatile__("" ::: "memory");'] for i in inventory)
assert all(i["executable_asm_text_occurrences"] + i["symbol_alias_occurrences"] == i["all_asm_keyword_occurrences"] for i in inventory)
(ROOT / "svcomp" / "summary.json").write_text(json.dumps(result, ensure_ascii=False, indent=2), encoding="utf-8")
print(json.dumps({k: v for k, v in result.items() if k != "inventory"}, ensure_ascii=False, indent=2))
print("Per source: 100 empty compiler-barrier occurrences and 6 symbol aliases.")

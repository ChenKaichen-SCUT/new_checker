"""Reassess the frozen full CK client; validate bytes, never erase behavior."""
import json
import re
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.provenance import require, walk
from certification.evidence import save_json


def main():
    directory = ROOT / "experiments/p2/external-client"
    selected = ROOT / "experiments/p2/external-selection.json"
    selection = json.loads(selected.read_bytes())
    scope = json.loads((directory / "scope-certificate.json").read_bytes())
    require(selection["denominator"] == 1 and scope["selection_sha256"] == sha(selected.read_bytes()), "frozen selection")
    for name, digest in selection["files"].items():
        require(sha((directory / "upstream" / name).read_bytes()) == digest, "upstream client changed")
    units = []
    for index, record in enumerate(scope["translation_units"]):
        d = directory / f"tu-{index}"
        require(record["source"] == selection["required_translation_units"][index]
                and record["returncode"] == 0, "original compile not bound")
        require(sha((d / "source.c").read_bytes()) == record["source_sha256"], "original source bytes")
        for name, digest in record["artifact_hashes"].items():
            require(sha((d / name).read_bytes()) == digest, "actual capture bytes")
        for dep in record["dependencies"].values():
            require(sha((d / dep["file"]).read_bytes()) == dep["sha256"], "dependency bytes")
        obs = json.loads((d / "observer.json").read_bytes())
        nodes = [(f["name"], n) for f in obs["functions"] for n in walk(f["body"])]
        names = {s["id"]: s["name"] for s in obs["symbols"]}
        calls = sorted({names.get(n.get("callee"), "indirect-or-unresolved") for _, n in nodes if n["kind"] == "CallExpr"})
        units.append({"source": record["source"], "artifacts": record["artifact_hashes"],
                      "surviving_llvm_asm": len(re.findall(r"\b(?:call|invoke|callbr)\b.*\basm\b", (d / "source.ll").read_text(encoding="utf-8"))),
                      "main_parameters": [[p["type"]["canonical"] for p in f["parameters"]] for f in obs["functions"] if f["name"] == "main"],
                      "loop_bearing_definitions": sorted({f for f, n in nodes if n["kind"] in {"ForStmt", "WhileStmt", "DoStmt"}}),
                      "call_names_in_included_definitions": calls})
    require(len(units) == 2 and units[0]["main_parameters"] == [["int", "char **"]], "unexpected original link context")
    missing = {
        "H1": "aggregate/alias/lifetime and ordinary/asm conflict domain proof for the complete original host",
        "H2": "open host simulation for original argc/argv, helpers, callbacks, clocks and OS calls",
        "H3": "typed cross-TU and indirect-call port/return correspondence for every actual activation",
        "H4": "full original wait/wake/shared-memory/runtime ordering projection, not final-value equality",
        "H5": "loop/callback phase invariants and exhaustive dynamic occurrence relation",
        "H6": "all finite assertion/error prefixes without future-completion filtering",
        "H7": "actual linked transformed LLVM and same-run final Q (not generated because HCC absent)",
        "H8": "actual property/assertion/assumption/bound query with adequate whole-client encoding",
    }
    result = {"result": "HCC_UNDISCHARGED", "program_verdict_eligible": False,
              "denominator": 1, "programs_certified": 0, "category": selection["category"],
              "selection_sha256": sha(selected.read_bytes()), "upstream_files": selection["files"],
              "actual_units": units, "missing_contracts": missing,
              "verified_external_provider": None, "additional_assumptions_admitted": [],
              "raw_captures": "experiments/p2/external-client (preserved byte-identically)",
              "conclusion": "Removing a grammar restriction cannot discharge these semantic premises; no replacement client or fabricated Q."}
    save_json(ROOT / "experiments/hcc/external-client-review.json", result)
    print(json.dumps({"result": result["result"], "counts": [u["surviving_llvm_asm"] for u in units], "accepted": "0/1"}))


if __name__ == "__main__": main()

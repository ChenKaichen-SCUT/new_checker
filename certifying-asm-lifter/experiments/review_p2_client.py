"""Derive scope blockers from the untouched client's actual capture (no execution)."""
import json
import re
from certification.run_pipeline import ROOT
from certification.evidence import save_json
from certification.interface import sha
from certification.provenance import require, walk


def main():
    root = ROOT / "experiments/p2/external-client"
    report = json.loads((root / "scope-certificate.json").read_bytes())
    selection = json.loads((root.parent / "external-selection.json").read_bytes())
    require(report["selection_sha256"] == sha((root.parent / "external-selection.json").read_bytes()), "selection changed")
    units, main_definitions = [], []
    for i, recorded in enumerate(report["translation_units"]):
        directory = root / f"tu-{i}"
        require(recorded["source"] == selection["required_translation_units"][i]
                and recorded["returncode"] == 0, "incomplete original TU capture")
        require(sha((directory / "source.c").read_bytes()) == recorded["source_sha256"], "source mismatch")
        for name, digest in recorded["artifact_hashes"].items():
            require(sha((directory / name).read_bytes()) == digest, "artifact mismatch")
        for dep in recorded["dependencies"].values():
            require(sha((directory / dep["file"]).read_bytes()) == dep["sha256"], "dependency mismatch")
        obs = json.loads((directory / "observer.json").read_bytes())
        llvm = (directory / "source.ll").read_text(encoding="utf-8")
        main_definitions += [{"tu": i, "parameters": [p["type"]["canonical"] for p in f["parameters"]],
                              "return": f["return_type"]["canonical"]} for f in obs["functions"] if f["name"] == "main"]
        loops, calls = {}, set()
        for f in obs["functions"]:
            for n in walk(f["body"]):
                if n["kind"] in {"ForStmt", "WhileStmt", "DoStmt"}:
                    loops[(f["id"], n["begin"]["raw"])] = {"function": f["name"], "kind": n["kind"], "location": n["begin"]}
                if n["kind"] == "CallExpr":
                    calls.add(n.get("callee"))
        external = [{"name": s["name"], "type": s["type"]["canonical"]} for s in obs["symbols"]
                    if s["id"] in calls and s["name"] in {"syscall", "usleep", "clock_gettime", "printf", "__assert_fail"}]
        units.append({"tu": i, "source": recorded["source"], "all_ast_asm_sites": len(obs["sites"]),
                      "surviving_llvm_asm": len(re.findall(r"\b(?:call|invoke|callbr)\b.*\basm\b", llvm)),
                      "observed_loops_in_included_definitions": list(loops.values()), "observed_external_calls": external})
    require(len(main_definitions) == 1 and main_definitions[0]["parameters"] == ["int", "char **"], "unexpected main")
    require(len(units) == 2, "complete original link set missing")
    save_json(root / "independent-scope-analysis.json", {
        "result": "OUTSIDE_D2_REJECT", "program_verdict_eligible": False,
        "checked_necessary_premises": {"single_TU": False, "main_void_parameters": False},
        "actual_main": main_definitions[0], "actual_units": units,
        "reason": "Two independently false domain premises suffice for rejection; loop/callback/interface observations are additional engineering barriers, not erased behavior.",
        "not_claimed": "No LLVM linking/asm lifting/Dat3M Program or safety query was fabricated for this out-of-domain complete client."})
    print(json.dumps({"result": "OUTSIDE_D2_REJECT", "units": len(units), "main": main_definitions[0],
                      "actual_llvm_asm_counts": [u["surviving_llvm_asm"] for u in units]}))


if __name__ == "__main__":
    main()

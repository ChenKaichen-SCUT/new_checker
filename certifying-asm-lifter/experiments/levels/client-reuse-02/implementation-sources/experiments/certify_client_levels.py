"""All frozen sites, no favorable-site selection and no fake whole-client Q."""
import argparse
import json
import time
from pathlib import Path
from certification.third_party_ports import load_unit, abstract_port
from certification.interface import sha, llvm_site
from certification.prepare import _translate_checked_interface
from certification.templates import TemplatePool
from certification.run_pipeline import ROOT, implementation_hashes
from certification.provenance import require, unique
from certification.evidence import save_json, Commands
from experiments.run_dat3m import linux
from checker.check import check
from frontend.gnu import parse
from lifter.lift import lift


def run(out, reuse):
    out.mkdir(parents=True, exist_ok=False)
    start = time.perf_counter()
    implementation = implementation_hashes()
    implementation["experiments/certify_client_levels.py"] = sha(Path(__file__).read_bytes())
    save_json(out / "implementation.json", implementation)
    for name in implementation:
        p = out / "implementation-sources" / name; p.parent.mkdir(parents=True, exist_ok=True); p.write_bytes((ROOT / name).read_bytes())
    frozen = json.loads((ROOT / "experiments/levels/frozen-sites.json").read_bytes())
    pool = TemplatePool(out / "templates") if reuse else None
    results, units = [], {}
    for row in frozen["sites"]:
        p = out / row["id"]; p.mkdir()
        r = {**row, "achieved_level": 0, "layers": {}, "program_verdict_eligible": False}
        tick = time.perf_counter()
        try:
            if row["tu"] not in units: units[row["tu"]] = load_unit(row["tu"])
            obs, buffers, module, receipt = units[row["tu"]]
            require(sha(module) == row["llvm_sha256"] and module.splitlines()[row["llvm_line_index"]] == row["llvm_call"], "frozen site changed")
            site = unique([s for s in obs["sites"] if s["cookies"] == row["cookies"]], "original GCCAsmStmt origin")
            require(row["supported_instruction_family"], "instruction family outside fixed scope (empty asm included in denominator)")
            interface = abstract_port(site, buffers, module, row)
            ir = lift(parse(interface["normalized"], interface["width"]))
            site_pool = pool if pool else TemplatePool(p / "templates")
            block = site_pool.verify(interface["normalized"], ir, interface["width"])
            save_json(p / "block-certificate.json", block)
            require(block["result"] == "EXACT", "block proof rejected")
            r.update(achieved_level=1); r["layers"]["L1"] = "BLOCK_EXACT"
            interface = llvm_site(module, interface, checked_line_index=row["llvm_line_index"])
            interface["result"] = "INTERFACE_MATCH"
            evidence = _translate_checked_interface(interface, module, p / "site", template_pool=site_pool)
            tool=ROOT/"vendor/clang-local/root/usr"
            Commands(p/"clang-validation").run(["wsl","-d","Ubuntu","--exec","env",
                "LD_LIBRARY_PATH="+linux(tool/"lib/x86_64-linux-gnu"),linux(tool/"bin/clang-21"),
                "-cc1","-emit-llvm-bc","-disable-llvm-passes","-x","ir",linux(p/"site/candidate.ll"),"-o",linux(p/"validated.bc")])
            evidence.pop("candidate_llvm")
            save_json(p / "site-evidence.json", evidence)
            r.update(achieved_level=2); r["layers"]["L2"] = "LLVM_SITE_EXACT"
            r["missing"] = ["L3: complete original linked client has no certified Q or finite/inductive activation domain",
                            "L4: no adequate original whole-host provider or actual bound query"]
        except Exception as e: r["reason"] = str(e)
        r["seconds"] = time.perf_counter() - tick
        save_json(p / "level-certificate.json", r); results.append(r)
    require(implementation_hashes() == {k:v for k,v in implementation.items() if not k.startswith("experiments/")}, "implementation changed")
    save_json(out / "results.json", {"baseline": frozen["baseline"], "frozen_manifest_sha256": sha((ROOT / "experiments/levels/frozen-sites.json").read_bytes()),
              "site_denominator": 113, "family_denominator": 8, "client_denominator": 1,
              "counts": {f"L{i}": sum(r["achieved_level"] >= i for r in results) for i in range(1,5)},
              "seconds": time.perf_counter() - start, "reuse": pool.summary() if pool else None,
              "sites": results, "program_verdict_eligible": False})
    print(json.dumps({"counts": {f"L{i}": sum(r["achieved_level"] >= i for r in results) for i in range(1,5)}, "seconds": time.perf_counter()-start}))


if __name__ == "__main__":
    ap = argparse.ArgumentParser(); ap.add_argument("--out", type=Path, required=True); ap.add_argument("--reuse", action="store_true")
    a = ap.parse_args(); run(a.out.resolve(), a.reuse)

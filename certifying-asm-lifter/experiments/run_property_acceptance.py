"""Small fixed correctness suite; no coverage or performance campaign."""
import argparse
import json
import sys
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.evidence import Commands, save_json
from certification.provenance import require


CASES = [
    ("owned", "property/capture-owned", None, "PROPERTY_CONDITIONAL_SAFE"),
    ("unsafe", "property/capture-unsafe", None, "PROPERTY_QUERY_SAT_NO_SAFE_TRANSFER"),
    ("relevant", "property/capture-relevant", None, "PROPERTY_CONDITIONAL_SAFE"),
    ("dependent", "property/capture-dependent", None, "PROPERTY_CONDITIONAL_SAFE"),
    ("branch", "hcc/capture-branch", None, "PROPERTY_CONDITIONAL_SAFE"),
    ("d2", "p2/capture-workers", None, "PROPERTY_CONDITIONAL_SAFE"),
    ("private-value", "property/capture-owned", "pd-private-value", "PROPERTY_TRANSFER_TEST_ONLY"),
    ("public-value", "property/capture-owned", "pd-public-value", "REJECT"),
    ("private-a", "property/capture-owned", "pd-private-a", "REJECT"),
    ("private-omit", "property/capture-owned", "pd-private-omit", "REJECT"),
    ("sync-omit", "property/capture-owned", "pd-sync-omit", "REJECT"),
    ("cross-return", "hcc/capture-branch", "swap-returns", "REJECT"),
    ("cross-read", "hcc/capture-branch", "cross-read", "REJECT"),
    ("missing-instance", "hcc/capture-branch", "omit-worker-call", "REJECT"),
    ("branch-condition", "hcc/capture-branch", "ite-swap", "REJECT"),
    ("query-binding", "property/capture-unsafe", "safety-query-binding", "REJECT"),
]


def main(out):
    out=Path(out).resolve(); out.mkdir(parents=True,exist_ok=False)
    save_json(out/"fixed-cases.json", {"cases":CASES,"purpose":"targeted correctness, no timing comparison"})
    commands=Commands(out/"commands"); rows=[]
    for name,capture,fault,expected in CASES:
        args=[sys.executable,"-m","experiments.certify_property","--capture",str(ROOT/"experiments"/capture),
              "--out",str(out/name),"--full-control"]
        if fault: args.extend(["--fault",fault])
        commands.run(args,timeout=240)
        c=json.loads((out/name/"property-certificate.json").read_bytes())
        row={"name":name,"expected":expected,"actual":c["result"],"reason":c.get("reason"),
             "omitted":c.get("omitted"),"property_eligible":c["property_verdict_eligible"]}
        rows.append(row); save_json(out/"results.json",rows)
        print(json.dumps(row),flush=True)
    require(all(r["actual"]==r["expected"] for r in rows),"unexpected acceptance result; retain all evidence")


if __name__=="__main__":
    p=argparse.ArgumentParser();p.add_argument("--out",required=True,type=Path);main(p.parse_args().out)

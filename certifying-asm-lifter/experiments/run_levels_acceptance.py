"""Fixed distinguishing cases. Faults mutate actual backend objects or exporter only."""
import argparse
import json
import sys
import time
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.evidence import save_json,Commands
from certification.provenance import require

CASES=[("workers","p2/capture-workers",None,4,None),
       ("multi","p2/capture-readonly-multi",None,4,None),
       ("unsafe","p2/capture-workers-unsafe",None,3,"BOUND_SAFETY_QUERY_SAT"),
       ("branch","hcc/capture-branch",None,3,"full C host contract absent")]+[
    (f,"hcc/capture-branch",f,2,r) for f,r in [
        ("ite-swap","write-value"),("ite-missing-dependency","dependency mismatch"),
        ("ite-wrong-type","ITE type"),("ite-truncated","ITE type"),
        ("omit-worker-call","effect census"),("omit-call","effect census"),
        ("a-only","RMW read width/labels"),("rmw-tag-only","RMW read width/labels"),
        ("swap-returns","monitor-"),("entry-ssa","write-value"),
        ("cross-read","ordinary read tags/width")]]+[
    ("query-binding","p2/capture-workers-unsafe","safety-query-binding",3,"actual-safety-assumption-binding")]


def main(out):
    out.mkdir(exist_ok=False,parents=True);logs=Commands(out/"commands");save_json(out/"fixed-cases.json",CASES);rows=[]
    for name,source,fault,expected,reason in CASES:
        command=[sys.executable,"-m","experiments.certify_levels","--capture",str(ROOT/"experiments"/source),"--out",str(out/name)]
        if fault:command += ["--fault",fault]
        start=time.perf_counter();code,_,_=logs.run(command,timeout=240,allow_failure=True)
        c=json.loads((out/name/"level-certificate.json").read_bytes())
        row={"case":name,"fault":fault,"expected":expected,"level":c["achieved_level"],"reason":c.get("missing_next_level"),
             "backend":c.get("backend",{}).get("observed_verdict"),"seconds":time.perf_counter()-start}
        rows.append(row);save_json(out/"results.json",rows);print(json.dumps(row),flush=True)
        require(code==0 and row["level"]==expected and (reason is None or reason in row["reason"]),"wrong layer/rejection")
        require(c["program_verdict_eligible"] is (expected==4),"wrong program authorization")


if __name__=="__main__":
    ap=argparse.ArgumentParser();ap.add_argument("--out",required=True,type=Path);main(ap.parse_args().out.resolve())

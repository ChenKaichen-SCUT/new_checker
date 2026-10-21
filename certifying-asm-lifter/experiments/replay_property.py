"""Reconstruct checks from raw captures and the SAME stored actual Q, no rerun Q.

Existing EXACT/transfer/facts JSON is not used as semantic evidence. The original
capture/OS/build fidelity remains Gamma_capture, as in the production runner.
This artifact replay never issues a new safety authorization.
"""
import argparse
import json
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.evidence import save_json, save_certificate
from certification.provenance import require, mapped_path
from certification.templates import TemplatePool
from certification.local_ports import prepare_ports
from certification.property_source import prepare_property_source
from certification.p1_entry import program_workers
from certification.p0_host import program_main, Obligations
from certification.property_obligations import check_plan
from certification.p0_queries import check_queries
from experiments.run_property_acceptance import CASES
from experiments.review_levels import implementation


def read(p): return json.loads(p.read_bytes())


def replay(case,capture,out):
    out.mkdir(parents=True,exist_ok=False)
    r={"result":"REJECT","program_verdict_eligible":False,"property_verdict_eligible":False}
    try:
        implementation(case)
        original=read(case/"property-certificate.json")
        require(ROOT/original["capture"]==capture,"capture identity")
        local=prepare_ports(capture,out/"local",TemplatePool(out/"templates"))
        prepared=prepare_property_source(capture,local,out/"preparation")
        candidate=out/"local/translation/candidate.ll"
        require(candidate.read_bytes()==(case/"local/translation/candidate.ll").read_bytes(),"candidate drift")
        qfile=case/"backend/snapshots/before-encoding.json"; q=read(qfile)
        require(q==read(case/"backend/snapshots/after-encoding.json"),"actual Q drift")
        coverage=program_workers(q,prepared,out/"collected",collect_only=True)
        require(coverage["result"]=="WORKER_OBLIGATIONS_PENDING",coverage.get("reason","missing worker checks"))
        host={"result":"REJECT"}
        try:
            host.update(program_main(q,prepared["main_ops"],prepared["objects"],coverage,Obligations(host),
                mapped_path(prepared["receipt"]["source_path"],prepared["receipt"])))
            host["result"]="PD0_MAIN_PARTITION_EXACT"
        finally: save_certificate(out/"partition",host)
        binding={"source_sha256":prepared["receipt"]["artifacts"]["source.c"],
                 "capture_receipt_sha256":sha((capture/"compiler-receipt.json").read_bytes()),
                 "llvm_sha256":sha(prepared["module"]),"candidate_sha256":sha(candidate.read_bytes()),
                 "q_sha256":sha(qfile.read_bytes()),"run_id":q["run_id"],"property":"all-user-assertions"}
        proposal=read(case/"proposal.json")
        transfer=check_plan(q,prepared,coverage,host,binding,proposal,out/"transfer")
        require(transfer["result"]=="PROPERTY_OBSERVATION_TRANSFER",transfer.get("reason","transfer failed"))
        host.update(result="PD0_PROPERTY_HOST_COVERED",property_transfer=transfer["result"],q_sha256=binding["q_sha256"])
        query=check_queries(q,case/"backend/snapshots/query-audit.json",original["backend"],host,out/"queries",host_profile="PD0")
        require(query["result"] in {"BOUND_SAFETY_AND_BOUND_UNSAT","BOUND_SAFETY_QUERY_SAT"},query.get("reason","query failed"))
        r.update(result="PROPERTY_CHECKS_REPLAYED",query_result=query["result"],binding=binding,omitted=transfer["omitted"])
    except Exception as error:r["reason"]=str(error)
    save_json(out/"replay.json",r)
    return r


def main(suite,out):
    suite=Path(suite).resolve();out=Path(out).resolve();out.mkdir(parents=True,exist_ok=False)
    results=[]
    for name,capture,fault,expected in CASES:
        r=replay(suite/name,ROOT/"experiments"/capture,out/name)
        require((r["result"]=="REJECT")== (expected=="REJECT"),"replay decision disagreed: "+name)
        if expected=="REJECT":
            require(r["reason"]==read(suite/name/"property-certificate.json")["reason"],"different replay failure: "+name)
        results.append({"case":name,**r});save_json(out/"results.json",results)
        print(json.dumps({"case":name,"result":r["result"],"reason":r.get("reason")}),flush=True)


if __name__=="__main__":
    p=argparse.ArgumentParser();p.add_argument("--suite",required=True,type=Path);p.add_argument("--out",required=True,type=Path)
    a=p.parse_args();main(a.suite,a.out)

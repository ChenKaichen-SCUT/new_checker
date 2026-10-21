"""Full real Q, property-specific obligation certificate; never relabel as L4."""
import argparse
import json
from pathlib import Path
from certification.run_pipeline import ROOT, implementation_hashes, run_backend
from certification.interface import sha
from certification.evidence import Commands, save_certificate, save_json
from certification.provenance import require, mapped_path
from certification.templates import TemplatePool
from certification.local_ports import prepare_ports
from certification.property_source import prepare_property_source
from certification.p1_entry import program_workers
from certification.p0_host import Obligations, program_main
from certification.property_obligations import reconstruct, propose, check_plan
from certification.p0_queries import check_queries
from experiments.certify_p0 import GAMMA, THEOREM_SHA256
from experiments.run_dat3m import linux


def run(capture,out,fault=None,full_control=False,property_name="all-user-assertions"):
    capture=Path(capture).resolve(); out=Path(out).resolve(); out.mkdir(parents=True,exist_ok=False)
    implementation=implementation_hashes()
    for f in ("experiments/certify_property.py","docs/property/01-model-and-proof.md","docs/property/02-algorithm.md"):
        implementation[f]=sha((ROOT/f).read_bytes())
    save_json(out/"implementation.json",implementation)
    for name in implementation:
        p=out/"implementation-sources"/name; p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes((ROOT/name).read_bytes())
    report={"result":"REJECT","program_verdict_eligible":False,"legacy_L4_eligible":False,
            "property_verdict_eligible":False,"unconditional_safe":False,"external_assumptions":GAMMA,
            "levels":{},"capture":capture.relative_to(ROOT).as_posix(),"controlled_fault":fault}
    try:
        require(property_name=="all-user-assertions","unsupported requested property")
        require(sha((ROOT/"docs/system-review/01-end-to-end-guarantee.md").read_bytes())==THEOREM_SHA256,"original theorem changed")
        pool=TemplatePool(out/"templates")
        local=prepare_ports(capture,out/"local",pool)
        report["levels"]={"L1":"BLOCK_EXACT","L2":"LLVM_SITE_EXACT"}
        prepared=prepare_property_source(capture,local,out/"preparation")
        candidate=out/"local/translation/candidate.ll"
        tool=ROOT/"vendor/clang-local/root/usr"
        Commands(out/"commands").run(["wsl","-d","Ubuntu","--exec","env","LD_LIBRARY_PATH="+linux(tool/"lib/x86_64-linux-gnu"),
            linux(tool/"bin/clang-21"),"-cc1","-emit-llvm-bc","-disable-llvm-passes","-x","ir",linux(candidate),"-o",linux(out/"validated.bc")])
        mode="property" if fault and fault.startswith("pd-") else "levels" if fault else "levels-positive"
        if mode=="property": build=ROOT/"vendor/Dat3M-property-fault-v1"; receipt=ROOT/"experiments/property/build-fault-01/build-receipt.json"
        elif fault: build=ROOT/"vendor/Dat3M-levels-fault-v1"; receipt=ROOT/"experiments/levels/build-fault-01/build-receipt.json"
        else: build=ROOT/"vendor/Dat3M-levels-positive-v1"; receipt=ROOT/"experiments/levels/build-positive-01/build-receipt.json"
        backend=run_backend(candidate,build,receipt,out/"backend",fault); report["backend"]=backend
        require(backend["result"]=="ACTUAL_BACKEND_CAPTURED","actual Q capture: "+backend.get("reason","unknown"))
        qfile=out/"backend/snapshots/before-encoding.json"; q=json.loads(qfile.read_bytes())
        coverage=program_workers(q,prepared,out/"collected",collect_only=True)
        require(coverage["result"]=="WORKER_OBLIGATIONS_PENDING",coverage.get("reason","structural workers incomplete"))
        host={"result":"REJECT","program_verdict_eligible":False}
        try:
            host.update(program_main(q,prepared["main_ops"],prepared["objects"],coverage,Obligations(host),
                mapped_path(prepared["receipt"]["source_path"],prepared["receipt"])))
            host["result"]="PD0_MAIN_PARTITION_EXACT"
        finally: save_certificate(out/"partition",host)
        binding={"source_sha256":prepared["receipt"]["artifacts"]["source.c"],
                 "capture_receipt_sha256":sha((capture/"compiler-receipt.json").read_bytes()),
                 "llvm_sha256":sha(prepared["module"]),"candidate_sha256":sha(candidate.read_bytes()),
                 "q_sha256":sha(qfile.read_bytes()),"run_id":q["run_id"],"property":property_name}
        facts=reconstruct(q,prepared,coverage,host,binding); save_json(out/"facts.json",facts)
        plan=propose(facts); save_json(out/"proposal.json",plan)
        transfer=check_plan(q,prepared,coverage,host,binding,plan,out/"transfer")
        report["transfer"]=transfer["result"]
        require(transfer["result"]=="PROPERTY_OBSERVATION_TRANSFER",transfer.get("reason","transfer failed"))
        report.update(omitted=transfer["omitted"],phi=transfer["phi"],binding=binding,full_L3_claim=False)
        property_host={**host,"result":"PD0_PROPERTY_HOST_COVERED","property_transfer":transfer["result"],
                       "q_sha256":binding["q_sha256"],"transfer_certificate_sha256":sha((out/"transfer/certificate.json").read_bytes())}
        save_json(out/"property-host.json",property_host)
        queries=check_queries(q,out/"backend/snapshots/query-audit.json",backend,property_host,out/"queries",host_profile="PD0")
        report["query_result"]=queries["result"]
        require(queries["result"] in {"BOUND_SAFETY_AND_BOUND_UNSAT","BOUND_SAFETY_QUERY_SAT"},queries.get("reason","query binding failed"))
        if full_control:
            control=program_workers(q,prepared,out/"full-control")
            report["full_equivalence_control"]={"result":control["result"],"reason":control.get("reason")}
        require(binding["q_sha256"]==sha(qfile.read_bytes()) and q==json.loads((out/"backend/snapshots/after-encoding.json").read_bytes()),"Q changed")
        if fault: report["result"]="PROPERTY_TRANSFER_TEST_ONLY"
        elif queries["result"]=="BOUND_SAFETY_QUERY_SAT": report["result"]="PROPERTY_QUERY_SAT_NO_SAFE_TRANSFER"
        else: report.update(result="PROPERTY_CONDITIONAL_SAFE",property_verdict_eligible=True)
    except Exception as error: report["reason"]=str(error)
    require(all(sha((ROOT/p).read_bytes())==h for p,h in implementation.items()),"implementation changed during run")
    save_json(out/"property-certificate.json",report)
    print(json.dumps({k:report[k] for k in ("result","reason","omitted","full_equivalence_control") if k in report}),flush=True)
    return report


if __name__=="__main__":
    p=argparse.ArgumentParser();p.add_argument("--capture",required=True,type=Path);p.add_argument("--out",required=True,type=Path)
    p.add_argument("--fault");p.add_argument("--full-control",action="store_true");p.add_argument("--property",default="all-user-assertions")
    a=p.parse_args();run(a.capture,a.out,a.fault,a.full_control,a.property)

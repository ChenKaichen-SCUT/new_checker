"""Four-level production runner. Higher failure retains actual lower evidence."""
import argparse
import json
import time
from pathlib import Path
from certification.run_pipeline import ROOT, implementation_hashes, run_backend
from certification.evidence import save_json, save_certificate, Commands
from certification.interface import sha
from certification.provenance import require, mapped_path
from certification.p0_host import program_main, Obligations
from certification.p1_entry import prepare_entry, program_workers, check_program_host
from certification.local_ports import prepare_ports
from certification.llvm_activation import prepare_scope
from certification.templates import TemplatePool
from certification.p0_queries import check_queries
from experiments.certify_p0 import GAMMA, THEOREM_SHA256
from experiments.run_dat3m import linux


def run(capture, out, fault=None, reuse=True):
    capture=Path(capture).resolve();out=Path(out).resolve();out.mkdir(parents=True,exist_ok=False)
    start=time.perf_counter();implementation=implementation_hashes()
    for p in ("experiments/certify_levels.py","docs/levels/01-levels-and-proof.md"):
        implementation[p]=sha((ROOT/p).read_bytes())
    save_json(out/"implementation.json",implementation)
    for p in implementation:
        q=out/"implementation-sources"/p;q.parent.mkdir(parents=True,exist_ok=True);q.write_bytes((ROOT/p).read_bytes())
    pool=TemplatePool(out/"templates") if reuse else None
    result={"achieved_level":0,"layers":{},"program_verdict_eligible":False,"unconditional_safe":False,
            "external_assumptions":GAMMA,"capture":capture.relative_to(ROOT).as_posix(),"fault":fault}
    strong=None
    try:
        require(sha((ROOT/"docs/system-review/01-end-to-end-guarantee.md").read_bytes())==THEOREM_SHA256,"original theorem changed")
        try:
            strong=prepare_entry(capture,out/"preparation",template_pool=pool)
            local={"translation":strong["translation"]}
        except Exception as error:
            result["L4_host_missing"]=str(error)
            local=prepare_ports(capture,out/"local",pool)
        result["layers"].update(L1="BLOCK_EXACT",L2="LLVM_SITE_EXACT");result["achieved_level"]=2
        translation=local["translation"]
        candidate=out/("preparation/translation/candidate.ll" if strong else "local/translation/candidate.ll")
        translation.pop("candidate_llvm",None)
        save_json(out/"translation-evidence.json",translation)
        scope=prepare_scope(capture,local,out/"activation")
        tool=ROOT/"vendor/clang-local/root/usr"
        Commands(out/"commands").run(["wsl","-d","Ubuntu","--exec","env","LD_LIBRARY_PATH="+linux(tool/"lib/x86_64-linux-gnu"),
            linux(tool/"bin/clang-21"),"-cc1","-emit-llvm-bc","-disable-llvm-passes","-x","ir",linux(candidate),"-o",linux(out/"validated.bc")])
        build="fault" if fault else "positive"
        receipt=ROOT/f"experiments/levels/build-{build}-01/build-receipt.json"
        hook=json.loads(receipt.read_bytes())["instrumentation"]
        require(hook["profile"]==("levels-query-audit-v1" if fault else "p0-query-audit-v1"),"instrumentation profile")
        if not fault:
            require(all(sha((ROOT/"backend/dat3m"/p).read_bytes())==h for p,h in hook["additional_sources"].items()),"positive observer build mismatch")
        backend=run_backend(candidate,ROOT/f"vendor/Dat3M-levels-{build}-v1",receipt,out/"backend",fault)
        result["backend"]=backend;require(backend["result"]=="ACTUAL_BACKEND_CAPTURED","complete actual Q: "+backend.get("reason","unknown"))
        q=json.loads((out/"backend/snapshots/before-encoding.json").read_bytes())
        coverage=program_workers(q,scope,out/"regions")
        require(coverage["result"]=="TYPED_WORKERS_EXACT","L3: "+coverage.get("reason","unknown"))
        partition={"result":"REJECT","scope":"restricted main/init/runtime partition; worker C not proved"}
        try:
            obligations=Obligations(partition)
            partition.update(program_main(q,scope["main_ops"],scope["objects"],coverage,obligations,
                mapped_path(scope["receipt"]["source_path"],scope["receipt"])))
            partition["result"]="FINITE_MAIN_PARTITION_EXACT"
        finally: save_certificate(out/"partition",partition)
        result["layers"]["L3"]="ACTUAL_Q_EXACT";result["achieved_level"]=3
        result["L3_scope"]={"source_worker_C_semantics_proved":False,"activation_domain":"finite direct create/site dependent union; complete optimized LLVM worker slices",
                            "regions":coverage["regions"],"q_sha256":sha((out/"backend/snapshots/before-encoding.json").read_bytes())}
        require(strong is not None,"L4: full C host contract absent; L3 retained")
        host=check_program_host(q,strong,coverage,out/"host")
        require(host["result"]==strong["profile"]+"_OPEN_HOST_EXACT","L4 host: "+host.get("reason","unknown"))
        queries=check_queries(q,out/"backend/snapshots/query-audit.json",backend,host,out/"queries",host_profile=strong["profile"])
        result["query_result"]=queries["result"]
        require(queries["result"]=="BOUND_SAFETY_AND_BOUND_UNSAT","L4 query: "+queries.get("reason",queries["result"]))
        require(fault is None,"controlled fault build cannot authorize L4")
        result["layers"]["L4"]="CONDITIONAL_SAFE";result["achieved_level"]=4;result["program_verdict_eligible"]=True
    except Exception as error: result["missing_next_level"]=str(error)
    require(all(sha((ROOT/p).read_bytes())==h for p,h in implementation.items()),"implementation changed during run")
    result["seconds"]=time.perf_counter()-start;result["reuse"]=pool.summary() if pool else None
    save_json(out/"level-certificate.json",result)
    print(json.dumps({k:result[k] for k in ("achieved_level","layers","missing_next_level") if k in result}))
    return result


if __name__=="__main__":
    ap=argparse.ArgumentParser();ap.add_argument("--capture",required=True,type=Path);ap.add_argument("--out",required=True,type=Path)
    ap.add_argument("--fault");ap.add_argument("--no-reuse",action="store_true");a=ap.parse_args()
    run(a.capture,a.out,a.fault,not a.no_reuse)

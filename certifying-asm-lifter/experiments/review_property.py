"""Artifact, premise and fault audit; distinct from the analytic PD-SAFE proof."""
import json
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.evidence import save_json
from certification.provenance import require
from experiments.certify_p0 import GAMMA, THEOREM_SHA256
from experiments.review_levels import implementation, obligations
from experiments.review_p2 import delta
from experiments.run_property_acceptance import CASES

BASE=ROOT/"experiments/property"


def read(p):return json.loads(p.read_bytes())


def main():
    require(sha((ROOT/"docs/system-review/01-end-to-end-guarantee.md").read_bytes())==THEOREM_SHA256,"theorem drift")
    fixed=read(BASE/"fixed-inputs.json")
    for p,h in fixed["new_source_hashes"].items():require(sha((ROOT/p).read_bytes())==h,"source drift")
    require("144 passed" in (BASE/"unit-commands-02/000.stdout.log").read_text(encoding="utf-8"),"unit regression incomplete")
    replays={r["case"]:r for r in read(BASE/"replay-01/results.json")}
    require(len(replays)==len(CASES)==16,"replay census")
    refs,rows,faults=0,[],[]
    for name,capture,fault,expected in CASES:
        p=BASE/"final-02"/name;implementation(p);refs+=obligations(p)
        refs+=obligations(BASE/"replay-01"/name)
        c=read(p/"property-certificate.json")
        require(c["result"]==expected and c["controlled_fault"]==fault,"case mismatch")
        require(c["external_assumptions"]==GAMMA and not c["unconditional_safe"],"TCB drift")
        require(not c["program_verdict_eligible"] and not c["legacy_L4_eligible"],"property certificate relabelled L4")
        require(c["property_verdict_eligible"]==(expected=="PROPERTY_CONDITIONAL_SAFE"),"property gate")
        require(c["levels"]=={"L1":"BLOCK_EXACT","L2":"LLVM_SITE_EXACT"},"lower levels lost")
        b=c["backend"];qfile=p/"backend/snapshots/before-encoding.json";q=read(qfile)
        require(q==read(p/"backend/snapshots/after-encoding.json") and q["run_id"]==b["run_id"],"Q/run changed")
        for f,h in b["snapshots"].items():require(sha((p/"backend/snapshots"/f).read_bytes())==h,"snapshot bytes")
        for f,h in b["queries"].items():require(sha((p/"backend"/f).read_bytes())==h,"actual solver transcript bytes")
        require(b["candidate_sha256"]==sha((p/"local/translation/candidate.ll").read_bytes()),"backend candidate binding")
        local=read(p/"local/local-certificate.json")
        if not fault:
            require(all(i["bindings"][i["slots"]["value"]].startswith("%") for i in local["translation"]["interfaces"]),"fixed LLVM operand")
        transfer=p/"transfer/certificate.json"
        row={"case":name,"result":expected,"reason":c.get("reason"),"backend_text":b["observed_verdict"],
             "property_eligible":c["property_verdict_eligible"],"Q_sha256":sha(qfile.read_bytes())}
        if transfer.exists() and read(transfer)["result"]=="PROPERTY_OBSERVATION_TRANSFER":
            t=read(transfer);f=read(p/"facts.json");pending=read(p/"collected/certificate.json")
            require(not t["full_L3_claim"] and not t["legacy_L4_eligible"],"local/property overclaim")
            require(pending["result"]=="WORKER_OBLIGATIONS_PENDING" and all(o["result"]=="PENDING" for o in pending["obligations"]),"unsolved EXACT")
            require(all(o["result"]=="unsat" for o in t["obligations"]),"selected equation not proved")
            all_names={o["name"] for o in pending["obligations"]}
            require(set(t["selected"])|set(t["omitted"])==all_names and not set(t["selected"])&set(t["omitted"]),"omitted equation census")
            require(t["binding"]["q_sha256"]==sha(qfile.read_bytes()) and t["binding"]["run_id"]==q["run_id"],"transfer Q binding")
            require(t["phi"]==f["phi"] and f["phi"]["kind"]=="all-user-assertions","phi mismatch")
            require(read(p/"preparation/source-llvm/certificate.json")["result"]=="PD0_SOURCE_LLVM_EXACT","source host missing")
            require(read(p/"partition/certificate.json")["result"]=="PD0_MAIN_PARTITION_EXACT","full partition missing")
            regions=f["regions"];ids=[(r["create_index"],r["llvm_line_index"],r["thread"]) for r in regions]
            ends=[e for r in regions for e in (r["read"],r["write"])]
            require(len(ids)==len(set(ids)) and len(ends)==len(set(ends)),"instance/endpoint reuse")
            row.update(selected=len(t["selected"]),omitted=t["omitted"],regions=len(regions),owners=sorted(f["owners"]))
            if name in {"relevant","dependent","branch","d2"}:require(not t["omitted"],"closure lost live/provider value")
            if name in {"owned","unsafe","private-value","query-binding"}:require(len(t["omitted"])==1,"owner distinction missing")
            if name=="dependent":require("side" in f["owners"] and len(regions)==3,"cross-object case drift")
            queries=read(p/"queries/certificate.json")
            if expected!="REJECT":
                require(queries["result"]==("BOUND_SAFETY_QUERY_SAT" if name=="unsafe" else "BOUND_SAFETY_AND_BOUND_UNSAT"),"wrong actual query")
                require(all(x["actual_result"].lower()==x["replay"] for x in queries["queries"]),"query replay disagreed")
                require(replays[name]["result"]=="PROPERTY_CHECKS_REPLAYED" and replays[name]["binding"]==t["binding"],"raw replay mismatch")
        if expected=="REJECT":require(replays[name]["result"]=="REJECT" and replays[name]["reason"]==c["reason"],"rejection replay mismatch")
        if fault:
            d,x,y=delta(p);require(d["objects_unchanged"],"fault changes memory identity")
            if name in {"private-value","public-value"}:
                require(len(d["changed"])==1 and d["changed"][0]["fields"]==["reads","value"] and not d["removed"],"nonisolated write value")
            elif name=="private-a":
                require(len(d["changed"])==2 and not d["removed"],"A fault census")
                for e in d["changed"]:
                    a,z=x[e["event"]],y[e["event"]]
                    require(e["fields"]==["tags"] and set(a["tags"])-set(z["tags"])=={"A"} and a.get("rmw_load")==z.get("rmw_load"),"A/pair cross-trigger")
            elif name in {"private-omit","sync-omit","missing-instance"}:
                require(len(d["removed"])==1 and x[d["removed"][0]]["class"]=="RMWStore" and len(d["changed"])==1
                    and d["changed"][0]["class_before"]=="Load" and d["changed"][0]["class_after"]=="Local","omission shape")
            elif name=="cross-read":require(len(d["changed"])==1 and not d["removed"] and d["changed"][0]["class_after"]=="Local","read omission shape")
            elif name=="cross-return":require(len(d["changed"])==2 and all(e["class_after"]=="Assert" for e in d["changed"]) and not d["removed"],"continuation fault shape")
            elif name=="branch-condition":require(len(d["changed"])==1 and d["changed"][0]["fields"]==["value"] and not d["removed"],"ITE swap isolation")
            elif name=="query-binding":require(not d["changed"] and not d["removed"],"query fault changed Q")
            faults.append({"case":name,**d})
        if name=="private-value":
            control=read(p/"full-control/certificate.json")
            require(control["result"]=="REJECT" and any(o["result"]=="sat" for o in control["obligations"]),"no full-equivalence counterexample")
        rows.append(row)
    legacy=[]
    for name,level in [("d2",4),("branch",3)]:
        p=BASE/"legacy-01"/name;implementation(p);refs+=obligations(p)
        c=read(p/"level-certificate.json")
        require(c["achieved_level"]==level and c["external_assumptions"]==GAMMA,"legacy level drift")
        legacy.append({"case":name,"level":level,"program_eligible":c["program_verdict_eligible"]})
    summary={"result":"REVIEWED","baseline":fixed["baseline"],"cases":16,"unit_tests":144,
        "raw_object_replays":16,"legacy":legacy,"rows":rows,"faults":faults,
        "obligation_references_checked":refs,"backend_PASS_but_rejected":sum(r["result"]=="REJECT" and r["backend_text"]=="PASS" for r in rows),
        "new_external_semantic_assumptions":[],"no_statistical_cost_claim":True,"semantics_proved_by_this_audit":False}
    save_json(BASE/"evidence-review.json",summary)
    print(json.dumps({k:v for k,v in summary.items() if k not in {"rows","faults"}}))


if __name__=="__main__":main()

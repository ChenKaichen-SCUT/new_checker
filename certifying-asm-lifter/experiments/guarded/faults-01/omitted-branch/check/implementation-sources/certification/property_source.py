"""PD0 full restricted C/LLVM host equations, including pure if assignments."""
import json
from pathlib import Path
import z3
from z3.z3util import get_vars
from certification.provenance import authenticate_capture, require, unique
from certification.llvm_activation import prepare_scope
from certification.p1_entry import source_worker, serial_ops
from certification.p0_host import Obligations
from certification.evidence import save_certificate


def prepare_property_source(capture, local, out):
    out=Path(out)
    report={"result":"REJECT", "program_verdict_eligible":False}
    proof=Obligations(report)
    try:
        scope=prepare_scope(capture,local,out/"finite-llvm")
        obs,receipt,_,_=authenticate_capture(capture)
        interfaces=local["translation"].get("interfaces",[local["translation"]["interface"]])
        defs={i["provenance"]["source_function_decl"] for i in interfaces}
        require(len(defs)==1,"PD0 requires one original typed FAA wrapper definition")
        wrapper=unique([f for f in obs["functions"] if f["id"] in defs],"PD source wrapper")
        activations=[]
        for a in scope["activations"]:
            worker=unique([f for f in obs["functions"] if f["name"]==a["worker"]],"PD source worker")
            ops=source_worker(worker,wrapper,a["interfaces"][0],a["argument"],scope["objects"],obs,
                              call_count=len(a["interfaces"]),pure_conditionals=True)
            variables={v.sexpr():v for op in ops for e in op.values() if isinstance(e,z3.AstRef) for v in get_vars(e)}
            fresh=[(v,z3.Const(f"pd-source-{a['create_index']}:"+n,v.sort())) for n,v in variables.items()]
            ops=[{k:z3.substitute(v,*fresh) if isinstance(v,z3.AstRef) else v for k,v in o.items()} for o in ops]
            require(len(ops)==len(a["ops"]),"PD complete C/LLVM operation census")
            substitution=[]
            for oi,(src,llvm) in enumerate(zip(ops,a["ops"])):
                require(src["kind"]==llvm["kind"],"PD source/LLVM operation order")
                kind=src["kind"]; label=f"activation-{a['create_index']}-operation-{oi}"
                if kind=="read":
                    require(src["object"]==llvm["object"] and src["width"]==llvm["width"],"PD ordinary read identity")
                    substitution.append((llvm["value"],src["value"]))
                elif kind=="asm":
                    f=llvm["interface"]
                    require(src["pointer"]==llvm["pointer"] and f["call_context"]=={
                        "begin_raw":src["call"]["begin"]["raw"],"end_raw":src["call"]["end"]["raw"]},"PD actual source call/context")
                    proof.prove(label+"-input",src["input"]==z3.substitute(llvm["input"],*substitution))
                    src["interface"]=f; substitution.append((llvm["value"],src["value"]))
                elif kind=="assert":
                    proof.prove(label+"-monitor",src["condition"]==z3.substitute(llvm["condition"],*substitution))
                else: require(kind=="return","PD source operation outside grammar")
            activations.append({**a,"ops":ops})
        reads={o["object"] for a in activations for o in a["ops"] if o["kind"]=="read"}
        writes={o["pointer"][1:] for a in activations for o in a["ops"] if o["kind"]=="asm"}
        require(not reads & writes,"PD mixed C/asm conflict")
        report.update(result="PD0_SOURCE_LLVM_EXACT", source_conflict_check={"reads":sorted(reads),"writes":sorted(writes)},
                      activations=[{**{k:v for k,v in a.items() if k!="ops"},"ops":serial_ops(a["ops"])} for a in activations],
                      scope="finite unconditional FAA; typed pure if assignments; all statements consumed")
        return {**scope,"activations":activations,"profile":"PD0","source_report":report,"receipt":receipt}
    except Exception as error:
        report["reason"]=str(error); raise
    finally: save_certificate(out/"source-llvm",report)

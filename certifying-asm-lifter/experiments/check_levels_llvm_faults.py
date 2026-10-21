"""Persist single-factor bad transformations of real LLVM fragments; never fake Q."""
import json
import re
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.lowering import check_fragment
from certification.evidence import save_json,save_certificate
from certification.provenance import require


def main():
    case=ROOT/"experiments/levels/final-04/branch/local/translation/call-1"
    i=json.loads((case/"interface.json").read_bytes())
    original=(case/"actual-fragment.ll").read_bytes().decode()
    root=ROOT/"experiments/levels/llvm-faults-02";root.mkdir(exist_ok=False)
    rows=[]
    for mode in ("operand","return"):
        if mode=="operand":bad=original.replace("i32 "+i["bindings"][i["slots"]["value"]]+" monotonic","i32 1 monotonic")
        else:bad=re.sub(r"add i32 0, %[-\w.$]+","add i32 0, 0",original)
        require(original!=bad,"fault not applied")
        out=root/mode;out.mkdir();(out/"original.ll").write_bytes(original.encode());(out/"fault.ll").write_bytes(bad.encode())
        save_json(out/"interface.json",i)
        c=check_fragment(i["normalized"],i["width"],bad,i["bindings"],{"o"+str(i["register_output"]):i["result_ssa"]})
        save_certificate(out/"check",c);require(c["result"]=="REJECT","bad L2 accepted")
        rows.append({"fault":mode,"source_actual_fragment_sha256":sha(original),"result":c["result"],"reason":c.get("reason"),
                     "retained_level":1,"L1_reference":str(case.relative_to(ROOT)/"block/certificate.json"),
                     "no_mutated_source_or_Q":True})
    save_json(root/"results.json",rows);print(json.dumps(rows))


if __name__=="__main__":main()

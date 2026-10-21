"""Attacks on actual captured ITE, L2 binding, and complete L3 scope."""
import copy
import json
import re
from pathlib import Path
import pytest
import z3
from certification.continuation import core_expr
from certification.lowering import check_fragment
from certification.p1_entry import program_workers
from certification.llvm_activation import prepare_scope
from certification.p0_host import program_main, Obligations
from certification.provenance import mapped_path
from frontend.gnu import Reject

ROOT=Path(__file__).resolve().parents[1]
CASE=ROOT/"experiments/levels/development-branch-01"


def find_ite(x):
    if isinstance(x,dict):
        if x.get("kind")=="ITE":return x
        for v in x.values():
            r=find_ite(v)
            if r is not None:return r
    if isinstance(x,list):
        for v in x:
            r=find_ite(v)
            if r is not None:return r


@pytest.mark.parametrize("fault",["dependency","type","truncated","nonboolean","unknownfield"])
def test_actual_ite_invalid_serialization(fault):
    q=json.loads((CASE/"backend/snapshots/before-encoding.json").read_bytes())
    x=copy.deepcopy(find_ite(q));env={r["name"]:z3.BitVec(r["name"],32) for r in x["register_dependencies"]}
    assert core_expr(x,env).size()==32
    if fault=="dependency":x["register_dependencies"].pop()
    if fault=="type":x["type"]="bv64"
    if fault=="truncated":x["args"].pop()
    if fault=="nonboolean":x["args"][0]=x["args"][1]
    if fault=="unknownfield":x["hidden_guard"]=True
    with pytest.raises((Reject,KeyError,z3.Z3Exception)):core_expr(x,env)


@pytest.mark.parametrize("fault",["operand","return"])
def test_wrong_actual_llvm_fragment_preserves_only_l1(fault):
    base=CASE/"local/translation/call-1"
    i=json.loads((base/"interface.json").read_bytes())
    text=(base/"actual-fragment.ll").read_text(encoding="utf-8")
    if fault=="operand":text=text.replace("i32 " + i["bindings"][i["slots"]["value"]] + " monotonic","i32 1 monotonic")
    else:text=re.sub(r"add i32 0, %[-\w.$]+", "add i32 0, 0", text)
    assert text!=(base/"actual-fragment.ll").read_text(encoding="utf-8")
    c=check_fragment(i["normalized"],i["width"],text,i["bindings"],{"o"+str(i["register_output"]):i["result_ssa"]})
    assert c["result"]=="REJECT"


def test_l3_requires_every_actual_activation(tmp_path):
    local=json.loads((CASE/"local/local-certificate.json").read_bytes())
    p=prepare_scope(ROOT/"experiments/hcc/capture-branch",local,tmp_path/"scope")
    q=json.loads((CASE/"backend/snapshots/before-encoding.json").read_bytes())
    q["threads"]=[t for t in q["threads"] if t["id"]!=2]
    c=program_workers(q,p,tmp_path/"q")
    assert c["result"]=="REJECT" and "activation count" in c["reason"]


def test_l3_rejects_extra_unaccounted_thread(tmp_path):
    local=json.loads((CASE/"local/local-certificate.json").read_bytes())
    p=prepare_scope(ROOT/"experiments/hcc/capture-branch",local,tmp_path/"scope")
    q=json.loads((CASE/"backend/snapshots/before-encoding.json").read_bytes())
    c=program_workers(q,p,tmp_path/"q");assert c["result"]=="TYPED_WORKERS_EXACT"
    # Explicit adversarial object mutation only; never used as positive Q.
    q["threads"].append({"id":99,"name":"unexplained","events":[]})
    with pytest.raises(Reject):
        program_main(q,p["main_ops"],p["objects"],c,Obligations({}),mapped_path(p["receipt"]["source_path"],p["receipt"]))

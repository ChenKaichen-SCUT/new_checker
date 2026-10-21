"""Real captured objects only for positive cases; adversarial plans are untrusted."""
import copy
import json
from pathlib import Path
import pytest
import z3
from z3.z3util import get_vars
from certification.property_obligations import propose, verify

ROOT=Path(__file__).resolve().parents[1]
CASE=ROOT/"experiments/property/development-owned-01"


def read(p): return json.loads(p.read_bytes())


def actual_equations(path):
    cert=read(path/"collected/certificate.json")
    result=[]
    for o in cert["obligations"]:
        a=z3.parse_smt2_string((path/"collected"/o["file"]).read_bytes().decode())
        assert len(a)==1 and z3.is_not(a[0])
        # Solver.to_smt2() may rewrite distinct to (and distinct true).
        # Recover declarations from that replay, but parse the separately
        # recorded original statement. The checker still verifies its exact
        # unsimplified AST hash; no dependency is erased by normalization.
        decls={str(v.decl().name()):v for v in get_vars(a[0])}
        original=z3.parse_smt2_string("(assert "+o["statement"]+")",decls=decls)
        assert len(original)==1
        result.append((o["name"],original[0]))
    return result


def test_real_owned_plan_accepts_without_full_equivalence_claim(tmp_path):
    facts=read(CASE/"facts.json"); plan=propose(facts)
    c=verify(facts,actual_equations(CASE),plan,tmp_path)
    assert c["result"]=="PROPERTY_OBSERVATION_TRANSFER" and len(c["omitted"])==1
    assert not c["full_L3_claim"] and not c["legacy_L4_eligible"]
    assert not c["program_verdict_eligible"] and not c["property_verdict_eligible"]


@pytest.mark.parametrize("attack",["missing-equation","wrong-kind","unowned","missing-root","missing-provider","stale-Q","private-crossing","duplicate"])
def test_untrusted_plan_rejected(attack,tmp_path):
    facts=read(CASE/"facts.json"); plan=propose(facts)
    if attack=="missing-equation": plan["selected"].pop()
    elif attack=="wrong-kind":
        n=next(n for n in plan["selected"] if "monitor" in n)
        plan["selected"].remove(n);plan["omitted"]=sorted([*plan["omitted"],n])
    elif attack=="unowned": plan["omitted_objects"]=sorted([*plan["omitted_objects"],"x"])
    elif attack=="missing-root": plan["closed"].remove(facts["roots"][0])
    elif attack=="missing-provider":
        n=next(b for a,b in facts["edges"] if a in plan["closed"] and b in plan["closed"] and b not in facts["roots"])
        plan["closed"].remove(n)
    elif attack=="stale-Q": plan["facts_sha256"]="0"*64
    elif attack=="private-crossing":
        name=plan["omitted_objects"][0]
        n=next("r:"+str(r["event"]) for r in facts["read_bindings"] if r["object"]==name)
        plan["closed"]=sorted(set(plan["closed"])|{n})
    else: plan["omitted"].append(plan["omitted"][0])
    c=verify(facts,actual_equations(CASE),plan,tmp_path)
    assert c["result"]=="REJECT" and not c["program_verdict_eligible"]
    expected={"missing-equation":"uncovered certification", "wrong-kind":"invalid omitted",
        "unowned":"unproved dynamic ownership", "missing-root":"missing property",
        "missing-provider":"missing provider", "stale-Q":"stale facts",
        "private-crossing":"missing provider", "duplicate":"duplicate/noncanonical"}
    assert expected[attack] in c["reason"]


def test_actual_private_difference_is_only_property_transfer(tmp_path):
    p=ROOT/"experiments/property/development-private-diff-01"
    facts=read(p/"facts.json"); plan=propose(facts)
    c=verify(facts,actual_equations(p),plan,tmp_path)
    assert c["result"]=="PROPERTY_OBSERVATION_TRANSFER"
    full=read(p/"full-control/certificate.json")
    assert full["result"]=="REJECT" and any(o["result"]=="sat" for o in full["obligations"])
    final=read(p/"property-certificate.json")
    assert final["result"]=="PROPERTY_TRANSFER_TEST_ONLY" and not final["property_verdict_eligible"]
    assert read(p/"backend/snapshots/before-encoding.json")==read(p/"backend/snapshots/after-encoding.json")


def test_repeated_activation_is_not_single_owner():
    p=ROOT/"experiments/property/development-branch-01"
    facts=read(p/"facts.json")
    assert len({r["thread"] for r in facts["regions"]})==2
    assert "x" not in facts["owners"] and not propose(facts)["omitted"]


def test_pending_does_not_authorize_queries():
    c=read(CASE/"collected/certificate.json")
    assert c["result"]=="WORKER_OBLIGATIONS_PENDING"
    assert all(o["result"]=="PENDING" for o in c["obligations"])
    assert all(r["result"]=="RMW_OBLIGATIONS_PENDING" for r in c["regions"])


def test_actual_cross_call_dependency_retains_owned_object():
    p=ROOT/"experiments/property/development-dependent-01"
    facts=read(p/"facts.json"); plan=propose(facts)
    assert "side" in facts["owners"] and not plan["omitted"]
    private={"r:"+str(r["event"]) for r in facts["read_bindings"] if r["object"]=="side"}
    assert private and private <= set(plan["closed"])


def test_omitted_equation_still_hash_bound(tmp_path):
    facts=read(CASE/"facts.json"); plan=propose(facts)
    equations=actual_equations(CASE)
    equations=[(n,z3.BoolVal(True) if n in plan["omitted"] else e) for n,e in equations]
    c=verify(facts,equations,plan,tmp_path)
    assert c["result"]=="REJECT" and c["reason"]=="equation drift"


def test_solver_unknown_cannot_authorize_transfer(tmp_path,monkeypatch):
    facts=read(CASE/"facts.json"); plan=propose(facts)
    equations=actual_equations(CASE)
    monkeypatch.setattr(z3.Solver,"check",lambda self,*args:z3.unknown)
    monkeypatch.setattr(z3.Solver,"reason_unknown",lambda self:"controlled timeout response")
    c=verify(facts,equations,plan,tmp_path)
    assert c["result"]=="REJECT" and c["obligations"][0]["result"]=="unknown"
    assert not c["property_verdict_eligible"]

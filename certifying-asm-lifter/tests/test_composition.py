"""Focused certificate attacks on immutable real captures; mutations are tests."""
import copy
import json
import pytest
from certification.run_pipeline import ROOT
from certification.evidence import save_json
from certification.composition import recover, propose, check
from experiments.certify_composition import load_front


@pytest.fixture(scope="module")
def real(tmp_path_factory):
    out = tmp_path_factory.mktemp("real-branch")
    prepared, _ = load_front(ROOT / "experiments/hcc/capture-branch", out / "front")
    q = json.loads((ROOT / "experiments/property/final-02/branch/backend/snapshots/before-encoding.json").read_bytes())
    facts = recover(q, prepared, out / "facts")
    binding = {"unit_test": "actual historical branch; no program SAFE claim"}
    return q, prepared, facts, binding, propose(facts, binding)


def verify(real, tmp_path, q=None, plan=None):
    original, prepared, _, binding, proposal = real
    q = original if q is None else q
    plan = proposal if plan is None else plan
    save_json(tmp_path / "tested-Q.json", q)
    save_json(tmp_path / "tested-proposal.json", plan)
    return check(q, prepared, binding, plan, tmp_path / "check")


def test_positive_all_units(real, tmp_path):
    r = verify(real, tmp_path)
    assert r["result"] == "COMPOSITIONAL_WORKERS_EXACT"
    assert len(r["regions"]) == 4 and r["region_count"] == 14


def test_independent_checker_accepts_noncanonical_partition(real, tmp_path):
    q, _, facts, binding, _ = real
    r = verify(real, tmp_path, plan=propose(facts, binding, merged=True))
    assert r["result"] == "COMPOSITIONAL_WORKERS_EXACT" and r["region_count"] == 2


@pytest.mark.parametrize("fault", ["missing-port", "missing-edge", "missing-call", "missing-worker", "wrong-map", "missing-node"])
def test_untrusted_proposal_faults(real, tmp_path, fault):
    plan = copy.deepcopy(real[4])
    a = plan["activations"][0]
    if fault == "missing-port":
        next(r for r in a["regions"] if r["input_ports"])["input_ports"].pop()
    elif fault == "missing-edge":
        next(r for r in a["regions"] if r["crossing_dependencies"])["crossing_dependencies"].pop()
    elif fault == "missing-call":
        a["pairs"].pop(1)
    elif fault == "missing-worker":
        plan["activations"].pop()
    elif fault == "missing-node":
        a["regions"][0]["actual_nodes"].pop()
    else:
        a["pairs"][1][1], a["pairs"][3][1] = a["pairs"][3][1], a["pairs"][1][1]
    r = verify(real, tmp_path, plan=plan)
    assert r["result"] == "REJECT" and r.get("reason")


@pytest.mark.parametrize("fault", ["write-value", "a-only", "pair-only", "ite-control"])
def test_actual_object_mutations_are_not_new_captures(real, tmp_path, fault):
    q = copy.deepcopy(real[0])
    t = next(t for t in q["threads"] if t["name"] == "worker")
    rs = [e for e in t["events"] if e["class"] == "RMWStore" and e["width"] == 32]
    if fault == "write-value":
        # Keep dependency census: ADD becomes subtraction is unsupported and
        # rejects, so use a total well-typed operand duplication instead.
        rs[0]["value"]["args"][1] = copy.deepcopy(rs[0]["value"]["args"][0])
        rs[0]["reads"] = [r for r in rs[0]["reads"] if r["name"] == rs[0]["value"]["args"][0]["name"]]
    elif fault == "a-only":
        rs[0]["tags"].remove("A")
    elif fault == "pair-only":
        rs[1]["rmw_load"] = rs[0]["rmw_load"]
    else:
        rs[1]["value"]["args"][0]["kind"] = "NEQ"
    r = verify(real, tmp_path, q=q)
    assert r["result"] == "REJECT"
    if fault in {"write-value", "ite-control"}:
        assert any(o["result"] == "sat" and "model" in o for o in r["obligations"])


def test_q_location_hints_not_matching_authority(real, tmp_path):
    q = copy.deepcopy(real[0])
    for t in q["threads"]:
        if t["name"] == "worker":
            for e in t["events"][4:-4]:
                e.pop("source", None)
    r = verify(real, tmp_path, q=q)
    assert r["result"] == "COMPOSITIONAL_WORKERS_EXACT"
    # This is ONLY a unit-level mutation acceptance. Artifact/query binding is
    # deliberately not bypassed to call the modified JSON an actual backend Q.


@pytest.mark.parametrize("case", ["cross-return", "cross-read", "missing-instance", "branch-condition"])
def test_independent_checker_on_actual_fault_capture_without_producer(real, tmp_path, case):
    q = json.loads((ROOT / "experiments/property/final-02" / case /
                    "backend/snapshots/before-encoding.json").read_bytes())
    # Directly challenge the independent checker with a previously good plan;
    # no candidate generator is called for the faulty actual Program.
    r = verify(real, tmp_path, q=q)
    assert r["result"] == "REJECT"

"""Entry relation regression; real captured objects, no fabricated event maps."""
import json
from pathlib import Path
import pytest
from certification.p1_entry import prepare_entry, llvm_worker, program_workers
from certification.p0_host import Obligations
from certification.provenance import reconcile
from frontend.gnu import Reject

ROOT = Path(__file__).resolve().parents[1]
CAPTURE = ROOT / "experiments/p2/capture-readonly"


@pytest.fixture
def prepared(tmp_path):
    return prepare_entry(CAPTURE, tmp_path / "prepared")


def test_old_scope_rejects_nonconstant_input():
    with pytest.raises(Reject):
        reconcile(CAPTURE)


def test_real_llvm_entry_is_nonconstant(prepared):
    interface = prepared["translation"]["interface"]
    assert interface["bindings"][interface["slots"]["value"]].startswith("%")
    assert prepared["report"]["result"] == "TYPED_SOURCE_LLVM_ENTRY_EXACT"


def test_changed_actual_llvm_operand_rejected(prepared):
    # Component-only corruption: never authenticated or represented as a
    # production compiler capture. Actual backend faults are separate runs.
    interface = {**prepared["translation"]["interface"]}
    interface["bindings"] = {**interface["bindings"], interface["slots"]["value"]: "1"}
    with pytest.raises(Reject, match="nonconstant"):
        llvm_worker(prepared["module"], prepared["worker"], interface, prepared["argument"],
                    prepared["ops"], Obligations({}))


def test_ssa_names_not_backend_contract(prepared, tmp_path):
    q = json.loads((ROOT / "experiments/p2/development-readonly-02/backend/snapshots/before-encoding.json").read_bytes())
    # Alpha-renaming is a component test only, not actual-Q acceptance evidence.
    def rename(v):
        if isinstance(v, dict):
            if (v.get("kind") == "register" or set(v) == {"name", "type"}):
                v["name"] = "renamed_" + v["name"]
            for child in v.values():
                rename(child)
        elif isinstance(v, list):
            for child in v:
                rename(child)
    rename(q)
    cert = program_workers(q, prepared, tmp_path / "alpha")
    assert cert["result"] == "TYPED_WORKERS_EXACT", cert.get("reason")


def test_two_real_contexts_and_cross_call_ssa(tmp_path):
    p = prepare_entry(ROOT / "experiments/p2/capture-readonly-multi", tmp_path / "multi")
    assert p["profile"] == "D1b"
    sites = p["translation"]["interfaces"]
    assert len(sites) == 2 and sites[0]["call_context"] != sites[1]["call_context"]
    assert sites[1]["bindings"][sites[1]["slots"]["value"]] == sites[0]["result_ssa"]
    assert all(c["lowering_certificate"]["result"] == "LLVM_FRAGMENT_EXACT" for c in p["translation"]["calls"])
    wrong = [{**s, "bindings": {**s["bindings"]}} for s in sites]
    wrong[1]["bindings"][wrong[1]["slots"]["value"]] = sites[0]["bindings"][sites[0]["slots"]["value"]]
    with pytest.raises(Reject, match="typed-entry-llvm-input"):
        llvm_worker(p["module"], p["worker"], wrong[0], p["argument"], p["ops"],
                    Obligations({}), interfaces=wrong)


def test_reused_context_rejects(tmp_path):
    p = prepare_entry(ROOT / "experiments/p2/capture-readonly-multi", tmp_path / "multi")
    sites = p["translation"]["interfaces"]
    wrong = [sites[0], {**sites[1], "call_context": sites[0]["call_context"]}]
    with pytest.raises(Reject, match="call context"):
        llvm_worker(p["module"], p["worker"], wrong[0], p["argument"], p["ops"],
                    Obligations({}), interfaces=wrong)

"""Meaningful attacks on the reuse boundary and HCC evidence admission."""
import json
from pathlib import Path
import pytest
from certification.templates import TemplatePool
from certification.hcc import declaration, validate_declaration
from certification.p1_entry import prepare_entry, program_workers
from certification.local_ports import prepare_ports
from frontend.gnu import Reject

ROOT = Path(__file__).resolve().parents[1]
CAPTURE = ROOT / "experiments/p2/capture-workers"


def test_template_shared_but_llvm_and_dynamic_instances_independent(tmp_path):
    pool = TemplatePool(tmp_path / "templates")
    p = prepare_entry(CAPTURE, tmp_path / "p", template_pool=pool)
    assert pool.summary()["distinct_template_proofs"] == 1
    assert pool.summary()["site_requests"] == 2
    calls = p["translation"]["calls"]
    assert len(calls) == 2 and all(c["lowering_certificate"]["result"] == "LLVM_FRAGMENT_EXACT" for c in calls)
    q = json.loads((ROOT / "experiments/p2/final-workers-02/safe/backend/snapshots/before-encoding.json").read_bytes())
    c = program_workers(q, p, tmp_path / "q")
    assert c["result"] == "TYPED_WORKERS_EXACT"
    assert len({(v["worker_definition"], v["thread"]) for v in c["regions"]}) == 2


def test_cache_candidate_change_requires_new_proof(tmp_path):
    from lifter.lift import lift
    from frontend.gnu import parse
    pool = TemplatePool(tmp_path / "templates")
    i = json.loads((ROOT / "experiments/p2/final-workers-02/safe/preparation/translation/call-0/interface.json").read_bytes())
    ir = lift(parse(i["normalized"], 32))
    c = pool.verify(i["normalized"], ir, 32)
    assert c["result"] == "EXACT"
    # A caller can mutate the returned certificate but not the stored theorem.
    c["result"] = "FORGED"
    assert pool.verify(i["normalized"], ir, 32)["result"] == "EXACT"
    altered = json.loads(json.dumps(ir))
    altered["code"][0]["value"] = 0
    with pytest.raises((Reject, KeyError)):
        pool.verify(i["normalized"], altered, 32)
    with pytest.raises(Reject):
        pool.verify(i["normalized"], ir, 64)


def test_cached_evidence_mutation_rejects(tmp_path):
    p = TemplatePool(tmp_path / "templates")
    result = prepare_ports(CAPTURE, tmp_path / "p", p)
    call = result["translation"]["calls"][0]
    ref = call["block_certificate"]["template_reference"]
    target = tmp_path / "templates" / ref["key"] / "certificate.json"
    target.write_bytes(b'{}')
    with pytest.raises(Reject, match="evidence mutated"):
        p.verify(call["interface"]["normalized"], call["candidate_ir"], call["interface"]["width"])


@pytest.mark.parametrize("mutation", ["source", "scope", "trust", "provider", "verified"])
def test_self_attested_hcc_is_not_a_proof(mutation):
    d = declaration(CAPTURE)
    if mutation == "source": d["artifacts"]["source.c"] = "0" * 64
    if mutation == "scope": d["direction"] = "target-in-source"
    if mutation == "trust": d["extra_assumptions"] = ["host compilation always correct"]
    if mutation == "provider": d["provider"] = "user-declared"
    if mutation == "verified": d["verified_external_provider"] = "CompCertTSO"
    with pytest.raises(Reject): validate_declaration(d, CAPTURE)


def test_declaration_alone_never_releases_safe():
    d = declaration(CAPTURE, "unavailable")
    assert validate_declaration(d, CAPTURE) == "unavailable"
    assert "program_verdict_eligible" not in d

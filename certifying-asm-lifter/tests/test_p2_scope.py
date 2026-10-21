"""Semantic applicability and dependent coverage, using real authenticated captures."""
import json
import hashlib
from pathlib import Path
import pytest
from certification.p1_entry import prepare_entry, program_workers
from frontend.gnu import Reject

ROOT = Path(__file__).resolve().parents[1]


def test_block_obligation_hash_binds_exact_disk_bytes(tmp_path):
    from checker.check import check
    from lifter.lift import lift
    from frontend.gnu import parse
    interface = ROOT / "experiments/p2/development-readonly-02/preparation/translation/interface.json"
    text = json.loads(interface.read_bytes())["normalized"]
    c = check(text, lift(parse(text, 32)), 32, output_dir=tmp_path)
    assert c["result"] == "EXACT"
    for o in c["obligations"]:
        assert hashlib.sha256((tmp_path / o["file"]).read_bytes()).hexdigest() == o["smt_sha256"]


@pytest.mark.parametrize("capture,reason", [
    ("p1a/capture-safe-01", "MIXED_C_ASM_CONFLICT"),
    ("p1b/capture-safe-02", "MIXED_C_ASM_CONFLICT"),
    ("p2/capture-workers-alias", "MIXED_C_ASM_CONFLICT"),
    ("p2/capture-workers-crossalias", "MIXED_C_ASM_CONFLICT"),
    ("p2/capture-workers-width", "roundtrip"),
])
def test_source_applicability_rejects(capture, reason, tmp_path):
    with pytest.raises(Reject, match=reason):
        prepare_entry(ROOT / "experiments" / capture, tmp_path / "p")


def test_distinct_workers_and_arguments(tmp_path):
    p = prepare_entry(ROOT / "experiments/p2/capture-workers", tmp_path / "p")
    assert p["profile"] == "D2"
    assert [(a["worker"], a["argument"]) for a in p["activations"]] == [
        ("worker", "@input_a"), ("worker_other", "@input_b")]
    assert len({a["ops"][0]["value"].sexpr() for a in p["activations"]}) == 2
    q = json.loads((ROOT / "experiments/p2/development-workers-01/backend/snapshots/before-encoding.json").read_bytes())
    c = program_workers(q, p, tmp_path / "q")
    assert c["result"] == "TYPED_WORKERS_EXACT", c.get("reason")
    assert len(c["regions"]) == 2
    assert len({r["worker_definition"] for r in c["regions"]}) == 2
    assert {r["create_index"] for r in c["regions"]} == {0, 1}


def test_wrong_source_activation_relation_is_not_a_register_map(tmp_path):
    p = prepare_entry(ROOT / "experiments/p2/capture-workers", tmp_path / "p")
    q = json.loads((ROOT / "experiments/p2/development-workers-01/backend/snapshots/before-encoding.json").read_bytes())
    # Internal premise attack only. Production run accepts no supplied preparation.
    p["activations"][1]["argument"] = "@input_a"
    c = program_workers(q, p, tmp_path / "q")
    assert c["result"] == "REJECT" and "thread-argument" in c["reason"]

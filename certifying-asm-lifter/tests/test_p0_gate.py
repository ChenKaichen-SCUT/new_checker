"""Targeted gate/parser regression checks; no generated source/event substitutes."""
import json
from pathlib import Path
import pytest
from certification.p0_queries import commands, transcript_queries
from certification.interface import sha
from experiments.certify_p0 import GAMMA, THEOREM_SHA256

ROOT = Path(__file__).resolve().parents[1]
FINAL = ROOT / "experiments/p0/final-reviewed"


def read(path):
    return json.loads(path.read_bytes())


def test_actual_safe_query_stack_and_conditional_gate():
    p = FINAL / "safe"
    transcript = next((p / "backend/solver-output").glob("*.smt2")).read_text(encoding="utf-8")
    qs = transcript_queries(transcript)
    assert [q["stack_depth"] for q in qs] == [1, 0]
    assert [q["logged_status"] for q in qs] == ["unsat", "unsat"]
    c = read(p / "program-certificate.json")
    assert c["result"] == "CONDITIONAL_SAFE" and c["program_verdict_eligible"]
    assert not c["unconditional_safe"] and not c["external_semantic_assumptions_proved"]
    assert c["external_assumptions"] == GAMMA and len(GAMMA) == 8
    assert sha((ROOT / c["theorem"].partition(":")[0]).read_bytes()) == THEOREM_SHA256


@pytest.mark.parametrize("case,expected", [
    ("unsafe", "SAFETY_QUERY_SAT_NO_SAFE_TRANSFER"), ("missing-main-assert", "REJECT"),
    ("wrong-join", "REJECT"), ("wrong-query", "REJECT"),
])
def test_actual_negative_cases_cannot_release(case, expected):
    p = FINAL / case
    c = read(p / "program-certificate.json")
    assert c["result"] == expected and not c["program_verdict_eligible"]
    assert c["layers"]["C1"] == "INTERFACE_BLOCK_LLVM_REGION_LIVE_EXACT"
    assert read(p / "regions/coverage.json")["result"] == "SUPPORTED_WORKERS_EXACT"
    if case != "unsafe":
        assert c["backend"]["observed_verdict"] == "PASS"


def test_actual_query_fault_has_a_local_binding_countermodel():
    c = read(FINAL / "wrong-query/queries/certificate.json")
    failed = [o for o in c["obligations"] if o["result"] == "sat"]
    assert len(failed) == 1 and failed[0]["name"] == "actual-safety-assumption-binding"
    assert failed[0]["model"]
    audit = read(FINAL / "wrong-query/backend/snapshots/query-audit.json")
    assert [q["result"] for q in audit["queries"]] == ["UNSAT", "UNSAT"]


def test_scanner_respects_quoted_comments_and_parentheses():
    assert commands('(set-info :source |; ( )|)\n; ignored (\n(assert true)') == [
        '(set-info :source |; ( )|)', '(assert true)']
    assert commands('(set-info :category "a""(;)")') == ['(set-info :category "a""(;)")']


@pytest.mark.parametrize("text", [
    '(assert true', '(pop 1)', '(set-option :produce-models true)',
    '(assert true)', '(set-info :status unsat)\n(check-sat)\n(push 1)',
    '(set-info :status unsat)\n(check-sat)\n(assert false)',
    '(set-info :status unknown)\n(check-sat)\n(set-info :status unsat)',
])
def test_incomplete_or_unsupported_transcript_rejects(text):
    with pytest.raises(ValueError):
        transcript_queries(text)

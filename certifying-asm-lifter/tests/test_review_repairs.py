import copy
import pytest
from backend.llvm_tso import emit
from checker.check import check
from frontend.gnu import Reject
from frontend.scan import extract
from experiments.review_regressions import IR, SOURCE, SPELLINGS


@pytest.mark.parametrize("value", [["add", 0, "o0"], ["add", "o0", 0]])
def test_review_equivalent_add_orders(value):
    ir = copy.deepcopy(IR)
    ir["code"][1]["value"] = value
    assert check(SOURCE, ir)["result"] == "EXACT"
    code, _ = emit(ir, {"p1": "%p"})
    assert "atomicrmw add" in code and "atomicrmw xchg" not in code


@pytest.mark.parametrize("value", ["o0", ["add", "o0", "o0"],
                                  ["add", 1, ["add", 1, "o0"]]])
def test_no_read_dependent_xchg_fallback(value):
    ir = copy.deepcopy(IR)
    ir["code"][1]["value"] = value
    with pytest.raises(Reject, match="depends"):
        emit(ir, {"p1": "%p"})


def test_previous_value_copy_is_not_this_read():
    ir = copy.deepcopy(IR)
    ir["code"].insert(1, {"op": "set", "dest": "tmp7", "value": "o0"})
    ir["code"][2]["value"] = ["add", "tmp7", "o0"]
    assert check(SOURCE, ir)["result"] == "EXACT"
    code, _ = emit(ir, {"p1": "%p", "o1": "%lift0"})
    assert "%lift1 = atomicrmw add" in code
    assert "i32 0 monotonic" in code


@pytest.mark.parametrize("mode", ["rlx", "acq", "rel", "sc"])
def test_modes_are_not_silently_weakened(mode):
    ir = copy.deepcopy(IR)
    ir["code"][1]["mode"] = mode
    with pytest.raises(Reject, match="TSO"):
        emit(ir, {"p1": "%p"})


@pytest.mark.parametrize("field,value", [
    ("has_write", ["eq", "o0", "o0"]),
    ("value", ["add", "o0", 1]),
])
def test_cas_operands_must_exist_before_read(field, value):
    ir = copy.deepcopy(IR)
    ir["code"][1].update(has_write=["eq", "o0", 7], value=2)
    ir["code"][1][field] = value
    with pytest.raises(Reject, match="depends"):
        emit(ir, {"p1": "%p"})


@pytest.mark.parametrize("text", SPELLINGS)
def test_review_spellings(text):
    assert list(extract(text)) == [(1, text)]


def test_scan_ignores_literals_comments_and_shields_slashes():
    text = r'''char *s="asm(\"bad\")"; /* asm("bad"); */
asm("/* not a comment */ // still string" ::: "memory");
'''
    rows = list(extract(text))
    assert len(rows) == 1 and rows[0][0] == 2
    assert "/* not a comment */" in rows[0][1]


def test_scan_splices_before_tokenizing():
    assert list(extract('a\\\nsm("mfence" ::: "memory");')) == [
        (1, 'asm("mfence" ::: "memory");')]

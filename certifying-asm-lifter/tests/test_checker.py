import copy
import json
import pytest
import z3
from frontend.gnu import parse, Reject
from lifter.lift import lift
from checker.check import check

GOOD = {
    "barrier": 'asm volatile("" ::: "memory");',
    "mfence": 'asm volatile("mfence" ::: "memory");',
    "sfence": 'asm volatile("sfence" ::: "memory");',
    "move": 'asm("movl %1,%0" : "=r"(out) : "r"(value));',
    "add": 'asm("addl %1,%0" : "+r"(out) : "r"(value) : "cc");',
    "read": 'asm volatile("movl %1,%0" : "=r"(out) : "m"(*ptr));',
    "write": 'asm volatile("movl %1,%0" : "=m"(*ptr) : "r"(value));',
    "xchg": 'asm volatile("xchgl %0,%1" : "+r"(value), "+m"(*ptr));',
    "xadd": 'asm volatile("lock xaddl %0,%1" : "+r"(value), "+m"(*ptr) : : "cc");',
    "cas": 'asm volatile("lock cmpxchgl %2,%1" : "+a"(expected), "+m"(*ptr) : "r"(desired) : "cc");',
    "tie": 'asm("addl %1,%0" : "=r"(out) : "0"(value) : "cc");',
    "early": 'asm("movl $0,%0; addl %1,%0" : "=&r"(out) : "r"(value) : "cc");',
    "named": 'asm("movl %[src],%[dst]" : [dst] "=r"(out) : [src] "r"(value));',
    "two_reads": 'asm("movl %2,%0; movl %2,%1" : "=&r"(a), "=r"(b) : "m"(*ptr));',
    "two_writes": 'asm("movl $1,%0; movl $2,%0" : "=m"(*ptr));',
    "alias": 'asm("movl $1,%0; movl $2,%1" : "=m"(*p), "=m"(*q));',
}


@pytest.mark.parametrize("name", list(GOOD))
@pytest.mark.parametrize("width", [32, 64])
def test_correct(name, width):
    text = GOOD[name]
    if width == 64:
        for mnemonic in ["mov", "add", "xchg", "xadd", "cmpxchg"]:
            text = text.replace(mnemonic + "l", mnemonic + "q")
    cert = check(text, lift(parse(text, width)), width)
    assert cert["result"] == "EXACT", cert


def mutation(name, mutate):
    text = GOOD[name]
    ir = lift(parse(text))
    mutate(ir["code"])
    cert = check(text, ir)
    assert cert["result"] == "REJECT", cert
    return cert


def test_delete_middle_write():
    mutation("two_writes", lambda c: c.pop(0))


def test_strengthen_sfence():
    mutation("sfence", lambda c: c[0].update(mode="sc"))


def test_weaken_mfence():
    mutation("mfence", lambda c: c[0].update(mode="sf"))


def test_barrier_becomes_hardware_fence():
    mutation("barrier", lambda c: c.append({"op": "fence", "mode": "sc"}))


def test_split_rmw():
    def split(c):
        c[:] = [{"op": "read", "mode": "tso", "width": 32, "addr": "p1", "dest": "tmp0"},
                {"op": "write", "mode": "tso", "width": 32, "addr": "p1", "value": ["add", "tmp0", "o0"]},
                {"op": "set", "dest": "o0", "value": "tmp0"}]
    mutation("xadd", split)


def test_cas_wrong_condition():
    cert = mutation("cas", lambda c: c[0].update(has_write=["ne", "tmp0", "o0"]))
    assert any(o["result"] == "sat" for o in cert["obligations"])


def test_cas_fail_writes():
    mutation("cas", lambda c: c[0].update(has_write=True))


def test_cas_failure_loses_order():
    # A plain read loses the RMW identity even if it returns the correct old value.
    def plain(c):
        c[0] = {"op": "read", "mode": "tso", "width": 32, "addr": "p1", "dest": "tmp0"}
    mutation("cas", plain)


def test_cas_wrong_return():
    mutation("cas", lambda c: c[1].update(value=0))


def test_rmw_different_value():
    mutation("xadd", lambda c: c[0].update(value="o0"))


def test_tied_input_not_initialized():
    mutation("tie", lambda c: c.insert(0, {"op": "set", "dest": "o0", "value": 0}))


def test_symbolic_addresses_not_distinct_constants():
    cert = mutation("alias", lambda c: c[1].update(addr="p0"))
    assert any("addr:p" in o.get("countermodel", "") for o in cert["obligations"])


def test_fresh_responses_not_cached_by_address():
    mutation("two_reads", lambda c: c.append({"op": "set", "dest": "o1", "value": "o0"}))


BAD = [
    'asm("movl $0,%0; addl %1,%0" : "=r"(out) : "r"(value) : "cc");',
    'asm("lock xaddl %0,%1" : "+r"(value), "+m"(*ptr));',
    'asm("movl %0,%1" : : "r"(value), "m"(*ptr));',
    'asm("movl %0,%1" : "=m"(*ptr), "=r"(out));',
    'asm("addl $1,%0" : "=r"(out) : : "cc");',
    'asm("mfence" : : : "eax");',
    'asm("lock cmpxchgl %2,%1" : "+r"(expected), "+m"(*ptr) : "r"(desired) : "cc");',
    'asm("xaddl %0,%1" : "+r"(value), "+m"(*ptr) : : "cc");',
    'asm("movl %%eax,%0" : "=r"(out));',
    'asm goto("jmp %l0" ::: : label);',
    'asm("movl %1,%0" : "=r"(*ptr) : "r"(value));',
    'asm("movl %1,%0" : "=r"(out) : "rm"(value));',
    'asm("addl %1,%0; adcl $0,%0" : "+r"(out) : "r"(value) : "cc");',
]


@pytest.mark.parametrize("text", BAD)
def test_reject_unsupported_or_bad_interface(text):
    try:
        ir = lift(parse(text))
    except Reject:
        return
    assert check(text, ir)["result"] == "REJECT"


def test_no_false_precondition_in_ir():
    text = GOOD["write"]
    ir = lift(parse(text))
    ir["assume"] = False
    assert check(text, ir)["result"] == "REJECT"


def test_unknown_statement_never_ignored():
    mutation("barrier", lambda c: c.append({"op": "unknown"}))


def test_compiler_barrier_metadata_not_dropped():
    text = GOOD["barrier"]
    ir = lift(parse(text))
    ir["compiler_barrier"] = False
    assert check(text, ir)["result"] == "REJECT"


@pytest.mark.parametrize("width,suffix", [(32, "l"), (64, "q")])
def test_x86_64_q_constraint(width, suffix):
    text = 'asm("lock xadd' + suffix + ' %1,%0" : "+m"(*ptr), "+q"(delta) : : "cc");'
    assert check(text, lift(parse(text, width)), width)["result"] == "EXACT"


def test_certificate_replay(tmp_path):
    text = GOOD["cas"]
    ir = lift(parse(text))
    cert = check(text, ir, output_dir=tmp_path)
    assert cert["result"] == "EXACT"
    for ob in cert["obligations"]:
        s = z3.Solver()
        # Z3's native file API on Windows may not open a Unicode workspace path.
        # Replay the exact persisted UTF-8 bytes through its string API.
        s.add(z3.parse_smt2_string((tmp_path / ob["file"]).read_bytes().decode("utf-8")))
        assert s.check() == z3.unsat
    # Edited candidate is rechecked; stale "EXACT" text cannot authorize it.
    ir["code"][0]["has_write"] = False
    assert check(text, ir)["result"] == "REJECT"

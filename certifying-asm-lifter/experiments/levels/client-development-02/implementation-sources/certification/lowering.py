"""Interpret the ACTUAL LLVM replacement text independently of llvm_tso.emit.

The interpretation is for the pinned Dat3M TSO target, not generic LLVM
concurrency semantics. In particular, failed cmpxchg retains locked-read order.
"""
import json
import re
import z3
from frontend.gnu import Reject, initial_bindings, parse
from semantics.reference import execute as reference
from certification.interface import sha, VALUE


def check_fragment(source, width, fragment, llvm_bindings, output_bindings, timeout_ms=10000):
    cert = {"format": "llvm-fragment-certificate-v1", "result": "REJECT",
            "source_sha256": sha(source), "fragment_sha256": sha(fragment),
            "interface_sha256": sha(json.dumps([llvm_bindings, output_bindings], sort_keys=True)),
            "semantics": "fixed-Dat3M-TSO; not generic LLVM weak memory",
            "program_verdict_eligible": False, "obligations": []}

    def prove(name, prop):
        solver = z3.Solver()
        solver.set(timeout=timeout_ms)
        solver.add(z3.Not(prop))
        answer = solver.check()
        item = {"name": name, "result": str(answer), "smt2": solver.to_smt2()}
        if answer == z3.sat:
            item["countermodel"] = str(solver.model())
        if answer == z3.unknown:
            item["reason"] = solver.reason_unknown()
        cert["obligations"].append(item)
        if answer != z3.unsat:
            raise Reject("unproved " + name)

    try:
        block = parse(source, width)
        env, definitions = {}, set()
        substitution = []
        for name, (symbol, bits) in initial_bindings(block).items():
            operand = llvm_bindings[name]
            if not re.fullmatch(VALUE, operand):
                raise Reject("LLVM operand syntax")
            if re.fullmatch(r"-?\d+", operand):
                value = z3.BitVecVal(int(operand), bits)
            else:
                value = z3.BitVec("llvm-entry:" + operand, bits)
                if operand in env and env[operand].sort() != value.sort():
                    raise Reject("inconsistent operand type")
                env[operand] = value
            substitution.append((z3.BitVec(symbol, bits), value))

        def val(s, bits):
            if re.fullmatch(r"-?\d+", s):
                v = z3.BitVecVal(int(s), bits)
            else:
                if s not in env or isinstance(env[s], tuple):
                    raise Reject("undefined/aggregate LLVM operand " + s)
                v = env[s]
            if not z3.is_bv(v) or v.size() != bits:
                raise Reject("LLVM operand type mismatch")
            return v

        def define(name, value):
            if name in definitions or name in env:
                raise Reject("duplicate SSA definition")
            definitions.add(name)
            env[name] = value

        actual, read_index = [], 0
        ty = "i" + str(width)
        ptr = rf"(?:ptr|{ty}\*)"
        lhs = r"(%[-a-zA-Z$._0-9]+)"

        def fresh():
            nonlocal read_index
            u = z3.BitVec("u" + str(read_index), width)
            read_index += 1
            return u

        for raw in fragment.splitlines():
            line = re.sub(r",\s*!dbg\s*!\d+\s*$", "", raw.strip())
            if not line:
                continue
            m = re.fullmatch(rf"{lhs} = add {ty} ({VALUE}), ({VALUE})", line)
            if m:
                define(m[1], val(m[2], width) + val(m[3], width))
                continue
            m = re.fullmatch(rf"{lhs} = load atomic {ty}, {ptr} ({VALUE}) monotonic, align {width//8}", line)
            if m:
                addr, u = val(m[2], 64), fresh()
                actual.append(dict(kind="R", mode="tso", width=width, addr=addr, read=u))
                define(m[1], u)
                continue
            m = re.fullmatch(rf"store atomic {ty} ({VALUE}), {ptr} ({VALUE}) monotonic, align {width//8}", line)
            if m:
                actual.append(dict(kind="W", mode="tso", width=width,
                                   addr=val(m[2], 64), value=val(m[1], width)))
                continue
            m = re.fullmatch(rf"{lhs} = atomicrmw (add|xchg) {ptr} ({VALUE}), {ty} ({VALUE}) monotonic", line)
            if m:
                # All LLVM operands are evaluated before assigning the SSA result.
                addr, operand, u = val(m[3], 64), val(m[4], width), fresh()
                actual.append(dict(kind="RMW", mode="tso", width=width, addr=addr, read=u,
                                   has_write=z3.BoolVal(True),
                                   value=u + operand if m[2] == "add" else operand))
                define(m[1], u)
                continue
            m = re.fullmatch(rf"{lhs} = cmpxchg {ptr} ({VALUE}), {ty} ({VALUE}), {ty} ({VALUE}) monotonic monotonic", line)
            if m:
                addr, expected, desired = val(m[2], 64), val(m[3], width), val(m[4], width)
                u = fresh()
                actual.append(dict(kind="RMW", mode="tso", width=width, addr=addr, read=u,
                                   has_write=u == expected, value=desired))
                define(m[1], (u, u == expected))
                continue
            m = re.fullmatch(rf"{lhs} = extractvalue \{{{ty}, i1\}} (%[-a-zA-Z$._0-9]+), 0", line)
            if m:
                aggregate = env.get(m[2])
                if not isinstance(aggregate, tuple):
                    raise Reject("extractvalue is not a cmpxchg result")
                define(m[1], aggregate[0])
                continue
            if line == "fence seq_cst":
                actual.append(dict(kind="F", mode="sc", width=0))
                continue
            raise Reject("unrecognized actual LLVM instruction: " + line)
        expected, outputs, _ = reference(block)
        if len(expected) != len(actual):
            raise Reject("actual LLVM event count mismatch")

        def sub(v):
            return z3.substitute(v, *substitution) if substitution else v

        for i, (s, t) in enumerate(zip(expected, actual)):
            for k in ("kind", "mode", "width"):
                if s[k] != t[k]:
                    raise Reject(f"actual LLVM event {i} {k} mismatch")
            for k in ("addr", "read", "has_write", "value"):
                if k in s:
                    proposition = sub(s[k]) == t[k]
                    if k == "value" and s["kind"] == "RMW":
                        proposition = z3.Implies(sub(s["has_write"]), proposition)
                    prove(f"event-{i}-{k}", proposition)
        if set(outputs) != set(output_bindings):
            raise Reject("all source scalar outputs must be bound to actual LLVM results")
        for name, expected_value in outputs.items():
            prove("output-" + name, sub(expected_value) == val(output_bindings[name], width))
        cert.update(result="LLVM_FRAGMENT_EXACT", event_count=len(actual),
                    assumptions=["authenticated compiler interface",
                                 "no further LLVM optimization after replacement",
                                 "fixed Dat3M TSO interpretation", "valid aligned WB memory"])
    except (Reject, KeyError, TypeError, ValueError, z3.Z3Exception) as error:
        cert["reason"] = str(error)
    return cert

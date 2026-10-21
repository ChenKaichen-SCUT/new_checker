"""Trusted small instruction semantics. Does not import lifter or target evaluator."""
import re
import z3
from frontend.gnu import Reject, Operand, canonical_index, initial_bindings


def execute(block):
    w = block.width
    state = {k: z3.BitVec(n, width) for k, (n, width) in initial_bindings(block).items()}
    events, response, accesses = [], 0, []

    def val(op):
        if isinstance(op, int):
            return z3.BitVecVal(op, w)
        key = "o" + str(canonical_index(block, op))
        if op.kind == "m" or key not in state:
            raise Reject("uninitialized/non-register value " + op.var)
        return state[key]

    def setval(op, v):
        if not isinstance(op, Operand) or op.kind == "m":
            raise Reject("register destination required")
        dest = block.operands[canonical_index(block, op)]
        if not dest.output:
            raise Reject("write to input-only register")
        state[dest.var] = v

    def address(op):
        if not isinstance(op, Operand) or op.kind != "m":
            raise Reject("memory operand required")
        return state["p" + str(op.index)]

    def memory_permission(op, read=False, write=False):
        if read and not op.readable:
            raise Reject("read from write-only memory constraint")
        if write and not op.writable:
            raise Reject("write to input-only memory constraint")

    def fresh():
        nonlocal response
        u = z3.BitVec("u" + str(response), w)
        response += 1
        return u

    for line in block.instructions:
        reads, writes = set(), set()
        previous_events = len(events)
        if line in ("mfence", "sfence"):
            events.append({"kind": "F", "mode": "sc" if line == "mfence" else "sf",
                           "width": 0, "state_after": dict(state)})
            accesses.append((reads, writes))
            continue
        m = re.fullmatch(r"(lock\s+)?(mov|add|xchg|xadd|cmpxchg)([lq])\s+(.+)", line)
        if not m:
            raise Reject("unsupported instruction: " + line)
        locked, opcode, suffix, args = m.groups()
        if (32 if suffix == "l" else 64) != w:
            raise Reject("mixed/inconsistent data width")
        if bool(locked) != (opcode in ("xadd", "cmpxchg")):
            raise Reject("unsupported/missing lock")
        operands = args.split(",")
        if len(operands) != 2:
            raise Reject("two operands required")
        src, dst = map(block.token, operands)
        if not isinstance(dst, Operand):
            raise Reject("immediate destination")
        for o in (src, dst):
            if isinstance(o, Operand):
                reads.add(canonical_index(block, o))
        if opcode in ("add", "xadd", "cmpxchg") and "cc" not in block.clobbers:
            raise Reject("condition codes must be clobbered")
        if opcode == "mov":
            if isinstance(src, Operand) and src.kind == "m":
                memory_permission(src, read=True)
                if dst.kind == "m":
                    raise Reject("memory-to-memory mov unsupported")
                u = fresh()
                events.append({"kind": "R", "mode": "tso", "width": w, "addr": address(src), "read": u})
                setval(dst, u)
            elif dst.kind == "m":
                memory_permission(dst, write=True)
                events.append({"kind": "W", "mode": "tso", "width": w, "addr": address(dst), "value": val(src)})
            else:
                setval(dst, val(src))
            if dst.kind != "m":
                writes.add(canonical_index(block, dst))
        elif opcode == "add":
            if dst.kind == "m" or (isinstance(src, Operand) and src.kind == "m"):
                raise Reject("only register add")
            setval(dst, val(dst) + val(src))
            writes.add(canonical_index(block, dst))
        else:
            if opcode == "xchg" and isinstance(src, Operand) and src.kind == "m":
                src, dst = dst, src
            if not isinstance(src, Operand) or src.kind == "m" or dst.kind != "m":
                raise Reject("RMW requires register and memory")
            memory_permission(dst, read=True, write=True)
            operand = val(src)
            u = fresh()
            has = z3.BoolVal(True)
            if opcode == "xchg":
                new = operand
                setval(src, u)
                writes.add(canonical_index(block, src))
            elif opcode == "xadd":
                new = u + operand
                setval(src, u)
                writes.add(canonical_index(block, src))
            else:
                acc = [o for o in block.operands if o.kind == "a" and o.tie is None]
                if len(acc) != 1 or not acc[0].output:
                    raise Reject("cmpxchg requires one read-write/tied accumulator output")
                a = acc[0]
                expected = val(a)
                reads.add(a.index)
                has = u == expected
                new = operand
                # On success u==expected, so assigning u implements both paths.
                setval(a, u)
                writes.add(a.index)
            events.append({"kind": "RMW", "mode": "tso", "width": w,
                           "addr": address(dst), "read": u, "has_write": has, "value": new})
        accesses.append((reads, writes))
        if len(events) > previous_events:
            events[-1]["state_after"] = dict(state)
    # Conservative lifetime proof: every later explicit/address read counts.
    for i, (_, writes) in enumerate(accesses):
        future = set().union(*(r for r, _ in accesses[i + 1:])) if i + 1 < len(accesses) else set()
        for out in writes:
            op = block.operands[out]
            if "&" not in op.constraint:
                for j in future - {out}:
                    other = block.operands[j]
                    if other.kind == "m" or not other.output:
                        raise Reject("early-clobber needed before a later input/address read")
    outputs = {}
    for o in block.operands:
        if o.output and o.kind != "m":
            if o.var not in state:
                raise Reject("output never defined")
            outputs[o.var] = state[o.var]
    return events, outputs, state

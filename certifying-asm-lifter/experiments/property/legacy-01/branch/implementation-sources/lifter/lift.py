"""Untrusted candidate generator. It may be replaced without changing checker."""
import re
from frontend.gnu import Operand, Reject, canonical_index


def lift(block):
    code, next_temp = [], 0

    def term(o):
        return o if isinstance(o, int) else "o" + str(canonical_index(block, o))

    for line in block.instructions:
        if line in ("mfence", "sfence"):
            code.append({"op": "fence", "mode": {"mfence": "sc", "sfence": "sf"}[line]})
            continue
        match = re.fullmatch(r"(?:lock\s+)?([a-z]+)\s+(.+)", line)
        if not match:
            raise Reject("candidate parser cannot lift")
        mnemonic, rest = match.groups()
        opcode = mnemonic[:-1]
        args = rest.split(",")
        if len(args) != 2:
            raise Reject("candidate expects two operands")
        x, y = [block.token(v) for v in args]
        if not isinstance(y, Operand):
            raise Reject("candidate destination")
        if opcode == "mov":
            if isinstance(x, Operand) and x.kind == "m":
                code.append({"op": "read", "mode": "tso", "width": block.width,
                             "addr": "p" + str(x.index), "dest": term(y)})
            elif y.kind == "m":
                code.append({"op": "write", "mode": "tso", "width": block.width,
                             "addr": "p" + str(y.index), "value": term(x)})
            else:
                code.append({"op": "set", "dest": term(y), "value": term(x)})
        elif opcode == "add":
            code.append({"op": "set", "dest": term(y), "value": ["add", term(y), term(x)]})
        elif opcode in ("xchg", "xadd", "cmpxchg"):
            if opcode == "xchg" and isinstance(x, Operand) and x.kind == "m":
                x, y = y, x
            old = "tmp" + str(next_temp)
            next_temp += 1
            new = ["add", old, term(x)] if opcode == "xadd" else term(x)
            has = True
            out = term(x)
            if opcode == "cmpxchg":
                acc = [o for o in block.operands if o.kind == "a" and o.tie is None]
                if len(acc) != 1:
                    raise Reject("candidate accumulator")
                out = term(acc[0])
                has = ["eq", old, out]
            code.append({"op": "rmw", "mode": "tso", "width": block.width,
                         "addr": "p" + str(y.index), "old": old,
                         "value": new, "has_write": has})
            code.append({"op": "set", "dest": out, "value": old})
        else:
            raise Reject("candidate does not support " + mnemonic)
    return {"format": "event-ir-v1", "width": block.width,
            "compiler_barrier": "memory" in block.clobbers, "code": code}

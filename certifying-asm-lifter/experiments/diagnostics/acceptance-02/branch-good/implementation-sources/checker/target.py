"""Typed Event IR interpreter. Not an x86 instruction interpreter."""
import re
import z3
from frontend.gnu import Reject, initial_bindings


def execute(ir, block):
    if set(ir) != {"format", "width", "compiler_barrier", "code"} or ir["format"] != "event-ir-v1":
        raise Reject("bad IR envelope")
    if type(ir["compiler_barrier"]) is not bool or ir["compiler_barrier"] != ("memory" in block.clobbers):
        raise Reject("compiler barrier metadata mismatch")
    if ir["width"] != block.width or not isinstance(ir["code"], list):
        raise Reject("IR width/code mismatch")
    w = block.width
    env = {k: z3.BitVec(n, width) for k, (n, width) in initial_bindings(block).items()}
    events, read_index = [], 0

    def expr(t):
        if isinstance(t, bool):
            return z3.BoolVal(t)
        if isinstance(t, int):
            return z3.BitVecVal(t, w)
        if isinstance(t, str):
            if t not in env:
                raise Reject("undefined IR variable " + t)
            return env[t]
        if not isinstance(t, list) or not t:
            raise Reject("invalid expression")
        op, *xs = t
        ys = [expr(x) for x in xs]
        if op == "add" and len(ys) == 2:
            if not all(z3.is_bv(x) and x.size() == w for x in ys):
                raise Reject("add type")
            return ys[0] + ys[1]
        if op in ("eq", "ne") and len(ys) == 2 and ys[0].sort() == ys[1].sort():
            return (ys[0] == ys[1]) if op == "eq" else (ys[0] != ys[1])
        if op == "ite" and len(ys) == 3 and z3.is_bool(ys[0]) and ys[1].sort() == ys[2].sort():
            return z3.If(*ys)
        raise Reject("unsupported or ill-typed expression " + str(op))

    def bv(t, width):
        v = expr(t)
        if not z3.is_bv(v) or v.size() != width:
            raise Reject("bit-vector width mismatch")
        return v

    def assign(name, v):
        if not isinstance(name, str) or not re.fullmatch(r"(?:o\d+|tmp\d+)", name):
            raise Reject("invalid register identifier")
        if not z3.is_bv(v) or v.size() != w:
            raise Reject("register value type")
        env[name] = v

    schemas = {
        "set": {"op", "dest", "value"},
        "read": {"op", "mode", "width", "addr", "dest"},
        "write": {"op", "mode", "width", "addr", "value"},
        "rmw": {"op", "mode", "width", "addr", "old", "value", "has_write"},
        "fence": {"op", "mode"},
    }
    for stmt in ir["code"]:
        if not isinstance(stmt, dict):
            raise Reject("statement must be object")
        op = stmt.get("op")
        if op not in schemas or set(stmt) != schemas[op]:
            raise Reject("unsupported IR statement/schema")
        if op == "set":
            assign(stmt["dest"], bv(stmt["value"], w))
            continue
        if op == "fence":
            if stmt["mode"] not in ("sc", "sf"):
                raise Reject("fence mode")
            events.append({"kind": "F", "mode": stmt["mode"], "width": 0, "state_after": dict(env)})
            continue
        if stmt["mode"] not in ("tso", "rlx", "acq", "rel", "sc") or stmt["width"] != w:
            raise Reject("memory mode/width")
        addr = bv(stmt["addr"], 64)
        event = {"kind": {"read": "R", "write": "W", "rmw": "RMW"}[op],
                 "mode": stmt["mode"], "width": w, "addr": addr}
        if op in ("read", "rmw"):
            u = z3.BitVec("u" + str(read_index), w)
            read_index += 1
            event["read"] = u
            assign(stmt["dest"] if op == "read" else stmt["old"], u)
        if op == "write":
            event["value"] = bv(stmt["value"], w)
        if op == "rmw":
            has = expr(stmt["has_write"])
            if not z3.is_bool(has):
                raise Reject("RMW write predicate type")
            event["has_write"] = has
            event["value"] = bv(stmt["value"], w)
        event["state_after"] = dict(env)
        events.append(event)
    outputs = {}
    for o in block.operands:
        if o.output and o.kind != "m":
            if o.var not in env:
                raise Reject("target missing output")
            outputs[o.var] = env[o.var]
    return events, outputs, env

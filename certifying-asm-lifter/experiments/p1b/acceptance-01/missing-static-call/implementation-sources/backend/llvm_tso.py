"""Fail-closed lowering subset. Acceptance is separate from block equivalence.

RMW addresses use the entry state. has_write/value use the state AFTER binding
old to this event's fresh read. A pre-read LLVM operand must not mention old.
See docs/12-review-repair.md for the structural simulation argument.
"""
import re
from frontend.gnu import Reject


def emit(ir, bindings, prefix="lift"):
    if (set(ir) != {"format", "width", "compiler_barrier", "code"}
            or ir["format"] != "event-ir-v1" or ir["width"] not in (32, 64)
            or type(ir["compiler_barrier"]) is not bool or not isinstance(ir["code"], list)):
        raise Reject("adapter envelope")
    if not re.fullmatch(r"[-a-zA-Z$._][-a-zA-Z$._0-9]*", prefix):
        raise Reject("adapter SSA prefix")
    env, lines, counter = dict(bindings), [], 0
    if any(not isinstance(v, str) or not re.fullmatch(
            r"(?:[%@][-a-zA-Z$._0-9]+|-?\d+)", v) for v in env.values()):
        raise Reject("adapter binding is not an LLVM operand")
    used = set(env.values())
    w = ir["width"]
    ty = "i" + str(w)

    def new():
        nonlocal counter
        while True:
            name = "%" + prefix + str(counter)
            counter += 1
            if name not in used:
                break
        used.add(name)
        return name

    def value(t):
        if isinstance(t, bool):
            raise Reject("adapter expected integer, not boolean")
        if isinstance(t, int):
            return str(t % (1 << w))
        if isinstance(t, str):
            if t not in env:
                raise Reject("adapter unbound variable " + t)
            return env[t]
        if not isinstance(t, list) or not t:
            raise Reject("adapter expression")
        op, *xs = t
        if op == "add" and len(xs) == 2:
            a, b = map(value, xs)
            dest = new()
            lines.append(f"  {dest} = add {ty} {a}, {b}")
            return dest
        raise Reject("adapter pure expression unsupported")

    def depends(t, name):
        return t == name if isinstance(t, str) else (
            any(depends(x, name) for x in t[1:]) if isinstance(t, list) else False)

    def independent(t, old):
        if depends(t, old):
            raise Reject("adapter operand depends on this RMW read: " + old)
        return value(t)

    def register(name):
        if not isinstance(name, str) or not re.fullmatch(r"(?:o|tmp)\d+", name):
            raise Reject("adapter register identifier")

    schemas = {
        "set": {"op", "dest", "value"},
        "fence": {"op", "mode"},
        "read": {"op", "mode", "width", "addr", "dest"},
        "write": {"op", "mode", "width", "addr", "value"},
        "rmw": {"op", "mode", "width", "addr", "old", "has_write", "value"},
    }
    for s in ir["code"]:
        if not isinstance(s, dict) or s.get("op") not in schemas or set(s) != schemas[s["op"]]:
            raise Reject("adapter statement schema")
        op = s["op"]
        if op in ("read", "write", "rmw"):
            if s["mode"] != "tso" or s["width"] != w:
                raise Reject("adapter supports matching-width TSO events only")
            if not isinstance(s["addr"], str) or not re.fullmatch(r"p\d+", s["addr"]):
                raise Reject("adapter requires an address binding")
        if op == "set":
            register(s["dest"])
            env[s["dest"]] = value(s["value"])
        elif op == "fence":
            if s["mode"] == "sc":
                lines.append("  fence seq_cst")
            elif s["mode"] == "sf":
                raise Reject("fixed Dat3M LLVM asm lexer accepts mfence only; SF adapter unavailable")
            else:
                raise Reject("adapter fence")
        elif op == "read":
            register(s["dest"])
            dest = new()
            lines.append(f"  {dest} = load atomic {ty}, {ty}* {value(s['addr'])} monotonic, align {w//8}")
            env[s["dest"]] = dest
        elif op == "write":
            lines.append(f"  store atomic {ty} {value(s['value'])}, {ty}* {value(s['addr'])} monotonic, align {w//8}")
        elif op == "rmw":
            addr, old, has, v = value(s["addr"]), s["old"], s["has_write"], s["value"]
            register(old)
            dest = new()
            if (has is True and isinstance(v, list) and len(v) == 3 and v[0] == "add"
                    and (v[1] == old or v[2] == old)):
                delta = v[2] if v[1] == old else v[1]
                lines.append(f"  {dest} = atomicrmw add {ty}* {addr}, {ty} {independent(delta, old)} monotonic")
                env[old] = dest
            elif has is True:
                lines.append(f"  {dest} = atomicrmw xchg {ty}* {addr}, {ty} {independent(v, old)} monotonic")
                env[old] = dest
            elif (isinstance(has, list) and len(has) == 3 and has[0] == "eq"
                  and (has[1] == old or has[2] == old)):
                expected = has[2] if has[1] == old else has[1]
                expected = independent(expected, old)
                desired = independent(v, old)
                lines.append(f"  {dest} = cmpxchg {ty}* {addr}, {ty} {expected}, {ty} {desired} monotonic monotonic")
                oldval = new()
                lines.append(f"  {oldval} = extractvalue {{{ty}, i1}} {dest}, 0")
                env[old] = oldval
            else:
                raise Reject("adapter unsupported RMW update")
        else:
            raise Reject("adapter unsupported operation")
    return "\n".join(lines), env

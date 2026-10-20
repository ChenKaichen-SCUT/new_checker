"""Exploratory adapter for fixed LLVM/TSO harnesses, NOT a verified general backend."""
from frontend.gnu import Reject


def emit(ir, bindings, prefix="lift"):
    env, lines, counter = dict(bindings), [], 0
    w = ir["width"]
    ty = "i" + str(w)

    def new():
        nonlocal counter
        name = "%" + prefix + str(counter)
        counter += 1
        return name

    def value(t):
        if isinstance(t, bool):
            return "true" if t else "false"
        if isinstance(t, int):
            return str(t % (1 << w))
        if isinstance(t, str):
            if t not in env:
                raise Reject("adapter unbound variable " + t)
            return env[t]
        if not isinstance(t, list):
            raise Reject("adapter expression")
        op, *xs = t
        if op == "add" and len(xs) == 2:
            a, b = map(value, xs)
            dest = new()
            lines.append(f"  {dest} = add {ty} {a}, {b}")
            return dest
        raise Reject("adapter pure expression unsupported")

    for s in ir["code"]:
        op = s["op"]
        if op == "set":
            env[s["dest"]] = value(s["value"])
        elif op == "fence":
            if s["mode"] == "sc":
                lines.append("  fence seq_cst")
            elif s["mode"] == "sf":
                raise Reject("fixed Dat3M LLVM asm lexer accepts mfence only; SF adapter unavailable")
            else:
                raise Reject("adapter fence")
        elif op == "read":
            dest = new()
            lines.append(f"  {dest} = load atomic {ty}, {ty}* {value(s['addr'])} monotonic, align {w//8}")
            env[s["dest"]] = dest
        elif op == "write":
            lines.append(f"  store atomic {ty} {value(s['value'])}, {ty}* {value(s['addr'])} monotonic, align {w//8}")
        elif op == "rmw":
            addr, old, has, v = value(s["addr"]), s["old"], s["has_write"], s["value"]
            dest = new()
            if has is True and isinstance(v, list) and v[:2] == ["add", old] and len(v) == 3:
                lines.append(f"  {dest} = atomicrmw add {ty}* {addr}, {ty} {value(v[2])} monotonic")
                env[old] = dest
            elif has is True:
                lines.append(f"  {dest} = atomicrmw xchg {ty}* {addr}, {ty} {value(v)} monotonic")
                env[old] = dest
            elif isinstance(has, list) and has[:2] == ["eq", old] and len(has) == 3:
                lines.append(f"  {dest} = cmpxchg {ty}* {addr}, {ty} {value(has[2])}, {ty} {value(v)} monotonic monotonic")
                oldval = new()
                lines.append(f"  {oldval} = extractvalue {{{ty}, i1}} {dest}, 0")
                env[old] = oldval
            else:
                raise Reject("adapter unsupported RMW update")
        else:
            raise Reject("adapter unsupported operation")
    return "\n".join(lines), env

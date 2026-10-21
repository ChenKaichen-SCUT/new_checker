"""Independent straight-line assertion continuation checker (C-live).

Register discovery is a census of real reads/writes, never an SSA-name guess.
The selected projection still requires the region output proof.
"""
import re
import z3
from frontend.gnu import Reject
from certification.endpoints import type_of, SEMANTIC_TAGS, ALLOWED_OTHER_TAGS

SSA = r"%[-a-zA-Z$._0-9]+"
VALUE = rf"(?:{SSA}|-?\d+)"


def llvm_continuation(instructions, result_ssa, width, symbol):
    env = {result_ssa: symbol}
    assertions = []

    def value(text, bits):
        v = env[text] if text.startswith("%") else z3.BitVecVal(int(text), bits)
        if v.sort() != z3.BitVecSort(bits):
            raise Reject("LLVM continuation operand type mismatch")
        return v

    if not instructions or instructions[-1] != "ret ptr null":
        raise Reject("continuation requires a constant null return")
    for text in instructions[:-1]:
        m = re.fullmatch(rf"({SSA}) = icmp (eq|ne) i(32|64) ({VALUE}), ({VALUE})", text)
        if m:
            a, b = value(m[4], int(m[3])), value(m[5], int(m[3]))
            v = z3.If(a == b if m[2] == "eq" else a != b,
                      z3.BitVecVal(1, 1), z3.BitVecVal(0, 1))
        else:
            m = re.fullmatch(rf"({SSA}) = zext i1 ({SSA}) to i32", text)
            if m:
                v = z3.ZeroExt(31, value(m[2], 1))
            else:
                a = re.fullmatch(rf"(?:tail )?call void @__VERIFIER_assert"
                                 rf"\(i32 (?:noundef )?({VALUE})\)(?: #\d+)?", text)
                if not a:
                    raise Reject("unsupported LLVM continuation instruction: " + text)
                assertions.append(value(a[1], 32) != 0)
                continue
        if m[1] in env:
            raise Reject("duplicate LLVM continuation definition")
        env[m[1]] = v
    return assertions


def core_expr(x, env):
    ty = type_of(x["type"])
    k = x["kind"]
    if not x.get("complete"):
        raise Reject("incomplete actual expression")
    if k == "register":
        v = env[x["name"]]
    elif k == "int" and z3.is_bv_sort(ty):
        v = z3.BitVecVal(int(x["value"]), ty.size())
    elif k == "bool" and type(x["value"]) is bool:
        v = z3.BoolVal(x["value"])
    else:
        a = [core_expr(y, env) for y in x.get("args", [])]
        if k == "EQ" and len(a) == 2:
            v = a[0] == a[1]
        elif k == "NEQ" and len(a) == 2:
            v = a[0] != a[1]
        elif k == "NOT" and len(a) == 1:
            v = z3.Not(a[0])
        elif k == "AND" and len(a) == 2:
            v = a[0] & a[1]
        elif k == "BV_EXTRACT" and len(a) == 1:
            v = z3.Extract(x["high_bit"], x["low_bit"], a[0])
        else:
            raise Reject("unsupported actual continuation expression " + k)
    if v.sort() != ty:
        raise Reject("actual continuation expression type mismatch")
    return v


def automatic_projection(events, lo, hi, interface, live):
    assigned = {e["writes"]["name"]: e["writes"]["type"]
                for e in events[lo:hi + 1] if e["writes"]}
    outside = {r["name"] for e in events[:lo] + events[hi + 1:] for r in e["reads"]}
    required = set(assigned) & outside
    if (live and len(required) != 1) or (not live and required):
        raise Reject("automatic projection requires exactly one live output or no dead outputs")
    if not live:
        return {}
    name = next(iter(required))
    if assigned[name] != f'bv{interface["width"]}':
        raise Reject("automatic live register has wrong type")
    return {"o" + str(interface["register_output"]): name}


def check_continuation(instructions, interface, thread, lo, hi, projection, timeout_ms=10000):
    result = {"result": "REJECT", "obligations": [], "program_verdict_eligible": False,
              "projection_discovery": "actual region writes intersect all outside reads",
              "projection": projection, "llvm_result": interface["result_ssa"]}

    def query(name, formula, expected="unsat"):
        s = z3.Solver()
        s.set(timeout=timeout_ms)
        s.add(formula)
        answer = str(s.check())
        item = {"name": name, "result": answer, "expected": expected, "smt2": s.to_smt2()}
        if answer == "sat":
            item["model"] = str(s.model())
        if answer == "unknown":
            item["reason"] = s.reason_unknown()
        result["obligations"].append(item)
        if answer != expected:
            raise Reject("unproved continuation condition " + name)

    try:
        events = thread["events"]
        prefix, suffix = events[:lo], events[hi + 1:]
        if [e["class"] for e in prefix] != ["ThreadStart", "Load", "Assume", "ThreadArgument"]:
            raise Reject("unsupported actual worker prefix")
        if len(suffix) < 4 or [e["class"] for e in suffix[-4:]] != [
                "Load", "RMWStore", "ThreadReturn", "Label"]:
            raise Reject("unsupported actual worker completion suffix")
        start, pread, assume, arg = prefix
        cread, cwrite, ret, label = suffix[-4:]
        runtime_name = f'__com_{thread["name"]}#{thread["id"]}'
        for e in prefix + suffix:
            if not e.get("complete") or not e["cf_implies_exec"] or "jump" in e:
                raise Reject("unsupported outside-region event/control")
            if set(e["tags"]) - SEMANTIC_TAGS - ALLOWED_OTHER_TAGS:
                raise Reject("unknown outside-region tag")
        if (arg["creator"] != start["creator"] or arg["argument_index"] != 0
                or start["reads"] or start["writes"] or arg["reads"]):
            raise Reject("unexpected runtime argument/start")
        for e, tags in [(pread, {"M", "R"}), (cread, {"M", "R", "A", "RMW"}),
                        (cwrite, {"M", "W", "A", "RMW"})]:
            if (e.get("source") or e["width"] != 2 or e["addr"]["kind"] != "object"
                    or e["addr"]["name"] != runtime_name or set(e["tags"]) & SEMANTIC_TAGS != tags):
                raise Reject("unsupported runtime memory operation")
        if cwrite["rmw_load"] != cread["id"]:
            raise Reject("runtime completion pair mismatch")
        env = {}
        for e in events:
            for r in e["reads"] + ([e["writes"]] if e["writes"] else []):
                if r["name"] in env and env[r["name"]].sort() != type_of(r["type"]):
                    raise Reject("actual register type conflict")
                env[r["name"]] = z3.Const("context:" + r["name"], type_of(r["type"]))
        for e in (pread, cread):
            if type_of(e["writes"]["type"]) != z3.BitVecSort(2) or e["reads"]:
                raise Reject("runtime read shape mismatch")
        pval = env[pread["writes"]["name"]]
        cval = env[cread["writes"]["name"]]
        query("runtime-start-condition",
              core_expr(assume["condition"], env) != (z3.Extract(0, 0, pval) != 0))
        query("runtime-completion-value",
              core_expr(cwrite["value"], env) != (cval & z3.BitVecVal(2, 2)))
        if (ret["return_value"]["kind"] != "int" or ret["return_value"]["type"] != "bv64"
                or int(ret["return_value"]["value"]) != 0 or label["successor"] is not None):
            raise Reject("unsupported return/exit")
        # Every pure event's tag shape is checked, including ignored annotations.
        for e in prefix + suffix:
            if e["class"] not in {"Load", "RMWStore"} and set(e["tags"]) & SEMANTIC_TAGS:
                raise Reject("outside pure event has semantic memory tags")
        z = z3.BitVec("llvm-live-result", interface["width"])
        expected = llvm_continuation(instructions, interface["result_ssa"], interface["width"], z)
        if bool(expected) != bool(projection):
            raise Reject("live source continuation / actual projection disagree")
        for name in projection.values():
            env[name] = z
        actual, assertion_ids = [], []
        for e in suffix[:-4]:
            if e["class"] == "Local":
                v = core_expr(e["expr"], env)
                if v.sort() != type_of(e["writes"]["type"]):
                    raise Reject("continuation Local result type mismatch")
                env[e["writes"]["name"]] = v
            elif e["class"] == "Assert":
                v = core_expr(e["condition"], env)
                if not z3.is_bool(v) or e["writes"]:
                    raise Reject("malformed actual assertion")
                actual.append(v)
                assertion_ids.append(e["id"])
            elif e["class"] == "StringAnnotation" and not e["reads"] and not e["writes"]:
                pass
            else:
                raise Reject("unconsumed actual continuation event " + e["class"])
        if len(expected) != len(actual):
            raise Reject("source/actual continuation assertion count mismatch")
        for i, (s, t) in enumerate(zip(expected, actual)):
            query(f"assertion-{i}-condition", s != t)
        if expected:
            z2 = z3.BitVec("different-live-result", interface["width"])
            query("source-output-really-influences-assertion",
                  z3.Or(*(s != z3.substitute(s, (z, z2)) for s in expected)), "sat")
        result.update(result="CONTINUATION_EXACT", assertion_events=assertion_ids,
                      assertion_count=len(actual), live_output=bool(expected))
    except (Reject, KeyError, TypeError, ValueError, z3.Z3Exception) as error:
        result["reason"] = str(error)
    return result

"""Independent symbolic checker for a CLOSED region of a Dat3M object snapshot.

This is a local API, not an end-to-end verdict authorization API. A caller must
authenticate the snapshot and discharge interface/instance-coverage obligations.
Unknown classes, expression forms, tags, control flow and solver results reject.
"""
import hashlib
import json
import re
import z3
from frontend.gnu import Reject, initial_bindings, parse
from semantics.reference import execute as reference

SEMANTIC_TAGS = {"R", "W", "M", "A", "RMW", "F", "mfence", "IW"}
ALLOWED_OTHER_TAGS = {"_", "__NOOPT", "__NO_INSTRUCTION", "__NO_CARRY_DEPS"}


def digest(obj):
    return hashlib.sha256(json.dumps(obj, sort_keys=True, separators=(",", ":")).encode()).hexdigest()


def type_of(name):
    if name == "bool":
        return z3.BoolSort()
    m = re.fullmatch(r"bv(\d+)", name)
    if not m or not 1 <= int(m[1]) <= 64:
        raise Reject("unsupported exported type " + str(name))
    return z3.BitVecSort(int(m[1]))


def check_region(source, width, snapshot, thread_id, first, last, llvm_bindings,
                 output_registers, timeout_ms=10000):
    """first..last is an inclusive interval in the actual thread event list.

llvm_bindings maps source slots to *actual* typed LLVM operands, obtained by
interface.py. output_registers maps source output slots to actual core registers.
The mappings are theorem parameters of this local API, not trusted user claims.
"""
    cert = {"format": "dat3m-region-certificate-v1", "result": "REJECT",
            "snapshot_sha256": digest(snapshot), "source_sha256": digest(source),
            "interface_parameters_sha256": digest([llvm_bindings, output_registers]),
            "scope": "closed-region-under-authenticated-interface",
            "program_verdict_eligible": False, "obligations": []}

    def prove(name, proposition):
        solver = z3.Solver()
        solver.set(timeout=timeout_ms)
        solver.add(z3.Not(proposition))
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
        if snapshot["format"] != "dat3m-core-snapshot-v1" or snapshot["arch"] != "TSO":
            raise Reject("snapshot format/target")
        threads = [t for t in snapshot["threads"] if t["id"] == thread_id]
        if len(threads) != 1:
            raise Reject("thread identity")
        all_events = threads[0]["events"]
        ids = [e["id"] for e in all_events]
        if len(set(ids)) != len(ids) or first not in ids or last not in ids:
            raise Reject("event identity")
        for i, event in enumerate(all_events):
            successor = ids[i + 1] if i + 1 < len(ids) else None
            if event["successor"] != successor:
                raise Reject("actual event list/successor chain disagreement")
        lo, hi = ids.index(first), ids.index(last)
        if lo > hi or hi + 1 >= len(ids):
            raise Reject("region requires a distinct successor exit")
        region = all_events[lo:hi + 1]
        exit_id = ids[hi + 1]
        inside = {e["id"] for e in region}

        def edges(event):
            xs = [event["successor"]] if event["successor"] is not None else []
            if "jump" in event:
                xs.append(event["jump"])
            return set(xs)

        for e in all_events:
            if e["id"] not in inside and (edges(e) & inside) - {first}:
                raise Reject("external jump enters middle of region")
        rank = {e["id"]: i for i, e in enumerate(region)}
        for e in region:
            if not e["cf_implies_exec"]:
                raise Reject("conditional-execution event unsupported")
            if not edges(e) or not edges(e) <= inside | {exit_id}:
                raise Reject("early/unknown region exit")
            if any(rank[d] <= rank[e["id"]] for d in edges(e) if d in inside):
                raise Reject("region is not a forward acyclic CFG")
            if e["class"] not in {"Load", "Store", "RMWStore", "Local", "CondJump", "Label"}:
                raise Reject("unsupported core class " + e["class"])
            if set(e["tags"]) - SEMANTIC_TAGS - ALLOWED_OTHER_TAGS:
                raise Reject("uninterpreted event tag")
            if e["class"] in {"Local", "CondJump", "Label"} and set(e["tags"]) & SEMANTIC_TAGS:
                raise Reject("pure/control node carries semantic memory tag")

        sorts = {}
        for e in all_events:
            for r in e["reads"] + ([e["writes"]] if e["writes"] else []):
                sort = type_of(r["type"])
                if r["name"] in sorts and sorts[r["name"]] != sort:
                    raise Reject("register type disagreement")
                sorts[r["name"]] = sort
        entry = {name: z3.Const("entry:" + name, sort) for name, sort in sorts.items()}
        all_regs = set(entry)

        def llvm_value(operand, bits):
            if re.fullmatch(r"-?\d+", operand):
                return z3.BitVecVal(int(operand), bits)
            if operand.startswith("@") and bits == 64:
                return z3.BitVec("object:" + operand[1:], 64)
            if operand.startswith("%"):
                name = "r" + operand[1:]
                if name not in entry or entry[name].sort() != z3.BitVecSort(bits):
                    raise Reject("LLVM live-in not preserved by backend; needs binding proof")
                return entry[name]
            raise Reject("unsupported actual LLVM binding")

        block = parse(source, width)
        substitutions = []
        for slot, (symbol, bits) in initial_bindings(block).items():
            if slot not in llvm_bindings:
                raise Reject("missing authenticated source operand")
            substitutions.append((z3.BitVec(symbol, bits), llvm_value(llvm_bindings[slot], bits)))

        def sub(x):
            return z3.substitute(x, *substitutions) if substitutions else x

        se, so, _ = reference(block)
        expected, expected_pairs = [], set()
        for e in se:
            if e["kind"] == "F":
                raise Reject("region implementation presently accepts memory events only")
            base = {"width": width, "addr": sub(e["addr"]), "guard": z3.BoolVal(True)}
            if e["kind"] in {"R", "RMW"}:
                ri = len(expected)
                expected.append({**base, "kind": "R", "atomic": e["kind"] == "RMW", "read": e["read"]})
            if e["kind"] in {"W", "RMW"}:
                wi = len(expected)
                expected.append({**base, "kind": "W", "atomic": e["kind"] == "RMW",
                                 "guard": sub(e["has_write"]) if e["kind"] == "RMW" else z3.BoolVal(True),
                                 "value": sub(e["value"])})
                if e["kind"] == "RMW":
                    expected_pairs.add((ri, wi))

        def expr(x, state):
            kind = x["kind"]
            ty = type_of(x["type"])
            if kind == "register":
                value = state[x["name"]]
            elif kind == "int":
                value = z3.BitVecVal(int(x["value"]), ty.size())
            elif kind == "bool":
                if type(x["value"]) is not bool:
                    raise Reject("bad boolean literal")
                value = z3.BoolVal(x["value"])
            elif kind == "object":
                value = z3.BitVec("object:" + x["name"], 64)
            else:
                args = [expr(a, state) for a in x.get("args", [])]
                if kind == "ADD" and len(args) == 2:
                    value = args[0] + args[1]
                elif kind == "EQ" and len(args) == 2:
                    value = args[0] == args[1]
                elif kind == "NEQ" and len(args) == 2:
                    value = args[0] != args[1]
                elif kind == "NOT" and len(args) == 1:
                    value = z3.Not(args[0])
                else:
                    raise Reject("unsupported exported expression " + kind)
            if value.sort() != ty:
                raise Reject("exported expression type mismatch")
            return value

        incoming = {first: [(z3.BoolVal(True), dict(entry))]}
        actual, actual_pairs, event_positions = [], set(), {}
        read_index = 0

        def merge(event_id):
            predecessors = incoming.get(event_id, [])
            if not predecessors:
                raise Reject("unreachable retained core node")
            for i, (g, _) in enumerate(predecessors):
                for h, _ in predecessors[:i]:
                    prove(f"merge-{event_id}-{i}", z3.Not(z3.And(g, h)))
            guard = z3.Or(*(g for g, _ in predecessors))
            state = {}
            for name in all_regs:
                value = entry[name]
                for g, env in predecessors:
                    value = z3.If(g, env[name], value)
                state[name] = value
            return guard, state

        for e in region:
            guard, state = merge(e["id"])
            cls = e["class"]
            if cls == "Local":
                value = expr(e["expr"], state)
                if value.sort() != type_of(e["writes"]["type"]):
                    raise Reject("Local result type mismatch")
                state[e["writes"]["name"]] = value
            elif cls in {"Load", "Store", "RMWStore"}:
                tags = set(e["tags"])
                is_read = cls == "Load"
                necessary = {"M", "R" if is_read else "W"}
                allowed = necessary | ({"RMW", "A"} if "RMW" in tags or "A" in tags else set())
                if (tags & SEMANTIC_TAGS) != allowed or not necessary <= tags:
                    raise Reject("inconsistent endpoint tags")
                if ("A" in tags) != ("RMW" in tags):
                    raise Reject("atomic endpoint lost RMW/A identity")
                p = {"guard": guard, "kind": "R" if is_read else "W",
                     "atomic": "A" in tags, "addr": expr(e["addr"], state), "width": e["width"]}
                if not z3.is_bv(p["addr"]) or p["addr"].size() != 64 or p["width"] != width:
                    raise Reject("address/data width")
                event_positions[e["id"]] = len(actual)
                if is_read:
                    u = z3.BitVec("u" + str(read_index), width)
                    read_index += 1
                    if type_of(e["writes"]["type"]) != u.sort():
                        raise Reject("Load result type mismatch")
                    p["read"] = u
                    state[e["writes"]["name"]] = u
                else:
                    p["value"] = expr(e["value"], state)
                    if p["value"].sort() != z3.BitVecSort(width):
                        raise Reject("store value width")
                    if cls == "RMWStore":
                        load = e["rmw_load"]
                        if load not in event_positions or not actual[event_positions[load]]["atomic"]:
                            raise Reject("RMWStore points outside paired read")
                        actual_pairs.add((event_positions[load], len(actual)))
                    elif p["atomic"]:
                        raise Reject("atomic store is not a real RMWStore")
                actual.append(p)
            if cls == "CondJump":
                cond = expr(e["guard"], state)
                if not z3.is_bool(cond):
                    raise Reject("jump guard type")
                outgoing = [(e["jump"], z3.And(guard, cond)),
                            (e["successor"], z3.And(guard, z3.Not(cond)))]
            else:
                outgoing = [(e["successor"], guard)]
            for dest, g in outgoing:
                incoming.setdefault(dest, []).append((g, dict(state)))
        exit_guard, final = merge(exit_id)
        prove("total-exit", exit_guard)
        cert["endpoint_counts"] = {"source": len(expected), "actual": len(actual)}
        if len(expected) != len(actual):
            raise Reject("endpoint count mismatch")
        static_errors = []
        for i, (s, t) in enumerate(zip(expected, actual)):
            for key in ("kind", "atomic", "width"):
                if s[key] != t[key]:
                    static_errors.append(f"endpoint {i}: {key} mismatch")
        if expected_pairs != actual_pairs:
            static_errors.append("real rmw relation mismatch")
        cert["static_endpoint_checks"] = {
            "source_rmw": sorted(expected_pairs), "actual_rmw": sorted(actual_pairs),
            "source_atomic": [e["atomic"] for e in expected],
            "actual_atomic": [e["atomic"] for e in actual], "errors": static_errors}
        if static_errors:
            raise Reject("; ".join(static_errors))
        for i, (s, t) in enumerate(zip(expected, actual)):
            prove(f"endpoint-{i}-presence", s["guard"] == t["guard"])
            for key in ("addr", "read", "value"):
                if key in s:
                    prove(f"endpoint-{i}-{key}", z3.Implies(s["guard"], s[key] == t[key]))
        assigned = {e["writes"]["name"] for e in region if e["writes"]}
        # Conservative live-out: all reads outside the region, including reads
        # preceding it. This may reject safe programs but cannot miss a future use.
        external_reads = {r["name"] for e in all_events if e["id"] not in inside for r in e["reads"]}
        required = assigned & external_reads
        if required - set(output_registers.values()):
            raise Reject("region writes an unaccounted host-live register")
        if set(output_registers) - set(so):
            raise Reject("unknown source output mapping")
        for source_name, target_name in output_registers.items():
            if target_name not in final:
                raise Reject("missing actual output register")
            prove("output-" + source_name, sub(so[source_name]) == final[target_name])
        cert.update(result="REGION_EXACT", endpoint_count=len(actual),
                    rmw_pairs=sorted(actual_pairs), thread=thread_id,
                    first=first, last=last, exit=exit_id,
                    output_projection=output_registers)
    except (Reject, KeyError, TypeError, ValueError, z3.Z3Exception) as error:
        cert["reason"] = str(error)
    return cert

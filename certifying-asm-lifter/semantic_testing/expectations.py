"""Finite-set properties and evidence. Never aliases the legacy SAFE labels."""
from .dsl import canonical, require
from .witness import verify


def expected(p, result):
    require(result["status"] == "COMPLETE", "EXPECTATION_REQUIRES_COMPLETE")
    observations = {canonical(o) for o in result["observations"]}
    actual = {canonical(verify(p, c)["observation"]) for c in result["graphs"]}
    require(observations == actual and bool(actual), "OBSERVATION_SET_BINDING")
    first = min(observations)
    index = next(i for i, c in enumerate(result["graphs"]) if canonical(c["observation"]) == first)
    return {"scope": "DSL_TERMINAL_ONLY", "safe": {"formula": "observation in finite allowed table", "allowed": result["observations"],
             "verdict": "DSL_EXPECTED_SAFE", "completeness": "all path final UNSAT + explicit A when supported"},
            "unsafe": {"formula": "observation != excluded tuple", "excluded": result["graphs"][index]["observation"],
                       "verdict": "DSL_EXPECTED_UNSAFE", "violating_graph": index}}


def relation(p, rp, q, rq):
    from .dsl import validate
    pv, qv = validate(p), validate(q)
    require(p["inputs"] == q["inputs"] and canonical(p["domain"]) == canonical(q["domain"]), "RELATION_INPUT_DOMAIN")
    require(p["observe"]["objects"] == q["observe"]["objects"] and pv["terminal_types"] == qv["terminal_types"], "RELATION_OBSERVATION_INTERFACE")
    if rp["status"] != "COMPLETE" or rq["status"] != "COMPLETE": return {"status": "UNKNOWN"}
    left = {canonical(o) for o in rp["observations"]}; right = {canonical(o) for o in rq["observations"]}
    if left == right: return {"status": "EQ_OBS", "observations": len(left)}
    side, difference, res, prog = ("source", left - right, rp, p) if left - right else ("target", right - left, rq, q)
    value = min(difference); i = next(i for i, c in enumerate(res["graphs"]) if canonical(c["observation"]) == value)
    verify(prog, res["graphs"][i])
    return {"status": "OBSERVATION_DIFFERENCE_DSL", "side": side, "graph": i, "observation": res["graphs"][i]["observation"],
            "other_side_exclusion": "absent from complete observation table; retain all path UNSAT and explicit A audit"}


def reachable(p, result, read, val):
    for i, c in enumerate(result["graphs"]):
        verify(p, c)
        if c["core"]["reads"].get(read) == val:
            return {"status": "REACHABLE_DSL", "read": read, "value": val, "graph": i}
    return {"status": "UNREACHABLE_OPEN_ASSIGNMENT" if result["status"] == "COMPLETE" else "UNKNOWN", "read": read, "value": val}

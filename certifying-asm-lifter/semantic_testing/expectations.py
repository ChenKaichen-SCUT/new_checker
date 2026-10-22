"""Finite-set properties and evidence. Never aliases the legacy SAFE labels."""
from .dsl import CAT, FENCES, canonical, digest, require
from .witness import verify


def exact_guard(p, result):
    """Do not trust candidate COMPLETE. Re-enumerate from original DSL using A.

    This release certifies completeness only in A's declared subset. B candidates
    outside it remain solver-backed candidates, not independently certified sets.
    """
    require(result["status"] == "COMPLETE", "EXPECTATION_REQUIRES_COMPLETE")
    require(result["version"] == "oracle-B-1" and result["model"] == [CAT, FENCES], "EXACT_MODEL_BINDING")
    require(result["program_sha256"] == digest(p), "EXACT_PROGRAM_BINDING")
    observations = {canonical(o) for o in result["observations"]}
    actual = {canonical(verify(p, c)["observation"]) for c in result["graphs"]}
    require(observations == actual and bool(actual), "OBSERVATION_SET_BINDING")
    from .exhaustive import compare
    audit = compare(p, result)
    require(audit["status"] == "AGREEMENT", "INDEPENDENT_COMPLETENESS_NOT_ESTABLISHED:" + audit["status"])
    return observations


def expected(p, result):
    observations = exact_guard(p, result)
    first = min(observations)
    index = next(i for i, c in enumerate(result["graphs"]) if canonical(c["observation"]) == first)
    return {"scope": "DSL_TERMINAL_ONLY", "safe": {"formula": "observation in finite allowed table", "allowed": result["observations"],
             "verdict": "DSL_EXPECTED_SAFE", "completeness": "explicit A reconstructed full graph set equality; final SMT UNSAT retained separately"},
            "unsafe": {"formula": "observation != excluded tuple", "excluded": result["graphs"][index]["observation"],
                       "verdict": "DSL_EXPECTED_UNSAFE", "violating_graph": index}}


def relation(p, rp, q, rq):
    from .dsl import validate
    pv, qv = validate(p), validate(q)
    require(p["inputs"] == q["inputs"] and canonical(p["domain"]) == canonical(q["domain"]), "RELATION_INPUT_DOMAIN")
    require(p["observe"]["objects"] == q["observe"]["objects"] and pv["terminal_types"] == qv["terminal_types"], "RELATION_OBSERVATION_INTERFACE")
    if rp["status"] != "COMPLETE" or rq["status"] != "COMPLETE": return {"status": "UNKNOWN"}
    left = exact_guard(p, rp); right = exact_guard(q, rq)
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
    complete = False
    if result["status"] == "COMPLETE":
        from .dsl import Invalid
        try: exact_guard(p, result); complete = True
        except Invalid: pass
    return {"status": "UNREACHABLE_OPEN_ASSIGNMENT" if complete else "UNKNOWN", "read": read, "value": val}

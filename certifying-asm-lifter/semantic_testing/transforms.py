"""Untrusted constructors plus separate syntactic side-condition verification.

Minimal rule subset: one FAA per arm, common destination, no arm temporaries.
General diamond/live-output inference is not claimed.
"""
import copy
from .dsl import canonical, digest, require, validate, walk


def locate(p, site):
    found = []
    def visit(seq):
        for i, n in enumerate(seq):
            if n["id"] == site: found.append((seq, i))
            if n["op"] == "if": visit(n["then"]); visit(n["else"])
    for t in p["threads"]: visit(t)
    require(len(found) == 1, "TRANSFORM_SITE")
    return found[0]


def merge(p, site, new_id):
    q = copy.deepcopy(p); seq, i = locate(q, site); n = seq[i]
    a, b = n["then"][0], n["else"][0]
    seq[i] = dict(id=new_id, op="faa", obj=a["obj"], dst=a["dst"], value=["ite", n["guard"], a["value"], b["value"]])
    return q, {"rule": "FAA_DIAMOND", "source_site": site, "target_site": new_id}


def duplicate(p, site, branch_id, left_id, right_id):
    q = copy.deepcopy(p); seq, i = locate(q, site); n = seq[i]
    require(type(n["value"]) is list and n["value"][0] == "ite", "DUPLICATE_ITE")
    _, g, a, b = n["value"]
    left, right = dict(n), dict(n)
    left.update(id=left_id, value=a); right.update(id=right_id, value=b)
    seq[i] = dict(id=branch_id, op="if", guard=g, then=[left], **{"else": [right]})
    return q, {"rule": "FAA_DUPLICATE", "source_site": site, "target_site": branch_id}


def pure_add_zero(p, site):
    q = copy.deepcopy(p); seq, i = locate(q, site)
    seq[i]["value"] = ["add", seq[i]["value"], 0]
    return q, {"rule": "PURE_ADD_ZERO", "source_site": site, "target_site": site}


def rename(p, thread, old, new):
    q = copy.deepcopy(p)
    def expr(e):
        if type(e) is str: return new if e == old else e
        if type(e) is list: return [e[0]] + [expr(v) for v in e[1:]]
        return e
    for n in walk(q["threads"][thread]):
        if n.get("dst") == old: n["dst"] = new
        for field in ("value", "guard"):
            if field in n: n[field] = expr(n[field])
    q["observe"]["locals"][thread] = [new if v == old else v for v in q["observe"]["locals"][thread]]
    return q, {"rule": "ALPHA", "thread": thread, "old": old, "new": new}


def verify_rule(p, q, claim):
    validate(p); validate(q)
    rule = claim["rule"]
    if rule == "FAA_DUPLICATE":
        # Verify inverse equation, not a sample of branch observations.
        inverse = verify_rule(q, p, {"rule": "FAA_DIAMOND", "source_site": claim["target_site"], "target_site": claim["source_site"]})
        return {"status": "RULE_VERIFIED", "rule": rule, "source_sha256": digest(p), "target_sha256": digest(q),
                "strength": "BIDIRECTIONAL_ACTIVE_GRAPH_TRANSPORT", "scope": "finite-tso-1", "inverse_check": inverse}
    if rule in ("FAA_DIAMOND", "PURE_ADD_ZERO"):
        a, b = copy.deepcopy(p), copy.deepcopy(q)
        sa, ia = locate(a, claim["source_site"]); sb, ib = locate(b, claim["target_site"])
        left, right = sa[ia], sb[ib]
        if rule == "FAA_DIAMOND":
            require(left["op"] == "if" and len(left["then"]) == len(left["else"]) == 1, "DIAMOND_COMPLETE_ARMS")
            x, y = left["then"][0], left["else"][0]
            require(x["op"] == y["op"] == right["op"] == "faa", "DIAMOND_ONLY_FAA")
            require(x["obj"] == y["obj"] == right["obj"] and x["dst"] == y["dst"] == right["dst"], "DIAMOND_INTERFACE")
            require(canonical(right["value"]) == canonical(["ite", left["guard"], x["value"], y["value"]]), "DIAMOND_GUARD_OPERANDS")
            # Validation of q checks both ITE arms in the common PRE-state.
        else:
            require("value" in left and "value" in right, "PURE_POSITION")
            expected = dict(left); expected["value"] = ["add", left["value"], 0]
            require(canonical(expected) == canonical(right), "PURE_UNIVERSAL_IDENTITY")
        sa[ia] = {"hole": True}; sb[ib] = {"hole": True}
        require(canonical(a) == canonical(b), "UNCHANGED_CONTEXT")
    elif rule == "ALPHA":
        t, old, new = claim["thread"], claim["old"], claim["new"]
        require(type(t) is int and 0 <= t < len(p["threads"]), "ALPHA_THREAD")
        names = set(p["inputs"]) | {n["dst"] for n in walk(p["threads"][t]) if "dst" in n}
        require(old in names and old not in p["inputs"] and new not in names, "ALPHA_CAPTURE")
        a, b = copy.deepcopy(p), copy.deepcopy(q)
        # Normalize the proposed target BACK to source, checking all definitions/uses.
        def backwards(e):
            if type(e) is str: return old if e == new else e
            if type(e) is list: return [e[0]] + [backwards(v) for v in e[1:]]
            return e
        for n in walk(b["threads"][t]):
            if n.get("dst") == new: n["dst"] = old
            for key in ("value", "guard"):
                if key in n: n[key] = backwards(n[key])
        b["observe"]["locals"][t] = [old if v == new else v for v in b["observe"]["locals"][t]]
        require(canonical(a) == canonical(b), "ALPHA_COMPLETE_RENAME")
        # Ensure EVERY old occurrence was replaced, not an identity masquerading as rename.
        require(all(n.get("dst") != old for n in walk(q["threads"][t])), "ALPHA_LEFT_OLD_DEFINITION")
    else:
        raise ValueError("UNSUPPORTED_RULE")
    return {"status": "RULE_VERIFIED", "rule": rule, "source_sha256": digest(p), "target_sha256": digest(q),
            "strength": "BIDIRECTIONAL_ACTIVE_GRAPH_TRANSPORT", "scope": "finite-tso-1"}

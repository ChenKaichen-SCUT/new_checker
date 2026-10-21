"""Structural host checks for the authorized input; NOT a host compiler proof."""
import re
from frontend.gnu import Reject


def check_host_objects(module, interface, snapshot, coverage):
    """Reconcile global initialization and thread boundaries with actual objects.

    Pthread scheduling, joins, assertion encoding, and ordinary host optimization
    remain the declared Dat3M TCB. This check does not infer them from PASS.
    """
    result = {"result": "REJECT", "program_verdict_eligible": False}
    try:
        if coverage["result"] != "SUPPORTED_WORKERS_EXACT":
            raise Reject("host checks require complete worker coverage")
        w = interface["width"]
        globals_ = {}
        for name in coverage["scope"]["globals"]:
            m = re.search(r"^@" + re.escape(name)
                          + rf" = (?:dso_local )?global i{w} (-?\d+), align (\d+)$", module, re.M)
            if not m or int(m[2]) < w // 8:
                raise Reject("source global outside aligned static-integer domain")
            value = int(m[1]) % (1 << w)
            objects = [o for o in snapshot["memory"] if o["name"] == name]
            if len(objects) != 1 or objects[0]["thread_local"]:
                raise Reject("global object identity/locality mismatch")
            obj = objects[0]
            if int(obj["size"]["value"]) != w // 8 or int(obj["alignment"]["value"]) < int(m[2]):
                raise Reject("global allocation contract mismatch")
            initial = obj["initial"].get("0", {})
            if (set(obj["initial"]) != {"0"} or initial.get("kind") != "int"
                    or initial.get("type") != f"bv{w}" or int(initial["value"]) % (1 << w) != value):
                raise Reject("global initial value mismatch")
            inits = [e for t in snapshot["threads"] for e in t["events"]
                     if e["class"] == "Init" and e.get("addr", {}).get("kind") == "object"
                     and e["addr"]["name"] == name]
            if (len(inits) != 1 or inits[0]["width"] != w
                    or inits[0]["value"].get("kind") != "int"
                    or int(inits[0]["value"]["value"]) % (1 << w) != value):
                raise Reject("actual initialization event mismatch")
            globals_[name] = {"width": w, "initial": value, "llvm_alignment": int(m[2]),
                              "core_alignment": int(obj["alignment"]["value"]), "init_event": inits[0]["id"]}
        links = {x["worker"]: x for x in coverage["instance_links"]}
        mains = [t for t in snapshot["threads"] if t["name"] == "main"]
        if len(mains) != 1:
            raise Reject("main thread identity")
        boundary = []
        for t in snapshot["threads"]:
            if t["id"] in links:
                events = t["events"]
                starts = [e for e in events if e["class"] == "ThreadStart"]
                returns = [e for e in events if e["class"] == "ThreadReturn"]
                if len(starts) != 1 or starts[0].get("creator") != links[t["id"]]["create_event"]:
                    raise Reject("worker start/creator mismatch")
                if (len(returns) != 1 or returns[0].get("return_value", {}).get("kind") != "int"
                        or returns[0]["return_value"].get("type") != "bv64"
                        or int(returns[0]["return_value"]["value"]) != 0):
                    raise Reject("worker does not preserve the source null return")
                boundary.append({"thread": t["id"], "start": starts[0]["id"],
                                 "creator": starts[0]["creator"], "return": returns[0]["id"]})
            elif t["id"] != mains[0]["id"]:
                if {e["class"] for e in t["events"]} - {"ThreadStart", "Init", "Label"}:
                    raise Reject("uncovered non-initialization thread")
                if sum(e["class"] == "Init" for e in t["events"]) != 1:
                    raise Reject("unknown extra thread")
        result.update(result="STRUCTURAL_HOST_CONTRACTS_CHECKED", globals=globals_, boundaries=boundary,
                      trusted_not_proved=["Clang host compilation", "Dat3M ordinary host and pthread semantics",
                                         "reachability/scheduling, joins, assertion and CAT encoding"])
    except (Reject, KeyError, TypeError, ValueError) as error:
        result["reason"] = str(error)
    return result

"""Five actual backend object faults. This is detection validation, not proof."""
import json
from pathlib import Path
from certification.run_pipeline import ROOT, run_backend, implementation_hashes
from certification.coverage import certify_workers
from certification.evidence import save_json
from certification.interface import sha
from frontend.gnu import Reject


def isolated_diff(before, after, mode):
    """Check what REALLY changed; reject collateral changes in the experiment."""
    if {k: v for k, v in before.items() if k != "threads"} != {
            k: v for k, v in after.items() if k != "threads"}:
        raise Reject("fault changed non-thread fields")
    if [(t["id"], t["name"]) for t in before["threads"]] != [
            (t["id"], t["name"]) for t in after["threads"]]:
        raise Reject("fault changed thread census")
    changes, removed = [], []
    for t, u in zip(before["threads"], after["threads"]):
        a = {e["id"]: e for e in t["events"]}
        b = {e["id"]: e for e in u["events"]}
        if set(b) - set(a):
            raise Reject("fault introduced extra events")
        removed.extend(a[k] for k in a.keys() - b.keys())
        for k in a.keys() & b.keys():
            delta = {f: {"before": a[k].get(f), "after": b[k].get(f)}
                     for f in a[k].keys() | b[k].keys() if a[k].get(f) != b[k].get(f)}
            if delta:
                changes.append({"thread": t["id"], "event": k, "fields": delta})
    if len(changes) != 1:
        raise Reject("fault changed more than one surviving event")
    field = {"a-only": "tags", "pair-only": "rmw_load", "guard-only": "guard",
             "live-use-only": "condition", "omit-instance": "successor"}[mode]
    if set(changes[0]["fields"]) != {field}:
        raise Reject("fault changed collateral fields")
    if mode == "omit-instance":
        if len(removed) != 2 or {e["class"] for e in removed} != {"Load", "RMWStore"}:
            raise Reject("omission did not remove exactly one RMW instance")
    elif removed:
        raise Reject("unexpected event deletion")
    if mode == "a-only":
        d = changes[0]["fields"]["tags"]
        if set(d["before"]) - set(d["after"]) != {"A"} or set(d["after"]) - set(d["before"]):
            raise Reject("not an A-only fault")
    return {"result": "SINGLE_FACTOR_ACTUAL_DIFF", "changes": changes,
            "removed_events": removed, "thread_census_unchanged": True,
            "llvm_frame_and_entire_candidate_unchanged": True}


def run():
    base = ROOT / "experiments/controlled-round"
    out = base / "single-factor"
    out.mkdir(exist_ok=False)
    summary = []
    save_json(out / "implementation.json", implementation_hashes())
    for mode, source_run in [
        ("a-only", base / "cas-failure-01"),
        ("pair-only", base / "live-01"),
        ("guard-only", base / "cas-failure-01"),
        ("live-use-only", base / "live-01"),
        ("omit-instance", ROOT / "experiments/minimal-acceptance/final"),
    ]:
        target = out / mode
        candidate = source_run / "translation/candidate.ll"
        original = candidate.read_bytes()
        frame = json.loads((source_run / "translation/host-frame.json").read_bytes())
        if sha(original) != frame["target_module_sha256"]:
            raise Reject("positive candidate differs from authenticated host frame")
        backend = run_backend(candidate, ROOT / "vendor/Dat3M-controlled-faults-v2",
                              base / "fault-build-02/build-receipt.json", target / "backend", fault=mode)
        if backend["result"] != "ACTUAL_BACKEND_CAPTURED":
            raise Reject("fault run did not reach real same-run encoding: " + str(backend))
        snapshots = target / "backend/snapshots"
        pre = json.loads((snapshots / "pre-fault.json").read_bytes())
        post = json.loads((snapshots / "post-fault.json").read_bytes())
        before = json.loads((snapshots / "before-encoding.json").read_bytes())
        after = json.loads((snapshots / "after-encoding.json").read_bytes())
        if post != before or before != after or candidate.read_bytes() != original:
            raise Reject("faulted Program/candidate changed after controlled injection")
        diff = isolated_diff(pre, post, mode)
        save_json(target / "isolation.json", diff)
        interface = json.loads((source_run / "translation/interface.json").read_bytes())
        llvm = (source_run / "source.ll").read_bytes().decode("utf8")
        # The original actual Program must still be accepted by today's checker.
        control = certify_workers(llvm, interface, pre, pre, target / "control")
        faulty = certify_workers(llvm, interface, before, after, target / "check")
        row = {"mode": mode, "positive_run": source_run.relative_to(ROOT).as_posix(),
               "candidate_sha256": sha(original), "isolation": diff["result"],
               "control": control["result"], "fault": faulty["result"], "reason": faulty.get("reason"),
               "actual_backend_result": backend["observed_verdict"],
               "program_verdict_eligible": False}
        save_json(target / "result.json", row)
        summary.append(row)
        save_json(out / "summary.json", summary)
        if control["result"] != "SUPPORTED_WORKERS_EXACT" or faulty["result"] != "REJECT":
            raise Reject("fault/control discrimination failed")
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    run()

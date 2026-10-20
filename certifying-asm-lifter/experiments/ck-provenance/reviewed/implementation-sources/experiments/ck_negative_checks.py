"""Small, explicitly separated component and actual-backend detection checks."""
import argparse
import copy
import json
import re
from pathlib import Path
from certification.provenance import authenticate_capture, _reconcile_objects
from certification.run_pipeline import ROOT, implementation_hashes, run_backend
from certification.coverage import certify_workers
from certification.interface import sha
from certification.evidence import save_json
from experiments.controlled_faults import isolated_diff
from frontend.gnu import Reject


def component_checks(capture, out):
    out.mkdir(parents=True, exist_ok=False)
    obs, receipt, buffers, module = authenticate_capture(capture)
    control = _reconcile_objects(obs, receipt, buffers, module)
    key = control["provenance"]["cookies"]
    site_index = next(i for i, s in enumerate(obs["sites"]) if s["cookies"] == key)
    function_index = next(i for i, f in enumerate(obs["functions"]) if f["id"] == obs["sites"][site_index]["function"])
    worker_id = control["provenance"]["inline_context"]["worker_decl"]
    worker_index = next(i for i, f in enumerate(obs["functions"]) if f["id"] == worker_id)
    expected_reasons = {
        "missing-origin": "missing/ambiguous asm origin metadata",
        "ambiguous-origin": "source provenance join is missing or ambiguous",
        "wrong-llvm-input": "actual LLVM operands differ from independent typed C substitution",
        "nonidentity-pointer-cast": "unsupported C cast: BitCast",
        "wrong-inline-context": "inline debug position differs",
        "wrong-c-live-condition": "source/LLVM assertion condition differs or solver unknown",
    }
    rows = []
    for mode in ["missing-origin", "ambiguous-origin", "wrong-llvm-input",
                 "nonidentity-pointer-cast", "wrong-inline-context", "wrong-c-live-condition"]:
        o, l = copy.deepcopy(obs), module
        changes = []
        def replace(container, field, value, path):
            changes.append({"path": path, "before": container[field], "after": value})
            container[field] = value
        if mode == "missing-origin":
            old = control["llvm_call"]
            new = re.sub(r", !srcloc !\d+", "", old)
            l = l.replace(old, new, 1)
            changes = [{"object": "actual LLVM bytes (controlled corruption)", "before": old, "after": new}]
        elif mode == "ambiguous-origin":
            duplicate = copy.deepcopy(o["sites"][site_index])
            o["sites"].append(duplicate)
            changes = [{"path": "/sites/-", "add": duplicate}]
        elif mode == "wrong-llvm-input":
            old = control["llvm_call"]
            new = old.replace("i32 1)", "i32 2)")
            if old == new:
                raise Reject("negative selector no longer matches real LLVM")
            l = l.replace(old, new, 1)
            changes = [{"object": "actual LLVM bytes (controlled corruption)", "before": old, "after": new}]
        elif mode == "nonidentity-pointer-cast":
            # The same AST expression is serialized in two views. Change the
            # semantic cast kind consistently, not the view-consistency check.
            for expr, path in [
                (o["sites"][site_index]["operands"][0]["expression"], f"/sites/{site_index}/operands/0/expression"),
                (o["functions"][function_index]["body"]["children"][0]["children"][0],
                 f"/functions/{function_index}/body/children/0/children/0")]:
                replace(expr["children"][0], "cast", "BitCast", path + "/children/0/cast")
        elif mode == "wrong-inline-context":
            mid = control["provenance"]["inline_context"]["inlined_at_debug_id"]
            old = re.search(r"^!" + mid + r" = .*$", l, re.M)[0]
            new = re.sub(r"line: (\d+)", lambda m: "line: " + str(int(m[1]) + 1), old, count=1)
            l = l.replace(old, new, 1)
            changes = [{"object": "actual LLVM inline metadata (controlled corruption)", "before": old, "after": new}]
        elif mode == "wrong-c-live-condition":
            assertion = o["functions"][worker_index]["body"]["children"][1]
            # Same CallExpr argument in the argument list and children view.
            replace(assertion["arguments"][0], "opcode", "==",
                    f"/functions/{worker_index}/body/children/1/arguments/0/opcode")
            replace(assertion["children"][1], "opcode", "==",
                    f"/functions/{worker_index}/body/children/1/children/1/opcode")
        row = {"mode": mode, "kind": "SYNTHETIC_COMPONENT_CORRUPTION_ONLY",
               "base_capture": capture.relative_to(ROOT).as_posix(),
               "control": control["result"], "changes": changes,
               "not_a_real_compiler_or_backend_capture": True, "program_verdict_eligible": False}
        target = out / mode
        try:
            _reconcile_objects(o, receipt, buffers, l, target)
            row["result"] = "UNEXPECTED_ACCEPT"
        except Exception as error:
            row.update(result="REJECT", reason=str(error))
        save_json(target / "result.json", row)
        rows.append({k: v for k, v in row.items() if k != "changes"})
        if row["result"] != "REJECT" or row.get("reason") != expected_reasons[mode]:
            raise Reject("component fault did not fail at its intended gate: " + mode)
    save_json(out / "summary.json", rows)
    return rows


def actual_backend_checks(capture, acceptance, out):
    out.mkdir(parents=True, exist_ok=False)
    interface = json.loads((acceptance / "translation/interface.json").read_bytes())
    module = (capture / "source.ll").read_bytes().decode()
    candidate = acceptance / "translation/candidate.ll"
    original = candidate.read_bytes()
    summary = []
    for mode in ["live-use-only", "omit-instance"]:
        target = out / mode
        backend = run_backend(candidate, ROOT / "vendor/Dat3M-controlled-faults-v2",
                              ROOT / "experiments/controlled-round/fault-build-02/build-receipt.json",
                              target / "backend", fault=mode)
        if backend["result"] != "ACTUAL_BACKEND_CAPTURED":
            save_json(out / "failed-run.json", backend)
            raise Reject("real fault backend did not complete: " + backend.get("reason", "unknown"))
        snapshots = target / "backend/snapshots"
        pre, post, before, after = [json.loads((snapshots / (p + ".json")).read_bytes())
                                   for p in ["pre-fault", "post-fault", "before-encoding", "after-encoding"]]
        if post != before or before != after or candidate.read_bytes() != original:
            raise Reject("actual fault run object/candidate changed unexpectedly")
        diff = isolated_diff(pre, post, mode)
        save_json(target / "isolation.json", diff)
        control = certify_workers(module, interface, pre, pre, target / "control")
        faulty = certify_workers(module, interface, before, after, target / "check")
        row = {"mode": mode, "kind": "ACTUAL_BACKEND_MUTATION_BEFORE_ANALYSES",
               "control": control["result"], "result": faulty["result"],
               "reason": faulty.get("reason"), "isolation": diff["result"],
               "candidate_sha256": sha(original), "backend_verdict": backend["observed_verdict"],
               "program_verdict_eligible": False}
        save_json(target / "result.json", row)
        summary.append(row)
        save_json(out / "summary.json", summary)
        if control["result"] != "SUPPORTED_WORKERS_EXACT" or faulty["result"] != "REJECT":
            raise Reject("actual backend fault discrimination failed")
    return summary


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--capture", required=True, type=Path)
    ap.add_argument("--acceptance", required=True, type=Path)
    ap.add_argument("--out", required=True, type=Path)
    args = ap.parse_args()
    args.out.mkdir(parents=True, exist_ok=False)
    save_json(args.out / "implementation.json", implementation_hashes())
    components = component_checks(args.capture.resolve(), args.out / "components")
    actual = actual_backend_checks(args.capture.resolve(), args.acceptance.resolve(), args.out / "actual")
    print(json.dumps({"components": components, "actual": actual}, indent=2))

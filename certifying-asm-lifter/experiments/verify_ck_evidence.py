"""Static distribution/object/query integrity only; no solver or backend run."""
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / "experiments/ck-provenance"


def read(path):
    return json.loads(path.read_bytes())


def sha(data):
    return hashlib.sha256(data).hexdigest()


def require(ok, message):
    if not ok:
        raise ValueError(message)


def verify():
    manifest = read(BASE / "manifest.json")
    for row in manifest["files"]:
        data = (BASE / row["path"]).read_bytes()
        require(len(data) == row["bytes"] and sha(data) == row["sha256"], "raw bytes: " + row["path"])
    implementation = read(BASE / "reviewed/implementation.json")
    for rel, digest in implementation.items():
        require(sha((BASE / "reviewed/implementation-sources" / rel).read_bytes()) == digest,
                "sealed source: " + rel)
    summary = read(BASE / "reviewed/summary.json")
    require(summary["result"] == "CK_SCOPED_CHAIN_CHECKED_UNDER_DECLARED_TCB"
            and summary["program_verdict_eligible"] is False and summary["novelty_confirmed"] is False,
            "claim/gate changed")
    capture = ROOT / summary["compiler_capture"]
    compiler = read(capture / "compiler-receipt.json")
    require(compiler["result"] == "SAME_INVOCATION_CAPTURED", "wrong capture")
    for name, digest in compiler["artifacts"].items():
        require(sha((capture / name).read_bytes()) == digest, "compiler artifact: " + name)
    for path, row in compiler["dependencies"].items():
        require(sha((capture / row["file"]).read_bytes()) == row["sha256"], "dependency: " + path)
    require(compiler["command"].count("-S") == 1 and "-emit-llvm" in compiler["command"]
            and "-plugin-arg-cert-observe" in compiler["command"], "not joint observer/CodeGen")
    require(summary["all_ast_asm_sites"] == 188 and summary["static_inline_sites"] == 1
            and summary["potential_worker_activations"] == 2, "scope/count claim changed")
    candidate = (ROOT / summary["actual_positive_backend"]).parent / "translation/candidate.ll"
    require(sha(candidate.read_bytes()) == summary["candidate_sha256"]
            and (BASE / "reviewed/translation/candidate.ll").read_bytes() == candidate.read_bytes(),
            "review did not check actual backend input")
    receipts = list(BASE.rglob("backend-receipt.json"))
    require(len(receipts) == 3, "unexpected backend run count")
    for path in receipts:
        r = read(path)
        require(r["result"] == "ACTUAL_BACKEND_CAPTURED"
                and r["candidate_sha256"] == summary["candidate_sha256"], "backend input/capture mismatch")
        for name, digest in r["snapshots"].items():
            require(sha((path.parent / "snapshots" / name).read_bytes()) == digest, "actual snapshot digest")
        for name, digest in r["queries"].items():
            require(sha((path.parent / name).read_bytes()) == digest, "actual SMT digest")
        before = read(path.parent / "snapshots/before-encoding.json")
        after = read(path.parent / "snapshots/after-encoding.json")
        require(before == after and before["run_id"] == r["run_id"], "actual same-run objects differ")
        if r["controlled_fault"]:
            require(read(path.parent / "snapshots/post-fault.json") == before, "fault object changed before encoding")
    query_count = legacy_count = 0
    for p in BASE.rglob("certificate.json"):
        for q in read(p).get("obligations", []):
            if "file" not in q:
                continue
            data = (p.parent / q["file"]).read_bytes()
            if sha(data) != q["smt_sha256"]:
                require("block" in p.parts and sha(data.replace(b"\r\n", b"\n")) == q["smt_sha256"],
                        "local SMT digest")
                legacy_count += 1
            if "smt2" in q:
                require(data == q["smt2"].encode(), "saved SMT differs from certificate text")
            query_count += 1
    counts = {"sat": 0, "unsat": 0, "unknown": 0}
    for part in ["translation", "regions"]:
        for p in (BASE / "reviewed" / part).rglob("certificate.json"):
            for q in read(p).get("obligations", []):
                require(q["result"] == q.get("expected", "unsat"), "positive query failed")
                counts[q["result"]] += 1
    require(counts == summary["positive_local_obligations"] == {"sat": 2, "unsat": 33, "unknown": 0},
            "positive obligation census")
    require(len(summary["component_faults"]) == 6 and len(summary["actual_faults"]) == 2, "negative census")
    for row in summary["component_faults"]:
        require(row["result"] == "REJECT" and row["control"] == "INTERFACE_MATCH"
                and row["not_a_real_compiler_or_backend_capture"] is True, "component provenance/result")
    for row in summary["actual_faults"]:
        require(row["result"] == "REJECT" and row["control"] == "SUPPORTED_WORKERS_EXACT"
                and row["isolated"] == "SINGLE_FACTOR_ACTUAL_DIFF", "actual fault discrimination")
    return {"result": "STATIC_CK_EVIDENCE_CHECKS_PASSED", "distribution_files": len(manifest["files"]),
            "sealed_implementation_files": len(implementation), "backend_runs": len(receipts),
            "saved_local_queries": query_count, "legacy_block_LF_digests": legacy_count,
            "final_positive_obligations": counts, "component_rejections": 6, "actual_backend_rejections": 2,
            "program_verdict_eligible": False, "novelty_confirmed": False,
            "scope": "recorded evidence integrity, not theorem/implementation/compiler/solver correctness"}


if __name__ == "__main__":
    print(json.dumps(verify(), indent=2))

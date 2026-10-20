"""Static integrity review only: no compiler, backend or SMT invocation."""
import json
import hashlib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / "experiments/controlled-round"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def read(path):
    return json.loads(path.read_bytes())


def require(condition, message):
    if not condition:
        raise ValueError(message)


def verify():
    manifest = read(BASE / "manifest.json")
    for row in manifest["files"]:
        data = (BASE / row["path"]).read_bytes()
        require(len(data) == row["bytes"] and sha(data) == row["sha256"],
                "distribution digest: " + row["path"])
    implementation = read(BASE / "reviewed/implementation.json")
    for rel, digest in implementation.items():
        require(sha((BASE / "reviewed/implementation-sources" / rel).read_bytes()) == digest,
                "sealed executed source: " + rel)
    summary = read(BASE / "reviewed/summary.json")
    for row in summary["positives_and_unsupported"]:
        capture = ROOT / row["actual_capture"]
        comp = read(capture / "compiler-receipt.json")
        for filename, key in [("source.c", "source_sha256"), ("source.ast.json", "ast_sha256"),
                              ("source.ll", "llvm_sha256")]:
            require(sha((capture / filename).read_bytes()) == comp[key], "compiler object " + filename)
        require(sha((capture / "translation/candidate.ll").read_bytes()) == row["candidate_sha256"],
                "candidate bytes")
    receipts = list(BASE.glob("*/backend/backend-receipt.json"))
    receipts += list((BASE / "single-factor").glob("*/backend/backend-receipt.json"))
    for path in receipts:
        r = read(path)
        if r["result"] != "ACTUAL_BACKEND_CAPTURED":
            continue  # Failed historical attempts are retained, not promoted.
        for name, digest in r["snapshots"].items():
            require(sha((path.parent / "snapshots" / name).read_bytes()) == digest, "snapshot bytes")
        for name, digest in r["queries"].items():
            require(sha((path.parent / name).read_bytes()) == digest, "solver query bytes")
        a = read(path.parent / "snapshots/before-encoding.json")
        b = read(path.parent / "snapshots/after-encoding.json")
        require(a == b and a["run_id"] == r["run_id"], "same-run encoding objects")
    query_count, legacy_count = 0, 0
    for path in BASE.rglob("certificate.json"):
        cert = read(path)
        for q in cert.get("obligations", []):
            if "file" not in q:
                continue
            data = (path.parent / q["file"]).read_bytes()
            if sha(data) != q["smt_sha256"]:
                require("block" in path.parts and sha(data.replace(b"\r\n", b"\n")) == q["smt_sha256"],
                        "local SMT digest")
                legacy_count += 1
            if "smt2" in q:
                require(data == q["smt2"].encode(), "saved SMT/certificate disagreement")
            query_count += 1
    positive_counts = {}
    for name in ["live-01", "cas-success-01", "cas-failure-01"]:
        counts = {}
        for path in (BASE / "reviewed" / name).rglob("certificate.json"):
            for q in read(path).get("obligations", []):
                require(q["result"] == q.get("expected", "unsat"), "positive obligation result")
                counts[q["result"]] = counts.get(q["result"], 0) + 1
        positive_counts[name] = counts
    require(positive_counts == {"live-01": {"unsat": 32, "sat": 2},
                               "cas-success-01": {"unsat": 22, "sat": 1},
                               "cas-failure-01": {"unsat": 22, "sat": 1}}, "reviewed query census")
    faults = read(BASE / "single-factor/summary.json")
    for f in faults:
        require(f["control"] == "SUPPORTED_WORKERS_EXACT" and f["fault"] == "REJECT",
                "single-factor detection")
        require(read(BASE / "single-factor" / f["mode"] / "isolation.json")["result"]
                == "SINGLE_FACTOR_ACTUAL_DIFF", "isolation evidence")
    ck = BASE / "ck-admission-05"
    require(read(ck / "admission.json")["result"] == "REJECT"
            and not read(ck / "admission.json")["backend_executed"], "CK stop gate")
    comp = read(ck / "compiler-receipt.json")
    origin = read(BASE / "ck-origin/download.json")
    for path, dep in comp["dependencies"].items():
        data = (ck / dep["file"]).read_bytes()
        require(sha(data) == dep["sha256"], "CK actual dependency")
        marker = "/ck-" + origin["commit"] + "/"
        if marker in path:
            rel = path.split(marker, 1)[1]
            if rel != "include/ck_md.h":  # Original configure output, separately captured.
                require(sha(data) == origin["files"][rel], "unchanged third-party source")
    return {"result": "STATIC_CONTROLLED_EVIDENCE_CHECKS_PASSED",
            "distribution_files": len(manifest["files"]), "sealed_checker_files": len(implementation),
            "backend_receipts": len(receipts), "local_saved_queries": query_count,
            "legacy_block_LF_digests": legacy_count, "reviewed_positive_counts": positive_counts,
            "single_factor_rejections": len(faults), "third_party": "REJECT",
            "program_verdict_eligible": False,
            "scope": "integrity of recorded evidence; not theorem/checker/compiler/solver correctness"}


if __name__ == "__main__":
    print(json.dumps(verify(), indent=2))

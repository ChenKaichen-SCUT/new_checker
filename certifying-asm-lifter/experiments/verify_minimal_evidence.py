"""Static distribution/provenance audit. Does NOT run compilers or SMT solvers."""
import hashlib
import json
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EVIDENCE = ROOT / "experiments/minimal-acceptance"
PIN = "b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8"
SOURCE_VERSION = "3e2326c1feec3b596d9e9a2d67a30a20df0c164a"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def git_object(kind, data):
    return hashlib.sha1(kind.encode() + b" " + str(len(data)).encode() + b"\0" + data).hexdigest()


def require(condition, reason):
    if not condition:
        raise ValueError(reason)


def verify():
    proof = json.loads((EVIDENCE / "upstream-tree-membership.json").read_bytes())
    raw_commit = (EVIDENCE / proof["signed_commit_file"]).read_bytes()
    require(git_object("commit", raw_commit) == PIN == proof["commit"], "pinned signed commit bytes")
    tree_root = raw_commit.splitlines()[0].decode().removeprefix("tree ")
    require(tree_root == proof["root_tree"], "commit/root-tree linkage")
    tree_ids = {}
    for directory, entries in proof["nodes"].items():
        require(len({e["name"] for e in entries}) == len(entries), "duplicate Git tree entry")
        entries = sorted(entries, key=lambda e: (e["name"] + ("/" if e["type"] == "tree" else "")).encode())
        raw = b"".join((("40000" if e["type"] == "tree" else e["mode"]) + " " + e["name"]).encode()
                       + b"\0" + bytes.fromhex(e["sha"]) for e in entries)
        tree_ids[directory] = git_object("tree", raw)
    require(tree_ids[""] == tree_root, "root tree object hash")
    for directory, object_id in tree_ids.items():
        if not directory:
            continue
        parent, _, name = directory.rpartition("/")
        entries = proof["nodes"][parent]
        require(any(e["name"] == name and e["type"] == "tree" and e["sha"] == object_id for e in entries),
                "Git tree ancestor membership: " + directory)
    inputs = json.loads((EVIDENCE / "build-03/upstream-inputs.json").read_bytes())["files"]
    require(set(inputs) == set(proof["selected_blobs"]), "selected source inventory")
    for path, hashes in inputs.items():
        parent, _, name = path.rpartition("/")
        require(any(e["name"] == name and e["type"] == "blob" and e["sha"] == hashes["git_blob"]
                    for e in proof["nodes"][parent]), "source blob not in pinned tree: " + path)
    implementation = json.loads((EVIDENCE / "final/implementation.json").read_bytes())["files"]
    def historical_bytes(path):
        # Later authorized changes must not falsify or rewrite a historical run.
        return subprocess.run(["git", "show", SOURCE_VERSION + ":certifying-asm-lifter/" + path],
                              cwd=ROOT.parent, check=True, capture_output=True).stdout
    for path, expected in implementation.items():
        require(sha(historical_bytes(path)) == expected, "historical implementation mismatch: " + path)
    for path, expected in json.loads((EVIDENCE / "final-negatives/implementation.json").read_bytes()).items():
        require(sha(historical_bytes(path)) == expected, "historical negative implementation mismatch: " + path)
    normalized_queries = []
    checked_queries = 0
    # Legacy block checker hashes the LF query text before Windows write_text
    # translates its line endings. New layers use exact UTF-8 bytes.
    for cert_path in EVIDENCE.rglob("certificate.json"):
        cert = json.loads(cert_path.read_bytes())
        for item in cert.get("obligations", []):
            if "file" not in item:
                continue
            file = cert_path.parent / item["file"]
            raw = file.read_bytes()
            if sha(raw) != item["smt_sha256"]:
                require("block" in cert_path.parts and sha(raw.replace(b"\r\n", b"\n")) == item["smt_sha256"],
                        "query digest mismatch: " + str(file))
                normalized_queries.append(file.relative_to(EVIDENCE).as_posix())
            if "smt2" in item:
                require(raw == item["smt2"].encode(), "saved actual query differs from certificate text")
            checked_queries += 1
    for path in [EVIDENCE / "final/backend/backend-receipt.json",
                 *sorted((EVIDENCE / "final-negatives").glob("*/backend/backend-receipt.json"))]:
        receipt = json.loads(path.read_bytes())
        require(receipt["result"] == "ACTUAL_BACKEND_CAPTURED", "final backend rejected")
        q0 = (path.parent / "snapshots/before-encoding.json").read_bytes()
        q1 = (path.parent / "snapshots/after-encoding.json").read_bytes()
        require(q0 == q1, "snapshot bytes differ across encoding")
        require(json.loads(q0)["run_id"] == receipt["run_id"], "run identity mismatch")
        for name, expected in receipt["snapshots"].items():
            require(sha((path.parent / "snapshots" / name).read_bytes()) == expected, "snapshot hash")
        for name, expected in receipt["queries"].items():
            require(sha((path.parent / name).read_bytes()) == expected, "backend query hash")
        require(sha((path.parent.parent / ("translation/candidate.ll" if path.parent.parent.name == "final"
                                          else "candidate.ll")).read_bytes()) == receipt["candidate_sha256"],
                "backend actual input hash")
    manifest = EVIDENCE / "manifest.json"
    checked_files = 0
    if manifest.exists():
        for item in json.loads(manifest.read_bytes())["files"]:
            data = (EVIDENCE / item["path"]).read_bytes()
            require(sha(data) == item["sha256"] and len(data) == item["bytes"], "distribution hash: " + item["path"])
            checked_files += 1
    return {"result": "STATIC_INTEGRITY_CHECKS_PASSED", "git_commit": PIN,
            "historical_checker_commit": SOURCE_VERSION,
            "root_tree": tree_root, "authenticated_build_inputs": len(inputs),
            "executed_implementation_files": len(implementation), "checked_queries": checked_queries,
            "legacy_LF_query_hashes": normalized_queries, "manifest_files_checked": checked_files,
            "not_proved": "compiler/checker/solver correctness or theorem implementation refinement"}


if __name__ == "__main__":
    print(json.dumps(verify(), indent=2))

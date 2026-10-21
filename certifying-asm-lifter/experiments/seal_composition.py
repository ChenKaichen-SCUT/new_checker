"""Static-only delivery seal. No compiler/backend/solver/checker execution.

Preserves every baseline byte except navigation, workflow and the manifest.
This is an integrity check, not a proof of the theorem or Python implementation.
"""
import ast
import hashlib
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]
REPO = ROOT.parent
PREFIX = ROOT.name + "/"
BASELINE = "f5498b6213e0a4e2b5f51f57477cad271035c200"
THEOREM_SHA256 = "8f4f91dc9a4002563389609879a653512ae7d687ac38c4bae164146c55d9d596"
DOCS = ROOT / "docs/composition"
EVIDENCE = ROOT / "experiments/composition"
ALLOWED = {"AGENTS.md", "README.md"} | {
    PREFIX + p for p in ("README.md", "docs/00-progress.md", "artifact-manifest.json")
}
NEW_CODE = {
    "certification/composition.py", "tests/test_composition.py",
    "experiments/certify_composition.py", "experiments/run_composition_acceptance.py",
    "experiments/review_composition.py", "experiments/seal_composition.py"
}


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def git(*args):
    return subprocess.check_output(["git", *args], cwd=REPO)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes((json.dumps(value, ensure_ascii=False, indent=2) + "\n").encode("utf-8"))


def paths():
    return sorted(set(filter(None, git("ls-files", "--cached", "--others",
                                       "--exclude-standard", "-z").decode("utf-8").split("\0"))))


def entries(names):
    result = []
    for name in names:
        data = (REPO / name).read_bytes()
        require(len(data) < 100_000_000, "oversized artifact: " + name)
        result.append({"path": name[len(PREFIX):], "sha256": sha(data), "bytes": len(data)})
    return result


def main():
    baseline_names, protected = set(), []
    for row in git("ls-tree", "-r", "-z", BASELINE).split(b"\0"):
        if not row:
            continue
        header, raw_name = row.split(b"\t", 1)
        _, kind, blob = header.split()
        name = raw_name.decode("utf-8")
        baseline_names.add(name)
        p = REPO / name
        require(kind == b"blob" and p.is_file(), "missing baseline file: " + name)
        data = p.read_bytes()
        current = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
        if name not in ALLOWED:
            require(current == blob.decode(), "frozen file changed: " + name)
            protected.append(name)
    for name in set(paths()) - baseline_names:
        require(name.startswith(PREFIX + "docs/composition/")
                or name.startswith(PREFIX + "experiments/composition/")
                or name in {PREFIX + p for p in NEW_CODE}, "unexpected new artifact: " + name)

    old_raw = git("show", BASELINE + ":" + PREFIX + "artifact-manifest.json")
    old = json.loads(old_raw)
    historical = [r for r in old["files"] if r["path"].startswith("experiments/")]
    for row in historical:
        require(sha((ROOT / row["path"]).read_bytes()) == row["sha256"],
                "historical experiment changed: " + row["path"])
    require(sha((ROOT / "docs/system-review/01-end-to-end-guarantee.md").read_bytes()) == THEOREM_SHA256,
            "original E2E theorem changed")

    pins = json.loads((ROOT / "backend/dat3m/pins.json").read_bytes())
    model = {}
    for name in ("tso.cat", "x86fences.cat", "stdlib.cat"):
        p = ROOT / "experiments/property/final-02/owned/backend/model/cat" / name
        model[name] = {"sha256": sha(p.read_bytes()), "bytes": p.stat().st_size}
        require(model[name]["sha256"] == pins["files"]["cat/" + name], "CAT identity mismatch")

    # Literal parsing only; no semantic module imports or execution.
    tree = ast.parse((ROOT / "experiments/certify_p0.py").read_text(encoding="utf-8"))
    gamma = next(ast.literal_eval(node.value) for node in tree.body
                 if isinstance(node, ast.Assign)
                 and any(isinstance(t, ast.Name) and t.id == "GAMMA" for t in node.targets))
    require(len(gamma) == 8, "original Gamma census mismatch")
    for name in NEW_CODE:
        ast.parse((ROOT / name).read_text(encoding="utf-8"))
    review = json.loads((EVIDENCE / "evidence-review.json").read_bytes())
    require(review["result"] == "REVIEWED" and len(review["cases"]) == 11
            and review["fresh_same_invocation_Clang_and_same_run_Dat3M"] == 3
            and review["historical_actual_controlled_fault_replays"] == 8
            and review["focused_tests"] == 17
            and review["new_real_upstream_bugs_claimed"] == 0, "evidence review incomplete")

    known_outputs = {(EVIDENCE / "integrity.json").resolve(), (EVIDENCE / "manifest.json").resolve()}
    broken = []
    for p in [*sorted(DOCS.glob("*.md")), ROOT / "README.md", REPO / "README.md",
              ROOT / "docs/00-progress.md"]:
        for target in re.findall(r"\[[^\]]*\]\(([^)]+)\)", p.read_text(encoding="utf-8")):
            if "://" in target or target.startswith("#"):
                continue
            resolved = (p.parent / target.partition("#")[0]).resolve()
            if not resolved.exists() and resolved not in known_outputs:
                broken.append({"file": str(p), "target": target})
    require(not broken, "broken local links: " + str(broken))

    save(EVIDENCE / "integrity.json", {
        "result": "STATIC_INTEGRITY_CHECKED", "date": "2026-10-21", "baseline": BASELINE,
        "protected_baseline_files": len(protected),
        "historical_experiment_files_sha256_checked": len(historical),
        "allowed_existing_updates": sorted(ALLOWED), "historical_exceptions": [],
        "old_checker_lifter_backend_tests_unchanged": True,
        "new_code": sorted(NEW_CODE), "original_theorem_sha256": THEOREM_SHA256,
        "original_gamma": gamma, "new_external_semantic_assumptions": [],
        "dat3m_commit": pins["commit"], "fixed_model": model,
        "local_paths_checked": True, "broken_local_paths": broken,
        "evidence_review_sha256": sha((EVIDENCE / "evidence-review.json").read_bytes()),
        "reported_fresh_actual_cases": 3, "reported_historical_actual_fault_cases": 8,
        "reported_focused_tests": 17,
        "production_source_language_scope_expanded": False,
        "complete_CK_client_L3_L4_ACTC": "0/1",
        "independent_algorithm_novelty": "NOT_ESTABLISHED_NO_GO",
        "proof_status": "analytic conditional proof; not mechanically checked by this script",
        "scope": "static byte/hash/path checks only; no semantic checker/compiler/backend/SMT/tests run by seal"
    })
    delivery_names = [p for p in paths() if (
        p.startswith(PREFIX + "docs/composition/") or p.startswith(PREFIX + "experiments/composition/")
        or p in {PREFIX + n for n in NEW_CODE}) and p != PREFIX + "experiments/composition/manifest.json"]
    save(EVIDENCE / "manifest.json", {
        "baseline": BASELINE, "status": "restricted-ACTC-prototype; coverage-unchanged; novelty-NO_GO; STOP",
        "files": entries(delivery_names), "sealing_script_sha256": sha(Path(__file__).read_bytes())
    })
    all_names = [p for p in paths() if p.startswith(PREFIX) and p != PREFIX + "artifact-manifest.json"]
    save(ROOT / "artifact-manifest.json", {
        "manifest_version": old["manifest_version"] + 1, "date": "2026-10-21",
        "baseline_commit": BASELINE,
        "status": "restricted-ACTC-proof-and-prototype; source-scope-unchanged; novelty-NO_GO; STOP-for-review",
        "previous_manifest_sha256": sha(old_raw), "previous_manifest_version": old["manifest_version"],
        "files": entries(all_names)
    })
    print(json.dumps({"protected_baseline_files": len(protected),
                      "historical_experiment_files": len(historical), "delivery_files": len(delivery_names),
                      "all_project_files": len(all_names), "broken_paths": 0,
                      "semantic_execution_by_this_script": False}))


if __name__ == "__main__":
    main()

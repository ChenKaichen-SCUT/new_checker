"""Static-only seal: no project imports, compiler, backend, SMT or tests.

This verifies artifact integrity, not the analytic theorem or program safety.
Run from any directory with Python's standard library and Git available.
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
BASELINE = "5e744abf48669d3ee6014e127c344ac5a00e1d43"
THEOREM_SHA256 = "8f4f91dc9a4002563389609879a653512ae7d687ac38c4bae164146c55d9d596"
DOCS = ROOT / "docs/property-multiwriter"
ALLOWED = {"AGENTS.md", "README.md"} | {
    PREFIX + p for p in ("README.md", "docs/00-progress.md", "artifact-manifest.json")
}
NEW_SCRIPT = PREFIX + "experiments/seal_multiwriter_review.py"


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
        require(name.startswith(PREFIX + "docs/property-multiwriter/") or name == NEW_SCRIPT,
                "unexpected new artifact: " + name)

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

    # Parse literal metadata only. Never import/run the certification pipeline.
    tree = ast.parse((ROOT / "experiments/certify_p0.py").read_text(encoding="utf-8"))
    gamma = next(ast.literal_eval(node.value) for node in tree.body
                 if isinstance(node, ast.Assign)
                 and any(isinstance(t, ast.Name) and t.id == "GAMMA" for t in node.targets))
    require(len(gamma) == 8, "original Gamma census mismatch")
    ast.parse(Path(__file__).read_text(encoding="utf-8"))

    evidence_path = DOCS / "evidence/integrity.json"
    known_outputs = {evidence_path.resolve(), (DOCS / "evidence/manifest.json").resolve()}
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

    save(evidence_path, {
        "result": "STATIC_INTEGRITY_CHECKED", "date": "2026-10-21", "baseline": BASELINE,
        "protected_baseline_files": len(protected),
        "historical_experiment_files_sha256_checked": len(historical),
        "allowed_existing_updates": sorted(ALLOWED), "historical_exceptions": [],
        "checker_lifter_backend_tests_unchanged": True,
        "original_theorem_sha256": THEOREM_SHA256,
        "original_gamma": gamma, "new_external_semantic_assumptions": [],
        "dat3m_commit": pins["commit"], "fixed_model": model,
        "local_links_checked": True, "broken_local_links": broken,
        "semantic_execution_this_round": [], "new_program_certificates": [],
        "proof_status": "analytic proof only; not mechanically checked by this script",
        "implemented_multiwriter_omission": False,
        "independent_algorithm_novelty": "NOT_ESTABLISHED_NO_GO",
        "scope": "static byte/hash/link checks; not semantic validation or regression execution"
    })
    review_names = [p for p in paths() if p.startswith(PREFIX + "docs/property-multiwriter/")
                   and p != PREFIX + "docs/property-multiwriter/evidence/manifest.json"]
    save(DOCS / "evidence/manifest.json", {
        "baseline": BASELINE, "status": "theory-design-only; stronger-rule; novelty-NO_GO; STOP",
        "files": entries(review_names), "sealing_script_sha256": sha(Path(__file__).read_bytes())
    })
    all_names = [p for p in paths() if p.startswith(PREFIX) and p != PREFIX + "artifact-manifest.json"]
    save(ROOT / "artifact-manifest.json", {
        "manifest_version": old["manifest_version"] + 1, "date": "2026-10-21",
        "baseline_commit": BASELINE,
        "status": "multiwriter-FAA-theory-only; production-scope-unchanged; novelty-NO_GO; STOP-for-review",
        "previous_manifest_sha256": sha(old_raw), "previous_manifest_version": old["manifest_version"],
        "files": entries(all_names)
    })
    print(json.dumps({"protected_baseline_files": len(protected),
                      "historical_experiment_files": len(historical), "review_files": len(review_names),
                      "all_project_files": len(all_names), "broken_links": 0,
                      "compiler_backend_SMT_tests_run": False}))


if __name__ == "__main__":
    main()

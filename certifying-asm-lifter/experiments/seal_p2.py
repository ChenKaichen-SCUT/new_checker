"""Publication integrity; preserve every historical evidence byte."""
import hashlib
import json
import re
import subprocess
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.evidence import save_json
from certification.provenance import require
from experiments.certify_p0 import THEOREM_SHA256

BASELINE = "884c06a8d2076c8f9443bfbfc30637151d89c73d"


def git(*args):
    return subprocess.check_output(["git", *args], cwd=ROOT.parent)


def paths():
    return sorted(set(git("ls-files", "--cached", "--others", "--exclude-standard", "-z").decode().strip("\0").split("\0")))


def main():
    prefix = ROOT.name + "/"
    allowed = {"AGENTS.md", "README.md"} | {prefix + p for p in (
        "README.md", "docs/00-progress.md", "artifact-manifest.json",
        "backend/dat3m/build_acceptance.py", "backend/dat3m/p0_instrument.py",
        "certification/p0_host.py", "certification/p0_queries.py", "certification/p1_entry.py",
        "certification/run_pipeline.py", "checker/check.py", "experiments/capture_ck.py",
        "experiments/certify_p1.py", "tests/test_p1_entry.py")}
    protected, changed = [], []
    for row in git("ls-tree", "-r", "-z", BASELINE).split(b"\0"):
        if not row:
            continue
        header, name = row.split(b"\t", 1)
        _, kind, blob = header.split()
        name = name.decode()
        p = ROOT.parent / name
        require(kind == b"blob" and p.is_file(), "missing baseline object " + name)
        data = p.read_bytes()
        actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
        if actual != blob.decode():
            require(name in allowed, "historical mutation " + name)
            changed.append(name)
        else:
            protected.append(name)
    require(sha((ROOT / "docs/system-review/01-end-to-end-guarantee.md").read_bytes()) == THEOREM_SHA256, "theorem changed")
    require(json.loads((ROOT / "experiments/p2/evidence-review.json").read_bytes())["result"] == "REVIEWED", "review missing")
    old_raw = git("show", BASELINE + ":" + prefix + "artifact-manifest.json")
    old = json.loads(old_raw)
    historical = [r for r in old["files"] if r["path"].startswith("experiments/") and prefix + r["path"] not in allowed]
    require(all(sha((ROOT / r["path"]).read_bytes()) == r["sha256"] for r in historical), "historical experiment bytes changed")
    save_json(ROOT / "experiments/p2/integrity.json", {
        "result": "STATIC_INTEGRITY_CHECKED", "baseline": BASELINE,
        "protected_baseline_files": len(protected), "historical_experiment_files": len(historical),
        "original_theorem_sha256": THEOREM_SHA256, "allowed_updates": sorted(allowed),
        "changed_baseline_paths_before_manifest": sorted(changed),
        "note": "All old raw evidence and old proofs byte-identical; old eligibility is explicitly contracted in new documents."})

    def entries(selected):
        rows = []
        for name in selected:
            p = ROOT.parent / name
            data = p.read_bytes()
            require(len(data) < 100_000_000, "GitHub file size limit " + name)
            rows.append({"path": p.relative_to(ROOT).as_posix(), "sha256": sha(data), "bytes": len(data)})
        return rows

    manifest = prefix + "experiments/p2/manifest.json"
    selected = [p for p in paths() if p.startswith(prefix + "experiments/p2/") and p != manifest]
    save_json(ROOT / "experiments/p2/manifest.json", {
        "baseline": BASELINE, "final_suites": ["experiments/p2/" + s + "-02" for s in (
            "final-readonly", "final-multi", "final-workers", "regression-p0", "regression-legacy-p1")],
        "external": "experiments/p2/external-client", "unit_tests": "experiments/p2/unit-final-02",
        "status": "restricted-conflict-free-input-and-distinct-workers-conditional-safe; external-client-REJECT; STOP",
        "superseded_new_runs_retained": "development-* and suites without -02 retain pre-byte-hash-repair evidence; not current final authorization",
        "files": entries(selected)})
    all_files = entries([p for p in paths() if p.startswith(prefix) and p != prefix + "artifact-manifest.json"])
    save_json(ROOT / "artifact-manifest.json", {
        "manifest_version": 11, "date": "2026-10-20", "baseline_commit": BASELINE,
        "status": "source-risk-repair-distinct-workers-external-client-audit-delivered; STOP-for-review",
        "previous_manifest_sha256": sha(old_raw), "previous_manifest_version": old["manifest_version"], "files": all_files})
    broken = []
    for p in [*sorted((ROOT / "docs/p2").glob("*.md")), ROOT / "README.md", ROOT.parent / "README.md"]:
        for target in re.findall(r"\[[^\]]*\]\(([^)]+)\)", p.read_text(encoding="utf-8")):
            if "://" in target or target.startswith("#"):
                continue
            if not (p.parent / target.partition("#")[0]).resolve().exists():
                broken.append((str(p), target))
    require(not broken, "broken links " + str(broken))
    print(json.dumps({"protected_baseline_files": len(protected), "historical_experiment_files": len(historical),
                      "new_evidence_files": len(selected), "manifest_files": len(all_files), "broken_links": len(broken)}))


if __name__ == "__main__":
    main()

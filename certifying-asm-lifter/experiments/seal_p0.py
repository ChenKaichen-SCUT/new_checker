"""Static publication seal; preserves baseline raw evidence and the original theorem."""
import hashlib
import json
import re
import subprocess
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.evidence import save_json
from certification.provenance import require
from experiments.certify_p0 import BASELINE, THEOREM_SHA256


def git(*args):
    return subprocess.check_output(["git", *args], cwd=ROOT.parent)


def paths():
    return sorted(set(git("ls-files", "--cached", "--others", "--exclude-standard", "-z")
                      .decode("utf-8").strip("\0").split("\0")))


def main():
    prefix = ROOT.name + "/"
    changed_allowed = {
        "AGENTS.md", prefix + "README.md", prefix + "docs/00-progress.md",
        prefix + "backend/dat3m/README.md", prefix + "backend/dat3m/build_acceptance.py",
        prefix + "certification/run_pipeline.py", prefix + "experiments/capture_ck.py",
        prefix + "artifact-manifest.json",
    }
    protected, changed = [], []
    for row in git("ls-tree", "-r", "-z", BASELINE).split(b"\0"):
        if not row:
            continue
        head, raw_path = row.split(b"\t", 1)
        _, kind, blob = head.split()
        require(kind == b"blob", "unexpected baseline tree entry")
        name = raw_path.decode("utf-8")
        p = ROOT.parent / name
        require(p.is_file(), "deleted baseline artifact: " + name)
        data = p.read_bytes()
        actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
        if actual != blob.decode():
            require(name in changed_allowed, "unapproved baseline mutation: " + name)
            changed.append(name)
        elif name not in changed_allowed:
            protected.append(name)
    require(sha((ROOT / "docs/system-review/01-end-to-end-guarantee.md").read_bytes()) == THEOREM_SHA256,
            "baseline theorem changed")
    broken = []
    for p in (ROOT / "docs/p0").glob("*.md"):
        for target in re.findall(r"\[[^\]]*\]\(([^)]+)\)", p.read_text(encoding="utf-8")):
            if "://" in target or target.startswith("#"):
                continue
            if not (p.parent / target.partition("#")[0]).resolve().exists():
                broken.append({"file": p.relative_to(ROOT).as_posix(), "target": target})
    require(not broken, "broken delivery links")
    review = json.loads((ROOT / "experiments/p0/evidence-review/review.json").read_bytes())
    require(review["result"] == "REVIEWED", "evidence audit incomplete")
    old_manifest_raw = git("show", BASELINE + ":" + prefix + "artifact-manifest.json")
    old_manifest = json.loads(old_manifest_raw)
    historical = [x for x in old_manifest["files"] if x["path"].startswith("experiments/")
                  and prefix + x["path"] not in changed_allowed]
    require(all(sha((ROOT / x["path"]).read_bytes()) == x["sha256"] for x in historical),
            "historical experimental evidence changed")
    save_json(ROOT / "experiments/p0/integrity.json", {
        "result": "STATIC_INTEGRITY_CHECKED", "baseline": BASELINE,
        "protected_baseline_files": len(protected), "historical_experiment_files": len(historical),
        "original_theorem_sha256": THEOREM_SHA256, "broken_delivery_links": broken,
        "allowed_updated_baseline_paths": sorted(changed_allowed),
        "checked_changed_paths_before_manifest_refresh": sorted(changed),
        "note": "No compiler/backend/SMT execution. Byte preservation is not a semantic correctness proof."})

    def entries(selected):
        result = []
        for name in selected:
            p = ROOT.parent / name
            require(p.is_file(), "missing publication file: " + name)
            data = p.read_bytes()
            result.append({"path": p.relative_to(ROOT).as_posix(), "sha256": sha(data), "bytes": len(data)})
        return result

    p0 = prefix + "experiments/p0/"
    save_json(ROOT / "experiments/p0/manifest.json", {
        "baseline": BASELINE, "final_acceptance": "experiments/p0/final-reviewed",
        "status": "conditional-safe-only-under-original-Gamma; minimal-acceptance-complete; STOP",
        "files": entries([p for p in paths() if p.startswith(p0) and p != p0 + "manifest.json"])})
    all_files = entries([p for p in paths() if p.startswith(prefix) and p != prefix + "artifact-manifest.json"])
    save_json(ROOT / "artifact-manifest.json", {
        "manifest_version": 9, "date": "2026-10-20", "baseline_commit": BASELINE,
        "status": "P0-conditional-program-gate-implemented-and-minimally-accepted; original-Gamma-retained; STOP-for-review",
        "previous_manifest_sha256": sha(old_manifest_raw), "previous_manifest_version": old_manifest["manifest_version"],
        "files": all_files})
    print(json.dumps({"protected_baseline_files": len(protected), "historical_experiment_files": len(historical),
                      "manifest_files": len(all_files), "broken_links": len(broken)}, indent=2))


if __name__ == "__main__":
    main()

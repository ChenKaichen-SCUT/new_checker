"""Static P1 publication seal, retaining every baseline evidence byte."""
import hashlib
import json
import re
import subprocess
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.evidence import save_json
from certification.provenance import require
from experiments.certify_p0 import THEOREM_SHA256

BASELINE = "274a5a58c27637ab8d45a988c3be393aa981b913"


def git(*args):
    return subprocess.check_output(["git", *args], cwd=ROOT.parent)


def paths():
    return sorted(set(git("ls-files", "--cached", "--others", "--exclude-standard", "-z")
                      .decode().strip("\0").split("\0")))


def main():
    prefix = ROOT.name + "/"
    allowed = {"AGENTS.md", "README.md"} | {prefix + p for p in (
        "README.md", "docs/00-progress.md", "backend/dat3m/README.md",
        "backend/dat3m/build_acceptance.py", "backend/dat3m/p0_instrument.py",
        "certification/endpoints.py", "certification/interface.py", "certification/p0_host.py",
        "certification/p0_queries.py", "certification/prepare.py", "certification/run_pipeline.py",
        "experiments/capture_ck.py", "artifact-manifest.json")}
    protected, changed = [], []
    for row in git("ls-tree", "-r", "-z", BASELINE).split(b"\0"):
        if not row:
            continue
        header, path = row.split(b"\t", 1)
        _, kind, blob = header.split()
        require(kind == b"blob", "non-file baseline object")
        name = path.decode()
        p = ROOT.parent / name
        require(p.is_file(), "deleted baseline artifact: " + name)
        data = p.read_bytes()
        actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
        if actual != blob.decode():
            require(name in allowed, "unapproved historical mutation: " + name)
            changed.append(name)
        else:
            protected.append(name)
    theorem = ROOT / "docs/system-review/01-end-to-end-guarantee.md"
    require(sha(theorem.read_bytes()) == THEOREM_SHA256, "original theorem changed")
    review = json.loads((ROOT / "experiments/p1b/evidence-review.json").read_bytes())
    require(review["result"] == "REVIEWED", "evidence review missing")
    old_raw = git("show", BASELINE + ":" + prefix + "artifact-manifest.json")
    old = json.loads(old_raw)
    historical = [r for r in old["files"] if r["path"].startswith("experiments/")
                  and prefix + r["path"] not in allowed]
    require(all(sha((ROOT / r["path"]).read_bytes()) == r["sha256"] for r in historical),
            "historical experiment changed")
    save_json(ROOT / "experiments/p1b/integrity.json", {
        "result": "STATIC_INTEGRITY_CHECKED", "baseline": BASELINE,
        "protected_baseline_files": len(protected), "historical_experiment_files": len(historical),
        "original_theorem_sha256": THEOREM_SHA256, "allowed_updates": sorted(allowed),
        "changed_baseline_paths_before_manifest": sorted(changed),
        "note": "All historical experiments, including P0 captures/certificates/logs, byte-identical."})

    def entries(selected):
        rows = []
        for name in selected:
            p = ROOT.parent / name
            data = p.read_bytes()
            require(len(data) < 100_000_000, "publication file exceeds GitHub per-file limit")
            rows.append({"path": p.relative_to(ROOT).as_posix(), "sha256": sha(data), "bytes": len(data)})
        return rows

    manifest = prefix + "experiments/p1b/manifest.json"
    selected = [p for p in paths() if p.startswith((prefix + "experiments/p1a/", prefix + "experiments/p1b/"))
                and p != manifest]
    save_json(ROOT / "experiments/p1b/manifest.json", {
        "baseline": BASELINE, "final_p1a": "experiments/p1b/regression-p1a",
        "final_p1b": "experiments/p1b/acceptance-01", "p0_regression": "experiments/p1b/regression-p0",
        "status": "D1a-and-restricted-D1b-conditional-safe-original-Gamma; STOP",
        "files": entries(selected)})
    all_files = entries([p for p in paths() if p.startswith(prefix) and p != prefix + "artifact-manifest.json"])
    save_json(ROOT / "artifact-manifest.json", {
        "manifest_version": 10, "date": "2026-10-20", "baseline_commit": BASELINE,
        "status": "P1a-P1b-restricted-conditional-transfer-delivered; STOP-for-review",
        "previous_manifest_sha256": sha(old_raw), "previous_manifest_version": old["manifest_version"],
        "files": all_files})
    broken = []
    for p in [*sorted((ROOT / "docs/p1").glob("*.md")), ROOT / "README.md", ROOT.parent / "README.md"]:
        for target in re.findall(r"\[[^\]]*\]\(([^)]+)\)", p.read_text(encoding="utf-8")):
            if "://" in target or target.startswith("#"):
                continue
            if not (p.parent / target.partition("#")[0]).resolve().exists():
                broken.append((str(p), target))
    require(not broken, "broken delivery links: " + str(broken))
    print(json.dumps({"protected_baseline_files": len(protected),
                      "historical_experiment_files": len(historical), "new_evidence_files": len(selected),
                      "manifest_files": len(all_files), "broken_links": len(broken)}, indent=2))


if __name__ == "__main__":
    main()

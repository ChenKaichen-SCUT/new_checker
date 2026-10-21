"""Seal Scheme A without rewriting any prior raw evidence or theorem."""
import hashlib
import json
import re
import subprocess
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.evidence import save_json
from certification.provenance import require
from experiments.certify_p0 import THEOREM_SHA256

BASELINE = "8412b600293161e173ed7f7b94bb3c316d46f796"


def git(*args): return subprocess.check_output(["git", *args], cwd=ROOT.parent)


def paths():
    return sorted(set(git("ls-files", "--cached", "--others", "--exclude-standard", "-z").decode().strip("\0").split("\0")))


def main():
    prefix = ROOT.name + "/"
    allowed = {"AGENTS.md", "README.md"} | {prefix + p for p in (
        "README.md", "docs/00-progress.md", "artifact-manifest.json", "certification/prepare.py",
        "certification/p1_entry.py", "experiments/capture_ck.py")}
    protected, changed = [], []
    for row in git("ls-tree", "-r", "-z", BASELINE).split(b"\0"):
        if not row: continue
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
        else: protected.append(name)
    require(sha((ROOT / "docs/system-review/01-end-to-end-guarantee.md").read_bytes()) == THEOREM_SHA256, "theorem changed")
    require(json.loads((ROOT / "experiments/hcc/evidence-review.json").read_bytes())["result"] == "REVIEWED", "review missing")
    old_raw = git("show", BASELINE + ":" + prefix + "artifact-manifest.json")
    old = json.loads(old_raw)
    historical = [r for r in old["files"] if r["path"].startswith("experiments/") and prefix + r["path"] not in allowed]
    require(all(sha((ROOT / r["path"]).read_bytes()) == r["sha256"] for r in historical), "historical evidence bytes")
    save_json(ROOT / "experiments/hcc/integrity.json", {"result": "STATIC_INTEGRITY_CHECKED", "baseline": BASELINE,
              "protected_baseline_files": len(protected), "historical_experiment_files": len(historical),
              "original_theorem_sha256": THEOREM_SHA256, "allowed_updates": sorted(allowed),
              "changed_baseline_paths_before_manifest": changed})

    def entries(names):
        rows = []
        for name in names:
            p = ROOT.parent / name
            data = p.read_bytes()
            require(len(data) < 100_000_000, "oversized artifact " + name)
            rows.append({"path": p.relative_to(ROOT).as_posix(), "sha256": sha(data), "bytes": len(data)})
        return rows

    manifest = prefix + "experiments/hcc/manifest.json"
    selected = [p for p in paths() if p.startswith(prefix + "experiments/hcc/") and p != manifest]
    save_json(ROOT / "experiments/hcc/manifest.json", {"baseline": BASELINE, "final_suite": "experiments/hcc/final-01",
              "status": "explicit-HCC-local-reuse-delivered; broader-program-SAFE-NO_GO; STOP",
              "external_client": "unchanged experiments/p2/external-client; revalidated; 0/1",
              "branch_backend": "branch-backend-01: PASS text but ITEExpr incomplete, capture rejected",
              "development": "development-* kept, final-01 is acceptance; unit-hcc-raw-01 includes deliberate mutations",
              "files": entries(selected)})
    all_files = entries([p for p in paths() if p.startswith(prefix) and p != prefix + "artifact-manifest.json"])
    save_json(ROOT / "artifact-manifest.json", {"manifest_version": 12, "date": "2026-10-20", "baseline_commit": BASELINE,
              "status": "Scheme-A-local-reuse-HCC-delivered; program-expansion-NO_GO; STOP-for-review",
              "previous_manifest_sha256": sha(old_raw), "previous_manifest_version": old["manifest_version"], "files": all_files})
    broken = []
    for p in [*sorted((ROOT / "docs/hcc").glob("*.md")), ROOT / "README.md", ROOT.parent / "README.md"]:
        for target in re.findall(r"\[[^\]]*\]\(([^)]+)\)", p.read_text(encoding="utf-8")):
            if "://" in target or target.startswith("#"): continue
            if not (p.parent / target.partition("#")[0]).resolve().exists(): broken.append((str(p), target))
    require(not broken, "broken links " + str(broken))
    print(json.dumps({"protected_files": len(protected), "historical_evidence": len(historical),
                      "new_evidence": len(selected), "all_files": len(all_files), "broken_links": len(broken)}))


if __name__ == "__main__": main()

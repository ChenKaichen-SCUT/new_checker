"""Seal the graded delivery and verify every frozen baseline artifact."""
import hashlib
import json
import re
import subprocess
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.evidence import save_json
from certification.provenance import require
from experiments.certify_p0 import THEOREM_SHA256

BASELINE = "795e2a9ee95ba7446d4964430f7bda78bf6ddf76"


def git(*args): return subprocess.check_output(["git", *args], cwd=ROOT.parent)


def paths():
    return sorted(set(git("ls-files", "--cached", "--others", "--exclude-standard", "-z").decode().strip("\0").split("\0")))


def main():
    prefix = ROOT.name + "/"
    allowed = {"AGENTS.md", "README.md"} | {prefix+p for p in (
        "README.md", "docs/00-progress.md", "artifact-manifest.json",
        "backend/dat3m/Snapshot.java", "backend/dat3m/build_acceptance.py", "backend/dat3m/p0_instrument.py",
        "certification/continuation.py", "certification/interface.py", "certification/local_ports.py",
        "certification/run_pipeline.py", "tests/test_checker.py")}
    protected, changed = [], []
    for row in git("ls-tree", "-r", "-z", BASELINE).split(b"\0"):
        if not row: continue
        header, name = row.split(b"\t", 1); _, kind, blob = header.split(); name = name.decode()
        p = ROOT.parent / name
        require(kind == b"blob" and p.is_file(), "missing baseline object " + name)
        data = p.read_bytes()
        actual = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
        if actual != blob.decode():
            require(name in allowed, "historical mutation " + name); changed.append(name)
        else: protected.append(name)
    require(sha((ROOT / "docs/system-review/01-end-to-end-guarantee.md").read_bytes()) == THEOREM_SHA256, "theorem changed")
    review = json.loads((ROOT / "experiments/levels/evidence-review.json").read_bytes())
    require(review["result"] == "REVIEWED" and review["cases"] == 16 and review["unit_tests"] == 129, "review missing")
    old_raw = git("show", BASELINE + ":" + prefix + "artifact-manifest.json"); old = json.loads(old_raw)
    historical = [r for r in old["files"] if r["path"].startswith("experiments/")]
    require(all(sha((ROOT / r["path"]).read_bytes()) == r["sha256"] for r in historical), "historical evidence changed")
    save_json(ROOT / "experiments/levels/integrity.json", {
        "result":"STATIC_INTEGRITY_CHECKED", "baseline":BASELINE,
        "protected_baseline_files":len(protected), "historical_experiment_files":len(historical),
        "original_theorem_sha256":THEOREM_SHA256, "allowed_updates":sorted(allowed),
        "changed_baseline_paths_before_manifest":changed})

    def entries(names):
        rows=[]
        for name in names:
            p=ROOT.parent/name; data=p.read_bytes()
            require(len(data)<100_000_000, "oversized artifact "+name)
            rows.append({"path":p.relative_to(ROOT).as_posix(),"sha256":sha(data),"bytes":len(data)})
        return rows

    manifest=prefix+"experiments/levels/manifest.json"
    selected=[p for p in paths() if p.startswith(prefix+"experiments/levels/") and p!=manifest]
    save_json(ROOT / "experiments/levels/manifest.json", {
        "baseline":BASELINE,"final_suite":"experiments/levels/final-04",
        "external":["experiments/levels/client-reuse-04","experiments/levels/client-per-site-04"],
        "comparison":"experiments/levels/comparison-02","LLVM_faults":"experiments/levels/llvm-faults-02",
        "unit_results":"experiments/levels/final-local-04/002.stdout.log; raw unit-raw-04",
        "status":"graded-certification-delivered; full-client-L3-L4-closed; STOP",
        "development":"all other numbered runs retained; superseded, not final acceptance; unit raw includes intentional mutations",
        "files":entries(selected)})
    all_files=entries([p for p in paths() if p.startswith(prefix) and p!=prefix+"artifact-manifest.json"])
    save_json(ROOT / "artifact-manifest.json", {
        "manifest_version":13,"date":"2026-10-21","baseline_commit":BASELINE,
        "status":"L1-L4-delivered; real-client-6-of-113-local; no-full-client-SAFE; STOP-for-review",
        "previous_manifest_sha256":sha(old_raw),"previous_manifest_version":old["manifest_version"],"files":all_files})
    broken=[]
    for p in [*sorted((ROOT/"docs/levels").glob("*.md")),ROOT/"README.md",ROOT.parent/"README.md"]:
        for target in re.findall(r"\[[^\]]*\]\(([^)]+)\)",p.read_text(encoding="utf-8")):
            if "://" in target or target.startswith("#"): continue
            if not (p.parent/target.partition("#")[0]).resolve().exists(): broken.append((str(p),target))
    require(not broken,"broken links "+str(broken))
    print(json.dumps({"protected_files":len(protected),"historical_evidence":len(historical),
                      "new_evidence":len(selected),"all_files":len(all_files),"broken_links":len(broken)}))


if __name__ == "__main__": main()

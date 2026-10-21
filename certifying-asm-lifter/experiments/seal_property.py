"""Seal this narrow property delivery; retain every frozen raw artifact."""
import hashlib
import json
import re
import subprocess
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.evidence import save_json
from certification.provenance import require
from experiments.certify_p0 import THEOREM_SHA256

BASELINE="51d8c63c796877f7fa6fcb9d4d1195ac3cce68d2"


def git(*args):return subprocess.check_output(["git",*args],cwd=ROOT.parent)


def paths():
    return sorted(set(git("ls-files","--cached","--others","--exclude-standard","-z").decode().strip("\0").split("\0")))


def main():
    prefix=ROOT.name+"/"
    allowed={"AGENTS.md","README.md"}|{prefix+p for p in (
        "README.md","docs/00-progress.md","artifact-manifest.json",
        "backend/dat3m/build_acceptance.py","backend/dat3m/p0_instrument.py",
        "certification/p1_entry.py","certification/p0_queries.py","certification/run_pipeline.py",
        "experiments/capture_ck.py")}
    protected,changed=[],[]
    for row in git("ls-tree","-r","-z",BASELINE).split(b"\0"):
        if not row:continue
        header,name=row.split(b"\t",1);_,kind,blob=header.split();name=name.decode()
        p=ROOT.parent/name;require(kind==b"blob" and p.is_file(),"missing baseline object "+name)
        data=p.read_bytes();actual=hashlib.sha1(b"blob "+str(len(data)).encode()+b"\0"+data).hexdigest()
        if actual!=blob.decode():require(name in allowed,"historical mutation "+name);changed.append(name)
        else:protected.append(name)
    require(sha((ROOT/"docs/system-review/01-end-to-end-guarantee.md").read_bytes())==THEOREM_SHA256,"original theorem changed")
    review=json.loads((ROOT/"experiments/property/evidence-review.json").read_bytes())
    require(review["result"]=="REVIEWED" and review["cases"]==16 and review["unit_tests"]==144
            and review["raw_object_replays"]==16,"final review missing")
    old_raw=git("show",BASELINE+":"+prefix+"artifact-manifest.json");old=json.loads(old_raw)
    historical=[r for r in old["files"] if r["path"].startswith("experiments/") and r["path"]!="experiments/capture_ck.py"]
    require(all(sha((ROOT/r["path"]).read_bytes())==r["sha256"] for r in historical),"historical experiment bytes changed")
    save_json(ROOT/"experiments/property/integrity.json",{
        "result":"STATIC_INTEGRITY_CHECKED","baseline":BASELINE,"protected_baseline_files":len(protected),
        "historical_experiment_files":len(historical),"historical_raw_exceptions":[],
        "authorized_experiment_driver_update":"experiments/capture_ck.py (source code, not a capture)",
        "original_theorem_sha256":THEOREM_SHA256,"allowed_updates":sorted(allowed),
        "changed_baseline_paths_before_manifest":changed})

    def entries(names):
        rows=[]
        for name in names:
            p=ROOT.parent/name;data=p.read_bytes();require(len(data)<100_000_000,"oversized artifact "+name)
            rows.append({"path":p.relative_to(ROOT).as_posix(),"sha256":sha(data),"bytes":len(data)})
        return rows

    manifest=prefix+"experiments/property/manifest.json"
    selected=[p for p in paths() if p.startswith(prefix+"experiments/property/") and p!=manifest]
    save_json(ROOT/"experiments/property/manifest.json",{
        "baseline":BASELINE,"final_suite":"experiments/property/final-02",
        "raw_object_replay":"experiments/property/replay-01","legacy":"experiments/property/legacy-01",
        "unit_results":"experiments/property/unit-commands-02/000.stdout.log; raw unit-raw-02",
        "status":"restricted-PD-SAFE-delivered; independent-novelty-NO_GO; STOP",
        "development":"all other numbered/development runs retained; superseded, not final acceptance; negative unit artifacts are mutations",
        "files":entries(selected)})
    all_files=entries([p for p in paths() if p.startswith(prefix) and p!=prefix+"artifact-manifest.json"])
    save_json(ROOT/"artifact-manifest.json",{
        "manifest_version":14,"date":"2026-10-21","baseline_commit":BASELINE,
        "status":"property-specific-conditional-theorem-and-prototype; legacy-levels-preserved; STOP-for-review",
        "previous_manifest_sha256":sha(old_raw),"previous_manifest_version":old["manifest_version"],"files":all_files})
    broken=[]
    for p in [*sorted((ROOT/"docs/property").glob("*.md")),ROOT/"README.md",ROOT.parent/"README.md"]:
        for target in re.findall(r"\[[^\]]*\]\(([^)]+)\)",p.read_text(encoding="utf-8")):
            if "://" in target or target.startswith("#"):continue
            if not (p.parent/target.partition("#")[0]).resolve().exists():broken.append((str(p),target))
    require(not broken,"broken links "+str(broken))
    print(json.dumps({"protected_files":len(protected),"historical_evidence":len(historical),
        "new_evidence":len(selected),"all_files":len(all_files),"broken_links":len(broken)}))


if __name__=="__main__":main()

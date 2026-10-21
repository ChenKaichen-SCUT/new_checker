"""Pinned build: read-only positive hooks, or explicitly separate fault profile."""
import argparse
import hashlib
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
from certification.evidence import Commands, save_json
from certification.interface import sha
from experiments.run_dat3m import linux
from frontend.gnu import Reject
from backend.dat3m.instrument import install, REL


def build(upstream, tree_index, destination, evidence, fault_injection=False, p0=False, p1=False, p1b=False, p2=False):
    upstream, destination, evidence = map(lambda p: Path(p).resolve(),
                                         (upstream, destination, evidence))
    if destination.exists() or evidence.exists():
        raise Reject("fresh build and evidence directories required")
    index_bytes = Path(tree_index).read_bytes()
    index = json.loads(index_bytes)
    pins = json.loads((ROOT / "backend/dat3m/pins.json").read_bytes())
    if index["sha"] != pins["commit"] or index.get("truncated"):
        raise Reject("incomplete or incorrect upstream tree index")
    # Maven reactor also reads the unbuilt sibling module POMs.
    selected = [e for e in index["tree"] if e["type"] == "blob"
                and (e["path"] in {"pom.xml", "LICENCE", "compilation.yml", "ui/pom.xml", "svcomp/pom.xml"}
                     or e["path"].startswith(("dartagnan/src/main/", "dartagnan/pom.xml",
                                              "cat/", ".mvn/")))]
    files = {}
    for entry in selected:
        rel = entry["path"]
        source, target = (upstream / rel).resolve(), (destination / rel).resolve()
        if not source.is_relative_to(upstream) or not target.is_relative_to(destination):
            raise Reject("upstream path traversal")
        data = source.read_bytes()
        blob = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
        if blob != entry["sha"]:
            raise Reject("upstream source differs from pinned Git blob: " + rel)
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(data)
        files[rel] = {"git_blob": blob, "sha256": sha(data)}
    evidence.mkdir(parents=True)
    save_json(evidence / "upstream-inputs.json", {
        "commit": pins["commit"], "tree_index_sha256": sha(index_bytes), "files": files,
        "provenance": "cached GitHub recursive tree; source bytes checked against Git blob IDs"})
    receipt = {"commit": pins["commit"], "status": "REJECT", "input_count": len(files),
               "upstream_inputs_sha256": sha((evidence / "upstream-inputs.json").read_bytes())}
    try:
        if p0 or p1 or p1b or p2:
            from backend.dat3m.p0_instrument import install_p0
            receipt["instrumentation"] = install_p0(destination, fault_injection=fault_injection,
                                                    fault_class="P2Faults" if p2 else "P1bFaults" if p1b else "P1Faults" if p1 else "P0Faults")
        else:
            receipt["instrumentation"] = install(destination, fault_injection=fault_injection)
        logs = Commands(evidence / "commands")
        logs.run(["wsl", "-d", "Ubuntu", "--", "java", "-version"])
        mvn = ROOT / "vendor/apache-maven-3.9.9/bin/mvn"
        receipt["maven_script_sha256"] = sha(mvn.read_bytes())
        logs.run(["wsl", "-d", "Ubuntu", "--", "sh", linux(mvn),
                  "-B", "-ntp", "-f", linux(destination / "pom.xml"), "-pl", "dartagnan", "-am",
                  "-Dmaven.test.skip=true", "-Dmaven.gitcommitid.skip=true", "package"],
                 timeout=600)
        # Source must remain unchanged throughout the trusted build.
        for rel, hashes in files.items():
            expected = (receipt["instrumentation"]["instrumented_sha256"]
                        if rel == REL else hashes["sha256"])
            if sha((destination / rel).read_bytes()) != expected:
                raise Reject("build changed a source input: " + rel)
        exporter = destination / "dartagnan/src/main/java/certifying/Snapshot.java"
        if sha(exporter.read_bytes()) != receipt["instrumentation"]["exporter_sha256"]:
            raise Reject("exporter changed during build")
        for name, digest in receipt["instrumentation"].get("additional_sources", {}).items():
            if sha((exporter.parent / name).read_bytes()) != digest:
                raise Reject("P0 audit source changed during build")
        if fault_injection and not (p0 or p1 or p1b or p2):
            faults = destination / "dartagnan/src/main/java/certifying/ControlledFaults.java"
            if sha(faults.read_bytes()) != receipt["instrumentation"]["fault_source_sha256"]:
                raise Reject("fault injector changed during build")
        artifacts = [destination / "dartagnan/target/dartagnan.jar",
                     *sorted((destination / "dartagnan/target/libs").glob("*"))]
        receipt["runtime_artifacts"] = {
            p.relative_to(destination).as_posix(): sha(p.read_bytes())
            for p in artifacts if p.is_file()}
        receipt["runtime_artifacts"]["compilation.yml"] = sha((destination / "compilation.yml").read_bytes())
        receipt["status"] = ("BUILT_PINNED_WITH_CONTROLLED_FAULTS" if fault_injection
                             else "BUILT_PINNED_WITH_DECLARED_HOOKS")
    except Exception as error:
        receipt["reason"] = str(error)
        raise
    finally:
        save_json(evidence / "build-receipt.json", receipt)
    return receipt


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("--upstream", required=True, type=Path)
    p.add_argument("--tree-index", required=True, type=Path)
    p.add_argument("--destination", required=True, type=Path)
    p.add_argument("--evidence", required=True, type=Path)
    p.add_argument("--controlled-fault-build", action="store_true")
    p.add_argument("--p0-query-audit", action="store_true")
    p.add_argument("--p1-query-audit", action="store_true")
    p.add_argument("--p1b-query-audit", action="store_true")
    p.add_argument("--p2-query-audit", action="store_true")
    a = p.parse_args()
    result = build(a.upstream, a.tree_index, a.destination, a.evidence,
                   a.controlled_fault_build, a.p0_query_audit, a.p1_query_audit, a.p1b_query_audit, a.p2_query_audit)
    print(json.dumps({k: result[k] for k in ("commit", "status", "input_count")}, indent=2))

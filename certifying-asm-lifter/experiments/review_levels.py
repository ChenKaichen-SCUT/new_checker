"""Independent artifact/census/fault audit; not a substitute for semantic proof."""
import json
import re
from collections import Counter
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.evidence import save_json
from certification.provenance import require
from experiments.certify_p0 import GAMMA, THEOREM_SHA256
from experiments.review_p2 import delta

BASE = ROOT / "experiments/levels"


def read(p): return json.loads(p.read_bytes())


def objects(x):
    if isinstance(x, dict):
        yield x
        for v in x.values(): yield from objects(v)
    elif isinstance(x, list):
        for v in x: yield from objects(v)


def implementation(p):
    for name, digest in read(p / "implementation.json").items():
        require(sha((p / "implementation-sources" / name).read_bytes()) == digest
                and sha((ROOT / name).read_bytes()) == digest, "stale implementation " + name)


def obligations(p):
    count = 0
    for f in [*p.rglob("certificate.json"), *p.rglob("block-certificate.json")]:
        c = read(f); ref = c.get("template_reference")
        base = ROOT / ref["evidence_directory"] if ref else f.parent
        if ref:
            original = read(base / "certificate.json")
            require(sha((base / "certificate.json").read_bytes()) == ref["certificate_sha256"], "template mutation")
            sig = read(base / "signature.json")
            require(sha(json.dumps(sig, sort_keys=True, separators=(",", ":")).encode()) == ref["key"], "template key")
            require(c["obligations"] == original["obligations"], "template obligations changed")
        for o in c.get("obligations", []):
            if "file" in o:
                require(sha((base / o["file"]).read_bytes()) == o["smt_sha256"], "SMT bytes")
                count += 1
    return count


def metrics(p):
    certs = list(p.rglob("*certificate.json"))
    # Actual persisted proof queries, excluding backend safety queries and code snapshots.
    smt = [q for q in p.rglob("*.smt2") if "backend" not in q.relative_to(p).parts]
    template_certs = [q for q in p.rglob("certificate.json") if (q.parent / "signature.json").exists()]
    per_call = list(p.glob("preparation/translation/call-*/block/certificate.json"))
    per_call = [q for q in per_call if not read(q).get("template_reference")]
    return {"certificate_bytes": sum(q.stat().st_size for q in certs),
            "local_smt_files": len(smt), "local_smt_bytes": sum(q.stat().st_size for q in smt),
            "distinct_block_proofs": len(template_certs) + len(per_call)}


def main():
    require(sha((ROOT / "docs/system-review/01-end-to-end-guarantee.md").read_bytes()) == THEOREM_SHA256, "theorem drift")
    frozen = read(BASE / "frozen-sites.json")
    expected = {r["id"]: r for r in frozen["sites"]}
    require(len(expected) == 113 and sum(r["supported_instruction_family"] for r in expected.values()) == 8, "denominator")
    for tu in (0, 1):
        module = (ROOT / f"experiments/p2/external-client/tu-{tu}/source.ll").read_text(encoding="utf-8")
        actual = {i for i, line in enumerate(module.splitlines())
                  if re.search(r"\b(?:call|invoke|callbr)\b.*\basm\b", line)}
        require(actual == {r["llvm_line_index"] for r in expected.values() if r["tu"] == tu},
                "frozen census omitted or invented an actual asm site")
    refs, external = 0, []
    for mode in ("client-reuse-04", "client-per-site-04"):
        p = BASE / mode; implementation(p); refs += obligations(p)
        c = read(p / "results.json")
        require(c["frozen_manifest_sha256"] == sha((BASE / "frozen-sites.json").read_bytes()), "census binding")
        require(len(c["sites"]) == 113 and {r["id"] for r in c["sites"]} == set(expected), "site omission")
        reasons = Counter(); certfiles = []
        for r in c["sites"]:
            require(all(r[k] == v for k, v in expected[r["id"]].items()), "frozen site mutation")
            f = p / r["id"] / "level-certificate.json"; require(read(f) == r, "site certificate mismatch")
            require(not r["program_verdict_eligible"] and r["achieved_level"] <= 2, "full-client overclaim")
            certfiles.append({"path": f.relative_to(ROOT).as_posix(), "sha256": sha(f.read_bytes())})
            if r["achieved_level"] == 2:
                evidence = read(f.parent / "site-evidence.json")
                i = evidence["interface"]; require(i["result"] == "INTERFACE_MATCH", "interface")
                original = (ROOT / f"experiments/p2/external-client/tu-{r['tu']}/source.ll").read_bytes()
                # Use the authenticated receipt's exact artifact name if it differs.
                require(sha(original) == r["llvm_sha256"], "original module")
                candidate = (f.parent / "site/candidate.ll").read_bytes()
                fragment = (f.parent / "site/actual-fragment.ll").read_bytes()
                lines = original.decode().splitlines(); index = r["llvm_line_index"]
                replaced = "\n".join(lines[:index] + fragment.decode().rstrip("\n").splitlines() + lines[index+1:]) + "\n"
                require(candidate == replaced.encode(), "outside-site host frame changed")
                require(sha(candidate) == evidence["frame"]["target_module_sha256"], "candidate hash")
                commands = read(f.parent / "clang-validation/commands.json")
                require(len(commands) == 1 and commands[0]["returncode"] == 0 and "-disable-llvm-passes" in commands[0]["args"], "actual candidate validation")
                reasons["L2"] += 1
            else: reasons[r["reason"]] += 1
        require(c["counts"] == {"L1":6,"L2":6,"L3":0,"L4":0}, "unexpected coverage")
        save_json(p / "certificate-package.json", {
            "schema":"graded-local-package-v1", "source_capture":"experiments/p2/external-client",
            "level_definition_sha256":sha((ROOT / "docs/levels/01-levels-and-proof.md").read_bytes()),
            "original_eight_Gamma_unchanged":GAMMA, "additional_external_semantic_assumptions":[],
            "used_scope":"L1/L2: defined valid typed port inputs; source/metadata fidelity, ISA bridge, checker/capture/SMT TCB",
            "not_discharged":["whole C caller evaluation/control", "C race freedom", "full-client Q/activations", "host simulation", "actual safety/bound queries"],
            "verified_external_HCC_provider":None, "program_verdict_eligible":False,
            "certificates":certfiles})
        external.append({"mode":mode,"counts":c["counts"],"seconds":c["seconds"],"reasons":dict(reasons),**metrics(p)})
    require(external[0]["reasons"] == external[1]["reasons"], "reuse changed acceptance")

    suite = BASE / "final-04"; rows = read(suite / "results.json")
    require(len(rows) == 16, "incomplete final suite")
    faults = []; positive = []; branch_ites = 0
    for row in rows:
        p = suite / row["case"]; implementation(p); refs += obligations(p)
        c = read(p / "level-certificate.json")
        require(c["achieved_level"] == row["expected"] == row["level"], "wrong level")
        require(c["external_assumptions"] == GAMMA and not c["unconditional_safe"], "trust boundary changed")
        require(c["program_verdict_eligible"] == (c["achieved_level"] == 4), "gate leaked")
        qfile = p / "backend/snapshots/before-encoding.json"; q = read(qfile)
        require(q == read(p / "backend/snapshots/after-encoding.json") and q["run_id"] == c["backend"]["run_id"], "different Program/run")
        if c["achieved_level"] >= 3:
            r = read(p / "regions/certificate.json"); a = read(p / "activation/certificate.json")
            require(r["result"] == "TYPED_WORKERS_EXACT" and a["result"] == "FINITE_LLVM_ACTIVATIONS_EXACT", "L3 prerequisites")
            require(read(p / "partition/certificate.json")["result"] == "FINITE_MAIN_PARTITION_EXACT", "whole Q partition missing")
            require(c["L3_scope"]["q_sha256"] == sha(qfile.read_bytes()), "actual Q binding")
            ids = [(v["create_index"],v["worker_definition"],v["llvm_line_index"],v["thread"]) for v in r["regions"]]
            ends = [e for v in r["regions"] for e in (v["read"],v["write"])]
            require(len(ids) == len(set(ids)) and len(ends) == len(set(ends)), "certificate/endpoint reuse")
            if row["case"] == "branch":
                require(len(ids) == 4 and not c["L3_scope"]["source_worker_C_semantics_proved"], "branch scope")
                ites = [e for e in objects(q) if e.get("kind") == "ITE"]
                require(ites and all(e["complete"] and len(e["args"]) == 3 and e["register_dependencies"] for e in ites), "ITE absent/incomplete")
                branch_ites = len(ites)
        if c["achieved_level"] == 4 or row["case"] == "unsafe":
            queries = read(p / "queries/certificate.json")
            require(all(v["actual_result"].lower() == v["replay"] for v in queries["queries"]), "query result disagreement")
            require(queries["result"] == ("BOUND_SAFETY_AND_BOUND_UNSAT" if c["achieved_level"]==4 else "BOUND_SAFETY_QUERY_SAT"), "safety result")
        if not row["fault"]: positive.append({**row, **metrics(p)})
        else:
            d,x,y = delta(p); mode = row["fault"]
            require(d["objects_unchanged"], "fault changed object census")
            if mode in {"a-only","rmw-tag-only"}:
                tag = "A" if mode == "a-only" else "RMW"
                require(len(d["changed"])==2 and not d["removed"], "label fault count")
                for e in d["changed"]:
                    require(e["fields"]==["tags"] and set(x[e["event"]]["tags"])-set(y[e["event"]]["tags"])=={tag}, "nonisolated label")
                    require(x[e["event"]].get("rmw_load")==y[e["event"]].get("rmw_load"), "pair changed")
            elif mode in {"ite-swap","entry-ssa"}:
                fields = ["value"] if mode == "ite-swap" else ["reads", "value"]
                require(len(d["changed"])==1 and d["changed"][0]["fields"]==fields and not d["removed"], "nonisolated value fault")
            elif mode in {"ite-missing-dependency","ite-wrong-type","ite-truncated","safety-query-binding"}:
                require(not d["changed"] and not d["removed"], "export/query fault changed Program")
            elif mode in {"omit-call","omit-worker-call"}:
                require(len(d["removed"])==(2 if mode=="omit-call" else 1) and all(x[e]["class"]=="RMWStore" for e in d["removed"]), "omission scope")
            faults.append({**row,"kind":"exporter" if mode.startswith("ite-") and mode!="ite-swap" else "query" if mode=="safety-query-binding" else "actual-Program",**d})
    require(len(faults)==12, "fault census")
    llvm_faults=read(BASE / "llvm-faults-02/results.json")
    require(len(llvm_faults)==2 and all(x["result"]=="REJECT" and x["retained_level"]==1 for x in llvm_faults), "LLVM faults")
    refs += obligations(BASE / "llvm-faults-02")
    comparisons=[]
    for row in read(BASE / "comparison-02/results.json"):
        p=BASE / "comparison-02" / (row["module"]+"-"+row["input"])
        implementation(p); refs += obligations(p); comparisons.append({**row,**metrics(p)})
    candidates=[BASE / "comparison-02" / (m+"-workers") / "preparation/translation/candidate.ll" for m in ("certify_p1","certify_hcc")]
    candidates.append(suite / "workers/preparation/translation/candidate.ll")
    require(len({sha(p.read_bytes()) for p in candidates})==1,"comparison candidate drift")
    require("129 passed" in (BASE / "final-local-04/002.stdout.log").read_text(encoding="utf-8"), "regression incomplete")
    summary={"result":"REVIEWED", "baseline":frozen["baseline"], "cases":16,"unit_tests":129,
             "external":external,"positive":positive,"faults":faults,"llvm_faults":llvm_faults,
             "comparison":comparisons,"paired_candidate_sha256":sha(candidates[0].read_bytes()),
             "branch_serialized_ITE_occurrences":branch_ites,"obligation_references_checked":refs,
             "backend_PASS_but_fault_rejected":sum(x["backend"]=="PASS" for x in faults),
             "time_interpretation":"single controlled acceptance executions, no statistical performance claim",
             "semantics_proved_by_this_audit":False}
    save_json(BASE / "evidence-review.json",summary)
    table=["# Frozen full-client site census", "", "All 113 actual LLVM sites, in original order. L3/L4 are zero; no full-client Q was certified.", "",
           "| Site | TU function | Family candidate | Level | Result/reason |", "|---|---|---|---|---|"]
    for r in read(BASE / "client-reuse-04/results.json")["sites"]:
        reason = "GNU port + actual LLVM site exact; full-host/Q absent" if r["achieved_level"]==2 else r["reason"]
        table.append(f"| {r['id']} | {r['function']} | {r['supported_instruction_family']} | {r['achieved_level']} | {reason} |")
    (BASE / "site-results.md").write_bytes(("\n".join(table)+"\n").encode())
    print(json.dumps({"result":"REVIEWED","cases":16,"faults":len(faults),"references":refs,"external":external}))


if __name__ == "__main__": main()

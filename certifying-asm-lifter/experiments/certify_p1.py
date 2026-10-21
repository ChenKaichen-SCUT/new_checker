"""Authorized D1a/D1b runner; explicit conditional program-level gate."""
import argparse
import json
from pathlib import Path
from certification.p1_entry import prepare_entry, program_workers, check_program_host
from certification.run_pipeline import ROOT, implementation_hashes, run_backend
from certification.evidence import Commands, save_json
from certification.interface import sha
from certification.p0_queries import check_queries
from certification.provenance import require
from experiments.run_dat3m import linux


BASELINE = "884c06a8d2076c8f9443bfbfc30637151d89c73d"
THEOREM_SHA256 = "8f4f91dc9a4002563389609879a653512ae7d687ac38c4bae164146c55d9d596"
GAMMA = {
    "Gamma_front": "Clang preprocessing, type/declaration/metadata fidelity; ordinary host compilation satisfies the original open contract.",
    "Gamma_ISA": "Accepted GNU interface and aligned valid WB x86 operations agree with the reference interpreter and pinned TSO CAT bridge.",
    "Gamma_capture": "Read-only observer/exporter and OS/build records faithfully identify and serialize all actual objects and solver calls.",
    "Gamma_runtime": "This pinned pthread protocol projects to all legal successful source lifecycle prefixes, without extra user restrictions or aliasing.",
    "Gamma_encode": "ENC-minus: every legal Q error prefix in the domain makes this actual safety query satisfiable; includes analysis, symmetry, bounds, CAT and prefix semantics.",
    "Gamma_check": "Python/C++/Java checkers refine C0-C4; local SMT UNSAT is sound. No mechanized implementation refinement is claimed.",
    "Gamma_solve": "The actual backend solver's UNSAT for the bound queries is sound; replay is not an independently checked proof certificate.",
    "Gamma_domain": "x86-64 LP64 ABI, valid aligned nonmixed ordinary WB objects, successful create/join and defined host operations apply; no ISO C race-UB vacuity.",
}


def run(capture, out, dat3m, build_receipt, fault=None):
    capture, out, dat3m, build_receipt = [Path(p).resolve() for p in (capture, out, dat3m, build_receipt)]
    out.mkdir(parents=True, exist_ok=False)
    implementation = implementation_hashes()
    implementation["experiments/certify_p1.py"] = sha(Path(__file__).read_bytes())
    implementation["experiments/capture_ck.py"] = sha((ROOT / "experiments/capture_ck.py").read_bytes())
    for name in ("experiments/certify_p0.py", "docs/p1/01-entry-design-and-proof.md",
                 "docs/p1/04-multiple-call-proof.md", "docs/p2/01-source-semantics-audit.md",
                 "docs/p2/02-restricted-proof.md"):
        implementation[name] = sha((ROOT / name).read_bytes())
    save_json(out / "implementation.json", implementation)
    for name in implementation:
        target = out / "implementation-sources" / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes((ROOT / name).read_bytes())
    logs = Commands(out / "commands")
    result = {"result": "REJECT", "program_verdict_eligible": False, "unconditional_safe": False,
              "baseline": BASELINE, "controlled_fault": fault, "layers": {},
              "external_assumptions": GAMMA, "external_semantic_assumptions_proved": False,
              "capture": capture.relative_to(ROOT).as_posix()}
    try:
        from experiments.certify_p0 import GAMMA as ORIGINAL_GAMMA
        require(GAMMA == ORIGINAL_GAMMA, "P1 must retain all eight original Gamma contracts")
        require(sha((ROOT / "docs/system-review/01-end-to-end-guarantee.md").read_bytes()) == THEOREM_SHA256,
                "original E2E theorem changed")
        build = json.loads(build_receipt.read_bytes())
        hook = build["instrumentation"]
        require(hook["profile"] in ({"p1-query-audit-v1", "p1b-query-audit-v1", "p2-query-audit-v1"} if fault else {"p0-query-audit-v1"})
                and bool(hook["fault_injection"]) == bool(fault),
                "wrong P0 instrumentation profile")
        for name, digest in hook["additional_sources"].items():
            if name != "Snapshot.java" or not fault:
                require(sha((ROOT / "backend/dat3m" / name).read_bytes()) == digest,
                        "audit source differs from build receipt")
        prepared = prepare_entry(capture, out / "preparation")
        profile = prepared["profile"]
        if fault:
            require(hook["profile"] == "p2-query-audit-v1" or
                    hook["profile"] == ("p1-query-audit-v1" if profile == "D1a" else "p1b-query-audit-v1"),
                    "fault build/domain profile mismatch")
        result["domain"] = profile
        result["source_semantics"] = "Restricted GNU/x86 extension; no ordinary C concurrent conflict; not portable ISO C11"
        result["source_conflict_check"] = prepared["report"]["source_conflict_check"]
        evidence = prepared["translation"]
        interface = evidence["interface"]
        result["layers"].update(C0="SAME_INVOCATION_SOURCE_AND_FRAME_BOUND",
                                C1="INTERFACE_BLOCK_LLVM_CHECKED")
        candidate = out / "preparation/translation/candidate.ll"
        require(sha(candidate.read_bytes()) == evidence["frame"]["target_module_sha256"], "candidate changed")
        tool = ROOT / "vendor/clang-local/root/usr"
        logs.run(["wsl", "-d", "Ubuntu", "--exec", "env",
                  "LD_LIBRARY_PATH=" + linux(tool / "lib/x86_64-linux-gnu"),
                  linux(tool / "bin/clang-21"), "-cc1", "-emit-llvm-bc", "-disable-llvm-passes",
                  "-x", "ir", linux(candidate), "-o", linux(out / "validated.bc")])
        evidence.pop("candidate_llvm")
        save_json(out / "translation/evidence.json", evidence)
        backend = run_backend(candidate, dat3m, build_receipt, out / "backend", fault)
        result["backend"] = backend
        require(backend["result"] == "ACTUAL_BACKEND_CAPTURED", "backend capture: " + backend.get("reason", "unknown"))
        before = json.loads((out / "backend/snapshots/before-encoding.json").read_bytes())
        after = json.loads((out / "backend/snapshots/after-encoding.json").read_bytes())
        module = (capture / "source.ll").read_bytes().decode("utf-8")
        require(before == after, "same-run Program identity")
        coverage = program_workers(before, prepared, out / "regions")
        require(coverage["result"] == "TYPED_WORKERS_EXACT", "worker coverage: " + coverage.get("reason", "unknown"))
        result["layers"].update(C1="INTERFACE_BLOCK_LLVM_REGION_LIVE_EXACT",
                                C3="WORKER_ACTIVATIONS_CHECKED_HOST_PARTITION_PENDING")
        host = check_program_host(before, prepared, coverage, out / "host")
        require(host["result"] == profile + "_OPEN_HOST_EXACT", "C2/C3 host: " + host.get("reason", "unknown"))
        result["layers"].update(C1="INTERFACE_BLOCK_LLVM_REGION_LIVE_EXACT",
                                C2=profile + "_OPEN_HOST_EXACT_UNDER_ORIGINAL_RUNTIME_CONTRACT",
                                C3="EXHAUSTIVE_MAIN_WORKER_INIT_PARTITION")
        queries = check_queries(before, out / "backend/snapshots/query-audit.json", backend, host, out / "queries", host_profile=profile)
        result["layers"]["C4"] = queries["result"]
        require(queries["result"] != "REJECT", "C4 query binding: " + queries.get("reason", "unknown"))
        current = implementation_hashes()
        current.update({p: sha((ROOT / p).read_bytes()) for p in implementation if p.startswith(("experiments/", "docs/"))})
        require(current == implementation, "implementation changed during run")
        if queries["result"] == "BOUND_SAFETY_QUERY_SAT":
            result["result"] = "SAFETY_QUERY_SAT_NO_SAFE_TRANSFER"
        else:
            require(fault is None, "test-only fault build cannot release SAFE")
            result.update(result="CONDITIONAL_SAFE", program_verdict_eligible=True,
                          claim="Under ALL original Gamma contracts and the recorded input domain, no source user-assertion error prefix exists.",
                          observation="All source user assertions in main and every worker activation; main return 0.",
                          theorem="docs/p2/02-restricted-proof.md",
                          original_theorem="docs/system-review/01-end-to-end-guarantee.md:E2E-SAFE",
                          original_theorem_sha256=THEOREM_SHA256,
                          theorem_sha256=sha((ROOT / "docs/p2/02-restricted-proof.md").read_bytes()))
    except Exception as error:
        result["reason"] = str(error)
        result["result"] = "REJECT"
        result["program_verdict_eligible"] = False
    save_json(out / "program-certificate.json", result)
    print(json.dumps({k: result[k] for k in ("result", "layers", "reason") if k in result}, indent=2))
    return result


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    for name in ("capture", "out", "dat3m", "build-receipt"):
        ap.add_argument("--" + name, required=True, type=Path)
    ap.add_argument("--fault", choices=["entry-ssa", "operand-only", "assert-only", "safety-query-binding",
                                       "swap-returns", "second-operand", "omit-call", "omit-activation",
                                       "cross-read", "continuation-assert", "thread-argument", "input-alias",
                                       "input-width", "omit-worker-call", "a-only", "live-use-only"])
    args = ap.parse_args()
    result = run(args.capture, args.out, args.dat3m, args.build_receipt, args.fault)
    raise SystemExit(1 if result["result"] == "REJECT" else 0)

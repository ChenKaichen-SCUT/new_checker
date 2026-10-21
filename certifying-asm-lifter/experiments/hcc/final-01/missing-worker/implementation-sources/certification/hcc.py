"""Explicit HCC declarations and admission. Declarations are never proofs.

The sole implemented evidence provider is the existing complete D2-family
checker, under unchanged Gamma. No verified external host provider is installed.
"""
from pathlib import Path
from certification.interface import sha
from certification.provenance import require

SCHEMA = "HCC-open-host-v1"
CLAUSES = {
    "H1": "initialization, types, validity, object identity and conflict exclusion",
    "H2": "all host data/control/effects and monitors",
    "H3": "universal typed call/return and continuation binding",
    "H4": "public order, RMW/A/fence footprint and one global rf/co",
    "H5": "exhaustive static and actual dependent activation coverage",
    "H6": "all error prefixes; no future completion requirement",
    "H7": "actual source/LLVM/Q/configuration provenance",
    "H8": "actual complete monitor and safety/bound query binding",
}


def declaration(capture, provider="d2-checked"):
    capture = Path(capture)
    return {"schema": SCHEMA, "provider": provider, "model": "x86/TSO",
            "direction": "source-error-prefix-to-target-error-prefix",
            "artifacts": {p: sha((capture / p).read_bytes()) for p in
                          ("source.c", "source.ll", "observer.json", "observer.json.ast.json", "compiler-receipt.json")},
            "clauses": list(CLAUSES), "extra_assumptions": [],
            "verified_external_provider": None}


def validate_declaration(value, capture):
    # Exact schema rejects purportedly verified or assumed arbitrary contracts.
    expected = declaration(capture, value.get("provider"))
    require(value == expected, "HCC declaration/artifact/scope mismatch")
    require(value["provider"] in {"d2-checked", "unavailable"}, "HCC provider not implemented or verified")
    return value["provider"]


def finish(declared, prepared, coverage, host, queries, backend, q_path):
    """Called only after recomputation by the runner; no imported proof JSON."""
    require(declared["provider"] == "d2-checked", "HCC has no credible provider")
    profile = prepared["profile"]
    require(prepared["report"]["result"] == "TYPED_SOURCE_LLVM_ENTRY_EXACT"
            and prepared["report"]["source_conflict_check"]["result"] == "ORDINARY_C_CONFLICT_FREE",
            "HCC source/LLVM conditions incomplete")
    require(coverage["result"] == "TYPED_WORKERS_EXACT" and
            host["result"] == profile + "_OPEN_HOST_EXACT", "HCC host/instance evidence incomplete")
    require(queries["result"] in {"BOUND_SAFETY_AND_BOUND_UNSAT", "BOUND_SAFETY_QUERY_SAT"},
            "HCC query evidence incomplete")
    return {"schema": SCHEMA, "result": "DISCHARGED_UNDER_ORIGINAL_GAMMA",
            "provider": "d2-checked", "declaration": declared,
            "q_sha256": sha(Path(q_path).read_bytes()),
            "candidate_sha256": prepared["translation"]["frame"]["target_module_sha256"],
            "backend_binding": backend, "clauses": {
                k: {"meaning": meaning, "basis": "recomputed D2-family C0-C4 plus original Gamma",
                    "verified_external_component": False} for k, meaning in CLAUSES.items()},
            "additional_trusted_semantics": [], "host_interpreter_eliminated": False,
            "loop_provider": None, "unbounded_claim": False,
            "trust_partition": {
                "automatically_checked": ["typed complete source/LLVM/Q host correspondence",
                                          "local universal proofs and concrete instantiations",
                                          "dependent activation partition", "same-run query binding"],
                "verified_external_guarantees": [],
                "assumed": "all eight original Gamma; no general Clang/Dat3M verification"}}

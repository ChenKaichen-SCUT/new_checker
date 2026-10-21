"""Prepare a reviewable real-source replacement bundle; NEVER release a verdict.

Inputs must be artifacts from the declared Clang invocation. This command does
not attest externally supplied AST/LLVM provenance and does not launch Dat3M.
This local API alone does not establish source capture or backend provenance.
"""
import argparse
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
from frontend.gnu import Reject, parse
from lifter.lift import lift
from checker.check import check
from backend.llvm_tso import emit
from certification.interface import source_interface, llvm_site, replace_site, sha
from certification.lowering import check_fragment
from certification.evidence import save_json, save_certificate


def prepare(source_bytes, ast, llvm, evidence_dir=None):
    interface = llvm_site(llvm, source_interface(source_bytes, ast))
    interface["result"] = "INTERFACE_MATCH"
    return _translate_checked_interface(interface, llvm, evidence_dir)


def prepare_observed(capture_dir, evidence_dir=None):
    """Production macro entry: never accepts an externally supplied site map."""
    from certification.provenance import reconcile
    interface = reconcile(capture_dir, evidence_dir)
    llvm = (Path(capture_dir) / "source.ll").read_bytes().decode("utf-8")
    if sha(llvm) != interface["llvm_sha256"]:
        raise Reject("captured LLVM changed after provenance reconciliation")
    return _translate_checked_interface(interface, llvm, evidence_dir)


def _translate_checked_interface(interface, llvm, evidence_dir, *, template_pool=None):
    """Local translation subroutine; does not itself attest source provenance."""
    out = Path(evidence_dir) if evidence_dir is not None else None
    if out:
        save_json(out / "interface.json", interface)
    normalized, width = interface["normalized"], interface["width"]
    candidate = lift(parse(normalized, width))
    if out:
        save_json(out / "candidate-ir.json", candidate)
    block_cert = (check(normalized, candidate, width, output_dir=out / "block" if out else None)
                  if template_pool is None else template_pool.verify(normalized, candidate, width))
    block_cert["layer_result"] = "BLOCK_EXACT" if block_cert["result"] == "EXACT" else "REJECT"
    if out:
        save_json(out / "block/certificate.json", block_cert)
    if block_cert["result"] != "EXACT":
        raise Reject("block check: " + block_cert.get("reason", "failed"))
    prefix = "cert_" + interface["source_sha256"][:12] + "_" + interface.get("instance_namespace", "")
    fragment, env = emit(candidate, interface["bindings"], prefix=prefix)
    out_name = "o" + str(interface["register_output"])
    transformed, frame = replace_site(llvm, interface, fragment, env[out_name])
    # Recover the actual byte interval from the resulting module, not from IR J.
    lines = llvm.splitlines(keepends=True)
    i = interface["llvm_line_index"]
    prefix_bytes, suffix_bytes = "".join(lines[:i]), "".join(lines[i + 1:])
    if not transformed.startswith(prefix_bytes) or not transformed.endswith(suffix_bytes):
        raise Reject("host frame changed")
    end = len(transformed) - len(suffix_bytes) if suffix_bytes else len(transformed)
    actual = transformed[len(prefix_bytes):end]
    if out:
        (out / "candidate.ll").write_bytes(transformed.encode("utf-8"))
        (out / "actual-fragment.ll").write_bytes(actual.encode("utf-8"))
        save_json(out / "host-frame.json", frame)
    lower_cert = check_fragment(normalized, width, actual, interface["bindings"],
                                {out_name: interface["result_ssa"]})
    if out:
        save_certificate(out / "llvm-fragment", lower_cert)
    if lower_cert["result"] != "LLVM_FRAGMENT_EXACT":
        raise Reject("actual lowering check: " + lower_cert.get("reason", "failed"))
    return {
        "interface": interface, "candidate_ir": candidate,
        "block_certificate": block_cert, "lowering_certificate": lower_cert,
        "frame": frame, "candidate_llvm": transformed,
        "release": {"status": "PREPARED_LOCAL_EVIDENCE", "program_verdict_eligible": False,
                    "pending": ["authenticate compiler invocation and dependencies",
                                "attach actual same-run Dat3M snapshots/model/build",
                                "run supported-worker coverage against actual snapshots",
                                "check every actual region and declared host conditions",
                                "declared external TCB is not mechanically verified"]},
    }


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--source", required=True, type=Path)
    ap.add_argument("--ast", required=True, type=Path)
    ap.add_argument("--llvm", required=True, type=Path)
    ap.add_argument("--out", required=True, type=Path)
    args = ap.parse_args()
    if args.out.exists():
        raise SystemExit("Refusing to overwrite an existing evidence directory")
    source_bytes = args.source.read_bytes()
    ast_bytes, llvm_bytes = args.ast.read_bytes(), args.llvm.read_bytes()
    result = prepare(source_bytes, json.loads(ast_bytes), llvm_bytes.decode("utf-8"))
    result["input_artifacts"] = {"source": sha(source_bytes), "ast": sha(ast_bytes),
                                "llvm": sha(llvm_bytes), "provenance": "EXTERNAL_UNATTESTED"}
    args.out.mkdir(parents=True)
    (args.out / "source.c").write_bytes(source_bytes)
    (args.out / "source.ast.json").write_bytes(ast_bytes)
    (args.out / "source.ll").write_bytes(llvm_bytes)
    (args.out / "candidate.ll").write_bytes(result.pop("candidate_llvm").encode("utf-8"))
    (args.out / "evidence.json").write_text(json.dumps(result, indent=2), encoding="utf-8")
    print("Prepared local evidence. Program verdict authorization remains CLOSED.")


if __name__ == "__main__":
    main()

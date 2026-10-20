"""Reconstructs all obligations. Never imports or trusts the candidate lifter."""
import hashlib
import json
import time
from pathlib import Path
import z3
from frontend.gnu import parse, Reject
from semantics.reference import execute as reference
from checker.target import execute as target

MODEL_VERSION = "RC11Ex86-B8-restricted-v1"


def digest(data):
    if not isinstance(data, str):
        data = json.dumps(data, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(data.encode("utf-8")).hexdigest()


def check(text, ir, width=32, timeout_ms=10000, output_dir=None):
    start = time.perf_counter()
    cert = {
        "version": 1, "source_sha256": digest(text), "target_sha256": digest(ir),
        "model": MODEL_VERSION, "width": width, "address_width": 64,
        "scope": "restricted-open-block; conditional GNU interface/host contract",
        "backend": "UNVERIFIED", "precondition": "true over valid aligned fixed-width WB domain",
        "solver": z3.get_version_string(), "proof_artifact": "replayable-SMT; solver-in-TCB",
        "obligations": [], "cutpoints": []
    }
    root = Path(__file__).resolve().parents[1]
    cert["trusted_implementation_sha256"] = {
        rel: digest((root / rel).read_text(encoding="utf-8"))
        for rel in ("frontend/gnu.py", "semantics/reference.py", "checker/target.py",
                    "checker/check.py", "docs/01-scope-and-semantics.md")
    }
    out = Path(output_dir) if output_dir else None
    if out:
        out.mkdir(parents=True, exist_ok=True)

    def prove(name, equality):
        solver = z3.Solver()
        solver.set(timeout=timeout_ms)
        solver.add(z3.Not(equality))
        query = solver.to_smt2()
        tick = time.perf_counter()
        result = solver.check()
        record = {"name": name, "result": str(result), "smt_sha256": digest(query),
                  "seconds": time.perf_counter() - tick}
        if out:
            filename = f"{len(cert['obligations']):03d}-{name}.smt2"
            (out / filename).write_text(query, encoding="utf-8")
            record["file"] = filename
        if result == z3.sat:
            record["countermodel"] = str(solver.model())
        elif result == z3.unknown:
            record["reason"] = solver.reason_unknown()
        cert["obligations"].append(record)
        if result != z3.unsat:
            raise Reject("unproved obligation " + name)

    try:
        b = parse(text, width)
        se, so, ss = reference(b)
        te, to, ts = target(ir, b)
        if len(se) != len(te):
            raise Reject(f"event count {len(se)} != {len(te)}")
        for i, (s, t) in enumerate(zip(se, te)):
            for key in ("kind", "mode", "width"):
                if s[key] != t[key]:
                    raise Reject(f"event {i} {key} mismatch: {s[key]} != {t[key]}")
            cert["cutpoints"].append({"source": i, "target": i, "kind": s["kind"],
                                      "mode": s["mode"],
                                      "source_fields": {k: str(v) for k, v in s.items() if k != "state_after"},
                                      "state_relation": {
                                          "source": {k: str(v) for k, v in s["state_after"].items()},
                                          "target": {k: str(v) for k, v in t["state_after"].items()},
                                          "quantification": "common entry X; independently fresh shared responses U"
                                      }})
            for key in ("addr", "read", "has_write"):
                if key in s:
                    prove(f"e{i}-{key}", s[key] == t[key])
            if "value" in s:
                equality = s["value"] == t["value"]
                if s["kind"] == "RMW":
                    equality = z3.Implies(s["has_write"], equality)
                prove(f"e{i}-value", equality)
        if set(so) != set(to):
            raise Reject("output interface mismatch")
        for key in so:
            prove("output-" + key, so[key] == to[key])
        cert["final_symbolic_relation"] = {
            "source": {k: str(v) for k, v in ss.items()},
            "target": {k: str(v) for k, v in ts.items()},
            "definition": "paired reachable symbolic states under common entry X and fresh U"
        }
        cert["result"] = "EXACT"
    except (Reject, KeyError, TypeError, ValueError, z3.Z3Exception) as e:
        cert["result"] = "REJECT"
        cert["reason"] = str(e)
    cert["seconds"] = time.perf_counter() - start
    if out:
        (out / "certificate.json").write_text(json.dumps(cert, indent=2, ensure_ascii=False), encoding="utf-8")
    return cert

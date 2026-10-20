"""Actual Task/property/query binding. Log PASS and the last UNSAT grant nothing."""
import json
import re
from pathlib import Path
import z3
from z3.z3util import get_vars
from certification.provenance import require
from certification.p0_host import Obligations
from certification.evidence import save_certificate
from certification.interface import sha


def commands(text):
    """Top-level SMT-LIB scanner, respecting comments, strings and quoted symbols."""
    out, depth, start, i = [], 0, None, 0
    while i < len(text):
        c = text[i]
        if c == ";":
            j = text.find("\n", i)
            i = len(text) if j < 0 else j + 1
            continue
        if c in {'"', "|"}:
            require(depth > 0, "SMT token outside command")
            quote = c
            i += 1
            while i < len(text):
                if text[i] == quote:
                    if quote == '"' and i + 1 < len(text) and text[i + 1] == '"':
                        i += 2
                        continue
                    break
                i += 1
            require(i < len(text), "unterminated SMT quote")
        elif c == "(":
            if depth == 0:
                start = i
            depth += 1
        elif c == ")":
            require(depth > 0, "unbalanced SMT close")
            depth -= 1
            if depth == 0:
                out.append(text[start:i + 1])
        elif depth == 0:
            require(c.isspace(), "unexpected text outside SMT command")
        i += 1
    require(depth == 0, "truncated SMT transcript")
    return out


def transcript_queries(text):
    declarations, assertions, stack, queries = [], [], [], []
    exited, status, last_head = False, None, None
    for command in commands(text):
        require(not exited, "SMT command after exit")
        head = re.match(r"\(\s*([-\w]+)", command)
        require(head is not None, "SMT command head")
        head = head[1]
        last_head = head
        if head in {"declare-fun", "declare-const", "define-fun"}:
            require(not stack, "scoped declarations unsupported")
            require(command not in declarations, "duplicate SMT declaration")
            declarations.append(command)
        elif head == "assert":
            assertions.append(command)
        elif head == "push":
            require(re.fullmatch(r"\(push\s+1\)", command) is not None, "SMT push arity")
            stack.append(len(assertions))
        elif head == "pop":
            require(re.fullmatch(r"\(pop\s+1\)", command) is not None and stack, "SMT pop underflow/arity")
            assertions = assertions[:stack.pop()]
        elif head == "check-sat":
            require(command == "(check-sat)" and status in {"sat", "unsat", "unknown"}, "SMT query boundary/status")
            queries.append({"smt2": "\n".join(declarations + assertions) + "\n(check-sat)\n",
                            "logged_status": status, "stack_depth": len(stack)})
            status = None
        elif head == "set-info":
            m = re.fullmatch(r"\(set-info\s+:status\s+(sat|unsat|unknown)\)", command)
            if m:
                require(status is None, "duplicate status without query")
                status = m[1]
            else:
                require(re.match(r"\(set-info\s+:(?:source|category|smt-lib-version|license)\s", command) is not None,
                        "unknown SMT metadata")
        elif head == "set-logic":
            require(command == "(set-logic ALL)" and not queries and not assertions, "unexpected SMT logic")
        elif head == "exit":
            require(command == "(exit)" and not stack and status is None, "unfinished SMT stack/query")
            exited = True
        else:
            raise ValueError("unsupported SMT command: " + head)
    # The pinned solver does not close ProverWithTracker on this path, so its
    # complete dump ends at EOF, not necessarily at (exit). Actual audit.complete
    # and the exact call census are independently required by the caller.
    require(not stack and queries and status is None and last_head in {"check-sat", "pop", "exit"},
            "incomplete SMT transcript")
    return queries


def formula(text):
    parsed = z3.parse_smt2_string(text)
    require(len(parsed) > 0, "formula dump has no assertion")
    return z3.And(*parsed)


def variables(expression):
    return {v.sexpr(): v for v in get_vars(expression)}


def check_queries(q, audit_path, backend, host, out, *, host_profile="D0"):
    report = {"result": "REJECT", "program_verdict_eligible": False,
              "semantic_encoder_contract": "Gamma_encode / ENC-minus remains external"}
    proof = Obligations(report)
    out = Path(out)
    out.mkdir(parents=True, exist_ok=False)
    try:
        audit_raw = Path(audit_path).read_bytes()
        require(sha(audit_raw) == backend["snapshots"]["query-audit.json"], "audit artifact changed")
        audit = json.loads(audit_raw)
        backend_dir = Path(audit_path).parent.parent
        for name in ("before-encoding.json", "after-encoding.json"):
            raw = (backend_dir / "snapshots" / name).read_bytes()
            require(sha(raw) == backend["snapshots"][name] and json.loads(raw) == q,
                    "bound actual Program artifact changed")
        require(audit["format"] == "dat3m-p0-query-audit-v1" and audit["completed"] is True,
                "incomplete actual query audit")
        require(audit["run_id"] == q["run_id"] == backend["run_id"]
                and audit["program_identity"] == q["program_identity"], "actual Task/Program/run binding")
        require(audit["properties"] == ["PROGRAM_SPEC"] and audit["combined_type"] == "SAFETY"
                and audit["specification_type"] == "ASSERT", "actual safety property mismatch")
        require(audit["bound_events"] == [] and not any("BOUND" in e["tags"] for t in q["threads"] for e in t["events"]),
                "P0 requires no truncation events")
        require(host_profile in {"D0", "D1a", "D1b"} and host["result"] == host_profile + "_OPEN_HOST_EXACT",
                "missing complete host/monitor coverage")
        ids = [m["event"] for m in audit["monitors"]]
        require(sorted(ids) == sorted(host["all_assertions"]) and len(set(ids)) == len(ids), "Task monitor census")
        c = {name: formula(text) for name, text in audit["components"].items()}
        expected_components = {"program", "memory_model", "symmetry", "variable_bounds",
                               "property", "assumption_literal", "assumed_property"}
        actual = audit["queries"]
        require(len(actual) in {1, 2}, "unexpected query count")
        require(set(c) == expected_components | ({"bound"} if len(actual) == 2 else set()), "query component census")
        base = z3.And(*(c[k] for k in ["program", "memory_model", "symmetry", "variable_bounds"]))
        assumption = z3.simplify(c["assumption_literal"])
        require(z3.is_const(assumption) and assumption.sort() == z3.BoolSort()
                and assumption.decl().kind() == z3.Z3_OP_UNINTERPRETED, "assumption is not a Boolean literal")
        require(assumption.sexpr() not in variables(base), "assumption constrained by base encoding")
        proof.prove("assumed-property-binding", c["assumed_property"] == z3.Implies(assumption, c["property"]))
        bad = z3.Or(*(z3.And(formula(m["execution"]), z3.Not(formula(m["condition"])))
                      for m in audit["monitors"]))
        # PropertyEncoder uses a fresh reporting Boolean, e.g. Program specification.
        # It is existentially private; do not incorrectly compare it as a free monitor.
        monitor_vars = variables(bad)
        require(assumption.sexpr() not in monitor_vars, "assumption aliases a monitor variable")
        private = {k: v for k, v in variables(c["property"]).items() if k not in monitor_vars}
        require(all(v.sort() == z3.BoolSort() for v in private.values())
                and not set(private) & set(variables(base))
                and assumption.sexpr() not in private, "non-private property auxiliary")
        projected = z3.Exists(list(private.values()), c["property"]) if private else c["property"]
        proof.prove("property-covers-exact-actual-monitors", projected == bad)
        report["property_private_variables"] = sorted(private)
        report["monitor_events"] = ids
        paths = list(backend["queries"])
        require(len(paths) == 1, "P0 expects one actual solver transcript")
        # Audit path is backend/snapshots/query-audit.json.
        raw = (backend_dir / paths[0]).read_bytes()
        require(sha(raw) == backend["queries"][paths[0]], "actual query artifact changed")
        text = raw.decode("utf-8")
        captured = transcript_queries(text)
        require(len(captured) == len(actual), "actual return/query count mismatch")
        reports = []
        for i, (a, t) in enumerate(zip(actual, captured)):
            require(a["index"] == i and a["state"] == "COMPLETED" and a["result"] in {"SAT", "UNSAT"},
                    "missing/UNKNOWN solver return")
            require(a["stage"] == ("safety" if i == 0 else "bound"), "solver phase binding")
            require(a["result"].lower() == t["logged_status"], "query transcript/actual return disagree")
            if i == 0:
                require(len(a["assumptions"]) == 1 and t["stack_depth"] == 1, "safety assumption stack")
                proof.prove("actual-safety-assumption-binding", formula(a["assumptions"][0]) == assumption)
                expected = z3.And(base, c["assumed_property"], assumption)
            else:
                require(a["assumptions"] == [] and t["stack_depth"] == 0 and actual[0]["result"] == "UNSAT",
                        "bound query order/assumptions")
                proof.prove("no-bound-event-formula", c["bound"] == z3.BoolVal(False))
                expected = z3.And(base, c["assumed_property"], c["bound"])
            captured_formula = formula(t["smt2"])
            proof.prove("actual-query-stack-" + str(i), captured_formula == expected)
            solver = z3.Solver()
            solver.set(timeout=30000)
            solver.add(captured_formula)
            answer = str(solver.check())
            row = {"index": i, "stage": a["stage"], "actual_result": a["result"], "replay": answer,
                   "file": f"actual-query-{i}.smt2", "stack_depth": t["stack_depth"]}
            (out / row["file"]).write_bytes(t["smt2"].encode("utf-8"))
            if answer == "sat":
                row["replay_model"] = str(solver.model())
            if answer == "unknown":
                row["reason"] = solver.reason_unknown()
            reports.append(row)
            report["queries"] = reports
            require(answer.upper() == a["result"], "query replay incomplete/disagrees")
        if actual[0]["result"] == "SAT":
            require(len(actual) == 1 and audit["solver_result"] == "FAIL", "SAT safety sequence")
            report["result"] = "BOUND_SAFETY_QUERY_SAT"
            report["actual_model_values"] = actual[0].get("actual_model_values", [])
        else:
            require(len(actual) == 2 and actual[1]["result"] == "UNSAT" and audit["solver_result"] == "PASS",
                    "no completed safety-and-bound UNSAT sequence")
            report["result"] = "BOUND_SAFETY_AND_BOUND_UNSAT"
    except Exception as error:
        report["reason"] = str(error)
    save_certificate(out, report)
    return report

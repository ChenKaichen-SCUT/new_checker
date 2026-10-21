"""Exact pinned P0 instrumentation. Positive hooks only observe actual objects."""
from pathlib import Path
import json
from certification.interface import sha
from frontend.gnu import Reject
from backend.dat3m.instrument import HERE, REL


def install_p0(root, fault_injection=False, fault_class="P0Faults"):
    root = Path(root)
    path = root / REL
    raw = path.read_bytes()
    pins = json.loads((HERE / "pins.json").read_bytes())
    if sha(raw) != pins["files"][REL]:
        raise Reject("P0 requires unmodified pinned AssumeSolver")
    code = raw.decode("utf-8")

    def replace(old, new):
        nonlocal code
        if code.count(old) != 1:
            raise Reject("P0 hook anchor not unique: " + old)
        code = code.replace(old, new)

    replace("        context = EncodingContext.of(task, analysisContext, solverContext.getFormulaManager());",
            '        certifying.Snapshot.write(task, "before-encoding");\n'
            "        context = EncodingContext.of(task, analysisContext, solverContext.getFormulaManager());\n"
            "        certifying.P0Audit.begin(task, context, solverContext.getFormulaManager());")
    for expression, name in [
        ("programEncoder.encodeFullProgram()", "program"),
        ("wmmEncoder.encodeFullMemoryModel()", "memory_model"),
        ("symmetryEncoder.encodeFullSymmetryBreaking()", "symmetry"),
        ("programEncoder.encodeBounds()", "variable_bounds"),
    ]:
        replace(f"prover.addConstraint({expression});",
                f'prover.addConstraint(certifying.P0Audit.component("{name}", {expression}));')
    replace("        prover.addConstraint(assumedSpec);",
            '        certifying.P0Audit.component("assumption_literal", assumptionLiteral);\n'
            '        certifying.P0Audit.component("property", propertyEncoding);\n'
            '        prover.addConstraint(certifying.P0Audit.component("assumed_property", assumedSpec));\n'
            '        certifying.Snapshot.write(task, "after-encoding");')
    # Same collection object goes to observer and original actual solver call.
    if fault_class not in {"P0Faults", "P1Faults", "P1bFaults", "P2Faults", "LevelsFaults"} or (fault_class != "P0Faults" and not fault_injection):
        raise Reject("invalid fault instrumentation profile")
    assumption = (f"certifying.{fault_class}.assumption(assumptionLiteral, bmgr)"
                  if fault_injection else "assumptionLiteral")
    replace("        if (prover.isUnsatWithAssumptions(singletonList(assumptionLiteral))) {",
            f"        var certAssumptions = singletonList({assumption});\n"
            '        certifying.P0Audit.start("safety", certAssumptions);\n'
            "        boolean certSafetyUnsat = prover.isUnsatWithAssumptions(certAssumptions);\n"
            "        certifying.P0Audit.finish(certSafetyUnsat, prover);\n"
            "        if (certSafetyUnsat) {")
    replace("            prover.addConstraint(propertyEncoder.encodeBoundEventExec());",
            '            prover.addConstraint(certifying.P0Audit.component("bound", propertyEncoder.encodeBoundEventExec()));')
    replace("            res = prover.isUnsat() ? PASS : ResultStatus.UNKNOWN;",
            '            certifying.P0Audit.start("bound", java.util.List.of());\n'
            "            boolean certBoundUnsat = prover.isUnsat();\n"
            "            certifying.P0Audit.finish(certBoundUnsat, prover);\n"
            "            res = certBoundUnsat ? PASS : ResultStatus.UNKNOWN;")
    replace('        logger.info("Verification finished with result {}", res);',
            '        certifying.P0Audit.complete(res.name());\n'
            '        logger.info("Verification finished with result {}", res);')
    if fault_injection:
        replace("        preprocessProgram(task, config);",
                f"        preprocessProgram(task, config);\n        certifying.{fault_class}.apply(task);")
    dest = root / "dartagnan/src/main/java/certifying"
    dest.mkdir(parents=True, exist_ok=False)
    sources = {}
    for name in ["Snapshot.java", "P0Audit.java"] + ([fault_class + ".java"] if fault_injection else []):
        data = (HERE / name).read_bytes()
        if name == "Snapshot.java" and fault_injection:
            text = data.decode("utf-8")
            text = text.replace('Set.of("before-encoding", "after-encoding").contains(phase)',
                                'Set.of("before-encoding", "after-encoding", "pre-fault", "post-fault").contains(phase)')
            text = text.replace('} else if (task != firstTask || task.getProgram() != firstProgram || !run.equals(firstRun)) {',
                                '} else if (phase.equals("after-encoding") && (task != firstTask || task.getProgram() != firstProgram || !run.equals(firstRun))) {')
            if fault_class == "LevelsFaults":
                text = text.replace('        return result;', '        if (e instanceof ITEExpr) {\n            String mode = System.getProperty("cert.controlled.fault", "");\n            if (mode.equals("ite-missing-dependency")) result.put("register_dependencies", List.of());\n            if (mode.equals("ite-wrong-type")) result.put("type", "bv64");\n            if (mode.equals("ite-truncated")) result.put("args", ((List<?>)result.get("args")).subList(0, 2));\n        }\n        return result;')
            data = text.encode("utf-8")
        (dest / name).write_bytes(data)
        sources[name] = sha(data)
    path.write_bytes(code.encode("utf-8"))
    return {"profile": {"P0Faults": "p0-query-audit-v1", "P1Faults": "p1-query-audit-v1",
                        "P1bFaults": "p1b-query-audit-v1", "P2Faults": "p2-query-audit-v1", "LevelsFaults": "levels-query-audit-v1"}[fault_class], "original_sha256": sha(raw),
            "instrumented_sha256": sha(path.read_bytes()),
            "exporter_sha256": sources["Snapshot.java"],
            "fault_source_sha256": sources.get(fault_class + ".java"),
            "fault_injection": fault_injection, "additional_sources": sources}

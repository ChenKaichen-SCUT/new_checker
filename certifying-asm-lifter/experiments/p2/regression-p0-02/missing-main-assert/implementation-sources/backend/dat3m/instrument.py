"""Install exact pinned hooks; optional fault profile is NEVER a positive build."""
import argparse
import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
REL = "dartagnan/src/main/java/com/dat3m/dartagnan/verification/solving/AssumeSolver.java"


def install(root, fault_injection=False):
    root = Path(root).resolve()
    target = (root / REL).resolve()
    if not target.is_relative_to(root):
        raise ValueError("source target escapes selected tree")
    pins = json.loads((HERE / "pins.json").read_text(encoding="utf-8"))
    raw = target.read_bytes()
    if hashlib.sha256(raw).hexdigest() != pins["files"][REL]:
        raise ValueError("AssumeSolver differs from pinned unmodified source")
    code = raw.decode("utf-8")
    hooks = [
        ("        context = EncodingContext.of(task, analysisContext, solverContext.getFormulaManager());",
         '        certifying.Snapshot.write(task, "before-encoding");\n'),
        ("        prover.addConstraint(assumedSpec);",
         '\n        certifying.Snapshot.write(task, "after-encoding");'),
    ]
    for i, (anchor, hook) in enumerate(hooks):
        if code.count(anchor) != 1:
            raise ValueError("snapshot anchor is not unique")
        code = code.replace(anchor, hook + anchor if i == 0 else anchor + hook)
    if fault_injection:
        anchor = "        preprocessProgram(task, config);"
        if code.count(anchor) != 1:
            raise ValueError("fault anchor is not unique")
        code = code.replace(anchor, anchor + "\n        certifying.ControlledFaults.apply(task);")
    destination = root / "dartagnan/src/main/java/certifying/Snapshot.java"
    if destination.exists():
        raise ValueError("snapshot class already exists; use a fresh source tree")
    destination.parent.mkdir(parents=True, exist_ok=True)
    exporter = (HERE / "Snapshot.java").read_bytes()
    if fault_injection:
        text = exporter.decode("utf-8")
        if (text.count('Set.of("before-encoding", "after-encoding").contains(phase)') != 1
                or text.count('} else if (task != firstTask || task.getProgram() != firstProgram || !run.equals(firstRun)) {') != 1):
            raise ValueError("audit snapshot anchors are not unique")
        text = text.replace('Set.of("before-encoding", "after-encoding").contains(phase)',
                            'Set.of("before-encoding", "after-encoding", "pre-fault", "post-fault").contains(phase)')
        text = text.replace('} else if (task != firstTask || task.getProgram() != firstProgram || !run.equals(firstRun)) {',
                            '} else if (phase.equals("after-encoding") && (task != firstTask || task.getProgram() != firstProgram || !run.equals(firstRun))) {')
        if text == exporter.decode("utf-8"):
            raise ValueError("audit snapshot anchors missing")
        exporter = text.encode("utf-8")
        (destination.parent / "ControlledFaults.java").write_bytes((HERE / "ControlledFaults.java").read_bytes())
    destination.write_bytes(exporter)
    target.write_bytes(code.encode("utf-8"))
    return {"original_sha256": hashlib.sha256(raw).hexdigest(),
            "instrumented_sha256": hashlib.sha256(target.read_bytes()).hexdigest(),
            "exporter_sha256": hashlib.sha256(destination.read_bytes()).hexdigest(),
            "fault_injection": fault_injection,
            "fault_source_sha256": hashlib.sha256((HERE / "ControlledFaults.java").read_bytes()).hexdigest()
                if fault_injection else None}


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--source-root", required=True, type=Path)
    args = ap.parse_args()
    print(json.dumps(install(args.source_root), indent=2))

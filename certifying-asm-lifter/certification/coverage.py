"""Automatic coverage for a deliberately narrow REAL worker-function class.

One asm site, straight-line worker with checked pure assertion continuation,
constant scalar inputs, static global memory operands, direct pthread_create
references from straight-line main. Every surviving worker thread is checked.
No caller-provided site count, core register binding, or output projection.
The C-live addendum supplies the additional conditional composition argument.
"""
import re
from pathlib import Path
from frontend.gnu import Reject
from certification.interface import sha
from certification.endpoints import check_region
from certification.evidence import save_json, save_certificate
from certification.continuation import automatic_projection, check_continuation, llvm_continuation
import z3


def supported_worker(module, interface):
    if sha(module) != interface["llvm_sha256"]:
        raise Reject("coverage source LLVM differs from reconciled interface")
    lines = module.splitlines()
    index = interface["llvm_line_index"]
    begin = next((i for i in range(index, -1, -1) if lines[i].startswith("define ")), None)
    if begin is None:
        raise Reject("asm is not in a function")
    end = next((i for i in range(index + 1, len(lines)) if lines[i].strip() == "}"), None)
    if end is None:
        raise Reject("missing worker function boundary")
    m = re.search(r"@([-a-zA-Z$._0-9]+)\(", lines[begin])
    if not m:
        raise Reject("unsupported worker name")
    worker = m[1]
    if worker == "main":
        raise Reject("v2 automatic coverage requires a distinct worker")
    other = []
    for i in range(begin + 1, end):
        text = lines[i].strip()
        if i == index or not text or text.startswith(";") or re.fullmatch(r"[-\w.]+:", text):
            continue
        text = re.sub(r",\s*!dbg\s*!\d+\s*$", "", text)
        other.append(text)
    for i in range(begin + 1, index):
        text = lines[i].strip()
        if text and not text.startswith(";") and not re.fullmatch(r"[-\w.]+:", text):
            raise Reject("worker has instructions before asm")
    result = interface["result_ssa"]
    assertions = llvm_continuation(other, result, interface["width"],
                                   z3.BitVec("scope-live-result", interface["width"]))
    references = []
    locations = []
    debug_lines = dict(re.findall(r"!(\d+) = !DILocation\(line: (\d+)", module))
    current = None
    for i, line in enumerate(lines):
        if line.startswith("define "):
            f = re.search(r"@([-a-zA-Z$._0-9]+)\(", line)
            current = f[1] if f else None
        if current == "main" and re.search(r"\b(?:br|switch|indirectbr|invoke|callbr)\b", line):
            raise Reject("automatic worker census requires straight-line main")
        if re.search(r"@" + re.escape(worker) + r"(?![-a-zA-Z$._0-9])", line):
            if i == begin:
                continue
            if current != "main" or not re.search(r"\bcall\b.*@pthread_create\(", line):
                raise Reject("worker has a non-pthread_create reference")
            # Exactly one direct reference per call; function-pointer casts reject.
            if not re.search(r"ptr(?:\s+(?:noundef|nonnull))*\s+@" + re.escape(worker) + r"\s*,", line):
                raise Reject("worker function pointer is not a direct pthread argument")
            references.append(i)
            dbg = re.search(r"!dbg !(\d+)", line)
            if not dbg or dbg[1] not in debug_lines:
                raise Reject("source pthread_create lacks a direct debug location")
            locations.append(int(debug_lines[dbg[1]]))
        if line.strip() == "}":
            current = None
    if not references:
        raise Reject("no direct worker instances")
    globals_used = set()
    for slot, value in interface["bindings"].items():
        if slot.startswith("p"):
            if not re.fullmatch(r"@[-a-zA-Z$._0-9]+", value) or value.startswith("@__com_"):
                raise Reject("automatic region binding requires static user globals")
            globals_used.add(value[1:])
        elif not re.fullmatch(r"-?\d+", value):
            raise Reject("automatic region binding requires constant scalar inputs")
    return {"function": worker, "expected_instances": len(references),
            "pthread_create_lines": references, "pthread_create_source_lines": locations,
            "globals": sorted(globals_used),
            "continuation": other, "live_output": bool(assertions),
            "projection_method": "unique actual assigned register read outside region",
            "source_module_sha256": sha(module)}


def _certify_workers(module, interface, before, after, result, evidence_dir):
    """No inference from absent regions; whole-copy disappearance is a rejection."""
    if before != after:
        raise Reject("actual Program changed across the encoding boundary")
    scope = supported_worker(module, interface)
    result["scope"] = scope
    thread_ids = [t["id"] for t in before["threads"]]
    event_ids = [e["id"] for t in before["threads"] for e in t["events"]]
    names = [m["name"] for m in before["memory"]]
    if any(len(v) != len(set(v)) for v in (thread_ids, event_ids, names)):
        raise Reject("duplicate actual thread/event/object identity")
    source_path = interface.get("source_path")
    host_source_path = interface.get("host_source_path", source_path)
    if not source_path:
        raise Reject("missing authenticated source path for provenance")
    workers = [t for t in before["threads"] if t["name"] == scope["function"]]
    result["actual_worker_threads"] = [t["id"] for t in workers]
    if len(workers) != scope["expected_instances"]:
        raise Reject("source pthread census and actual worker instances disagree")
    ids = [t["id"] for t in workers]
    creates = [(t, e) for t in before["threads"] for e in t["events"]
               if "spawned_thread" in e and e["spawned_thread"] in ids]
    if sorted(e["spawned_thread"] for _, e in creates) != sorted(ids):
        raise Reject("worker has missing/duplicate actual ThreadCreate linkage")
    if any(t["name"] != "main" or e.get("source", {}).get("path") != host_source_path
           for t, e in creates):
        raise Reject("actual worker creation has wrong parent/source")
    if sorted(e["source"]["line"] for _, e in creates) != sorted(scope["pthread_create_source_lines"]):
        raise Reject("source calls and actual ThreadCreate provenance disagree")
    result["instance_links"] = [{"parent": t["id"], "create_event": e["id"],
                                 "worker": e["spawned_thread"], "source": e["source"]}
                                for t, e in creates]
    memory = {m["name"]: m for m in before["memory"]}
    for name in scope["globals"]:
        obj = memory.get(name)
        if not obj or obj["thread_local"]:
            raise Reject("source global is absent from actual memory objects")
        size, align = obj["size"], obj["alignment"]
        if (size["kind"] != "int" or align["kind"] != "int"
                or int(size["value"]) < interface["width"] // 8
                or int(align["value"]) < interface["width"] // 8):
            raise Reject("actual global size/alignment does not justify access domain")
    reports = result["regions"]
    for thread in workers:
        events = thread["events"]
        selected = [i for i, e in enumerate(events)
                    if e.get("source", {}) == {"path": source_path, "line": interface["line"]}]
        if not selected:
            raise Reject("asm instance vanished or lost provenance")
        lo, hi = min(selected), max(selected)
        # This minimal class has no user memory operations outside the sole asm.
        # All non-runtime memory endpoints must be inside the proposed interval.
        for i, e in enumerate(events):
            if "M" in e["tags"] and not lo <= i <= hi:
                addr = e.get("addr", {})
                if addr.get("kind") != "object" or not str(addr.get("name", "")).startswith("__com_"):
                    raise Reject("uncovered worker memory endpoint")
            if not lo <= i <= hi and "jump" in e:
                raise Reject("unexpected worker branch outside certified region")
        projection = automatic_projection(events, lo, hi, interface, scope["live_output"])
        report = check_region(interface["normalized"], interface["width"], before, thread["id"],
                              events[lo]["id"], events[hi]["id"], interface["bindings"], projection)
        reports.append(report)
        if evidence_dir is not None:
            save_certificate(Path(evidence_dir) / f"thread-{thread['id']}", report)
        if report["result"] != "REGION_EXACT":
            raise Reject("actual worker region rejected: " + report.get("reason", "unknown"))
        continuation = check_continuation(scope["continuation"], interface, thread, lo, hi, projection)
        result.setdefault("continuations", []).append(continuation)
        if evidence_dir is not None:
            save_certificate(Path(evidence_dir) / f"continuation-{thread['id']}", continuation)
        if continuation["result"] != "CONTINUATION_EXACT":
            raise Reject("actual continuation rejected: " + continuation.get("reason", "unknown"))
    result["result"] = "SUPPORTED_WORKERS_EXACT"


def certify_workers(module, interface, before, after, evidence_dir=None):
    result = {"result": "REJECT", "regions": [], "program_verdict_eligible": False,
              "scope_note": "all potential worker activations in the restricted pthread model",
              "external_conditions": ["declared compiler/host/ISA/model/solver/checker TCB"]}
    try:
        _certify_workers(module, interface, before, after, result, evidence_dir)
    except (Reject, KeyError, TypeError, ValueError) as error:
        result["reason"] = str(error)
    if evidence_dir is not None:
        save_json(Path(evidence_dir) / "coverage.json", result)
    return result

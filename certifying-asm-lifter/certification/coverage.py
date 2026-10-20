"""Automatic coverage for a deliberately narrow REAL worker-function class.

One asm site, straight-line worker containing only that call and `ret ptr null`,
constant scalar inputs, static global memory operands, direct pthread_create
references from straight-line main. Every surviving worker thread is checked.
No caller-provided site count, core register binding, or output projection.
"""
import re
from frontend.gnu import Reject
from certification.interface import sha
from certification.endpoints import check_region


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
    if other != ["ret ptr null"]:
        raise Reject("worker must have only the asm call and a constant null return")
    # The output cannot be used by ret, stores or other code in this worker.
    # Exactly one use is its defining occurrence.
    result = interface["result_ssa"]
    token = re.escape(result) + r"(?![-a-zA-Z$._0-9])"
    if len(re.findall(token, "\n".join(lines[begin:end + 1]))) != 1:
        raise Reject("automatic coverage requires a dead scalar result")
    references = []
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
            "pthread_create_lines": references, "globals": sorted(globals_used),
            "output_projection": {}, "source_module_sha256": sha(module)}


def certify_workers(module, interface, before, after):
    """No inference from absent regions; whole-copy disappearance is a rejection."""
    if before != after:
        raise Reject("actual Program changed across the encoding boundary")
    scope = supported_worker(module, interface)
    workers = [t for t in before["threads"] if t["name"] == scope["function"]]
    if len(workers) != scope["expected_instances"]:
        raise Reject("source pthread census and actual worker instances disagree")
    ids = [t["id"] for t in workers]
    creates = [e["spawned_thread"] for t in before["threads"] for e in t["events"]
               if "spawned_thread" in e and e["spawned_thread"] in ids]
    if sorted(creates) != sorted(ids):
        raise Reject("worker has missing/duplicate actual ThreadCreate linkage")
    memory = {m["name"]: m for m in before["memory"]}
    for name in scope["globals"]:
        obj = memory.get(name)
        if not obj:
            raise Reject("source global is absent from actual memory objects")
        size, align = obj["size"], obj["alignment"]
        if (size["kind"] != "int" or align["kind"] != "int"
                or int(size["value"]) < interface["width"] // 8
                or int(align["value"]) < interface["width"] // 8):
            raise Reject("actual global size/alignment does not justify access domain")
    reports = []
    for thread in workers:
        events = thread["events"]
        selected = [i for i, e in enumerate(events)
                    if e.get("source", {}).get("line") == interface["line"]]
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
        report = check_region(interface["normalized"], interface["width"], before, thread["id"],
                              events[lo]["id"], events[hi]["id"], interface["bindings"], {})
        if report["result"] != "REGION_EXACT":
            raise Reject("actual worker region rejected: " + report.get("reason", "unknown"))
        reports.append(report)
    return {"scope": scope, "regions": reports, "result": "SUPPORTED_WORKERS_EXACT",
            "program_verdict_eligible": False,
            "remaining_release_conditions": ["authenticated build/compiler bundle",
                                             "same-run input/CAT/config/query sealing",
                                             "declared host and solver TCB conditions",
                                             "implementation execution validation deferred"]}

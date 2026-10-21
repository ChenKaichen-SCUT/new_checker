"""Real GNU/LLVM port certificates, independent of a whole-host interpreter.

No source argument evaluation, Q region claim or program SAFE follows here.
Unresolved host premises are explicit, even when every fragment is EXACT.
"""
import json
import re
from pathlib import Path
from certification.provenance import authenticate_capture, require, unique, walk
from certification.p1_entry import wrapper_interface, translate_all
from certification.evidence import save_json
from frontend.gnu import Reject


def prepare_ports(capture, out, pool):
    out = Path(out)
    out.mkdir(parents=True, exist_ok=True)
    obs, receipt, buffers, module = authenticate_capture(capture)
    calls = [(i, s) for i, s in enumerate(module.splitlines())
             if re.search(r"\b(?:call|invoke|callbr)\b.*\basm\b", s)]
    require(calls, "no surviving LLVM asm")
    md = dict(re.findall(r"^!(\d+) = !\{([^{}]*)\}$", module, re.M))
    sources = []
    for i, line in calls:
        mid = unique(re.findall(r"!srcloc !(\d+)", line), "port origin cookie")
        require(mid in md and re.fullmatch(r"i64 \d+(?:, i64 \d+)*", md[mid]), "port origin tuple")
        key = [int(x) for x in re.findall(r"i64 (\d+)", md[mid])]
        sources.append(unique([s for s in obs["sites"] if s["cookies"] == key], "whole AST port origin"))
    definitions = {s["function"] for s in sources}
    uses = [(f, n) for f in obs["functions"] for n in walk(f["body"])
            if n["kind"] == "CallExpr" and n.get("callee") in definitions]
    require(len(uses) == len(calls), "source/LLVM static port census")
    interfaces, selected = [], set()
    for (i, line), source in zip(calls, sources):
        candidates = []
        for ui, (worker, call) in enumerate(uses):
            try:
                interface, _ = wrapper_interface(obs, receipt, buffers, module, source, worker, call, i)
                candidates.append((ui, interface))
            except Reject:
                pass
        ui, interface = unique(candidates, "independently checked port context")
        require(ui not in selected, "port context reused")
        selected.add(ui)
        interface.update(worker_definition=uses[ui][0]["id"], worker_name=uses[ui][0]["name"],
                         instance_namespace="port" + str(len(interfaces)) + "_")
        interfaces.append(interface)
    require(selected == set(range(len(uses))), "uncovered static source call")
    translation = translate_all(interfaces, module, out / "translation", template_pool=pool)
    translation.pop("candidate_llvm")
    result = {"result": "LOCAL_PORTS_EXACT", "program_verdict_eligible": False,
              "static_ports": len(interfaces), "translation": translation,
              "quantification": "valid typed LLVM port inputs and fresh open responses",
              "pending": ["source argument evaluation and validity/alias/race domain",
                          "host control/data/lifecycle and error-prefix correspondence",
                          "actual Q regions and all dynamic occurrences", "actual safety/bound query binding"],
              "verified_host_compilation": False, "reuse": pool.summary()}
    save_json(out / "local-certificate.json", result)
    return result

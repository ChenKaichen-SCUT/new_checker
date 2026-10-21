"""Original full-client captures; per-site port abstraction, no host rewrite."""
import json
import re
from pathlib import Path
from certification.interface import sha, llvm_site, nodes
from certification.provenance import require, check_literal_tokens, validate_location, unsigned
from certification.run_pipeline import ROOT
from frontend.gnu import parse


def load_unit(tu):
    root = ROOT / "experiments/p2/external-client"
    scope = json.loads((root / "scope-certificate.json").read_bytes())
    selection = json.loads((root.parent / "external-selection.json").read_bytes())
    require(sha((root.parent / "external-selection.json").read_bytes()) == scope["selection_sha256"], "original selection")
    require(scope["compiler_sha256"] == "412bbe8c60571a1eb06f48fde89635033621caeb01a9b4ee76d46711bae8e932"
            and "21.1.8" in scope["compiler_version"], "pinned external compiler")
    d = root / f"tu-{tu}"
    receipt = json.loads((d / "receipt.json").read_bytes())
    require(receipt == scope["translation_units"][tu] and receipt["returncode"] == 0
            and receipt["source"] == selection["required_translation_units"][tu], "TU invocation binding")
    for p, digest in selection["files"].items():
        require(sha((root / "upstream" / p).read_bytes()) == digest, "upstream code changed")
    for p, digest in receipt["artifact_hashes"].items():
        require(sha((d / p).read_bytes()) == digest, "original artifact changed")
    deps = {}
    for path, dep in receipt["dependencies"].items():
        data = (d / dep["file"]).read_bytes()
        require(sha(data) == dep["sha256"], "dependency changed")
        deps[path] = data
    obs = json.loads((d / "observer.json").read_bytes())
    raw = json.loads((d / "observer.json.ast.json").read_bytes())
    require(obs["schema"] == "clang21-observer-v1" and
            sum(n.get("kind") == "GCCAsmStmt" for n in nodes(raw)) == len(obs["sites"]), "whole AST asm census")
    buffers = {}
    for b in obs["buffers"]:
        data = b["content"].encode()
        require(b["file_id"] not in buffers and sha(data) == b["sha256"] and len(data) == b["bytes"], "buffer identity")
        if b["path"].startswith("<"):
            require(b["path"] in {"<scratch space>", "<built-in>", "<command line>"}, "virtual buffer")
        else:
            require(deps.get(b["path"]) == data, "buffer/dependency mismatch")
        buffers[b["file_id"]] = b
    return obs, buffers, (d / "source.ll").read_bytes().decode(), receipt


def abstract_port(site, buffers, module, row):
    require(site["volatile"] and not site["simple"] and not site["goto"], "nonvolatile/basic/goto interface")
    for loc in [site["begin"], site["end"], *site["string_tokens"]]: validate_location(loc, buffers)
    strings = check_literal_tokens(site, buffers)
    require(site["cookies"][0] == site["string_tokens"][0]["raw"], "original source cookie")
    operands, groups, widths, outputs = [], [[], []], set(), []
    for i, o in enumerate(site["operands"]):
        ty = o["expression"]["type"]
        require(not o["name"] and unsigned(ty) and ty["bits"] in {32, 64}, "unsupported GNU operand type/width/flag output")
        widths.add(ty["bits"])
        memory = o["constraint"].endswith("m")
        name = "*addr" + str(i) if memory else "v" + str(i)
        groups[0 if o["output"] else 1].append(json.dumps(o["constraint"]) + "(" + name + ")")
        operands.append({"index": i, "constraint": o["constraint"], "output": o["output"],
                         "memory": memory, "clang_type": ty})
        if o["output"] and not memory: outputs.append(i)
    require(len(widths) == 1 and len(outputs) == 1, "one common width/scalar output required")
    width = next(iter(widths))
    normalized = "asm volatile(" + json.dumps(site["template"]) + " : " + ",".join(groups[0]) + " : " + ",".join(groups[1]) + " : " + ",".join(json.dumps(c) for c in site["clobbers"]) + ");"
    block = parse(normalized, width)
    require("memory" in block.clobbers, "explicit compiler memory clobber required")
    return {"normalized": normalized, "width": width, "register_output": outputs[0],
            "operands": operands, "source_sha256": sha(json.dumps(site, sort_keys=True)),
            "source_function_decl": site["function"], "instance_namespace": row["id"] + "_",
            "origin": {"cookies": site["cookies"], "location": site["begin"], "original_strings": strings},
            "host_evaluation": "NOT_PROVED; all defined valid typed port inputs",
            "site_id": row["id"]}

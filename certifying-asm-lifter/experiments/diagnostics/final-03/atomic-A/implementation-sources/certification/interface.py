"""Clang AST/source/LLVM interface reconciliation. No hand-supplied data width.

This reader accepts an intentionally small syntax and rejects ambiguous matches.
It consumes compiler artifacts; hashes authenticate bytes, not compiler truth.
The compiler invocation producing those artifacts remains an explicit TCB input.
"""
import hashlib
import json
import re
from frontend.gnu import Reject, cstrings, parse, split_top

VALUE = r"(?:%[-a-zA-Z$._0-9]+|@[-a-zA-Z$._0-9]+|-?\d+)"
STRING = r'"(?:[^"\\]|\\[0-9A-Fa-f]{2})*"'


def sha(data):
    if isinstance(data, str):
        data = data.encode()
    return hashlib.sha256(data).hexdigest()


def decode_llvm_string(s):
    return re.sub(r"\\([0-9A-Fa-f]{2})", lambda m: chr(int(m[1], 16)), s[1:-1])


def nodes(tree):
    yield tree
    for child in tree.get("inner", []):
        yield from nodes(child)


def direct_range(node):
    r = node.get("range", {})
    a, b = r.get("begin", {}), r.get("end", {})
    if any(k in a or k in b for k in ("spellingLoc", "expansionLoc")):
        raise Reject("macro-expanded source location: unsupported")
    if "offset" not in a or "offset" not in b or "tokLen" not in b:
        raise Reject("missing direct source byte offsets")
    return a["offset"], b["offset"] + b["tokLen"]


def source_interface(source, ast):
    """Return one source-backed site; source is bytes, offsets are byte offsets."""
    sites = [n for n in nodes(ast) if n.get("kind") == "GCCAsmStmt"]
    if len(sites) != 1:
        raise Reject("v2 requires exactly one GCCAsmStmt in the translation unit")
    site = sites[0]
    start, end = direct_range(site)
    if not 0 <= start < end <= len(source):
        raise Reject("source range outside supplied translation unit")
    raw = source[start:end].decode("utf-8")
    match = re.fullmatch(
        r"\s*(?:asm|__asm__|__asm)\s+(?:volatile|__volatile__|__volatile)\s*\((.*)\)\s*",
        raw, re.S)
    if not match:
        # Whitespace is optional between the keyword and volatile only where
        # they remain separate C tokens; the normal spelling has whitespace.
        raise Reject("v2 source must be volatile, direct extended asm")
    sections = split_top(match[1], ":")
    if not 2 <= len(sections) <= 4:
        raise Reject("asm goto/basic asm unsupported")
    sections += [""] * (4 - len(sections))
    template = cstrings(sections[0])
    operands, normalized = [], [[], []]
    for group, section in enumerate(sections[1:3]):
        for item in split_top(section, ",") if section else []:
            m = re.fullmatch(r'"([=+&raqm0-9]+)"\s*\(\s*(\*?\s*[A-Za-z_]\w*)\s*\)', item)
            if not m:
                raise Reject("v2 requires unnamed, simple lvalue operands")
            i = len(operands)
            constraint, expression = m.groups()
            expression = re.sub(r"\s+", "", expression)
            kind = "m" if constraint.endswith("m") else "r"
            replacement = "*addr" + str(i) if kind == "m" else "v" + str(i)
            normalized[group].append(json.dumps(constraint) + "(" + replacement + ")")
            operands.append({"index": i, "constraint": constraint, "expression": expression,
                             "output": group == 0, "memory": kind == "m"})
    children = site.get("inner", [])
    if len(children) != len(operands):
        raise Reject("AST operand count differs from source constraint count")
    widths = []
    for operand, child in zip(operands, children):
        a, b = direct_range(child)
        if not start <= a < b <= end:
            raise Reject("AST operand range escapes asm")
        expression = re.sub(r"\s+", "", source[a:b].decode("utf-8"))
        if expression != operand["expression"]:
            raise Reject("AST/source operand order mismatch")
        ty = child.get("type", {})
        canonical = ty.get("desugaredQualType", ty.get("qualType"))
        width = {"unsigned int": 32, "unsigned long": 64, "unsigned long long": 64}.get(canonical)
        if width is None:
            raise Reject("v2 requires unqualified unsigned 32/64-bit operands on x86-64 LP64")
        widths.append(width)
        operand["clang_type"] = ty
        operand["ast_kind"] = child.get("kind")
        operand["decl_refs"] = [n["referencedDecl"] for n in nodes(child) if "referencedDecl" in n]
    if not widths or len(set(widths)) != 1:
        raise Reject("v2 requires one common data width")
    text = 'asm volatile(' + json.dumps(template) + " : " + ",".join(normalized[0])
    text += " : " + ",".join(normalized[1]) + " : " + sections[3] + ");"
    block = parse(text, widths[0])
    if "memory" not in block.clobbers:
        raise Reject("v2 requires an explicit compiler memory barrier")
    register_outputs = [o for o in block.operands if o.output and o.kind != "m"]
    if len(register_outputs) != 1:
        raise Reject("v2 supports one scalar result")
    return {"source_sha256": sha(source), "ast_sha256": sha(json.dumps(ast, sort_keys=True)),
            "start_byte": start, "end_byte": end, "line": source[:start].count(b"\n") + 1,
            "raw": raw, "normalized": text, "width": widths[0], "operands": operands,
            "register_output": register_outputs[0].index}


def llvm_site(module, interface, *, checked_line_index=None):
    """Reconstruct argument consumption from constraints, not a supplied map."""
    if not re.search(r'target triple = "x86_64-(?:pc|unknown)-linux-gnu"', module):
        raise Reject("expected x86-64 Linux compiler target")
    if re.search(r"\b(?:callbr|invoke)\b[^\n]*\basm\b", module):
        raise Reject("non-fallthrough asm unsupported")
    lines = module.splitlines(keepends=True)
    matches = [(i, s) for i, s in enumerate(lines)
               if re.search(r"\bcall\b[^\n]*\basm\b", s)]
    if checked_line_index is None:
        if len(matches) != 1:
            raise Reject("exactly one surviving LLVM inline-asm call is required")
        i, line = matches[0]
    else:
        selected = [(i, s) for i, s in matches if i == checked_line_index]
        if len(selected) != 1:
            raise Reject("checked call interval absent or ambiguous")
        i, line = selected[0]
    w = interface["width"]
    pattern = (rf'\s*(%[-a-zA-Z$._0-9]+)\s*=\s*(?:tail\s+)?call i{w} asm sideeffect '
               rf'({STRING}),\s*({STRING})\((.*)\)'
               r'\s*(?:#\d+)?\s*(?:,\s*!dbg\s*!\d+)?\s*(?:,\s*!srcloc\s*!\d+)?\s*\n?')
    m = re.fullmatch(pattern, line)
    if not m:
        raise Reject("LLVM call outside the pinned one-result syntax")
    result, asm, constraints, args = m.groups()
    block = parse(interface["normalized"], w)
    # Reconstruct directly so immediate $0 is not confused with operand %0.
    expected_asm = block.template.replace("$", "$$")
    expected_asm = re.sub(r"%(\d+)", r"$\1", expected_asm)
    if decode_llvm_string(asm) != expected_asm:
        raise Reject("GNU template and actual LLVM template differ")
    expected_constraints, consumers, inout = [], [], []
    for o in block.operands:
        kind = "{ax}" if o.kind == "a" else o.kind
        if o.output:
            expected_constraints.append("=" + ("&" if "&" in o.constraint else "")
                                        + ("*" if o.kind == "m" else "") + kind)
            if o.kind == "m":
                consumers.append(("p" + str(o.index), True))
            if o.constraint.startswith("+"):
                inout.append(("*m" if o.kind == "m" else str(o.index),
                              "p" + str(o.index) if o.kind == "m" else o.var, o.kind == "m"))
        else:
            expected_constraints.append("*m" if o.kind == "m" else o.constraint.replace("a", "{ax}"))
            consumers.append(("p" + str(o.index) if o.kind == "m"
                              else "o" + str(o.tie if o.tie is not None else o.index), o.kind == "m"))
    for c, name, mem in inout:
        expected_constraints.append(c)
        consumers.append((name, mem))
    got = decode_llvm_string(constraints).split(",")
    clobbers = ["~{" + c + "}" for c in block.clobbers] + ["~{dirflag}", "~{fpsr}", "~{flags}"]
    if got != expected_constraints + clobbers:
        raise Reject("actual LLVM constraint/tie/clobber list mismatch")
    actual_args = split_top(args, ",")
    if len(actual_args) != len(consumers):
        raise Reject("LLVM argument consumption mismatch")
    bindings, entry_conditions = {}, []
    for arg, (name, mem) in zip(actual_args, consumers):
        if mem:
            am = re.fullmatch(rf"ptr\s+(?:nonnull\s+)?elementtype\(i{w}\)\s+({VALUE})", arg)
        else:
            rm = re.fullmatch(rf"i{w}\s+range\(i{w} (-?\d+), (-?\d+)\)\s+({VALUE})", arg)
            if rm:
                low, high = int(rm[1]), int(rm[2])
                if not all(-(2 ** (w - 1)) <= v < 2 ** w for v in (low, high)) or low % (2 ** w) == high % (2 ** w):
                    raise Reject("unsupported LLVM range bounds")
                entry_conditions.append({"slot": name, "width": w, "lower": low,
                                         "upper_exclusive": high, "operand": rm[3],
                                         "domain": "defined LLVM range input; modular interval"})
                am = re.fullmatch(rf"i{w}\s+({VALUE})", f"i{w} {rm[3]}")
            else:
                am = re.fullmatch(rf"i{w}\s+({VALUE})", arg)
        if not am:
            raise Reject("typed LLVM operand outside supported subset")
        if name in bindings and bindings[name] != am[1]:
            raise Reject("read-write memory argument is not the same LLVM operand")
        bindings[name] = am[1]
    return {**interface, "llvm_sha256": sha(module), "llvm_line_index": i,
            "llvm_call": line, "result_ssa": result, "bindings": bindings,
            "llvm_entry_conditions": entry_conditions}


def replace_site(module, site, emitted, output_value):
    """Keep every host line byte-for-byte; preserve the original result SSA name."""
    if sha(module) != site["llvm_sha256"]:
        raise Reject("source LLVM changed after interface reconciliation")
    lines = module.splitlines(keepends=True)
    index = site["llvm_line_index"]
    if lines[index] != site["llvm_call"]:
        raise Reject("replacement interval mismatch")
    prefix_defs = re.findall(r"^\s*(%[-a-zA-Z$._0-9]+)\s*=", emitted, re.M)
    old_names = set(re.findall(r"%[-a-zA-Z$._0-9]+", module))
    if len(set(prefix_defs)) != len(prefix_defs) or old_names.intersection(prefix_defs):
        raise Reject("candidate SSA definitions collide with host names")
    dbg = re.search(r",\s*!dbg\s*!\d+", site["llvm_call"])
    suffix = dbg[0] if dbg else ""
    replacement = "".join(s + suffix + "\n" for s in emitted.splitlines())
    replacement += f'  {site["result_ssa"]} = add i{site["width"]} 0, {output_value}{suffix}\n'
    lines[index] = replacement
    candidate = "".join(lines)
    return candidate, {"source_module_sha256": sha(module), "target_module_sha256": sha(candidate),
                       "replaced_line": index, "replacement_sha256": sha(replacement),
                       "host_prefix_sha256": sha("".join(lines[:index])),
                       "host_suffix_sha256": sha("".join(lines[index + 1:]))}

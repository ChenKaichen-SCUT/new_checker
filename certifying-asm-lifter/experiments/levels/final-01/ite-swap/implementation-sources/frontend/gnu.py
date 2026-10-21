"""Fail-closed parser for ONE restricted GNU extended asm statement, not C."""
import ast
import re
from dataclasses import dataclass


class Reject(ValueError):
    pass


def split_top(s, sep):
    parts, start, depth, quoted, escape = [], 0, 0, False, False
    for i, c in enumerate(s):
        if quoted:
            if escape:
                escape = False
            elif c == "\\":
                escape = True
            elif c == '"':
                quoted = False
        elif c == '"':
            quoted = True
        elif c == "(":
            depth += 1
        elif c == ")":
            depth -= 1
            if depth < 0:
                raise Reject("unbalanced operand")
        elif c == sep and depth == 0:
            parts.append(s[start:i].strip())
            start = i + 1
    if quoted or depth:
        raise Reject("unbalanced statement")
    return parts + [s[start:].strip()]


def cstrings(s):
    pattern = r'"(?:[^"\\]|\\.)*"'
    tokens = re.findall(pattern, s)
    if not tokens or re.sub(pattern, "", s).strip():
        raise Reject("literal strings required")
    try:
        return "".join(ast.literal_eval(x) for x in tokens)
    except (SyntaxError, ValueError) as e:
        raise Reject("unsupported string escape") from e


@dataclass
class Operand:
    index: int
    name: str | None
    constraint: str
    expr: str
    output: bool
    kind: str
    tie: int | None = None

    @property
    def var(self):
        return "o" + str(self.index)

    @property
    def readable(self):
        return not self.output or self.constraint.startswith("+")

    @property
    def writable(self):
        return self.output


@dataclass
class Block:
    text: str
    template: str
    operands: list
    clobbers: list
    width: int
    instructions: list

    def token(self, token):
        token = token.strip()
        if re.fullmatch(r"\$-?(?:0x[0-9a-fA-F]+|\d+)", token):
            return int(token[1:], 0)
        m = re.fullmatch(r"%(?:(\d+)|\[([A-Za-z_]\w*)\])", token)
        if not m:
            raise Reject("unsupported asm operand: " + token)
        if m[1] is not None:
            i = int(m[1])
            if i >= len(self.operands):
                raise Reject("operand index out of bounds")
            return self.operands[i]
        found = [o for o in self.operands if o.name == m[2]]
        if len(found) != 1:
            raise Reject("unknown/ambiguous named operand")
        return found[0]


def parse(text, width=32):
    if width not in (32, 64):
        raise Reject("unsupported width")
    m = re.fullmatch(
        r"\s*(?:asm|__asm__|__asm)\s*(?:(?:volatile|__volatile__|__volatile)\s*)?"
        r"\((.*)\)\s*;?\s*", text, re.S
    )
    if not m:
        raise Reject("expected one extended asm statement")
    sections = split_top(m[1], ":")
    if not 2 <= len(sections) <= 4:
        raise Reject("extended asm only; goto unsupported")
    sections += [""] * (4 - len(sections))
    template = cstrings(sections[0])
    ops = []
    for output, section in [(True, sections[1]), (False, sections[2])]:
        for item in split_top(section, ",") if section else []:
            om = re.fullmatch(
                r'(?:\[([A-Za-z_]\w*)\]\s*)?"([^"]+)"\s*'
                r"\(\s*(\*?\s*[A-Za-z_]\w*)\s*\)", item
            )
            if not om:
                raise Reject("operand expression/constraint outside supported subset")
            name, constraint, expr = om.groups()
            expr = re.sub(r"\s+", "", expr)
            tie = None
            if output:
                if not re.fullmatch(r"[=+]&?[raqm]", constraint):
                    raise Reject("unsupported output constraint " + constraint)
                kind = constraint[-1]
                if kind == "m" and "&" in constraint:
                    raise Reject("early-clobber memory unsupported")
            elif re.fullmatch(r"\d+", constraint):
                tie = int(constraint)
                if tie >= len(ops) or not ops[tie].output or ops[tie].kind == "m":
                    raise Reject("invalid tied operand")
                kind = ops[tie].kind
            elif constraint in ("r", "a", "q", "m"):
                kind = constraint
            else:
                raise Reject("unsupported input constraint " + constraint)
            if kind == "m":
                if not re.fullmatch(r"\*[A-Za-z_]\w*", expr):
                    raise Reject("memory operand must be *identifier")
            elif expr.startswith("*"):
                raise Reject("shared scalar input/output evaluation requires host frontend")
            ops.append(Operand(len(ops), name, constraint, expr, output, kind, tie))
    names = [o.name for o in ops if o.name]
    if len(set(names)) != len(names):
        raise Reject("duplicate operand names")
    # Distinct outputs must not assign the same C scalar.
    outputs = [o.expr for o in ops if o.output and o.kind != "m"]
    if len(set(outputs)) != len(outputs):
        raise Reject("duplicate output lvalue")
    fixed = [o for o in ops if o.kind == "a" and o.tie is None]
    if len(fixed) > 1:
        raise Reject("conflicting accumulator constraints")
    clobbers = [cstrings(x) for x in split_top(sections[3], ",")] if sections[3] else []
    if any(c not in ("memory", "cc") for c in clobbers):
        raise Reject("unsupported register/flag clobber")
    raw = [x.strip() for x in re.split(r"[;\n]", template) if x.strip()]
    instructions, lock = [], False
    for item in raw:
        if item == "lock":
            if lock:
                raise Reject("repeated lock")
            lock = True
            continue
        if lock:
            item = "lock " + item
            lock = False
        instructions.append(item)
    if lock:
        raise Reject("dangling lock prefix")
    return Block(text, template, ops, clobbers, width, instructions)


def canonical_index(block, op):
    return op.tie if op.tie is not None else op.index


def initial_bindings(block):
    """Variable -> external symbol name. Ties initialize the output, not a new reg."""
    result = {}
    for o in block.operands:
        if o.kind == "m":
            result["p" + str(o.index)] = ("addr:" + o.expr[1:], 64)
        elif o.readable:
            key = "o" + str(canonical_index(block, o))
            value = ("in:" + o.expr, block.width)
            if key in result and result[key] != value:
                raise Reject("incompatible initial values for tied operand")
            result[key] = value
    return result

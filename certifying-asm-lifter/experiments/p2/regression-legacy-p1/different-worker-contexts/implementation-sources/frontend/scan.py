"""Lexical inventory, NOT a C preprocessor, type checker, or coverage oracle."""
import re


def mask_literals_comments(text):
    """Length-preserving mask. Quotes shield comment markers and vice versa."""
    out = list(text)
    token = re.compile(r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|/\*.*?\*/|//[^\n]*', re.S)
    for match in token.finditer(text):
        for i in range(match.start(), match.end()):
            if out[i] not in "\r\n":
                out[i] = " "
    return "".join(out)


def extract(text):
    # C line splicing occurs before token recognition, including within keywords.
    spliced, positions = [], []
    i = 0
    splice = re.compile(r"\\\r?\n")
    while i < len(text):
        m = splice.match(text, i)
        if m:
            i += len(m[0])
        else:
            spliced.append(text[i])
            positions.append(i)
            i += 1
    logical = "".join(spliced)
    clean = mask_literals_comments(logical)
    pattern = r"\b(?:asm|__asm__|__asm)\b\s*(?:(?:volatile|__volatile__|__volatile)\b\s*)?\("
    for match in re.finditer(pattern, clean):
        start, end, depth = match.start(), match.end(), 1
        while end < len(clean) and depth:
            depth += (clean[end] == "(") - (clean[end] == ")")
            end += 1
        if depth == 0:
            yield text.count("\n", 0, positions[start]) + 1, logical[start:end] + ";"

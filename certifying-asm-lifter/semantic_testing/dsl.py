"""Strict structured, acyclic subset of theory/01. All checks survive python -O."""
import hashlib
import itertools
import json

MASK = (1 << 32) - 1
CAT = "8561d85057c449c0828b888c61e3cfeda8b73750474353eee1dd3f0383b192ac"
FENCES = "b7d347726619c89e336bb19fd0ed5284d0b2fb893f06c957644ab769de691766"


class Invalid(ValueError):
    pass


class Limit(RuntimeError):
    pass


def require(condition, reason):
    if not condition:
        raise Invalid(reason)


def canonical(x):
    return json.dumps(x, sort_keys=True, separators=(",", ":"), ensure_ascii=False)


def digest(x):
    return hashlib.sha256(canonical(x).encode("utf-8")).hexdigest()


def fields(x, names):
    require(type(x) is dict and set(x) == set(names.split()), "SCHEMA_FIELDS")


def name(x):
    require(type(x) is str and x.isidentifier() and len(x) <= 64, "IDENTIFIER")


def etype(e, env):
    if type(e) is bool:
        return "bool"
    if type(e) is int:
        require(0 <= e <= MASK, "BV32_LITERAL")
        return "bv32"
    if type(e) is str:
        require(e in env, "UNDEFINED:" + e)
        return env[e]
    require(type(e) is list and len(e) > 1, "EXPRESSION")
    op, args = e[0], e[1:]
    ts = [etype(a, env) for a in args]
    if op in ("add", "sub", "mul", "band", "bor", "xor", "shl", "shr"):
        require(ts == ["bv32", "bv32"], "BV_BINARY_TYPE")
        return "bv32"
    if op in ("ult", "ule"):
        require(ts == ["bv32", "bv32"], "BV_COMPARE_TYPE")
        return "bool"
    if op == "eq":
        require(len(ts) == 2 and ts[0] == ts[1], "EQUALITY_TYPE")
        return "bool"
    if op in ("and", "or"):
        require(ts == ["bool", "bool"], "BOOL_BINARY_TYPE")
        return "bool"
    if op == "not":
        require(ts == ["bool"], "BOOL_UNARY_TYPE")
        return "bool"
    if op == "ite":
        require(len(ts) == 3 and ts[0] == "bool" and ts[1] == ts[2], "ITE_TYPE")
        return ts[1]
    raise Invalid("UNSUPPORTED_EXPRESSION:" + str(op))


def evaluate(e, env):
    if type(e) in (int, bool):
        return e
    if type(e) is str:
        return env[e]
    op = e[0]
    a = [evaluate(v, env) for v in e[1:]]  # both ITE arms defined and total
    if op == "add": return (a[0] + a[1]) & MASK
    if op == "sub": return (a[0] - a[1]) & MASK
    if op == "mul": return (a[0] * a[1]) & MASK
    if op == "band": return a[0] & a[1]
    if op == "bor": return a[0] | a[1]
    if op == "xor": return a[0] ^ a[1]
    if op == "shl": return (a[0] << (a[1] & 31)) & MASK
    if op == "shr": return a[0] >> (a[1] & 31)
    if op == "ult": return a[0] < a[1]
    if op == "ule": return a[0] <= a[1]
    if op == "eq": return a[0] == a[1]
    if op == "and": return a[0] and a[1]
    if op == "or": return a[0] or a[1]
    if op == "not": return not a[0]
    if op == "ite": return a[1] if a[0] else a[2]
    raise Invalid("UNSUPPORTED_EXPRESSION")


def walk(body):
    for n in body:
        yield n
        if n["op"] == "if":
            yield from walk(n["then"])
            yield from walk(n["else"])


def validate(p):
    fields(p, "version inputs domain objects threads observe")
    require(p["version"] == "finite-tso-1", "VERSION")
    require(type(p["inputs"]) is dict and type(p["objects"]) is dict, "TABLES")
    require(bool(p["objects"]) and type(p["threads"]) is list and bool(p["threads"]), "NONEMPTY")
    env = dict(p["inputs"])
    for k, t in env.items():
        name(k); require(t in ("bool", "bv32"), "INPUT_TYPE")
    require(etype(p["domain"], env) == "bool", "DOMAIN_TYPE")
    for k, v in p["objects"].items():
        name(k); require(etype(v, env) == "bv32", "INIT_TYPE")
    ids = set()
    def sequence(body, incoming):
        require(type(body) is list, "BODY_LIST")
        state = dict(incoming)
        for n in body:
            require(type(n) is dict and "op" in n and "id" in n, "COMMAND")
            op = n["op"]
            schemas = {"set": "id op dst value", "load": "id op dst obj", "store": "id op obj value",
                       "faa": "id op dst obj value", "fence": "id op", "if": "id op guard then else"}
            require(op in schemas, "UNSUPPORTED_COMMAND")
            fields(n, schemas[op]); name(n["id"])
            require(n["id"] not in ids, "DUPLICATE_SITE"); ids.add(n["id"])
            if op == "if":
                require(etype(n["guard"], state) == "bool", "GUARD_TYPE")
                left, right = sequence(n["then"], state), sequence(n["else"], state)
                state = {k: left[k] for k in left.keys() & right.keys() if left[k] == right[k]}
                continue
            if "obj" in n:
                require(n["obj"] in p["objects"], "OBJECT")
            if "value" in n:
                typ = etype(n["value"], state)  # before defining FAA return
                if op != "set": require(typ == "bv32", "WRITE_TYPE")
            if "dst" in n:
                name(n["dst"]); require(n["dst"] not in env, "IMMUTABLE_INPUT")
                typ = typ if op == "set" else "bv32"
                require(n["dst"] not in state or state[n["dst"]] == typ, "LOCAL_TYPE_CHANGE")
                state[n["dst"]] = typ
        return state
    ends = [sequence(t, env) for t in p["threads"]]
    fields(p["observe"], "objects locals")
    require(type(p["observe"]["objects"]) is list and len(set(p["observe"]["objects"])) == len(p["observe"]["objects"]), "OBS_OBJECTS")
    require(all(o in p["objects"] for o in p["observe"]["objects"]), "OBS_OBJECT")
    require(type(p["observe"]["locals"]) is list and len(p["observe"]["locals"]) == len(ends), "OBS_THREADS")
    for end, outputs in zip(ends, p["observe"]["locals"]):
        require(type(outputs) is list and len(set(outputs)) == len(outputs), "OBS_LOCALS")
        for v in outputs: require(v in end and v not in env, "OBS_UNDEFINED")
    return {"status": "WELL_FORMED", "program_sha256": digest(p), "sites": len(ids),
            "terminal_types": [[e[v] for v in vs] for e, vs in zip(ends, p["observe"]["locals"])]}


def structural_paths(body, limit=4096):
    """Every structural branch, including semantically impossible branches."""
    paths = [[]]
    for n in body:
        if n["op"] == "if":
            options = []
            for b, key in ((True, "then"), (False, "else")):
                options += [[{"op": "guard", "id": n["id"], "value": n["guard"], "choice": b}] + s
                            for s in structural_paths(n[key], limit)]
        else:
            options = [[n]]
        if len(paths) * len(options) > limit: raise Limit("STRUCTURAL_PATH_BUDGET")
        paths = [a + b for a in paths for b in options]
    return paths


def path_products(p, limit=4096):
    ps = [structural_paths(t, limit) for t in p["threads"]]
    count = 1
    for a in ps: count *= len(a)
    if count > limit: raise Limit("PATH_PRODUCT_BUDGET")
    return list(itertools.product(*ps))

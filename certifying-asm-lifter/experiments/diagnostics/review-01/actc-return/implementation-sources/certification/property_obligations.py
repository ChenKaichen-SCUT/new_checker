"""Checked obligation selection. Never trusts a producer's dependency graph."""
import json
from collections import Counter, defaultdict, deque
import z3
from z3.z3util import get_vars
from certification.interface import sha
from certification.provenance import require
from certification.p0_host import Obligations
from certification.evidence import save_certificate


def digest(value):
    return sha(json.dumps(value, sort_keys=True, separators=(",", ":")).encode())


class Collector:
    """Structural checking can collect equations, but cannot report EXACT."""
    def __init__(self, report):
        self.equations = []
        self.report = report
        report["obligations"] = []

    def prove(self, name, statement):
        require(name not in {n for n, _ in self.equations}, "duplicate pending obligation")
        self.equations.append((name, statement))
        encoding = z3.Solver()
        encoding.add(z3.Not(statement))
        self.report["obligations"].append({"name":name, "result":"PENDING", "statement":statement.sexpr(),
                                           "smt2":encoding.to_smt2()})


def reconstruct(q, prepared, coverage, host, binding):
    """All objects come from fresh source/LLVM/Q checking, never a plan file."""
    require(coverage["result"] == "WORKER_OBLIGATIONS_PENDING", "missing complete structural worker check")
    require(host["result"] == "PD0_MAIN_PARTITION_EXACT", "missing full Q partition")
    regions, reads, equations = coverage["regions"], coverage["read_bindings"], coverage["_equations"]
    require(len({r["variable"] for r in reads}) == len(reads), "read symbol reused")
    require(len({n for n, _ in equations}) == len(equations), "equation identity reused")
    eq = dict(equations)
    create_thread = {}
    for r in regions:
        ci, tid = r["create_index"], r["thread"]
        require(ci not in create_thread or create_thread[ci] == tid, "activation/thread mismatch")
        create_thread[ci] = tid
    require(set(create_thread) == {a["create_index"] for a in prepared["activations"]}, "source activation omitted")
    src_access, q_access = [], []
    for a in prepared["activations"]:
        tid = create_thread[a["create_index"]]
        for op in a["ops"]:
            if op["kind"] == "read": src_access.append((op["object"],tid,"read",op["width"]))
            elif op["kind"] == "asm":
                for kind in ("RMW-read","RMW-write"):
                    src_access.append((op["pointer"][1:],tid,kind,op["interface"]["width"]))
    main = next(t for t in q["threads"] if t["name"] == "main")
    for op in prepared["main_ops"]:
        if op["kind"] == "read": src_access.append((op["object"],main["id"],"read",op["width"]))
    event_access = []
    for t in q["threads"]:
        for e in t["events"]:
            if e["class"] not in {"Load","Store","RMWStore","Init"}: continue
            a = e["addr"]
            require(a.get("kind") == "object" and a.get("complete") is True and a.get("type") == "bv64",
                    "PD0 requires independently checked constant complete-object addresses")
            name = a["name"]
            require(name in prepared["objects"] or name in host["protocol_objects"], "unknown alias/object")
            if e["class"] == "Init" or name in host["protocol_objects"]: continue
            kind = "RMW-write" if e["class"] == "RMWStore" else "RMW-read" if e["class"] == "Load" and "RMW" in e["tags"] else "read" if e["class"] == "Load" else "write"
            q_access.append((name,t["id"],kind,e["width"]))
            event_access.append({"object":name,"thread":t["id"],"kind":kind,"width":e["width"],"event":e["id"]})
    require(Counter(src_access) == Counter(q_access), "independent whole-program access census mismatch")
    owners = {}
    for obj in prepared["objects"]:
        ss = [v for v in src_access if v[0] == obj]; qq = [v for v in q_access if v[0] == obj]
        tids = {v[1] for v in ss + qq}
        if ss and len(tids) == 1 and main["id"] not in tids and all(v[2].startswith("RMW-") for v in ss+qq):
            owners[obj] = {"thread":next(iter(tids)), "accesses":[e for e in event_access if e["object"] == obj]}
    nodes = {"r:"+str(r["event"]) for r in reads}
    varnode = {r["variable"]:"r:"+str(r["event"]) for r in reads}
    writes = {r["write_value_obligation"]:r for r in regions}
    require(set(writes) <= set(eq), "missing write-value equation")
    returns = {r["reference_return_obligation"] for r in regions}
    edges, roots = set(), set()
    for name, statement in equations:
        consumer = "w:"+str(writes[name]["write"]) if name in writes else "o:"+name
        nodes.add(consumer)
        # Reference-return is a universal block identity, still solved below.
        # Only its actual uses, not its mere presence, make the value observable.
        if name not in writes and name not in returns: roots.add(consumer)
        if name in writes and writes[name]["object"] not in owners: roots.add(consumer)
        for variable in get_vars(statement):
            if variable.sexpr() in varnode: edges.add((consumer,varnode[variable.sexpr()]))
    for rd in reads:
        for wr in regions:
            if rd["object"] == wr["object"]: edges.add(("r:"+str(rd["event"]),"w:"+str(wr["write"])))
    # Full main/runtime checks are never candidates for omission. All main
    # accesses already prevent ownership; their assertions are bound below.
    facts = {"binding":binding, "owners":owners, "accesses":event_access,
             "nodes":sorted(nodes), "roots":sorted(roots), "edges":[list(e) for e in sorted(edges)],
             "read_bindings":reads, "regions":regions,
             "equations":[{"name":n,"statement_sha256":sha(e.sexpr())} for n,e in equations],
             "phi":{"kind":"all-user-assertions","actual_events":sorted(host["user_assertions"])},
             "all_actual_monitors":sorted(host["all_assertions"])}
    return facts


def propose(facts):
    closed = set(facts["roots"])
    providers = defaultdict(list)
    for consumer, provider in facts["edges"]:
        providers[consumer].append(provider)
    work = deque(closed)
    while work:
        for provider in providers[work.popleft()]:
            if provider not in closed:
                closed.add(provider)
                work.append(provider)
    omitted_objects = []
    for name in facts["owners"]:
        owned = {"r:"+str(r["event"]) for r in facts["read_bindings"] if r["object"] == name}
        owned |= {"w:"+str(r["write"]) for r in facts["regions"] if r["object"] == name}
        if not owned & closed: omitted_objects.append(name)
    omit = sorted(r["write_value_obligation"] for r in facts["regions"] if r["object"] in omitted_objects)
    return {"facts_sha256":digest(facts), "closed":sorted(closed), "omitted_objects":sorted(omitted_objects),
            "omitted":omit, "selected":sorted(e["name"] for e in facts["equations"] if e["name"] not in omit)}


def verify(facts, equations, proposal, out):
    """Validate closure and every omitted obligation, then solve selected ones."""
    report = {"result":"REJECT", "legacy_L4_eligible":False, "full_L3_claim":False,
              "program_verdict_eligible":False, "property_verdict_eligible":False}
    proof = Obligations(report)
    try:
        require(set(proposal) == {"facts_sha256","closed","omitted_objects","omitted","selected"}, "proposal schema")
        require(proposal["facts_sha256"] == digest(facts), "stale facts/property/Q binding")
        for k in ("closed","omitted_objects","omitted","selected"):
            require(proposal[k] == sorted(set(proposal[k])), "duplicate/noncanonical proposal field")
        closed = set(proposal["closed"])
        require(set(facts["roots"]) <= closed <= set(facts["nodes"]), "missing property/structural root")
        require(all(a not in closed or b in closed for a,b in facts["edges"]), "dependency closure missing provider")
        omitted_objects = set(proposal["omitted_objects"])
        require(omitted_objects <= set(facts["owners"]), "unproved dynamic ownership")
        boundary=[]
        for name in sorted(omitted_objects):
            rs = [r for r in facts["read_bindings"] if r["object"] == name]
            ws = [r for r in facts["regions"] if r["object"] == name]
            require(rs and ws and not ({"r:"+str(r["event"]) for r in rs} | {"w:"+str(w["write"]) for w in ws}) & closed,
                    "omitted values cross property/boundary")
            boundary.append({"object":name, **facts["owners"][name],
                             "rule":"PD-SAFE single-owner value repair; all events/order/atomicity retained"})
        allowed = sorted(r["write_value_obligation"] for r in facts["regions"] if r["object"] in omitted_objects)
        require(proposal["omitted"] == allowed, "invalid omitted obligation kind/census")
        require(proposal["selected"] == sorted(n for n,_ in equations if n not in allowed), "uncovered certification obligation")
        require(facts["equations"] == [{"name":n,"statement_sha256":sha(e.sexpr())} for n,e in equations], "equation drift")
        for name, statement in equations:
            if name not in allowed: proof.prove(name, statement)
        report.update(result="PROPERTY_OBSERVATION_TRANSFER", boundary_certificates=boundary,
                      omitted=allowed, selected=proposal["selected"], facts_sha256=digest(facts),
                      phi=facts["phi"], binding=facts["binding"], no_events_removed=True,
                      full_value_equivalence_claim=False)
    except Exception as error: report["reason"] = str(error)
    save_certificate(out, report)
    return report


def check_plan(q, prepared, coverage, host, binding, proposal, out):
    # Independent of the proposal producer: no supplied graph, owner claim or
    # serialized EXACT is used to construct the acceptance facts.
    fresh = reconstruct(q, prepared, coverage, host, binding)
    return verify(fresh, coverage["_equations"], proposal, out)

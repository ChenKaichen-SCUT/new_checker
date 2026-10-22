"""Independent acceptance: old raw-DSL B, explicit A0, concrete graph checks."""
import time
from pathlib import Path
from semantic_testing.dsl import require, canonical, digest
from semantic_testing.run import save, load, task
from semantic_testing.witness import inspect, seal, verify
from .patterns import matches

LIMITS = dict(oracle_seconds=15,explicit_seconds=15,max_graphs=512,max_paths=4096)


def grammar_membership(p,d,requirements=()):
    """Recover the grammar parameters FROM RAW DSL, ignoring model/choices.json."""
    from .grammar import KINDS,VALUES,decode,conditional,validate_domain
    from semantic_testing.dsl import validate
    validate_domain(d); validate(p)
    require(len(p['threads']) == d['threads'],'GRAMMAR_THREADS')
    choices = []
    for t,body in enumerate(p['threads']):
        pos = 0
        for j in range(d['slots']):
            sid,dst = f't{t}s{j}',f'v{j}'
            require(pos < len(body) and body[pos] == dict(op='set',id=sid+'z',dst=dst,value=0),'SLOT_ENTRY')
            pos += 1
            def recover(nodes,suffix):
                require(len(nodes) <= 1,'ONE_OPERATION_ARM')
                if not nodes: return dict(kind=0,obj=0,value=0)
                n=nodes[0]; require(n['id'] == sid+suffix and n['op'] in KINDS[1:],'GRAMMAR_OPERATION')
                obj = 'xy'.index(n['obj']) if 'obj' in n else 0
                val = next((i for i,x in enumerate(VALUES) if canonical(x) == canonical(n.get('value',0))),None)
                require(val is not None,'INPUT_ONLY_VALUE')
                return dict(kind=KINDS.index(n['op']),obj=obj,value=val)
            if pos < len(body) and body[pos]['op'] == 'if':
                n=body[pos]; require(n['id'] == sid+'c' and conditional(d,t,j),'BRANCH_SLOT')
                guards = {1:'b',2:['not','b']}
                if j: guards[3] = ['eq',f'v{j-1}',0]
                mode=next((m for m,g in guards.items() if canonical(g) == canonical(n['guard'])),None)
                require(mode is not None,'GUARD_GRAMMAR')
                arms=[recover(n['then'],'a'),recover(n['else'],'b')]; pos+=1
            else:
                mode=0; nodes=[]
                if pos < len(body) and body[pos]['id'] == sid+'a': nodes=[body[pos]]; pos+=1
                a=recover(nodes,'a'); arms=[a,dict(a)]
            choices.append(dict(mode=mode,arms=arms))
        require(pos == len(body),'UNCONSUMED_HOST_NODE')
    require(canonical(decode(d,choices)) == canonical(p),'RAW_GRAMMAR_RECONSTRUCTION')
    for req in requirements:
        valid=False
        for i,c in enumerate(choices):
            aa=c['arms']; j=i%d['slots']
            if c['mode'] and all(a['kind'] == 3 for a in aa) and aa[0]['obj'] == aa[1]['obj']:
                if req == 'faa_branch' and c['mode'] in (1,2): valid=True
                if req == 'read_branch' and c['mode'] == 3 and j and choices[i-1]['mode'] == 0 and choices[i-1]['arms'][0]['kind'] in (1,3): valid=True
        require(valid,'UNMET_GRAMMAR_REQUIREMENT')
    return choices


def evaluate(p, output, targets):
    start = time.perf_counter()
    result, independent, feature = task(p,output,LIMITS,True)
    output = Path(output)
    record = dict(status='UNKNOWN',program_sha256=digest(p),oracle=result['status'],independent=independent['status'],
                  graphs=len(result['graphs']),observations=len(result['observations']),queries=len(result['queries']))
    if result['status'] == 'COMPLETE' and independent['status'] == 'AGREEMENT' and feature is not None:
        hits = {}
        for i,cert in enumerate(result['graphs']):
            g = verify(p,cert)
            for target in targets:
                if target['name'] not in hits:
                    embedding = matches(g,target)
                    if embedding is not None: hits[target['name']] = dict(graph=i,embedding=embedding)
        record.update(status='EXACT_INDEPENDENT',hits=hits,features=feature,
                      semantic_key=digest(sorted(canonical(x['observation']) for x in result['graphs'])),
                      relation_key=digest(feature['objective']))
    record['wall_seconds'] = time.perf_counter()-start
    save(output/'evaluation.json',record)
    return record


def accept_synthesis(directory, targets):
    directory = Path(directory); request = load(directory/'request.json')
    p = load(directory/'program.json'); cores = load(directory/'witnesses.json')
    recovered = grammar_membership(p,request['domain'],request['requirements'])
    save(directory/'recovered-grammar.json',recovered)
    require(len(cores) == len(request['requests']), 'REQUEST_WITNESS_COUNT')
    # No dependency on the synthesizer's event construction, embedding or ranks.
    local = []
    for req,core in zip(request['requests'],cores):
        cert = seal(p,core); g = verify(p,cert)
        if 'input' in req: require(core['inputs']['b'] == req['input'], 'REQUEST_INPUT')
        embedding = matches(g,req['pattern']); require(embedding is not None,'TARGET_NOT_IN_GRAPH')
        local.append(dict(certificate=cert,embedding=embedding))
    save(directory/'independent-witnesses.json',local)
    evaluation = evaluate(p,directory/'oracle',targets)
    if evaluation['status'] != 'EXACT_INDEPENDENT':
        save(directory/'acceptance.json',dict(status='UNKNOWN',reason='FULL_GRAPH_CHECK_INCOMPLETE'))
        return evaluation
    result = load(directory/'oracle'/'result.json')
    keys = {canonical(c['core']) for c in result['graphs']}
    for core in cores: require(canonical(core) in keys,'SYNTHESIS_WITNESS_NOT_IN_COMPLETE_SET')
    save(directory/'acceptance.json',dict(status='CONFIRMED_SYNTHESIS',quantifier='for each request exists a complete execution',
                                        program_sha256=digest(p),full_graphs=len(keys),targets=[r['pattern']['name'] for r in request['requests']]))
    return evaluation


def replay(directory):
    """Regenerate the formula separately from rechecking raw-DSL success evidence."""
    import z3
    from .encode import Synthesis
    from semantic_testing.exhaustive import compare
    directory = Path(directory); req = load(directory/'request.json'); result = load(directory/'synthesis.json')
    enc = Synthesis(req['domain'],req['requests'],req['requirements'],req['propagation'],req['seed'])
    parsed = z3.parse_smt2_file(str(directory/'formula.smt2'))
    # Z3's simplify orders commutative children by context-local AST ids. A
    # fresh reconstruction after other queries can choose a different order.
    # Normalize only proved commutative operators, never drop assertions/fields.
    intern, memo = {}, {}
    def normal(x):
        if x.get_id() in memo: return memo[x.get_id()]
        args = [normal(a) for a in x.children()]
        if x.decl().kind() in (z3.Z3_OP_AND,z3.Z3_OP_OR,z3.Z3_OP_EQ,z3.Z3_OP_DISTINCT,
                              z3.Z3_OP_ADD,z3.Z3_OP_MUL,z3.Z3_OP_BADD,z3.Z3_OP_BMUL):
            args.sort()
        key = (x.decl().kind(),str(x.sort()),str(x.decl()),tuple(args))
        if key not in intern: intern[key] = len(intern)
        memo[x.get_id()] = intern[key]
        return intern[key]
    require([normal(x) for x in parsed] == [normal(x) for x in enc.solver.assertions()],'FORMULA_REQUEST_BINDING')
    out = dict(binding=True,status=result['status'])
    if result['status'] == 'BOUNDED_UNSAT':
        enc.solver.set(timeout=30000)
        status = str(enc.solver.check()); require(status == 'unsat','UNSAT_REPLAY')
        out.update(replayed=status,independence='same formula solver replay, not a checked resolution proof')
    if (directory/'acceptance.json').exists() and load(directory/'acceptance.json')['status'] == 'CONFIRMED_SYNTHESIS':
        p = load(directory/'program.json'); r = load(directory/'oracle'/'result.json')
        grammar_membership(p,req['domain'],req['requirements'])
        a = compare(p,r); require(a['status'] == 'AGREEMENT','COMPLETE_GRAPH_REPLAY')
        for cert in r['graphs']: verify(p,cert)
        cores = load(directory/'witnesses.json')
        for q,c in zip(req['requests'],cores): require(matches(inspect(p,c),q['pattern']) is not None,'EMBEDDING_REPLAY')
        out.update(complete_graphs=len(r['graphs']),independent='A0+concrete raw DSL')
    return out

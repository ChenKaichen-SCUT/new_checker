"""Independent acceptance: old raw-DSL B, explicit A0, concrete graph checks."""
import time
from pathlib import Path
from semantic_testing.dsl import require, canonical, digest
from semantic_testing.run import save, load, task
from semantic_testing.witness import inspect, seal, verify
from .patterns import matches

LIMITS = dict(oracle_seconds=15,explicit_seconds=15,max_graphs=512,max_paths=4096)


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
    require([x.sexpr() for x in parsed] == [x.sexpr() for x in enc.solver.assertions()],'FORMULA_REQUEST_BINDING')
    out = dict(binding=True,status=result['status'])
    if result['status'] == 'BOUNDED_UNSAT':
        enc.solver.set(timeout=30000)
        status = str(enc.solver.check()); require(status == 'unsat','UNSAT_REPLAY')
        out.update(replayed=status,independence='same formula solver replay, not a checked resolution proof')
    if (directory/'acceptance.json').exists() and load(directory/'acceptance.json')['status'] == 'CONFIRMED_SYNTHESIS':
        p = load(directory/'program.json'); r = load(directory/'oracle'/'result.json')
        a = compare(p,r); require(a['status'] == 'AGREEMENT','COMPLETE_GRAPH_REPLAY')
        for cert in r['graphs']: verify(p,cert)
        cores = load(directory/'witnesses.json')
        for q,c in zip(req['requests'],cores): require(matches(inspect(p,c),q['pattern']) is not None,'EMBEDDING_REPLAY')
        out.update(complete_graphs=len(r['graphs']),independent='A0+concrete raw DSL')
    return out

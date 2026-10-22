"""Fixed correctness pilot, boundary acceptance and raw evidence replay."""
import copy
import time
from pathlib import Path
from semantic_testing.run import load,save
from semantic_testing.dsl import require
from semantic_testing.pool import candidate_pool, boundaries
from semantic_testing.exhaustive import decide_a
from semantic_testing.witness import inspect
from semantic_testing.transforms import merge,verify_rule
from semantic_testing.expectations import relation
from .grammar import domain
from .patterns import matches,targets,negatives,target
from .encode import synthesize
from .check import accept_synthesis,replay,evaluate


def run(output):
    output = Path(output); output.mkdir(parents=True,exist_ok=False)
    ts = targets(); rows = []
    jobs = [(p['name'],domain(3 if p['name'] in ('three_thread_faa','relay_three_threads') else 2),[dict(pattern=p)],[],True,True) for p in ts]
    jobs += [(p['name'],domain(),[dict(pattern=p)],[],True,False) for p in negatives()]
    jobs += [('exclusive_faa',domain(),[dict(pattern=ts[3],input=False),dict(pattern=ts[3],input=True)],['faa_branch'],True,True),
             ('read_control',domain(),[dict(pattern=ts[3])],['read_branch'],True,True),
             ('multi_target',domain(),[dict(pattern=ts[0]),dict(pattern=ts[6])],[],True,True),
             ('atomic_no_propagation',domain(3),[dict(pattern=ts[5])],[],False,True),
             ('sb_no_propagation',domain(),[dict(pattern=ts[7])],[],False,True)]
    # With one slot a thread takes just one arm. Two ordered reads in the same
    # thread would require simultaneously activating mutually exclusive choices.
    impossible = target('one_slot_two_reads',[dict(kind='R'),dict(kind='R')],[('po',0,1)])
    jobs += [('path_exclusivity',domain(2,1),[dict(pattern=impossible)],[],True,False)]
    for name,d,reqs,requirements,prop,expected in jobs:
        start = time.perf_counter(); dest = output/name
        r = synthesize(d,reqs,dest,seconds=15,seed=7,requirements=requirements,propagation=prop)
        row = dict(name=name,expected='SAT' if expected else 'BOUNDED_UNSAT',synthesis=r)
        try:
            if r['status'] == 'SAT_CANDIDATE':
                a = accept_synthesis(dest,ts); row.update(independent=a['status'],graphs=a['graphs'],hits=list(a.get('hits',{})))
                row['pass'] = expected and a['status'] == 'EXACT_INDEPENDENT'
            else: row['pass'] = not expected and r['status'] == 'BOUNDED_UNSAT'
            if (dest/'formula.smt2').exists(): row['replay'] = replay(dest)
        except Exception as e:
            import traceback
            row.update(pass_=False,error=repr(e)); row['pass'] = False
            (dest/'acceptance-failure.log').write_text(traceback.format_exc(),encoding='utf-8')
        row['wall_seconds'] = time.perf_counter()-start; rows.append(row)
        save(output/'progress.json',rows); print(name,r['status'],row['pass'],flush=True)
    # Historical denominator: re-execute independent explicit A, never use old
    # pool as synthesis input. Full graph patterns are re-extracted, not guessed.
    historical = []; start = time.perf_counter()
    for name,p in candidate_pool().items():
        a = decide_a(p); require(a['status'] == 'COMPLETE','HISTORICAL_A_INCOMPLETE')
        import json
        graphs = [inspect(p,json.loads(c)) for c in a['graphs']]
        hits = [t['name'] for t in ts if any(matches(g,t) is not None for g in graphs)]
        historical.append(dict(name=name,graphs=len(graphs),hits=hits))
    save(output/'historical100.json',dict(tasks=historical,seconds=time.perf_counter()-start,
        union=sorted(set().union(*(set(x['hits']) for x in historical)))))
    # Old proved diamond rule, actual raw DSL on both sides. Active relation
    # patterns transport; there is no claim about static event-count equality.
    p = boundaries()['diamond']; q,claim = merge(p,'d','merged'); rule = verify_rule(p,q,claim)
    pr = evaluate(p,output/'transform-source',ts); qr = evaluate(q,output/'transform-target',ts)
    eq = relation(p,load(output/'transform-source'/'result.json'),q,load(output/'transform-target'/'result.json'))
    transform = dict(rule=rule,relation=eq,targets_preserved=set(pr['hits']) == set(qr['hits']),
                     induced_F3_preserved=pr['features']['heldout_three'] == qr['features']['heldout_three'])
    save(output/'transform.json',transform)
    summary = dict(rows=rows,pass_=all(x['pass'] for x in rows),transform=transform)
    summary['pass'] = summary.pop('pass_') and eq['status'] == 'EQ_OBS' and transform['targets_preserved'] and transform['induced_F3_preserved']
    save(output/'summary.json',summary)
    return summary


if __name__ == '__main__':
    import sys
    if not run(sys.argv[1])['pass']: raise SystemExit(1)

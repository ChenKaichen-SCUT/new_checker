"""Additional correctness obligation: the SAME read-dependent branch takes
both arms under the SAME input, in two complete legal executions. No template.
This boundary check is separate from the frozen performance algorithm.
"""
import time
from pathlib import Path
import z3
from semantic_testing.run import save,load
from semantic_testing.symbolic import raw_smt,value
from semantic_testing.dsl import require,canonical
from semantic_testing.witness import seal,verify
from .encode import Synthesis,both,either
from .grammar import domain,decode,conditional
from .patterns import targets
from .check import evaluate,grammar_membership


def encoding():
    d=domain(); reqs=[dict(pattern=targets()[3],input=False)]*2
    enc=Synthesis(d,reqs,['read_branch'],True,7)
    focus=z3.Int('shared_read_branch_focus')
    opts=[]
    for i,c in enumerate(enc.slots):
        if not conditional(d,c['t'],c['j']) or c['j']==0: continue
        prev=enc.slots[i-1]
        opts.append(both(focus==i,c['mode']==3,c['arms'][0]['kind']==3,c['arms'][1]['kind']==3,
                         c['arms'][0]['obj']==c['arms'][1]['obj'],prev['mode']==0,
                         either(prev['arms'][0]['kind']==1,prev['arms'][0]['kind']==3),
                         enc.executions[0].operations[i]['take'],z3.Not(enc.executions[1].operations[i]['take'])))
    enc.solver.add(either(*opts))
    return enc


def run(output):
    output=Path(output); output.mkdir(parents=True,exist_ok=False); start=time.perf_counter()
    enc=encoding(); enc.solver.set(timeout=15000,max_memory=2048)
    save(output/'request.json',dict(domain=domain(),scope='same input b=false; exists one shared read-branch; two complete executions with opposite branch choices',seed=7,seconds=15))
    (output/'formula.smt2').write_text(raw_smt(enc.solver),encoding='utf-8')
    status=enc.solver.check(); result=dict(status=str(status))
    if status==z3.sat:
        m=enc.solver.model(); p=decode(domain(),enc.choices(m)); recovered=grammar_membership(p,domain(),['read_branch']); save(output/'program.json',p)
        certs=[seal(p,e.core(m)) for e in enc.executions]
        save(output/'witnesses.json',certs)
        for c in certs: verify(p,c)
        # Recover the shared active branch from raw traces, not the SMT focus.
        choices=[]
        for c in certs:
            choices.append({n[0]:n[1] for tr in c['paths'] for n in tr if len(n)==2})
        read_branches=set()
        for i,c in enumerate(recovered):
            t,j=divmod(i,domain()['slots'])
            if j and c['mode']==3 and recovered[i-1]['mode']==0 and recovered[i-1]['arms'][0]['kind'] in (1,3) and all(a['kind']==3 for a in c['arms']) and c['arms'][0]['obj']==c['arms'][1]['obj']:
                read_branches.add(f't{t}s{j}c')
        opposite=[sid for sid in read_branches if choices[0].get(sid) is True and choices[1].get(sid) is False]
        require(opposite and certs[0]['core']['inputs']==certs[1]['core']['inputs'],'BRANCH_REACHABILITY')
        a=evaluate(p,output/'oracle',targets()); require(a['status']=='EXACT_INDEPENDENT','FULL_CHECK')
        keys={canonical(c['core']) for c in load(output/'oracle/result.json')['graphs']}
        require(all(canonical(c['core']) in keys for c in certs),'WITNESS_COVERAGE')
        result.update(status='CONFIRMED_BOTH_READ_BRANCHES',branch=opposite,graphs=a['graphs'],same_input=certs[0]['core']['inputs'])
    elif status==z3.unknown: result['reason']=enc.solver.reason_unknown()
    result['wall_seconds']=time.perf_counter()-start; save(output/'result.json',result)
    return result


if __name__=='__main__':
    import sys
    print(run(sys.argv[1]))

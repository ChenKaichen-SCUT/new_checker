"""Joint syntax/global-graph encoding. Candidate generation is NOT trusted."""
import itertools
import time
from pathlib import Path
import z3
from semantic_testing.dsl import require
from semantic_testing.symbolic import raw_smt, value
from semantic_testing.run import save, memory
from .grammar import conditional, decode, validate_domain
from .patterns import validate as validate_pattern


def both(*xs): return z3.simplify(z3.And(*xs))
def either(*xs): return z3.simplify(z3.Or(*xs))


class Synthesis:
    def __init__(self, d, requests, requirements=(), propagation=True, seed=0):
        validate_domain(d)
        self.d, self.requests = d, requests
        self.solver = s = z3.Solver(); s.set(random_seed=seed)
        self.slots, self.executions = [], []
        for t in range(d['threads']):
            for j in range(d['slots']):
                mode = z3.Int(f'mode_{t}_{j}')
                s.add(mode >= 0, mode < (4 if j else 3) if conditional(d,t,j) else mode == 0)
                arms = []
                for a in range(2):
                    v = {k:z3.Int(f'{k}_{t}_{j}_{a}') for k in ('kind','obj','value')}
                    s.add(v['kind'] >= 0, v['kind'] < 5, v['obj'] >= 0, v['obj'] < d['objects'],v['value'] >= 0,v['value'] < 4)
                    arms.append(v)
                for k in arms[0]: s.add(z3.Implies(mode == 0,arms[0][k] == arms[1][k]))
                self.slots.append(dict(mode=mode,arms=arms,t=t,j=j))
        for req in requirements:
            require(req in ('faa_branch','read_branch'), 'UNKNOWN_REQUIREMENT')
            xs = []
            for i,c in enumerate(self.slots):
                if not conditional(d,c['t'],c['j']): continue
                q = [c['mode'] > 0, c['arms'][0]['kind'] == 3, c['arms'][1]['kind'] == 3,
                     c['arms'][0]['obj'] == c['arms'][1]['obj']]
                if req == 'read_branch':
                    if c['j'] == 0: continue
                    prev = self.slots[i-1]
                    q += [c['mode'] == 3, prev['mode'] == 0, either(prev['arms'][0]['kind'] == 1,prev['arms'][0]['kind'] == 3)]
                else: q += [either(c['mode'] == 1,c['mode'] == 2)]
                xs.append(both(*q))
            s.add(either(*xs))
        require(requests, 'NO_TARGET')
        for i, req in enumerate(requests):
            require(set(req) <= {'pattern','input'}, 'REQUEST_SCHEMA')
            if 'input' in req: require(type(req['input']) is bool,'INPUT_BOOL')
            validate_pattern(req['pattern'])
            self.executions.append(Execution(self, i, req, propagation))

    def choices(self,m):
        return [dict(mode=value(m,c['mode']),arms=[{k:value(m,v) for k,v in a.items()} for a in c['arms']]) for c in self.slots]


class Execution:
    def __init__(self, syn, number, req, propagation):
        s, d = syn.solver, syn.d
        prefix = f'e{number}_'
        self.input = b = z3.Bool(prefix+'input_b')
        if 'input' in req: s.add(b == req['input'])
        es, operations, outputs = [], [], {}
        for o in range(d['objects']):
            es.append(dict(t=-o-1,j=-1,kind='W',active=z3.BoolVal(True),obj=z3.IntVal(o),val=z3.BitVecVal(0,32),atomic=z3.BoolVal(False),init=True))
        for i,c in enumerate(syn.slots):
            t,j,mode = c['t'],c['j'],c['mode']
            previous = outputs.get((t,j-1),z3.BitVecVal(0,32))
            guard = z3.If(mode == 1,b,z3.If(mode == 2,z3.Not(b),previous == 0))
            take = either(mode == 0,guard)
            selected = {k:z3.If(take,c['arms'][0][k],c['arms'][1][k]) for k in ('kind','obj','value')}
            k,o,v = (selected[k] for k in ('kind','obj','value'))
            operand = z3.If(v == 0,z3.BitVecVal(0,32),z3.If(v == 1,z3.BitVecVal(1,32),z3.If(v == 2,z3.BitVecVal(2,32),z3.If(b,z3.BitVecVal(1,32),z3.BitVecVal(2,32)))))
            read = z3.BitVec(prefix+f'read_{i}',32)
            outputs[t,j] = z3.If(either(k == 1,k == 3),read,z3.BitVecVal(0,32))
            ri,wi = len(es),len(es)+1
            common = dict(t=t,j=j,obj=o,atomic=k == 3,init=False,slot=i)
            es.append(dict(**common,kind='R',active=either(k == 1,k == 3),val=read))
            es.append(dict(**common,kind='W',active=either(k == 2,k == 3),val=z3.If(k == 3,read+operand,operand)))
            operations.append(dict(t=t,j=j,kind=k,mode=mode,take=take,r=ri,w=wi))
        self.es,self.operations = es,operations
        n = len(es); R = [i for i,e in enumerate(es) if e['kind'] == 'R']; W = [i for i,e in enumerate(es) if e['kind'] == 'W']
        self.ranks = ranks = {w:z3.Int(prefix+f'co_{w}') for w in W}
        for w in W:
            s.add(ranks[w] >= 0,ranks[w] < n)
            s.add(ranks[w] == 0 if es[w]['init'] else z3.Implies(es[w]['active'], ranks[w] > 0))
        for a,bw in itertools.combinations(W,2):
            s.add(z3.Implies(both(es[a]['active'],es[bw]['active'],es[a]['obj'] == es[bw]['obj']),ranks[a] != ranks[bw]))
        self.rf = rf = {}
        for r in R:
            bs = []
            for w in W:
                x = z3.Bool(prefix+f'rf_{w}_{r}'); rf[w,r] = x; bs.append(x)
                s.add(z3.Implies(x,both(es[r]['active'],es[w]['active'],es[r]['obj'] == es[w]['obj'],es[r]['val'] == es[w]['val'])))
            s.add(z3.Sum([z3.If(x,1,0) for x in bs]) == z3.If(es[r]['active'],1,0))
        false = z3.BoolVal(False)
        co = {(a,bw):both(es[a]['active'],es[bw]['active'],es[a]['obj'] == es[bw]['obj'],ranks[a] < ranks[bw]) for a in W for bw in W if a != bw}
        fr = {(r,w):either(*[both(rf[v,r],co.get((v,w),false)) for v in W if v != w]) for r in R for w in W}
        rmw = {(op['r'],op['w']):op['kind'] == 3 for op in operations}
        rel = {k:{} for k in ('po','mfence','K','same_thread','same_obj')}
        rel.update(rf=rf,co=co,fr=fr,rmw=rmw)
        ur = [z3.Int(prefix+f'U_{i}') for i in range(n)]; tr = [z3.Int(prefix+f'T_{i}') for i in range(n)]
        for x in ur+tr: s.add(x >= 0,x < n)
        for a,bw in itertools.product(range(n),repeat=2):
            ea,eb = es[a],es[bw]; active = both(ea['active'],eb['active'])
            same_t = ea['t'] == eb['t']; same_o = ea['obj'] == eb['obj']
            inpo = same_t and ea['t'] >= 0 and (ea['j'] < eb['j'] or (ea['j'] == eb['j'] and ea['kind'] == 'R' and eb['kind'] == 'W'))
            po = active if inpo else false
            fence = both(active,either(*[op['kind'] == 4 for op in operations if op['t'] == ea['t'] and ea['j'] < op['j'] < eb['j']])) if inpo else false
            kept = both(po,either(ea['kind'] == 'R',eb['kind'] == 'W',ea['atomic'],eb['atomic']))
            rel['po'][a,bw] = po; rel['mfence'][a,bw] = fence; rel['K'][a,bw] = either(kept,fence)
            rel['same_thread'][a,bw] = z3.BoolVal(same_t); rel['same_obj'][a,bw] = same_o
            cb,fb,rb = co.get((a,bw),false),fr.get((a,bw),false),rf.get((a,bw),false)
            u = either(both(po,same_o),cb,fb,rb)
            ts = either(kept,fence,cb,fb,rb if not same_t else false)
            if not z3.is_false(u): s.add(z3.Implies(u,ur[a] < ur[bw]))
            if not z3.is_false(ts): s.add(z3.Implies(ts,tr[a] < tr[bw]))
        for op in operations:
            r,w = op['r'],op['w']; atomic = op['kind'] == 3
            for v in W:
                if es[v]['t'] != es[r]['t']:
                    s.add(z3.Not(both(atomic,fr[r,v],co.get((v,w),false))))
            if propagation:
                # Consequence of the already proved adjacent FAA predecessor lemma.
                for source in W:
                    s.add(z3.Implies(both(atomic,rf[source,r]),co.get((source,w),false)))
                    for v in W:
                        if source != v and v != w:
                            s.add(z3.Not(both(atomic,rf[source,r],co.get((source,v),false),co.get((v,w),false))))
        self.rel = rel
        p = req['pattern']; maps = []; options = []
        for i,color in enumerate(p['nodes']):
            x = z3.Int(prefix+f'embed_{i}'); maps.append(x)
            candidates = [j for j,e in enumerate(es) if e['kind'] == color['kind'] and ('initial' not in color or e['init'] == color['initial'])]
            options.append(candidates)
            terms = []
            for j in candidates:
                terms.append(both(x == j,es[j]['active'],es[j]['atomic'] == color['atomic'] if 'atomic' in color else True))
            s.add(either(*terms))
        s.add(z3.Distinct(*maps))
        for name,a,bw,v in p['edges']:
            for i in options[a]:
                for j in options[bw]:
                    edge = rel[name].get((i,j),false)
                    s.add(z3.Implies(both(maps[a] == i,maps[bw] == j),edge if v else z3.Not(edge)))
        self.maps = maps

    def core(self,m):
        def eid(i):
            e = self.es[i]
            if e['init']: return 'I:'+'xy'[value(m,e['obj'])]
            op = self.operations[e['slot']]
            suffix = 'a' if value(m,op['take']) else 'b'
            return f"t{e['t']}s{e['j']}"+suffix+':'+e['kind']
        active = [i for i,e in enumerate(self.es) if value(m,e['active'])]
        return dict(inputs={'b':value(m,self.input)},
                    reads={eid(i):value(m,self.es[i]['val']) for i in active if self.es[i]['kind'] == 'R'},
                    rf={eid(r):eid(w) for (w,r),b in self.rf.items() if value(m,b)},
                    co={'xy'[o]:[eid(w) for w in sorted([i for i in active if self.es[i]['kind'] == 'W' and value(m,self.es[i]['obj']) == o],key=lambda i:value(m,self.ranks[i]))] for o in range(sum(e['init'] for e in self.es))})


def synthesize(d, requests, output, seconds=15, seed=0, requirements=(), propagation=True):
    output = Path(output); output.mkdir(parents=True,exist_ok=False)
    start,cpu = time.perf_counter(),time.process_time()
    request = dict(domain=d,requests=requests,requirements=list(requirements),propagation=propagation,seed=seed,seconds=seconds)
    save(output/'request.json',request)
    result = dict(status='UNKNOWN',reason=None,queries=0)
    try:
        enc = Synthesis(d,requests,requirements,propagation,seed)
        result['encoding_seconds'] = time.perf_counter()-start
        (output/'formula.smt2').write_text(raw_smt(enc.solver),encoding='utf-8')
        remaining = seconds-(time.perf_counter()-start)
        if remaining <= 0: result.update(status='TIMEOUT',reason='ENCODING_BUDGET')
        else:
            enc.solver.set(timeout=max(1,int(remaining*1000)),max_memory=2048)
            before = time.perf_counter(); status = enc.solver.check(); result['queries'] = 1
            result['solve_seconds'] = time.perf_counter()-before
            if status == z3.unsat: result.update(status='BOUNDED_UNSAT',reason='Z3_UNSAT_REQUIRES_FORMULA_BINDING')
            elif status != z3.sat:
                reason = enc.solver.reason_unknown(); result.update(status='TIMEOUT' if 'timeout' in reason else 'UNKNOWN',reason=reason)
            else:
                m = enc.solver.model(); choices = enc.choices(m); p = decode(d,choices)
                save(output/'choices.json',choices); save(output/'program.json',p)
                save(output/'witnesses.json',[e.core(m) for e in enc.executions])
                (output/'model.txt').write_text(str(m),encoding='utf-8')
                result['status'] = 'SAT_CANDIDATE'
    except Exception as e:
        import traceback
        result.update(status='INTERNAL_ERROR',reason=repr(e)); (output/'failure.log').write_text(traceback.format_exc(),encoding='utf-8')
    result.update(wall_seconds=time.perf_counter()-start,cpu_seconds=time.process_time()-cpu,peak_bytes=memory())
    save(output/'synthesis.json',result)
    return result

"""Path-sensitive active-history products, never static permutations."""
import z3
from z3.z3util import get_vars
from certification.provenance import require
from certification.evidence import save_certificate
from diagnostics.matching import constraints, conjunction, domain, Queries, assignment


LIMIT = 128


def truth(x):
    return x if z3.is_bool(x) else x != 0


def event(kind, identity, width=0, **kw):
    return {'kind': kind, 'id': str(identity), 'width': width, 'tags': [], 'fields': {}, **kw}


def read_event(identity, address, width=32):
    return event('R', identity, width, response=z3.BitVec(str(identity)+':response', width), fields={'address': address})


def faa(identity, address, value):
    r = read_event(str(identity)+':R', address, value.size())
    r['tags'] = ['A', 'RMW']
    w = event('W', str(identity)+':W', value.size(), tags=['A', 'RMW'], pair=r['id'],
              fields={'address': address, 'value': r['response'] + value})
    return [r, w], r['response']


def serial(paths):
    def convert(x):
        if isinstance(x, z3.AstRef): return x.sexpr()
        if isinstance(x, dict): return {k: convert(v) for k, v in x.items()}
        if isinstance(x, list): return list(map(convert, x))
        return x
    return convert(paths)


def relation(s, t):
    """Only ACTIVE sequences are synchronized; potential node counts may differ."""
    a, b = s['events'], t['events']
    if len(a) != len(b) or any((x['kind'], x['width']) != (y['kind'], y['width']) for x, y in zip(a, b)):
        return z3.BoolVal(False), []
    pairs = [(y['response'], x['response']) for x, y in zip(a, b) if x['kind'] == 'R']
    fields = conjunction(constraints(a, b, tuple(range(len(a)))))
    guard = z3.substitute(t['guard'], *pairs)
    return z3.And(guard, fields), [[x['id'], y['id']] for x, y in zip(a, b)]


def source_domain(source, objects=None):
    es=list({e['id']: e for p in source for e in p['events']}.values())
    if objects is not None:
        # All declared objects, even those not read on this activation/path.
        # This does NOT add executed endpoints or constrain read responses.
        from certification.p1_entry import obj
        es += [read_event('domain:'+n,obj('@'+n),o['width']) for n,o in objects.items()]
    return domain(es, [])


def summarize(source, target, out, *, uniform=False, fixed_witness=None, objects=None):
    report = {'result': 'UNKNOWN', 'program_verdict_eligible': False,
              'semantics': 'source-to-target open active endpoint history inclusion',
              'source_paths': len(source), 'target_paths': len(target), 'uniform_ablation': uniform,
              'obligations': [], 'products': []}
    q = Queries(report)
    try:
        require(0 < len(source) <= LIMIT and 0 < len(target) <= LIMIT, 'complete path budget')
        d = source_domain(source, objects)
        source_vars={v.sexpr() for v in get_vars(d)}
        for p in source:
            for f in [p['guard']]+[v for e in p['events'] for v in list(e['fields'].values())+([e['response']] if 'response' in e else [])]:
                source_vars.update(v.sexpr() for v in get_vars(f))
        feasible, _ = q.ask('domain', d)
        require(feasible == z3.sat, 'source domain nonempty')
        all_guards = z3.Or(*[p['guard'] for p in source])
        status, _ = q.ask('source-path-coverage', z3.And(d, z3.Not(all_guards)))
        require(status == z3.unsat, 'source paths do not cover open environment')
        possible_static = set()
        for si, s in enumerate(source):
            formulas, maps = [], []
            for ti, t in enumerate(target):
                f, m = relation(s, t)
                require(all(v.sexpr() in source_vars for v in get_vars(f)),
                        'uneliminated target-only nondeterminism requires quantified proof')
                formulas.append(f); maps.append(m)
                report['products'].append({'source_path': si, 'target_path': ti, 'active_map': m, 'formula': f.sexpr()})
            bad = z3.And(d, s['guard'], z3.Not(z3.Or(*formulas)))
            if fixed_witness is not None:
                bad = z3.And(bad, *fixed_witness)
            status, model = q.ask('unmatched-source-path-'+str(si), bad)
            if status == z3.sat:
                vars_ = {v.sexpr(): v for f in [bad, *formulas] for v in get_vars(f)}
                report.update(result='OPEN_DIFFERENCE', source_path=si,
                              witness=assignment(model, list(vars_.values())))
                excluded=[]
                for ti,t in enumerate(target):
                    a,b=s['events'],t['events']
                    if len(a)!=len(b):
                        reason=[{'category':'active-event-count','source_count':len(a),'target_count':len(b)}]
                    elif any((x['kind'],x['width'])!=(y['kind'],y['width']) for x,y in zip(a,b)):
                        reason=[{'category':'active-event-type-or-width'}]
                    else:
                        sub=[(y['response'],x['response']) for x,y in zip(a,b) if x['kind']=='R']
                        rows=constraints(a,b,tuple(range(len(a))))+[{'category':'target-path-guard','formula':z3.substitute(t['guard'],*sub)}]
                        reason=[{k:v for k,v in r.items() if k!='formula'} for r in rows
                                if z3.is_false(model.eval(r['formula'],model_completion=True))]
                    excluded.append({'target_path':ti,'blocking_conditions':reason,
                                     'source_nodes':s.get('visited',[]),'target_nodes':t.get('visited',[])})
                report['excluded_alternatives']=excluded
                break
            for m in maps:
                possible_static.update(tuple(p) for p in m)
        else:
            report['result'] = 'GUARDED_OPEN_INCLUSION'
            if uniform:
                # Exact bounded exists(static injection) forall(open state) query.
                # A union-of-possible-edges conflict would NOT establish this.
                choices={edge:z3.Bool('static-edge-'+str(i)) for i,edge in enumerate(sorted(possible_static))}
                conditions=[]
                for side in (0,1):
                    for node in {edge[side] for edge in choices}:
                        group=[v for edge,v in choices.items() if edge[side]==node]
                        if len(group)>1:conditions.append(z3.AtMost(*group,1))
                for s in source:
                    alternatives=[]
                    for t in target:
                        f,m=relation(s,t)
                        alternatives.append(z3.And(f,*[choices[tuple(e)] for e in m]))
                    body=z3.Implies(z3.And(d,s['guard']),z3.Or(*alternatives))
                    vs=[v for v in get_vars(body) if v.sexpr() not in {x.sexpr() for x in choices.values()}]
                    conditions.append(z3.ForAll(vs,body) if vs else body)
                st,_=q.ask('uniform-static-injection-ablation',z3.And(*conditions))
                report['result']='UNIFORM_STATIC_CERTIFICATE_UNAVAILABLE' if st==z3.unsat else 'UNIFORM_STATIC_INJECTION_EXISTS'
        report['closed_execution_claim'] = False
    except Exception as error:
        report.update(result='UNKNOWN', reason=str(error))
    save_certificate(out, report)
    return report


def verify_witness(source, target, claim, out, *, objects=None):
    """Reconstructed paths, all alternatives; does not trust producer products."""
    report = {'result': 'REJECT', 'program_verdict_eligible': False}
    q = Queries(report)
    try:
        if claim['result'] == 'GUARDED_OPEN_INCLUSION':
            rebuilt = summarize(source, target, out / 'reconstructed', objects=objects)
            require(rebuilt['result'] == claim['result'], 'inclusion replay failed')
        elif claim['result'] == 'OPEN_DIFFERENCE':
            s = source[claim['source_path']]
            env = []
            for v in claim['witness']:
                if v['type'] == 'bool':
                    require(type(v['value']) is bool, 'witness Boolean')
                    env.append((z3.Bool(v['name']), z3.BoolVal(v['value'])))
                else:
                    w = int(v['type'][2:]); require(0 <= v['value'] < 2**w, 'witness BV')
                    env.append((z3.BitVec(v['name'], w), z3.BitVecVal(v['value'], w)))
            require(len({a.sexpr() for a, _ in env}) == len(env), 'duplicate witness')
            d = source_domain(source, objects)
            require(z3.is_true(z3.simplify(z3.substitute(z3.And(d, s['guard']), *env))), 'source witness incomplete/invalid')
            for t in target:
                f, _ = relation(s, t)
                # Any still-free target value is existential, never guessed.
                st, _ = q.ask('exclude-target-path-'+str(len(report['obligations'])), z3.substitute(f, *env))
                require(st == z3.unsat, 'witness has matching target execution')
        else:
            raise ValueError('no semantic verdict to verify')
        report['result'] = 'INDEPENDENT_GUARDED_CLAIM_CHECKED'
    except Exception as error:
        report['reason'] = str(error)
    save_certificate(out, report)
    return report

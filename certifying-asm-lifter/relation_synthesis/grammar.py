"""One common finite grammar for synthesis and every generation baseline."""
import random
import copy
from semantic_testing.dsl import require, validate, canonical
from semantic_testing.pool import op, program

KINDS = ('nop', 'load', 'store', 'faa', 'fence')
VALUES = (0, 1, 2, ['ite', 'b', 1, 2])


def domain(threads=2, slots=3, objects=2):
    return dict(version='slot-grammar-1', threads=threads, slots=slots, objects=objects,
                branches=2, values=copy.deepcopy(list(VALUES)), modes=['none', 'b', 'not_b', 'previous_zero'])


def validate_domain(d):
    require(all(type(d[k]) is int for k in ('threads','slots','objects')), 'GRAMMAR_INTEGER_BOUNDS')
    require(canonical(d) == canonical(domain(d['threads'], d['slots'], d['objects'])), 'GRAMMAR_SCHEMA')
    require(d['threads'] in (2, 3) and 1 <= d['slots'] <= 3 and d['objects'] in (1, 2), 'GRAMMAR_BOUNDS')


def conditional(d, t, j):
    return t < 2 and j == d['slots'] - 1


def decode(d, choices):
    validate_domain(d)
    require(len(choices) == d['threads'] * d['slots'], 'SLOT_COVERAGE')
    threads, outputs = [], []
    for t in range(d['threads']):
        body, locs = [], []
        for j in range(d['slots']):
            c = choices[t*d['slots']+j]
            require(set(c) == {'mode', 'arms'} and len(c['arms']) == 2, 'CHOICE_SCHEMA')
            require(type(c['mode']) is int and 0 <= c['mode'] < 4, 'MODE')
            require(conditional(d,t,j) or c['mode'] == 0, 'BRANCH_POSITION')
            require(j > 0 or c['mode'] != 3, 'PREVIOUS_DEFINED')
            if c['mode'] == 0: require(c['arms'][0] == c['arms'][1], 'INACTIVE_ARM_CANONICAL')
            sid, dst = f't{t}s{j}', f'v{j}'
            body.append(op('set', sid+'z', dst=dst, value=0)); locs.append(dst)
            def arm(a, suffix):
                require(set(a) == {'kind','obj','value'}, 'ARM_SCHEMA')
                require(all(type(a[k]) is int for k in a), 'ARM_INTEGER')
                require(0 <= a['kind'] < 5 and 0 <= a['obj'] < d['objects'] and 0 <= a['value'] < 4, 'ARM_BOUNDS')
                kind = KINDS[a['kind']]
                if kind == 'nop': return []
                if kind == 'fence': return [op(kind,sid+suffix)]
                return [op(kind,sid+suffix,'xy'[a['obj']],dst if kind in ('load','faa') else None,
                           copy.deepcopy(VALUES[a['value']]) if kind in ('store','faa') else None)]
            if c['mode'] == 0: body += arm(c['arms'][0], 'a')
            else:
                guard = {1:'b',2:['not','b'],3:['eq',f'v{j-1}',0]}[c['mode']]
                body.append(dict(id=sid+'c',op='if',guard=guard,then=arm(c['arms'][0],'a'),else_=None))
                body[-1].pop('else_'); body[-1]['else'] = arm(c['arms'][1],'b')
        threads.append(body); outputs.append(locs)
    p = program(threads,outputs,{'b':'bool'},dict.fromkeys('xy'[:d['objects']],0))
    validate(p)
    return p


def random_choices(d, rng):
    out = []
    for t in range(d['threads']):
        for j in range(d['slots']):
            mode = rng.randrange(4 if j else 3) if conditional(d,t,j) else 0
            arms = [dict(kind=rng.randrange(5),obj=rng.randrange(d['objects']),value=rng.randrange(4)) for _ in range(2)]
            if mode == 0: arms[1] = dict(arms[0])
            out.append(dict(mode=mode,arms=arms))
    return out

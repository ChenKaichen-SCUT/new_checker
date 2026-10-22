"""Explicit positive/negative partial patterns and independent embeddings."""
import itertools
from semantic_testing.dsl import require

RELATIONS = ('po','rf','co','fr','rmw','mfence','K','same_thread','same_obj')


def validate(p):
    require(set(p) == {'name','nodes','edges'}, 'PATTERN_SCHEMA')
    require(0 < len(p['nodes']) <= 6, 'PATTERN_SIZE')
    for n in p['nodes']:
        require(set(n) <= {'kind','atomic','initial'}, 'NODE_FIELDS')
        require(n.get('kind') in ('R','W'), 'MEMORY_ENDPOINT_REQUIRED')
        for k in ('atomic','initial'):
            if k in n: require(type(n[k]) is bool, 'COLOR_BOOLEAN')
    for r,a,b,v in p['edges']:
        require(r in RELATIONS and type(a) is int and type(b) is int and 0 <= a < len(p['nodes']) and 0 <= b < len(p['nodes']) and type(v) is bool, 'EDGE_SCHEMA')


def matches(g, p):
    """Find an injective embedding, reading only independently rebuilt graph."""
    validate(p)
    es = {e['id']:e for e in g['events'] if e['kind'] in ('R','W')}
    rel = {k:set(map(tuple,v)) for k,v in g['relations'].items()}
    candidates = [[k for k,e in es.items() if all(e[f] == v for f,v in n.items())] for n in p['nodes']]
    order = sorted(range(len(candidates)), key=lambda i:len(candidates[i]))
    assigned = {}
    def edge(r,a,b):
        if r == 'same_thread': return es[a]['thread'] == es[b]['thread']
        if r == 'same_obj': return es[a]['obj'] == es[b]['obj']
        return (a,b) in rel[r]
    def visit(k):
        if k == len(order): return [assigned[i] for i in range(len(order))]
        n = order[k]
        for eid in candidates[n]:
            if eid in assigned.values(): continue
            assigned[n] = eid
            if all(edge(r,assigned[a],assigned[b]) == v for r,a,b,v in p['edges'] if a in assigned and b in assigned):
                result = visit(k+1)
                if result is not None: return result
            del assigned[n]
        return None
    return visit(0)


def target(name, colors, yes=(), no=()):
    return dict(name=name,nodes=colors,edges=[[*e,True] for e in yes]+[[*e,False] for e in no])


def targets():
    r = dict(kind='R',initial=False,atomic=False)
    w = dict(kind='W',initial=False,atomic=False)
    a = dict(kind='W',initial=False,atomic=True)
    ar = dict(kind='R',initial=False,atomic=True)
    # General relation constraints, never a lookup table of program witnesses.
    return [
        target('external_rf',[w,r],[('rf',0,1)],[('same_thread',0,1)]),
        target('store_load_gap',[w,r],[('po',0,1)],[('same_obj',0,1),('K',0,1)]),
        target('fence_order',[w,r],[('mfence',0,1)],[('same_obj',0,1)]),
        target('faa_pair',[ar,a],[('rmw',0,1),('po',0,1),('K',0,1)]),
        target('two_thread_faa',[a,a],[('co',0,1)],[('same_thread',0,1)]),
        target('three_thread_faa',[a,a,a],[('co',0,1),('co',1,2)],
               [('same_thread',0,1),('same_thread',1,2),('same_thread',0,2)]),
        target('three_local_faa',[a,a,a],[('po',0,1),('po',1,2),('co',0,1),('co',1,2)]),
        target('sb_cycle',[w,r,w,r],[('po',0,1),('po',2,3),('fr',1,2),('fr',3,0)],
               [('same_thread',0,2),('same_obj',0,1),('K',0,1),('K',2,3)]),
        target('relay_three_threads',[w,r,w,r],[('rf',0,1),('po',1,2),('rf',2,3)],
               [('same_thread',0,1),('same_thread',0,3),('same_thread',1,3),('same_obj',1,2)]),
    ]


def negatives():
    w = dict(kind='W',initial=False); r = dict(kind='R',initial=False)
    return [
        target('co_cycle',[w,w],[('co',0,1),('co',1,0)]),
        target('init_not_first',[w,dict(kind='W',initial=True)],[('co',0,1)]),
        target('identity_conflict',[w,r],[('same_obj',0,1)],[('same_obj',0,1)]),
        target('tso_cycle',[w,r,w,r],[('mfence',0,1),('fr',1,2),('mfence',2,3),('fr',3,0)]),
        target('rmw_interposed',[dict(kind='R',atomic=True),dict(kind='W',atomic=True),w],
               [('rmw',0,1),('fr',0,2),('co',2,1)],[('same_thread',0,2)]),
        target('rf_two_sources',[w,w,r],[('rf',0,2),('rf',1,2)]),
    ]

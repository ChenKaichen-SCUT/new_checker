"""Recover open endpoints from checked source and actual Q, without a map.

Strict unsupported/export boundaries precede semantic diagnosis. Runtime nodes
are checked as a separate frame; none is mistaken for a missing user endpoint.
"""
import z3
from certification.composition import source_units, serial
from certification.p0_host import basic_event, mem, literal, Obligations
from certification.p1_entry import qexpr, obj
from certification.continuation import core_expr
from certification.provenance import require, unique
from certification.evidence import save_certificate


def expand(units):
    result = []
    for u in units:
        common = {k: v for k, v in u.items() if k not in {'fields', 'response', 'kind', 'id'}}
        if u['kind'] == 'assert':
            result.append(dict(common, id=u['id'], kind='O', tags=[], fields=u['fields']))
        else:
            rid = str(u['id']) + ':R'
            result.append(dict(common, id=rid, kind='R', response=u['response'],
                               tags=['A', 'RMW'] if u['kind'] == 'asm' else [],
                               fields={'address': u['fields']['address']}))
            if u['kind'] == 'asm':
                result.append(dict(common, id=str(u['id']) + ':W', kind='W', tags=['A', 'RMW'], pair=rid,
                                   fields={'address': u['fields']['write_address'], 'value': u['fields']['write_value']}))
    return result


def source_graph(activation, out):
    report = {}
    try:
        graph = expand(source_units(activation, Obligations(report)))
        report['result'] = 'SOURCE_OPEN_SUMMARY'
        return graph
    finally:
        save_certificate(out, report)


def completeness(value, path='$'):
    if isinstance(value, dict):
        if value.get('complete') is False:
            raise ValueError('CAPTURE_INCOMPLETE at ' + path + ': ' + value.get('java_class', value.get('kind', 'object')))
        for k, v in value.items():
            completeness(v, path + '.' + str(k))
    elif isinstance(value, list):
        for i, v in enumerate(value):
            completeness(v, path + '[' + str(i) + ']')


def q_graph(q, thread, argument, out):
    report = {'result': 'UNSUPPORTED'}
    proof = Obligations(report)
    try:
        require(q['format'] == 'dat3m-core-snapshot-v1' and q['arch'] == 'TSO', 'Q format/model')
        completeness(q)
        ids = [e['id'] for t in q['threads'] for e in t['events']]
        require(len(ids) == len(set(ids)), 'global Q identity')
        es = thread['events']
        for i, e in enumerate(es):
            basic_event(e, es[i+1]['id'] if i+1 < len(es) else None)
        require([e['class'] for e in es[:4]] == ['ThreadStart', 'Load', 'Assume', 'ThreadArgument']
                and [e['class'] for e in es[-4:]] == ['Load', 'RMWStore', 'ThreadReturn', 'Label'], 'runtime frame')
        start, r, assume, arg = es[:4]
        cr, cw, ret, end = es[-4:]
        creator = unique([e for t in q['threads'] for e in t['events'] if e['id'] == start['creator']], 'actual creator')
        require(creator['class'] == 'ThreadCreate' and creator['spawned_thread'] == thread['id']
                and arg['creator'] == creator['id'] and arg['argument_index'] == 0
                and len(creator['arguments']) == 1 and arg['writes']['type'] == 'bv64', 'activation/argument identity')
        actual_argument = qexpr(creator['arguments'][0], {})
        expected_argument = z3.BitVecVal(0, 64) if argument == 'null' else obj(argument)
        proof.prove('argument', actual_argument == expected_argument)
        runtime = f"__com_{thread['name']}#{thread['id']}"
        for e, tags in ((r, ['M', 'R', '_']), (cr, ['A', 'M', 'R', 'RMW', '_']), (cw, ['A', 'M', 'W', 'RMW', '_'])):
            mem(e, runtime, 2, tags)
            require(e.get('source') is None, 'runtime/user separation')
        require(cw['rmw_load'] == cr['id'] and end['successor'] is None, 'runtime pair/exit')
        literal(ret['return_value'], 64, 0)
        rv, cv = z3.BitVec('startup', 2), z3.BitVec('completion', 2)
        proof.prove('startup', core_expr(assume['condition'], {r['writes']['name']: rv}) == (z3.Extract(0, 0, rv) != 0))
        proof.prove('completion', core_expr(cw['value'], {cr['writes']['name']: cv}) == (cv & 2))
        env = {arg['writes']['name']: actual_argument}
        endpoints, consumed = [], []
        for e in es[4:-4]:
            consumed.append(e['id'])
            cls = e['class']
            if cls == 'StringAnnotation':
                continue
            if cls == 'Local':
                value = qexpr(e['expr'], env)
                require(e['writes']['type'] == ('bool' if z3.is_bool(value) else 'bv' + str(value.size())), 'Q Local type')
                env[e['writes']['name']] = value
                continue
            ep = {'id': e['id'], 'actual_class': cls, 'source_hint': e.get('source'),
                  'tags': [t for t in e['tags'] if t in {'A', 'RMW'}], 'fields': {}}
            if cls in {'Load', 'Store', 'RMWStore'}:
                kind = 'R' if cls == 'Load' else 'W'
                tags = set(e['tags'])
                require({kind, 'M'} <= tags and tags <= {kind, 'M', '_', 'A', 'RMW'}, 'unsupported Q memory tags')
                require(e['width'] in {32, 64}, 'unsupported public width')
                ep.update(kind=kind, width=e['width'])
                ep['fields']['address'] = qexpr(e['addr'], env)
                if kind == 'R':
                    u = z3.BitVec(f"diagnostic-q-{thread['id']}-read-{e['id']}", e['width'])
                    require(e['writes']['type'] == 'bv' + str(e['width']), 'Q read result width')
                    env[e['writes']['name']] = u
                    ep['response'] = u
                else:
                    ep['fields']['value'] = qexpr(e['value'], env)
                    require(ep['fields']['value'].sort() == z3.BitVecSort(e['width']), 'Q write width')
                    if cls == 'RMWStore':
                        ep['pair'] = e['rmw_load']
            elif cls == 'Assert':
                require(e['error_message'] == 'user assertion', 'unknown monitor role')
                ep.update(kind='O')
                ep['fields']['condition'] = qexpr(e['condition'], env)
                require(z3.is_bool(ep['fields']['condition']), 'monitor type')
            else:
                raise ValueError('unsupported Q public event ' + cls)
            endpoints.append(ep)
        # Empty public body is meaningful ONLY after complete semantic consumption.
        report.update(result='Q_OPEN_SUMMARY', actual_thread=thread['id'], consumed_body_nodes=consumed,
                      endpoints=[serial(e) for e in endpoints])
        return endpoints
    except Exception as error:
        report['reason'] = str(error)
        raise
    finally:
        save_certificate(out, report)


def serialize(graph):
    return [serial(e) for e in graph]

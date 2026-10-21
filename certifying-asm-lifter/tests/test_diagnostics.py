"""Synthetic algebra/certificate attacks, not actual backend captures or bugs."""
import copy
import pytest
import z3
from diagnostics.matching import diagnose, domain, candidates, Incomplete
from diagnostics.verify import verify, universe
from diagnostics.objects import completeness


def graph(prefix='s', increment=1):
    a, r = z3.BitVec('object:x', 64), z3.BitVec(prefix + '-r', 32)
    return [dict(id=prefix+'R', kind='R', width=32, response=r, tags=['A', 'RMW'], fields={'address': a}),
            dict(id=prefix+'W', kind='W', width=32, pair=prefix+'R', tags=['A', 'RMW'],
                 fields={'address': a, 'value': r + increment})]


def check(s, t, tmp_path):
    c = diagnose(s, t, tmp_path / 'producer')
    v = verify(s, t, c, tmp_path / 'checker')
    assert v['result'] == 'VERIFIED_OPEN_CLAIM'
    assert not v['program_verdict_eligible'] and not v['closed_program_counterexample']
    return c


def test_pure_expression_reassociation_and_different_names(tmp_path):
    s, t = graph(), graph('q')
    t[1]['fields']['value'] = (t[0]['response'] + 7) - 6
    assert check(s, t, tmp_path)['result'] == 'OPEN_HISTORY_EQUIVALENT'


@pytest.mark.parametrize('fault', ['value', 'A', 'pair', 'return-monitor', 'order', 'missing-write', 'extra-write', 'width'])
def test_distinct_semantic_faults(fault, tmp_path):
    s, t = graph(), graph('q')
    if fault == 'value':
        t[1]['fields']['value'] += 1
    elif fault == 'A':
        t[1]['tags'].remove('A')
    elif fault == 'pair':
        t[1]['pair'] = 'not-the-read'
    elif fault == 'return-monitor':
        s.append(dict(id='sO', kind='O', tags=[], fields={'condition': s[0]['response'] == 0}))
        t.append(dict(id='qO', kind='O', tags=[], fields={'condition': t[0]['response'] == 1}))
    elif fault == 'order':
        t.reverse()
    elif fault == 'missing-write':
        t.pop()
    elif fault == 'extra-write':
        t.append(copy.deepcopy(t[1])); t[-1]['id'] = 'extra'
    else:
        t[1]['width'] = 64
        t[1]['fields']['value'] = z3.ZeroExt(32, t[1]['fields']['value'])
    assert check(s, t, tmp_path)['result'] == 'OPEN_HISTORY_DIFFERENCE'


def test_four_byte_alignment_and_source_only_domain():
    s, t = graph(), graph('q')
    t[0]['fields']['address'] = z3.BitVec('object:extra', 64)
    solver = z3.Solver()
    solver.add(domain(s, t), s[0]['fields']['address'] == 4, t[0]['fields']['address'] == 0)
    assert solver.check() == z3.sat  # Bad target cannot constrain away this source input.


def test_unknown_address_scope_rejects(tmp_path):
    s = graph()
    s[0]['fields']['address'] += 1
    assert diagnose(s, graph('q'), tmp_path)['result'] == 'UNKNOWN'


def test_mixed_width_objects_must_not_overlap():
    s = graph()
    s.append(dict(id='wide', kind='R', width=64, tags=[], response=z3.BitVec('wide-r', 64),
                  fields={'address': z3.BitVec('object:wide', 64)}))
    solver = z3.Solver()
    solver.add(domain(s, []), z3.BitVec('object:wide', 64) == 8, z3.BitVec('object:x', 64) == 12)
    assert solver.check() == z3.unsat


def test_complete_universes_agree_without_order_pruning():
    s = graph() + graph('s2')
    t = graph('q') + graph('q2')
    assert candidates(s, t) == universe(s, t)
    assert len(universe(s, t)) == 4


def test_caps_do_not_authorize_negative(tmp_path):
    s = graph() + graph('s2')
    t = graph('q') + graph('q2')
    assert diagnose(s, t, tmp_path, limit=1)['result'] == 'UNKNOWN'
    with pytest.raises(Exception, match='candidate limit'):
        universe(s, t, cap=1)


def test_factorial_cap_checked_before_materialization():
    g = [dict(kind='O', id=i, fields={}, tags=[]) for i in range(40)]
    with pytest.raises(Exception, match='candidate limit'):
        universe(g, g)


@pytest.mark.parametrize('attack', ['census', 'universe', 'assignment', 'frontier', 'mapping'])
def test_untrusted_claim_tampering(attack, tmp_path):
    s, t = graph(), graph('q', 2 if attack != 'mapping' else 1)
    c = diagnose(s, t, tmp_path / 'producer')
    if attack == 'census':
        c['source_census'] = {}
    elif attack == 'universe':
        c['candidates'] = 0
    elif attack == 'assignment':
        c['assignment'] = []
    elif attack == 'frontier':
        c['diagnosis']['minimum'] = 0
    else:
        c['mapping'] = [1, 0]
    assert verify(s, t, c, tmp_path / 'checker')['result'] == 'REJECT'


def test_incomplete_export_is_not_a_semantic_counterexample():
    with pytest.raises(ValueError, match='CAPTURE_INCOMPLETE at'):
        completeness({'value': {'complete': False, 'java_class': 'ITEExpr'}})


def test_timeout_cannot_issue_a_semantic_claim(monkeypatch, tmp_path):
    from diagnostics.matching import Queries
    def unknown(*args):
        raise Incomplete('SMT UNKNOWN: injected unit-test timeout')
    monkeypatch.setattr(Queries, 'ask', unknown)
    assert diagnose(graph(), graph('q'), tmp_path)['result'] == 'UNKNOWN'

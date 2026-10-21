"""Exhaustive typed correspondence, common witnesses and ambiguity frontiers.

No ordinal map, input location hint, backend verdict or nominated faulty site.
Negative conclusions require a complete candidate space. Raw extraction and
separate witness checking are in objects.py and verify.py.
"""
from collections import Counter
from pathlib import Path
import itertools
import z3
from z3.z3util import get_vars
from certification.evidence import save_certificate


class Incomplete(Exception):
    pass


def signature(e):
    return e['kind'], e.get('width', 0)


def census(graph):
    return dict(sorted((str(k), n) for k, n in Counter(map(signature, graph)).items()))


def candidates(source, target, limit=512):
    """DFS complete universe; no semantic/pair/order/source-position pruning."""
    if census(source) != census(target):
        return []
    result = []

    def visit(prefix, used):
        if len(prefix) == len(source):
            if len(result) >= limit:
                raise Incomplete('candidate limit; negative completeness unavailable')
            result.append(tuple(prefix))
            return
        for j, e in enumerate(target):
            if j not in used and signature(e) == signature(source[len(prefix)]):
                visit(prefix + [j], used | {j})
    visit([], set())
    return result


def domain(source, target):
    variables = {v.sexpr(): v for e in source + target for f in e['fields'].values() for v in get_vars(f)}
    objects = [v for v in variables.values() if str(v).startswith('object:')]
    return z3.And(*([z3.Distinct(*objects)] if len(objects) > 1 else []),
                  *[z3.And(v != 0, v & 7 == 0) for v in objects])


def constraints(source, target, mapping):
    subs = [(target[j]['response'], source[i]['response']) for i, j in enumerate(mapping)
            if source[i]['kind'] == 'R']
    conditions = []

    def add(category, ids, formula):
        conditions.append({'category': category, 'source': [source[i]['id'] for i in ids],
                           'target': [target[mapping[i]]['id'] for i in ids],
                           'formula': z3.simplify(formula)})
    for i, j in enumerate(mapping):
        a, b = source[i], target[j]
        for field in sorted(set(a['fields']) | set(b['fields'])):
            eq = (a['fields'][field] == z3.substitute(b['fields'][field], *subs)
                  if field in a['fields'] and field in b['fields'] else z3.BoolVal(False))
            add(field, [i], eq)
        for tag in ('A', 'RMW'):
            add('label:' + tag, [i], z3.BoolVal((tag in a['tags']) == (tag in b['tags'])))
    for i in range(len(source)):
        for k in range(i + 1, len(source)):
            add('public-order', [i, k], z3.BoolVal(mapping[i] < mapping[k]))
        for k in range(len(source)):
            sp = source[i].get('pair') == source[k]['id']
            tp = target[mapping[i]].get('pair') == target[mapping[k]]['id']
            if sp or tp:
                add('RMW-pair', [i, k], z3.BoolVal(sp == tp))
    return conditions


def conjunction(rows):
    return z3.And(*[r['formula'] for r in rows])


def variables(source, target, formulas):
    values = [e['response'] for e in source if 'response' in e]
    values += [v for f in formulas for v in get_vars(f)]
    return sorted({v.sexpr(): v for v in values}.values(), key=lambda v: v.sexpr())


def assignment(model, variables_):
    return [{'name': str(v), 'type': 'bool' if z3.is_bool(v) else 'bv' + str(v.size()),
             'value': z3.is_true(model.eval(v, model_completion=True)) if z3.is_bool(v)
             else model.eval(v, model_completion=True).as_long()} for v in variables_]


def label(row):
    return {k: v for k, v in row.items() if k != 'formula'}


def label_key(row):
    return row['category'], tuple(map(str, row['source'])), tuple(map(str, row['target']))


class Queries:
    def __init__(self, report):
        self.report, self.cache = report, {}
        report['obligations'] = []

    def ask(self, name, f):
        s = z3.Solver()
        s.set(timeout=10000)
        s.add(f)
        status = s.check()
        record = {'name': name, 'result': str(status), 'smt2': s.to_smt2()}
        if status == z3.sat:
            record['model'] = str(s.model())
        if status == z3.unknown:
            record['reason'] = s.reason_unknown()
        self.report['obligations'].append(record)
        if status == z3.unknown:
            raise Incomplete('SMT UNKNOWN: ' + name)
        return status, s.model() if status == z3.sat else None

    def universal(self, d, f):
        f = z3.simplify(f)
        if z3.is_true(f):
            return True
        if z3.is_false(f):
            return False  # D is checked satisfiable before use.
        key = f.sexpr()
        if key not in self.cache:
            result, _ = self.ask('field-' + str(len(self.cache)), z3.And(d, z3.Not(f)))
            self.cache[key] = result == z3.unsat
        return self.cache[key]


def diagnose(source, target, out, limit=512):
    report = {'format': 'semantic-difference-v1', 'result': 'UNKNOWN',
              'program_verdict_eligible': False, 'closed_reachability_checked': False,
              'candidate_complete': False, 'source_census': census(source), 'target_census': census(target)}
    queries = Queries(report)
    try:
        maps = candidates(source, target, limit)
        report.update(candidate_complete=True, candidates=len(maps))
        d = domain(source, target)
        status, _ = queries.ask('domain-feasible', d)
        if status != z3.sat:
            raise Incomplete('empty or infeasible input domain')
        if not maps:
            report.update(result='OPEN_HISTORY_DIFFERENCE', witness_kind='CENSUS',
                          location_ambiguity='all vertices in deficient/excess sorts; no unique deleted occurrence',
                          missing_sorts={k: n - census(target).get(k, 0) for k, n in census(source).items()
                                         if n > census(target).get(k, 0)},
                          extra_sorts={k: n - census(source).get(k, 0) for k, n in census(target).items()
                                       if n > census(source).get(k, 0)})
        else:
            all_rows = [constraints(source, target, m) for m in maps]
            formulas = [conjunction(rows) for rows in all_rows]
            for i, (m, formula) in enumerate(zip(maps, formulas)):
                status, _ = queries.ask('candidate-' + str(i), z3.And(d, z3.Not(formula)))
                if status == z3.unsat:
                    report.update(result='OPEN_HISTORY_EQUIVALENT', mapping=list(m), witness_kind='UNIFORM_MAP')
                    break
            else:
                status, model = queries.ask('common-counterexample', z3.And(d, *[z3.Not(f) for f in formulas]))
                if status == z3.sat:
                    report.update(result='OPEN_HISTORY_DIFFERENCE', witness_kind='COMMON_OPEN_ASSIGNMENT',
                                  assignment=assignment(model, variables(source, target, [d, *formulas])))
                else:
                    report.update(result='INCONCLUSIVE_NO_UNIFORM_MAP', witness_kind=None)
                # Full ambiguity frontier, no claimed unique edit or compiler root cause.
                failures = [[label(r) for r in rows if not queries.universal(d, r['formula'])] for rows in all_rows]
                minimum = min(map(len, failures))
                winners = [i for i, fs in enumerate(failures) if len(fs) == minimum]
                sets = [{label_key(r) for r in failures[i]} for i in winners]
                forced = set.intersection(*sets)
                possible = set.union(*sets)
                by_key = {label_key(r): r for i in winners for r in failures[i]}
                report['diagnosis'] = {'cost': 'number of nonuniversal labelled fields/relations',
                    'minimum': minimum, 'candidate_indices': winners,
                    'mappings': [list(maps[i]) for i in winners],
                    'forced': [by_key[k] for k in sorted(forced)],
                    'possible': [by_key[k] for k in sorted(possible)],
                    'root_cause_proved': False}
    except Incomplete as error:
        report.update(result='UNKNOWN', reason=str(error), candidate_complete=False)
    save_certificate(Path(out), report)
    return report

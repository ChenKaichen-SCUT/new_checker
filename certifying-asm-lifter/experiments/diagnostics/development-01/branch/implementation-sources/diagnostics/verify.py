"""Independent claim checking on RECONSTRUCTED facts, not supplied summaries.

This module never calls diagnose() or trusts its candidate list. Its universe
is built by grouped permutations, separately from producer DFS. No SAFE API.
"""
from collections import defaultdict
import itertools
import z3
from certification.provenance import require
from certification.evidence import save_certificate
from diagnostics.matching import signature, census, constraints, conjunction, domain, Queries, label, label_key


def universe(source, target, cap=512):
    if census(source) != census(target):
        return []
    groups = defaultdict(list)
    for i, e in enumerate(source):
        groups[signature(e)].append(i)
    choices, indices, count = [], [], 1
    for key, positions in sorted(groups.items()):
        js = [j for j, e in enumerate(target) if signature(e) == key]
        perms = list(itertools.permutations(js))
        count *= len(perms)
        require(count <= cap, 'verifier candidate limit')
        choices.append(perms)
        indices.append(positions)
    result = []
    for selected in itertools.product(*choices):
        m = [None] * len(source)
        for positions, targets in zip(indices, selected):
            for i, j in zip(positions, targets):
                m[i] = j
        result.append(tuple(m))
    return sorted(result)


def verify(source, target, claim, out):
    report = {'result': 'REJECT', 'program_verdict_eligible': False}
    q = Queries(report)
    try:
        require(claim['source_census'] == census(source) and claim['target_census'] == census(target), 'claimed census')
        maps = universe(source, target)
        require(claim['candidate_complete'] and claim['candidates'] == len(maps), 'candidate completeness')
        d = domain(source, target)
        feasible, _ = q.ask('independent-domain', d)
        require(feasible == z3.sat, 'domain nonempty')
        result = claim['result']
        if result == 'OPEN_HISTORY_EQUIVALENT':
            m = tuple(claim['mapping'])
            require(m in maps, 'not a complete typed bijection')
            status, _ = q.ask('independent-equivalence', z3.And(d, z3.Not(conjunction(constraints(source, target, m)))))
            require(status == z3.unsat, 'invalid equality claim')
        elif result == 'OPEN_HISTORY_DIFFERENCE':
            if claim['witness_kind'] == 'CENSUS':
                require(not maps and census(source) != census(target), 'invalid structural witness')
                missing = {k: n - census(target).get(k, 0) for k, n in census(source).items() if n > census(target).get(k, 0)}
                extra = {k: n - census(source).get(k, 0) for k, n in census(target).items() if n > census(source).get(k, 0)}
                require(claim['missing_sorts'] == missing and claim['extra_sorts'] == extra, 'wrong deficit/excess')
            else:
                require(claim['witness_kind'] == 'COMMON_OPEN_ASSIGNMENT' and maps, 'witness kind')
                substitutions, names = [], set()
                for row in claim['assignment']:
                    require(row['name'] not in names, 'duplicate assignment')
                    names.add(row['name'])
                    if row['type'] == 'bool':
                        require(type(row['value']) is bool, 'Boolean assignment')
                        a, b = z3.Bool(row['name']), z3.BoolVal(row['value'])
                    else:
                        width = int(row['type'][2:])
                        require(row['type'].startswith('bv') and 0 <= row['value'] < 2**width, 'bitvector assignment')
                        a, b = z3.BitVec(row['name'], width), z3.BitVecVal(row['value'], width)
                    substitutions.append((a, b))
                require(z3.is_true(z3.simplify(z3.substitute(d, *substitutions))), 'witness violates/omits domain')
                for m in maps:
                    e = conjunction(constraints(source, target, m))
                    require(z3.is_false(z3.simplify(z3.substitute(e, *substitutions))), 'witness does not defeat every mapping')
        else:
            raise ValueError('no positive semantic claim to certify')
        if 'diagnosis' in claim:
            failures = [[label(r) for r in constraints(source, target, m) if not q.universal(d, r['formula'])] for m in maps]
            minimum = min(map(len, failures))
            winners = [i for i, fs in enumerate(failures) if len(fs) == minimum]
            sets = [{label_key(r) for r in failures[i]} for i in winners]
            actual = claim['diagnosis']
            require(actual['minimum'] == minimum and actual['candidate_indices'] == winners
                    and actual['mappings'] == [list(maps[i]) for i in winners], 'minimum/ambiguous mapping frontier')
            require({label_key(r) for r in actual['forced']} == set.intersection(*sets)
                    and {label_key(r) for r in actual['possible']} == set.union(*sets), 'incorrect diagnostic frontier')
        report.update(result='VERIFIED_OPEN_CLAIM', claim_result=result,
                      candidate_count=len(maps), closed_program_counterexample=False)
    except Exception as error:
        report['reason'] = str(error)
    save_certificate(out, report)
    return report

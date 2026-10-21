"""Raw hash/same-run binding and byte-identical obligation replay.

Backend check-sat-assuming is not replaced by a plain Solver.check here.
Its safety meaning remains subject to the existing actual query gate.
"""
import argparse
from pathlib import Path
import z3
from certification.run_pipeline import ROOT
from certification.evidence import save_json
from certification.provenance import require
from experiments.gap45.common import digest, read


def run(out):
    out.mkdir(parents=True, exist_ok=False); b = ROOT / 'experiments/gap45'
    scopes = [b / s for s in ['pilot-01', 'closed-fresh-01', 'faults-01', 'sites-02', 'replay-01', 'levels-regression-01', 'performance-01']]
    stored = {digest(p): p for s in scopes for p in s.rglob('*.smt2')}; unique = {}; occurrences = []; errors = []
    for s in scopes:
        for cp in s.rglob('certificate.json'):
            c = read(cp)
            for o in c.get('obligations', []):
                if 'file' not in o:
                    continue
                try:
                    p = cp.parent / o['file']
                    if not p.exists(): p = stored[o['smt_sha256']]
                    h = digest(p); require(h == o['smt_sha256'], 'SMT file identity')
                    if 'smt2' in o: require(p.read_bytes() == o['smt2'].encode(), 'embedded SMT byte equality')
                    require('check-sat-assuming' not in p.read_text(), 'cannot erase actual assumptions')
                    if h not in unique:
                        solver = z3.Solver(); solver.set(timeout=30000); solver.from_string(p.read_text())
                        unique[h] = str(solver.check())
                    require(unique[h] == o['result'] != 'unknown', 'SMT replay mismatch')
                    occurrences.append({'file': p.relative_to(ROOT).as_posix(), 'sha256': h, 'result': unique[h], 'certificate': cp.relative_to(ROOT).as_posix()})
                except Exception as e:
                    errors.append({'certificate': cp.relative_to(ROOT).as_posix(), 'reason': str(e)})
    raw = []
    for p in b.rglob('backend-receipt.json'):
        r = read(p)
        if r.get('result') != 'ACTUAL_BACKEND_CAPTURED': continue
        for n, h in r['snapshots'].items(): require(digest(p.parent / 'snapshots' / n) == h, 'backend bytes changed')
        q = read(p.parent / 'snapshots/before-encoding.json'); a = read(p.parent / 'snapshots/query-audit.json')
        require(q == read(p.parent / 'snapshots/after-encoding.json'), 'capture changed Program')
        require(q['run_id'] == a['run_id'] == r['run_id'], 'actual run identity')
        raw.append({'receipt': p.relative_to(ROOT).as_posix(), 'run_id': r['run_id'], 'controlled_fault': r.get('controlled_fault')})
    save_json(out / 'obligation-replay.json', {'references': occurrences, 'unique': unique, 'errors': errors, 'z3': z3.get_version_string()})
    save_json(out / 'actual-objects.json', raw)
    result = {'result': 'CHECKED' if not errors else 'REJECT', 'references': len(occurrences), 'distinct_SMT': len(unique),
              'same_run_actual_Q': len(raw), 'errors': len(errors), 'backend_query_semantics': 'existing query gate only; no unguarded SMT shortcut'}
    save_json(out / 'summary.json', result); print(result)
    require(not errors, 'replay failures retained')


if __name__ == '__main__':
    p = argparse.ArgumentParser(); p.add_argument('--out', required=True, type=Path)
    run(p.parse_args().out.resolve())

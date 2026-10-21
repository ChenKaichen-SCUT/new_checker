"""Bounded evidence replay and same-object ACTC comparison, not a benchmark."""
import json
import argparse
import sys
from pathlib import Path
import z3
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.evidence import Commands, save_json
from certification.provenance import require
from experiments.run_diagnostic_acceptance import REPLAYS


def read(p):
    return json.loads(p.read_bytes())


def main(base, out, previous_comparison=None):
    base, out = Path(base).resolve(), Path(out).resolve()
    out.mkdir(parents=True, exist_ok=False)
    commands = Commands(out / 'commands')
    comparison = []
    # These are the same captured Q objects, not another backend approximation.
    for name, cap, backend, category, _ in REPLAYS:
        dest = (Path(previous_comparison).resolve() if previous_comparison else out) / ('actc-' + name)
        if not previous_comparison:
            commands.run([sys.executable, '-m', 'experiments.certify_composition', '--capture', str(ROOT / 'experiments' / cap),
                          '--replay', str((ROOT / 'experiments' / backend).parent), '--out', str(dest)], timeout=240)
        for n, digest in read(dest / 'implementation.json').items():
            require(sha((ROOT / n).read_bytes()) == digest, 'baseline comparison implementation drift')
        old, new = read(dest / 'composition-certificate.json'), read(base / name / 'diagnostic-report.json')
        comparison.append({'case': name, 'origin': category, 'ACTC': old['result'],
                           'ACTC_reason': old.get('reason'), 'diagnostic': new['result'],
                           'diagnostic_reason': new.get('reason'), 'same_backend_path': backend,
                           'ACTC_certificate': (dest / 'composition-certificate.json').relative_to(ROOT).as_posix(),
                           'ACTC_certificate_sha256': sha((dest / 'composition-certificate.json').read_bytes())})
        save_json(out / 'comparison.json', comparison)
    require(next(r for r in comparison if r['case'] == 'query-binding')['ACTC'] == 'REJECT', 'query fault must reject')
    # Independently solve the EXACT persisted obligation bytes, deduplicating only
    # identical bytes. Each occurrence remains recorded with its expected result.
    unique, occurrences = {}, []
    # TemplatePool embeds a shared proof in per-call certificates. Its relative
    # file field is a template filename, not a copied per-call SMT file.
    stored = {}
    for path in sorted(base.rglob('*.smt2')):
        stored.setdefault(sha(path.read_bytes()), path)
    for certpath in sorted(base.rglob('certificate.json')):
        for obligation in read(certpath).get('obligations', []):
            if 'file' not in obligation:
                continue
            path = certpath.parent / obligation['file']
            if not path.exists():
                require(obligation['smt_sha256'] in stored, 'missing shared SMT bytes')
                path = stored[obligation['smt_sha256']]
            data = path.read_bytes()
            digest = sha(data)
            require(digest == obligation['smt_sha256'], 'SMT file byte binding')
            if 'smt2' in obligation:  # Some legacy template records store only a hash/file reference.
                require(data == obligation['smt2'].encode('utf-8'), 'embedded SMT byte binding')
            if digest not in unique:
                solver = z3.Solver()
                solver.set(timeout=10000)
                solver.from_string(data.decode('utf-8'))
                result = str(solver.check())
                unique[digest] = {'result': result, 'first_file': path.relative_to(ROOT).as_posix()}
            require(unique[digest]['result'] == obligation['result'] != 'unknown', 'SMT replay disagreement')
            occurrences.append({'file': path.relative_to(ROOT).as_posix(), 'certificate': certpath.relative_to(ROOT).as_posix(),
                                'sha256': digest, 'result': obligation['result']})
    save_json(out / 'smt-replay.json', {'unique': unique, 'occurrences': occurrences, 'solver': z3.get_version_string()})
    reports, claims = [], []
    for row in read(base / 'results.json'):
        require(row['expected'] == row['actual'], 'unexpected acceptance result')
        case = base / row['name']
        report = read(case / 'diagnostic-report.json')
        require(not report['program_verdict_eligible'] and not report['closed_program_counterexample'], 'unauthorized claim')
        for name, digest in read(case / 'implementation.json').items():
            require(sha((case / 'implementation-sources' / name).read_bytes()) == digest, 'saved implementation binding')
            require(sha((ROOT / name).read_bytes()) == digest, 'current implementation changed since acceptance')
        if 'binding' in report:
            backend = ROOT / report['backend_directory']
            qbytes = (backend / 'snapshots/before-encoding.json').read_bytes()
            require(sha(qbytes) == report['binding']['Q'], 'raw Q binding')
        reports.append({'case': row['name'], 'result': report['result'], 'stage': report['stage_claim']})
        for worker in report['workers']:
            p = case / ('thread-' + str(worker['thread']))
            c, v = read(p / 'diagnosis/certificate.json'), read(p / 'independent/witness/certificate.json')
            require(v['result'] == 'VERIFIED_OPEN_CLAIM', 'unchecked worker claim')
            claims.append({'case': row['name'], 'thread': worker['thread'], 'result': c['result'],
                           'witness': c['witness_kind'], 'candidates': c['candidates'],
                           'frontier': c.get('diagnosis'), 'missing_sorts': c.get('missing_sorts'),
                           'extra_sorts': c.get('extra_sorts')})
    save_json(out / 'claims.json', claims)
    actual_queries = []
    for name in ['raw-safe-backend', 'lifted-control-backend', 'raw-unsafe-backend']:
        b = ROOT / 'experiments/diagnostics/acceptance-02' / name
        receipt, q, audit = read(b / 'backend-receipt.json'), read(b / 'snapshots/before-encoding.json'), read(b / 'snapshots/query-audit.json')
        require(receipt['result'] == 'ACTUAL_BACKEND_CAPTURED' and not receipt.get('controlled_fault'), 'fresh no-fault capture')
        require(q == read(b / 'snapshots/after-encoding.json') and q['run_id'] == audit['run_id'] == receipt['run_id'], 'same run Q/query')
        for name2, expected in receipt['snapshots'].items():
            require(sha((b / 'snapshots' / name2).read_bytes()) == expected, 'fresh snapshot hash')
        actual_queries.append({'backend': name, 'run': q['run_id'], 'properties': audit['properties'],
                               'queries': [{k: r.get(k) for k in ['index', 'stage', 'state', 'result']} for r in audit['queries']],
                               'observed_verdict': receipt['observed_verdict'], 'program_safe_transfer_checked': False})
    save_json(out / 'actual-query-inventory.json', actual_queries)
    summary = {'result': 'BOUNDED_DIAGNOSTIC_EVIDENCE_REVIEWED', 'cases': len(reports), 'verified_worker_claims': len(claims),
               'fresh_Clang_captures': 2, 'fresh_Dat3M_runs': 3, 'historical_same_object_comparisons': len(comparison),
               'SMT_occurrences_replayed': len(occurrences), 'distinct_SMT_bytes_solved': len(unique),
               'new_program_SAFE': 0, 'new_real_upstream_defects': 0, 'closed_execution_counterexamples': 0,
               'independent_algorithm_novelty': 'NO_GO', 'reports': reports}
    save_json(out / 'summary.json', summary)
    print(json.dumps({k: v for k, v in summary.items() if k != 'reports'}), flush=True)


if __name__ == '__main__':
    p = argparse.ArgumentParser()
    p.add_argument('--base', required=True, type=Path)
    p.add_argument('--out', required=True, type=Path)
    p.add_argument('--previous-comparison', type=Path)
    a = p.parse_args()
    main(a.base, a.out, a.previous_comparison)

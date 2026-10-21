"""Fixed-denominator export; never drop rejected or unavailable tasks/sites."""
import argparse
import collections
import csv
import json
from pathlib import Path
import posixpath
import statistics
from certification.run_pipeline import ROOT
from certification.evidence import save_json
from experiments.gap45.common import read, digest


def table(path, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    keys = list(dict.fromkeys(k for r in rows for k in r))
    with path.open('w', newline='', encoding='utf-8-sig') as f:
        writer = csv.DictWriter(f, keys); writer.writeheader()
        writer.writerows({k: json.dumps(v, ensure_ascii=False) if isinstance(v, (list, dict)) else v for k, v in r.items()} for r in rows)
    save_json(path.with_suffix('.json'), rows)


def run(out):
    out.mkdir(parents=True, exist_ok=False); base = ROOT / 'experiments/gap45'
    reg = read(base / 'registration-04/tasks.json'); tasks = []; sites = []; sources = []; contexts = set()
    physical = set(); llvm_unique = set(); source_config = set()
    for t in reg['tasks']:
        tr = {'id': t['id'], 'project': t['project'], 'category': t['category'], 'registered_TUs': len(t['units']),
              'captured_TUs': 0, 'source_asm_occurrences': 0, 'LLVM_asm_occurrences': 0, 'family_candidates': 0,
              'L1': 0, 'L2': 0, 'L3': 0, 'L4': 0, 'dynamic_instances': 'UNKNOWN', 'new_defect': False}
        obstacles = collections.Counter()
        for i, unit in enumerate(t['units']):
            cap = base / 'capture-02' / t['id'] / ('tu-' + str(i))
            receipt = read(cap / 'compiler-receipt.json')
            if receipt['result'] != 'SAME_INVOCATION_NATIVE_UPSTREAM_CAPTURED':
                continue
            tr['captured_TUs'] += 1
            c = read(cap / 'census.json'); obs = read(cap / 'observer.json')
            fns = {f['id']: f['name'] for f in obs['functions']}
            tr['source_asm_occurrences'] += c['source_asm_occurrences']; obstacles.update(c['source_syntactic_obstacles'])
            for s in c['source_sites']:
                def loc(k):
                    d = s['begin'][k]; p = d.get('path', '')
                    p = posixpath.normpath(posixpath.join(unit['cwd'], p)) if not p.startswith('<') else p
                    p = p.replace(t['project_root'], '$PROJECT')
                    return (p, d.get('offset'), d.get('line'), d.get('column'))
                key = (t['project'], t['upstream_commit'], loc('spelling'), loc('expansion'), fns.get(s['function_decl']), s['template'])
                physical.add(key); source_config.add((key, tuple(receipt['flags']), unit['cwd']))
                sources.append({'task': t['id'], 'project': t['project'], 'TU': i, 'index': s['index'],
                                'function': fns.get(s['function_decl']), 'spelling': loc('spelling'), 'expansion': loc('expansion'),
                                'template': s['template'], 'empty': s['empty'], 'origin_key': repr(key)})
            srpath = base / 'sites-02' / t['id'] / ('tu-' + str(i)) / 'result.json'
            sr = read(srpath) if srpath.exists() else {'sites': [], 'reason': 'task did not finish'}
            checked = {s['id']: s for s in sr['sites']}
            for s in c['LLVM_sites']:
                r = checked.get(s['id'], {'result': 'NOT_ANALYZED', 'reason': sr.get('reason')})
                row = {'task': t['id'], 'project': t['project'], 'TU': i, 'id': s['id'], 'module_sha256': c['LLVM_sha256'],
                       'function': s['function'], 'family_candidate': s['family_candidate'], 'empty': s['empty'],
                       'origin_indices': s['origin_indices'], 'result': r['result'], 'reason': r.get('reason'),
                       **{k: bool(r.get(k, False)) for k in ['L1', 'L2', 'L3', 'L4']},
                       'evidence': str(srpath.relative_to(ROOT)), 'LLVM_instruction': s['llvm_call']}
                sites.append(row); llvm_unique.add((c['LLVM_sha256'], s['llvm_line_index']))
                contexts.add((t['id'], c['LLVM_sha256'], s['function']))
                tr['LLVM_asm_occurrences'] += 1; tr['family_candidates'] += int(s['family_candidate'])
                for k in ['L1', 'L2', 'L3', 'L4']:
                    tr[k] += int(row[k])
        tr['syntactic_obstacles'] = dict(obstacles)
        pr = base / 'programs-01' / t['id'] / 'result.json'
        if pr.exists():
            r = read(pr); m = r.get('methods', {}); q = m.get('actual_raw_Q', {})
            tr.update(task_result=r['result'], actual_Q=q.get('result', 'NOT_AVAILABLE'), Q_reason=q.get('reason', r.get('reason')),
                      guarded=m.get('guarded', {}).get('result', 'NOT_RUN'), guarded_reason=m.get('guarded', {}).get('reason'),
                      caveat='actual capture is not a complete source activation proof; default backend bounds retained')
            for name, file in [('ACTC', 'ACTC/composition-certificate.json'), ('diagnostics', 'diagnostics/diagnostic-report.json')]:
                p = pr.parent / file
                a = read(p) if p.exists() else {'result': 'NOT_RUN'}
                tr[name] = a['result']; tr[name + '_reason'] = a.get('reason')
            tr['lifter'] = m.get('lifter_no_checker', {}).get('result', 'NOT_RUN')
        else:
            tr.update(task_result='NOT_COMPLETED', actual_Q='NOT_AVAILABLE')
        tasks.append(tr)
    table(out / 'tasks.csv', tasks); table(out / 'LLVM-sites.csv', sites); table(out / 'source-sites.csv', sources)
    project = []
    for name in sorted({t['project'] for t in tasks}):
        ts = [t for t in tasks if t['project'] == name]; ss = [s for s in sites if s['project'] == name]
        project.append({'project': name, 'tasks': len(ts), 'source_unique_locations': sum(x[0] == name for x in physical),
                        'source_occurrences': sum(t['source_asm_occurrences'] for t in ts), 'LLVM_occurrences': len(ss),
                        'family_candidates': sum(s['family_candidate'] for s in ss), 'empty': sum(s['empty'] for s in ss),
                        'L1': sum(s['L1'] for s in ss), 'L2': sum(s['L2'] for s in ss), 'L3': 0, 'L4': 0,
                        'actual_Q_captured_tasks': sum(t['actual_Q'] == 'ACTUAL_BACKEND_CAPTURED' for t in ts),
                        'position_reasons': dict(collections.Counter(s['reason'] or s['result'] for s in ss))})
    table(out / 'projects.csv', project)
    totals = {'registration_sha256': digest(base / 'registration-04/tasks.json'), 'tasks': len(tasks),
              'source_physical_macro_context_locations': len(physical), 'source_configuration_locations': len(source_config),
              'source_TU_occurrences': len(sources), 'LLVM_TU_occurrences': len(sites), 'unique_module_instruction_sites': len(llvm_unique),
              'asm_containing_task_module_functions': len(contexts), 'dynamic_instance_denominator': 'UNKNOWN_NOT_ZERO',
              'source_census_scope': 'AST-visible definitions including unused headers; not dynamic activations',
              'LLVM_census_scope': 'actual surviving instructions including empty asm, not all FAA',
              'position_results': dict(collections.Counter(s['result'] for s in sites)),
              'actual_Q_results': dict(collections.Counter(t['actual_Q'] for t in tasks)),
              'accepted_program_transfers': 0, 'new_confirmed_upstream_bugs': 0}
    save_json(out / 'totals.json', totals)
    perf = base / 'performance-01/measurements.json'
    if perf.exists():
        raw = read(perf); measurements = []; grouped = collections.defaultdict(list)
        for r in raw:
            d = base / 'performance-01' / r['name'] / 'artifacts'
            rr = read(d / 'result.json') if (d / 'result.json').exists() else {'result': 'NO_RESULT'}
            row = {k: r.get(k) for k in ['repeat', 'mode', 'case', 'name', 'process_status', 'exit_code', 'wall_seconds', 'user_seconds', 'system_seconds', 'max_process_rss_kib']}
            elapsed = r.get('gnu_time', {}).get('Elapsed (wall clock) time (h:mm:ss or m:ss)')
            value = 0.0
            if elapsed:
                for part in elapsed.split(':'): value = 60 * value + float(part)
            row['inner_elapsed_seconds'] = value if elapsed else None
            row['CPU_seconds'] = (row['user_seconds'] or 0) + (row['system_seconds'] or 0)
            row.update(artifact_bytes=sum(p.stat().st_size for p in d.rglob('*') if p.is_file()),
                       SMT_files=len(list(d.rglob('*.smt2'))), result=rr.get('result', 'COMPARISON_ROWS') if isinstance(rr, dict) else [x['result'] for x in rr])
            measurements.append(row); grouped[(r['case'], r['mode'])].append(row)
        table(out / 'measurements.csv', measurements)
        summaries = []
        for (case, mode), rs in grouped.items():
            x = {'case': case, 'mode': mode, 'repeats': len(rs), 'failures': sum(r['exit_code'] != 0 for r in rs)}
            for k in ['wall_seconds', 'inner_elapsed_seconds', 'CPU_seconds', 'user_seconds', 'system_seconds', 'max_process_rss_kib', 'artifact_bytes', 'SMT_files']:
                values = [r[k] for r in rs if r[k] is not None]
                x[k] = {'median': statistics.median(values), 'min': min(values), 'max': max(values)} if values else None
            summaries.append(x)
        table(out / 'performance-summary.csv', summaries)
        stage = []
        for r in raw:
            p = base / 'performance-01' / r['name'] / 'artifacts/stages.json'
            if p.exists():
                by = collections.defaultdict(list)
                for x in read(p)['calls']:
                    by[x['stage']].append(x['wall_seconds'])
                stage.extend({'name': r['name'], 'case': r['case'], 'mode': r['mode'], 'repeat': r['repeat'],
                              'stage': k, 'inclusive_seconds': sum(v), 'calls': len(v)} for k, v in by.items())
        table(out / 'inclusive-stages.csv', stage)
    print(json.dumps(totals, indent=2))


if __name__ == '__main__':
    p = argparse.ArgumentParser(); p.add_argument('--out', required=True, type=Path)
    run(p.parse_args().out.resolve())

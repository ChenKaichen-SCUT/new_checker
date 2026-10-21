"""Predetermined isolated five-repeat measurements, including failures.

Inclusive call timing is observational only. It does not alter arguments,
results, solver constraints or certificates; nested stage times are NOT summed.
"""
import argparse
import functools
import os
from pathlib import Path
import sys
import time
from certification.run_pipeline import ROOT
from certification.evidence import save_json
from experiments.gap45.common import execute, read, digest


def worker(mode, case, out):
    times = []
    def wrap(obj, name, label):
        original = getattr(obj, name)
        @functools.wraps(original)
        def timed(*args, **kwargs):
            start = time.perf_counter(); cpu = time.process_time()
            try:
                return original(*args, **kwargs)
            finally:
                times.append({'stage': label, 'wall_seconds': time.perf_counter() - start,
                              'process_cpu_seconds': time.process_time() - cpu})
        setattr(obj, name, timed)
    from guarded import pipeline, source, llvm, actual
    import z3
    for obj, name, label in [(source, 'load', 'C_AST_source_extraction'), (llvm, 'paths', 'LLVM_path_extraction'),
                             (actual, 'paths', 'actual_Q_path_extraction'), (pipeline, 'summarize', 'relation_and_SMT'),
                             (pipeline, 'verify_witness', 'independent_claim_check'), (z3.Solver, 'check', 'SMT_check')]:
        wrap(obj, name, label)
    b = ROOT / 'experiments/gap45/pilot-01' / case
    result = None
    try:
        if mode == 'guarded':
            result = pipeline.check(b / 'capture', b / 'lift/optimized.ll', b / 'backend', out / 'check')
        elif mode in {'static', 'path', 'old'}:
            from experiments.gap45.controlled import comparison
            result = comparison(case, out / 'comparison', uniform=mode == 'static', old=mode == 'old')
        elif mode == 'lower':
            p = pipeline.lower(b / 'capture', out / 'lower')
            result = {'result': 'LOWERED_WITH_EXISTING_FRONTEND_CHECKS', 'sha256': digest(p),
                      'note': 'not an unchecked-emitter performance baseline'}
        elif mode.startswith('dat3m'):
            base = Path('/opt/actc-gap45/upstreams/Dat3M-archive')
            module = b / ('capture/source.ll' if mode == 'dat3m-raw' else 'lift/optimized.ll')
            logs = out / 'solver'; logs.mkdir(parents=True)
            result = execute(['env', 'DAT3M_HOME=' + str(base), 'DAT3M_OUTPUT=' + str(logs), 'java', '-jar',
                              str(base / 'dartagnan/target/dartagnan.jar'), str(base / 'cat/tso.cat'), str(module),
                              '--target=tso', '--method=eager', '--solver=z3', '--property=program_spec', '--smtlib2=true'],
                             out / 'backend', timeout=120)
        elif mode == 'capture':
            from experiments.gap45.capture import one
            reg = read(ROOT / 'experiments/gap45/registration-04/tasks.json')
            t = next(t for t in reg['tasks'] if t['id'] == case)
            result = [one(t, u, out / ('tu-' + str(i))) for i, u in enumerate(t['units'])]
        else:
            raise ValueError(mode)
    except Exception as e:
        result = {'result': 'EXPERIMENT_FAILURE', 'reason': str(e)}
    finally:
        save_json(out / 'result.json', result)
        save_json(out / 'stages.json', {'inclusive_not_additive': True, 'calls': times})


def freeze(out):
    out.mkdir(parents=True, exist_ok=False)
    reg = read(ROOT / 'experiments/gap45/registration-04/tasks.json')
    tasks = [{'mode': 'capture', 'case': c} for c in reg['capture_repeat_population']]
    tasks += [{'mode': m, 'case': c} for c in ['merge', 'conditional']
              for m in ['guarded', 'path', 'static', 'old', 'lower', 'dat3m-raw', 'dat3m-lifted']]
    plan = {'frozen_before_formal_timing': True, 'repeats': 5, 'tasks': tasks, 'order': 'repeat-major deterministic listed order',
            'memory_bytes': 16 * 1024**3, 'cpus': list(range(8)), 'timeout': 600, 'backend_timeout': 120,
            'concurrency': 1, 'cache': 'input file pages primed before each job; fresh process/JVM; system caches not flushed',
            'comparison': 'path/static share extraction and semantic range; full guarded includes independent reconstruction and is not directly cost-equivalent to old rejected summaries',
            'unavailable_baseline': 'no unchecked standalone Lifter entry; lower includes historical admission checks; never claim its cost is no-checker cost',
            'resource_note': '8 logical CPUs = 4 physical cores; RSS maximum single process, aggregate memory peak unavailable'}
    save_json(out / 'plan.json', plan)
    save_json(out / 'seal.json', {'sha256': digest(out / 'plan.json')})


def run(plan_path, out):
    plan = read(plan_path); out.mkdir(parents=True, exist_ok=False)
    save_json(out / 'plan-binding.json', {'plan': str(plan_path), 'sha256': digest(plan_path)})
    rows = []
    for repeat in range(1, 6):
        for t in plan['tasks']:
            # Prime immutable input pages, with no compiler/checker warm-up run.
            base = ROOT / ('experiments/gap45/capture-02/' + t['case'] if t['mode'] == 'capture' else 'experiments/gap45/pilot-01/' + t['case'])
            for p in base.rglob('*'):
                if p.is_file():
                    with p.open('rb') as f:
                        while f.read(1024 * 1024):
                            pass
            name = f"r{repeat}-{t['case']}-{t['mode']}"; d = out / name
            env = dict(os.environ, JAVA_TOOL_OPTIONS='-Xmx8g -XX:ActiveProcessorCount=8')
            r = execute([sys.executable, '-m', 'experiments.gap45.performance', '--worker', '--mode', t['mode'],
                         '--case', t['case'], '--out', str(d / 'artifacts')], d / 'measurement', cwd=ROOT,
                        timeout=600, env=env, isolate=True, cpus=list(range(8)))
            rows.append({'repeat': repeat, **t, 'name': name, **r})
            save_json(out / 'measurements.json', rows)


if __name__ == '__main__':
    p = argparse.ArgumentParser(); p.add_argument('--out', required=True, type=Path)
    p.add_argument('--freeze', action='store_true'); p.add_argument('--worker', action='store_true')
    p.add_argument('--mode'); p.add_argument('--case'); p.add_argument('--plan', type=Path)
    a = p.parse_args()
    if a.freeze:
        freeze(a.out.resolve())
    elif a.worker:
        worker(a.mode, a.case, a.out.resolve())
    else:
        run(a.plan.resolve(), a.out.resolve())

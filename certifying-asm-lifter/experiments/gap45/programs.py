"""Actual upstream and read-only Dat3M runs; no verdict promotion.

Refused frontend paths are run and recorded on their real artifacts. Missing
host/activation or unsupported statements are never replaced by a harness.
"""
import argparse
import concurrent.futures
import os
from pathlib import Path
import queue
import sys
from certification.evidence import save_json
from certification.provenance import require
from certification.run_pipeline import ROOT, run_backend
from experiments.gap45.common import digest, execute, read


def task_run(task, caps, out):
    out.mkdir(parents=True, exist_ok=False)
    report = {'id': task['id'], 'result': 'UNSUPPORTED', 'program_verdict_eligible': False,
              'new_bug_claim': False, 'methods': {}}
    try:
        inputs = []
        for i, unit in enumerate(task['units']):
            cap = caps / task['id'] / ('tu-' + str(i))
            r = read(cap / 'compiler-receipt.json')
            require(r['result'] == 'SAME_INVOCATION_NATIVE_UPSTREAM_CAPTURED', 'one original TU was not captured')
            require(r['source_sha256'] == unit['sha256'] and all(digest(cap / n) == h for n, h in r['artifacts'].items()), 'actual capture binding')
            inputs.append(cap / 'source.ll')
        require(task['link_status'] == 'COMPLETE_SOURCE_LINK_SET', 'original source link set incomplete')
        if len(inputs) == 1:
            module = inputs[0]
        else:
            module = out / 'linked.ll'
            link = Path('/opt/actc-gap45/llvm21/usr/lib/llvm-21/bin/llvm-link')
            cmd = [os.environ['ACTC_CLANG_LOADER'], '--library-path', os.environ['ACTC_CLANG_RUNTIME'], str(link),
                   '-S', *map(str, inputs), '-o', str(module)]
            r = execute(cmd, out / 'link')
            require(r['exit_code'] == 0, 'real llvm-link could not link complete registered units')
        save_json(out / 'link-receipt.json', {'inputs': {str(p.relative_to(ROOT)): digest(p) for p in inputs},
                                             'actual_module_sha256': digest(module),
                                             'scope': 'registered C link inputs; no native ELF symbol-interposition guarantee'})
        upstream = Path('/opt/actc-gap45/upstreams/Dat3M-archive')
        logs = out / 'upstream-solver'; logs.mkdir()
        raw = execute(['env', 'DAT3M_HOME=' + str(upstream), 'DAT3M_OUTPUT=' + str(logs),
                       'java', '-jar', str(upstream / 'dartagnan/target/dartagnan.jar'), str(upstream / 'cat/tso.cat'),
                       str(module), '--target=tso', '--method=eager', '--solver=z3', '--property=program_spec', '--smtlib2=true'],
                      out / 'original-dat3m', timeout=120)
        report['methods']['original_dat3m'] = {'process': raw, 'correctness_oracle': False}
        q = run_backend(module, ROOT / 'vendor/Dat3M-linux-positive-02',
                        ROOT / 'experiments/gap45/build-positive-02/build-receipt.json', out / 'actual-raw-backend')
        report['methods']['actual_raw_Q'] = q
        # Execute the unmodified public frontend interfaces; schema mismatch
        # is a TOOL integration refusal, never algorithmic inferiority or a bug.
        cap = caps / task['id'] / 'tu-0'
        methods = [
            ('ACTC', [sys.executable, '-m', 'experiments.certify_composition', '--capture', str(cap), '--out', str(out / 'ACTC')]),
            ('diagnostics', [sys.executable, '-m', 'experiments.detect_semantic_difference', '--capture', str(cap),
                             '--backend', str(out / 'actual-raw-backend'), '--out', str(out / 'diagnostics'), '--route', 'raw'])]
        for name, cmd in methods:
            report['methods'][name] = execute(cmd, out / (name + '-command'), cwd=ROOT)
        from guarded.pipeline import check
        report['methods']['guarded'] = check(cap, module, out / 'actual-raw-backend', out / 'guarded', raw=len(inputs) == 1)
        from guarded.pipeline import lower
        try:
            candidate = lower(cap, out / 'lifter-entry')
            report['methods']['lifter_no_checker'] = {'result': 'CANDIDATE_AVAILABLE', 'sha256': digest(candidate),
                                                      'note': 'frontend/lifter admission may perform existing checks; no independent Q comparison yet'}
        except Exception as e:
            report['methods']['lifter_no_checker'] = {'result': 'UNSUPPORTED', 'reason': str(e)}
        report['methods']['uniform_static_ablation'] = {'result': 'UNSUPPORTED',
            'reason': 'no independently extracted complete source/target path set; not flattened or hand-mapped'}
        report['result'] = 'REAL_TOOL_ATTEMPTS_RECORDED'
    except Exception as e:
        report['reason'] = str(e)
    save_json(out / 'result.json', report)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--registration', required=True, type=Path)
    ap.add_argument('--captures', required=True, type=Path)
    ap.add_argument('--out', required=True, type=Path)
    ap.add_argument('--task')
    a = ap.parse_args(); reg = read(a.registration); caps = a.captures.resolve(); out = a.out.resolve()
    if a.task:
        return task_run(next(t for t in reg['tasks'] if t['id'] == a.task), caps, out / a.task)
    out.mkdir(parents=True, exist_ok=False)
    save_json(out / 'input-seal.json', {'registration': digest(a.registration), 'census': digest(caps / 'census-seal.json'),
                                       'task_count': len(reg['tasks']), 'all_raw_tasks_attempted': True})
    slots = queue.Queue()
    for i in range(4):
        slots.put(list(range(i * 8, i * 8 + 8)))
    def run(t):
        cpus = slots.get()
        try:
            env = dict(os.environ, JAVA_TOOL_OPTIONS='-Xmx8g -XX:ActiveProcessorCount=8')
            r = execute([sys.executable, '-m', 'experiments.gap45.programs', '--registration', str(a.registration.resolve()),
                         '--captures', str(caps), '--out', str(out), '--task', t['id']], out / 'jobs' / t['id'],
                        cwd=ROOT, timeout=600, env=env, isolate=True, cpus=cpus)
            return {'id': t['id'], 'status': r['process_status'], 'exit_code': r['exit_code']}
        finally:
            slots.put(cpus)
    with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
        save_json(out / 'execution.json', list(pool.map(run, reg['tasks'])))


if __name__ == '__main__':
    main()

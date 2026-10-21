"""Fresh native captures and same-run Q. No synthetic events or semantic edits."""
import argparse
import concurrent.futures
import json
from pathlib import Path
import subprocess
import sys
from certification.run_pipeline import ROOT, run_backend
from certification.evidence import save_json
from experiments.capture_guarded import capture
from guarded.pipeline import lower, check


def one(name, out):
    d = out / name
    d.mkdir(parents=True, exist_ok=False)
    source = ROOT / 'benchmarks' / ('backend-source.c' if name == 'raw-unsafe' else 'guarded-' + name + '.c')
    capture(d / 'capture', source, expected=0 if name == 'raw-unsafe' else 2)
    candidate = d / 'capture/source.ll' if name == 'raw-unsafe' else lower(d / 'capture', d / 'lift')
    r = run_backend(candidate, ROOT / 'vendor/Dat3M-linux-positive-02',
                    ROOT / 'experiments/gap45/build-positive-02/build-receipt.json', d / 'backend')
    if r['result'] == 'ACTUAL_BACKEND_CAPTURED':
        r = check(d / 'capture', candidate, d / 'backend', d / 'check', raw=name == 'raw-unsafe')
    save_json(d / 'result.json', r)
    return {'name': name, 'result': r['result'], 'reason': r.get('reason')}


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--out', type=Path, required=True)
    p.add_argument('--case', choices=['merge', 'conditional', 'raw-unsafe'])
    a = p.parse_args()
    if a.case:
        one(a.case, a.out.resolve())
        return
    a.out.mkdir(parents=True, exist_ok=False)
    save_json(a.out / 'plan.json', {'cases': ['merge', 'conditional', 'raw-unsafe'],
                                   'purpose': 'pilot/regression, excluded from formal timing', 'workers': 3})
    def execute(name):
        with (a.out / (name + '.stdout.log')).open('wb') as o, (a.out / (name + '.stderr.log')).open('wb') as e:
            r = subprocess.run([sys.executable, '-m', 'experiments.gap45.pilot', '--out', str(a.out), '--case', name],
                               stdout=o, stderr=e, timeout=600)
        return {'name': name, 'exit_code': r.returncode}
    with concurrent.futures.ThreadPoolExecutor(max_workers=3) as pool:
        save_json(a.out / 'execution.json', list(pool.map(execute, ['merge', 'conditional', 'raw-unsafe'])))


if __name__ == '__main__':
    main()

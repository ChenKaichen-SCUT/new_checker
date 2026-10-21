"""Predeclared minimal real defect regression and labelled actual-object checks."""
import argparse
import json
import sys
from pathlib import Path
from certification.evidence import Commands, save_json
from certification.run_pipeline import ROOT, run_backend
from experiments.detect_semantic_difference import direct_front
from experiments.capture_diagnostic_direct import capture

REPLAYS = [
    ('branch-good', 'hcc/capture-branch', 'property/final-02/branch/backend', 'CONTROLLED_HARNESS_NO_FAULT', 'OPEN_HISTORY_EQUIVALENT'),
    ('workers-good', 'p2/capture-workers', 'composition/final-01/workers/backend', 'CONTROLLED_HARNESS_NO_FAULT', 'OPEN_HISTORY_EQUIVALENT'),
    ('return', 'hcc/capture-branch', 'property/final-02/cross-return/backend', 'INJECTED_BACKEND_FAULT', 'OPEN_HISTORY_DIFFERENCE'),
    ('missing-read', 'hcc/capture-branch', 'property/final-02/cross-read/backend', 'INJECTED_BACKEND_FAULT', 'OPEN_HISTORY_DIFFERENCE'),
    ('missing-call', 'hcc/capture-branch', 'property/final-02/missing-instance/backend', 'INJECTED_BACKEND_FAULT', 'OPEN_HISTORY_DIFFERENCE'),
    ('condition', 'hcc/capture-branch', 'property/final-02/branch-condition/backend', 'INJECTED_BACKEND_FAULT', 'OPEN_HISTORY_DIFFERENCE'),
    ('atomic-A', 'property/capture-owned', 'property/final-02/private-a/backend', 'INJECTED_BACKEND_FAULT', 'OPEN_HISTORY_DIFFERENCE'),
    ('entry-ssa', 'hcc/capture-branch', 'levels/final-04/entry-ssa/backend', 'INJECTED_BACKEND_FAULT', 'OPEN_HISTORY_DIFFERENCE'),
    ('ite-export-history', 'hcc/capture-branch', 'hcc/branch-backend-01/backend', 'HISTORICAL_EXPORTER_DEFECT', 'CAPTURE_UNKNOWN'),
    ('query-binding', 'property/capture-unsafe', 'property/final-02/query-binding/backend', 'INJECTED_QUERY_FAULT', 'OPEN_HISTORY_EQUIVALENT'),
]


def main(out, reuse=None):
    out = Path(out).resolve()
    out.mkdir(parents=True, exist_ok=False)
    reuse = Path(reuse).resolve() if reuse else None
    save_json(out / 'fixed-cases.json', {'baseline': '3c67f7b2116a3eb7f090f1807e4c2c41beeb01b6',
        'fresh': ['historical original backend-source.c EXPECT=2 raw import',
                  'same unchanged source/config through checked lifter',
                  'historical original backend-source.c EXPECT=0 raw import'],
        'replays': REPLAYS, 'external_software': 'one unchanged CK event-counter client, two frozen TUs, 113 surviving asm; no full Q',
        'no_new_bug_expected_or_assumed': True, 'large_experiments': False,
        'reuse_fresh_capture_directory': str(reuse) if reuse else None})
    commands = Commands(out / 'commands')
    rows = []

    def detect(name, cap, backend, category, expected, direct=False, route='lifted'):
        args = [sys.executable, '-m', 'experiments.detect_semantic_difference', '--capture', str(cap),
                '--backend', str(backend), '--out', str(out / name), '--origin', category, '--route', route]
        if direct:
            args.append('--direct')
        commands.run(args, timeout=240)
        report = json.loads((out / name / 'diagnostic-report.json').read_bytes())
        rows.append({'name': name, 'origin': category, 'expected': expected, 'actual': report['result'],
                     'reason': report.get('reason'), 'backend': report.get('backend_observation')})
        save_json(out / 'results.json', rows)
        print(json.dumps(rows[-1]), flush=True)

    for n, expected in [('safe', 2), ('unsafe', 0)]:
        cap = (reuse or out) / ('capture-' + n)
        raw = (reuse or out) / ('raw-' + n + '-backend')
        if not reuse:
            capture(cap, expected)
            _, candidate = direct_front(cap, out / ('prepare-' + n))
            run_backend(cap / 'source.ll', ROOT / 'vendor/Dat3M-levels-positive-v1',
                        ROOT / 'experiments/levels/build-positive-01/build-receipt.json', raw)
        detect('raw-' + n, cap, raw, 'HISTORICAL_REAL_UPSTREAM_REGRESSION', 'OPEN_HISTORY_DIFFERENCE', True, 'raw')
        if n == 'safe':
            backend = (reuse or out) / 'lifted-control-backend'
            if not reuse:
                run_backend(candidate, ROOT / 'vendor/Dat3M-levels-positive-v1',
                            ROOT / 'experiments/levels/build-positive-01/build-receipt.json', backend)
            detect('lifted-control', cap, backend, 'CONTROLLED_INPUT_NO_FAULT', 'OPEN_HISTORY_EQUIVALENT', True)
    for name, cap, backend, category, expected in REPLAYS:
        detect(name, ROOT / 'experiments' / cap, ROOT / 'experiments' / backend, category, expected)
    # Unexpected results are retained, never relabelled or hidden.
    print(json.dumps({'matched': sum(r['expected'] == r['actual'] for r in rows), 'total': len(rows)}))


if __name__ == '__main__':
    p = argparse.ArgumentParser()
    p.add_argument('--out', required=True, type=Path)
    p.add_argument('--reuse', type=Path, help='Replay the same raw objects after diagnostic-only changes')
    args = p.parse_args()
    main(args.out, args.reuse)

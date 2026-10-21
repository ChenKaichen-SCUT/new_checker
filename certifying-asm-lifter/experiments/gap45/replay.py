"""Portable raw-object replay: needs Python/Z3, no compiler/Dat3M installation."""
import argparse
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.evidence import save_json
from certification.provenance import require
from guarded.pipeline import check
from guarded.closed import run as closed


def run(out):
    out.mkdir(parents=True, exist_ok=False); b = ROOT / 'experiments/gap45/pilot-01'; rows = []
    for name in ['merge', 'conditional', 'raw-unsafe']:
        raw = name == 'raw-unsafe'; d = b / name
        candidate = d / ('capture/source.ll' if raw else 'lift/optimized.ll')
        r = check(d / 'capture', candidate, d / 'backend', out / name, raw=raw)
        expected = 'GUARDED_OPEN_DIFFERENCE' if raw else 'GUARDED_OPEN_INCLUSION'
        require(r['result'] == expected, 'portable replay mismatch')
        rows.append({'case': name, 'result': r['result']})
    d = b / 'raw-unsafe'; claim = out / 'raw-unsafe/activation-0/source-Q/certificate.json'
    for name, kw, expected in [('closed', {}, 'CONDITIONAL_CLOSED_ERROR_DIFFERENCE'),
                               ('unreachable', {'force_read': 7}, 'UNREACHABLE_OPEN_WITNESS'),
                               ('source-only', {'exclude_target': False}, 'REACHABLE_SOURCE_ERROR_ONLY')]:
        r = closed(d / 'capture', d / 'capture/source.ll', d / 'backend', out / name, claim, **kw)
        require(r['result'] == expected, 'portable concretization mismatch')
        rows.append({'case': name, 'result': r['result']})
    save_json(out / 'results.json', rows)


if __name__ == '__main__':
    p = argparse.ArgumentParser(); p.add_argument('--out', required=True, type=Path)
    run(p.parse_args().out.resolve())

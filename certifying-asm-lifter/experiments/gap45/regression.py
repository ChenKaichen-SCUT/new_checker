"""Run the entire historical 16-case levels gate against native actual Q.

Only fixed build-directory/receipt launch bindings change. The original
certification logic, inputs, expected levels and refusal predicates are reused.
"""
import argparse
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.evidence import save_json
from certification.provenance import require
from experiments.run_levels_acceptance import CASES


def run(out):
    out.mkdir(parents=True, exist_ok=False)
    p = ROOT / 'experiments/certify_levels.py'; text = p.read_text()
    a = 'ROOT/f"experiments/levels/build-{build}-01/build-receipt.json"'
    b = 'ROOT/("experiments/gap45/build-fault-01/build-receipt.json" if fault else "experiments/gap45/build-positive-02/build-receipt.json")'
    assert a in text; text = text.replace(a, b)
    a = 'ROOT/f"vendor/Dat3M-levels-{build}-v1"'
    b = 'ROOT/("vendor/Dat3M-linux-fault" if fault else "vendor/Dat3M-linux-positive-02")'
    assert a in text; text = text.replace(a, b)
    (out / 'executed-driver.py').write_text(text)
    scope = {'__name__': 'native_levels_driver'}; exec(compile(text, str(p), 'exec'), scope)
    save_json(out / 'fixed-cases.json', CASES)
    rows = []
    for name, source, fault, expected, reason in CASES:
        try:
            r = scope['run'](ROOT / 'experiments' / source, out / name, fault=fault)
            ok = r['achieved_level'] == expected and (reason is None or reason in r.get('missing_next_level', ''))
            ok = ok and r['program_verdict_eligible'] is (expected == 4)
            row = {'case': name, 'expected': expected, 'level': r['achieved_level'], 'matched': ok, 'reason': r.get('missing_next_level')}
        except Exception as e:
            row = {'case': name, 'expected': expected, 'matched': False, 'reason': str(e)}
        rows.append(row); save_json(out / 'results.json', rows)
    require(all(r['matched'] for r in rows), 'native historical levels regression mismatch; evidence retained')


if __name__ == '__main__':
    p = argparse.ArgumentParser(); p.add_argument('--out', required=True, type=Path)
    run(p.parse_args().out.resolve())

"""Fresh fixed controls and same-object comparisons; never upstream bugs."""
import argparse
import json
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.evidence import save_json
from experiments.gap45.common import read


def faults(out):
    # Reuse the exact historical injection driver, changing only artifact paths.
    p = ROOT / 'experiments/run_guarded_faults.py'
    text = p.read_text().replace("base=ROOT/'experiments/guarded'", "base=ROOT/'experiments/gap45/pilot-01'")
    for a, b in [('capture-conditional-01', 'conditional/capture'), ('conditional-lift-01/optimized.ll', 'conditional/lift/optimized.ll'),
                 ('vendor/Dat3M-levels-positive-v1', 'vendor/Dat3M-linux-positive-02'),
                 ('experiments/levels/build-positive-01/build-receipt.json', 'experiments/gap45/build-positive-02/build-receipt.json'),
                 ('vendor/Dat3M-levels-fault-v1', 'vendor/Dat3M-linux-fault'),
                 ('experiments/levels/build-fault-01/build-receipt.json', 'experiments/gap45/build-fault-01/build-receipt.json')]:
        assert a in text
        text = text.replace(a, b)
    scope = {'__name__': 'rebound_historical_fault_driver'}
    exec(compile(text, str(p), 'exec'), scope)
    rows = scope['run'](out)
    (out / 'executed-driver.py').write_text(text)
    # A query fault does not falsify worker equivalence; independently test the
    # closed observation exclusion gate on the very same faulty actual query.
    from guarded import source
    from guarded.pipeline import target_frame
    from guarded.target_queries import check_target_queries
    from experiments.detect_semantic_difference import bind_actual
    b = ROOT / 'experiments/gap45/pilot-01/conditional'
    qdir = out / 'safety-query-binding/backend'; d = out / 'query-exclusion'
    f = source.load(b / 'capture', d / 'source')
    q, receipt, _ = bind_actual(b / 'capture', f, b / 'lift/optimized.ll', qdir, 'lifted')
    host = target_frame(f, (b / 'lift/optimized.ll').read_text(), q, d / 'host')
    r = check_target_queries(q, qdir / 'snapshots/query-audit.json', receipt, host, d / 'check')
    rows.append({'name': 'independent-query-exclusion', **r})
    save_json(out / 'results.json', rows)


def comparison(case, out, uniform=False, old=False):
    from guarded import source, actual, llvm
    from guarded.model import summarize
    from certification.composition import q_units
    from diagnostics.objects import q_graph
    from experiments.detect_semantic_difference import associations, bind_actual, direct_front
    from experiments.certify_composition import load_front
    b = ROOT / 'experiments/gap45/pilot-01' / case
    out.mkdir(parents=True, exist_ok=False)
    f = source.load(b / 'capture', out / 'source')
    q, _, binding = bind_actual(b / 'capture', f, b / 'lift/optimized.ll', b / 'backend', 'lifted')
    rows = []
    if old:
        for label, fn in [('ACTC_front', lambda: load_front(b / 'capture', out / 'ACTC-front')),
                          ('diagnostics_front', lambda: direct_front(b / 'capture', out / 'diagnostics-front'))]:
            try:
                fn(); rows.append({'method': label, 'result': 'FRONT_ADMITTED_ONLY'})
            except Exception as e:
                rows.append({'method': label, 'result': 'UNSUPPORTED', 'reason': str(e)})
    for a, t in associations(q, f):
        d = out / ('activation-' + str(a['create_index']))
        if old:
            for label, fn in [('ACTC_Q', lambda: q_units(t, a['argument'])),
                              ('diagnostics_Q', lambda: q_graph(q, t, a['argument'], d / 'old-Q'))]:
                try:
                    value = fn(); rows.append({'method': label, 'activation': a['create_index'], 'result': 'SUMMARY_ONLY', 'size': len(value)})
                except Exception as e:
                    rows.append({'method': label, 'activation': a['create_index'], 'result': 'UNSUPPORTED', 'reason': str(e)})
        else:
            qs = actual.paths(q, t, a['argument'], d / 'extraction')
            r = summarize(a['paths'], qs, d / 'C-Q', uniform=uniform, objects=f['objects'])
            ls = llvm.paths(f['module'], a['worker'], a['argument'], f['interface'], 'L')
            lr = summarize(ls, qs, d / 'L-Q', uniform=uniform, objects=f['objects'])
            rows.append({'activation': a['create_index'], 'C_Q': r['result'], 'L_Q': lr['result']})
    result = {'binding': binding, 'uniform': uniform, 'old': old, 'rows': rows,
              'scope': 'same original objects; summary-only cost is not full certificate cost'}
    save_json(out / 'result.json', result)
    return result


if __name__ == '__main__':
    p = argparse.ArgumentParser(); p.add_argument('--out', required=True, type=Path)
    p.add_argument('--faults', action='store_true'); p.add_argument('--case', default='merge')
    p.add_argument('--uniform', action='store_true'); p.add_argument('--old', action='store_true')
    a = p.parse_args()
    if a.faults:
        faults(a.out.resolve())
    else:
        comparison(a.case, a.out.resolve(), a.uniform, a.old)

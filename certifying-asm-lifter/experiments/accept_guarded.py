"""Replay all fixed raw objects with the final prototype, without recapture."""
import argparse
import json
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.evidence import save_json
from guarded.pipeline import check, target_frame
from guarded.closed import run as concretize
from guarded.target_queries import check_target_queries
from guarded import source
from experiments.detect_semantic_difference import bind_actual
from experiments.compare_guarded import run as compare


def run(out):
    out.mkdir(parents=True,exist_ok=False);b=ROOT/'experiments/guarded';results=[]
    cases=[('merge',b/'capture-merge-01',b/'explore-lift-01/optimized.ll',b/'backend-merge-01',False),
           ('conditional',b/'capture-conditional-01',b/'conditional-lift-01/optimized.ll',b/'backend-conditional-01',False)]
    h=ROOT/'experiments/diagnostics/acceptance-02';cap=h/'capture-unsafe';back=h/'raw-unsafe-backend'
    cases += [('historical-raw',cap,cap/'source.ll',back,True)]
    for name in ['wrong-guard','omitted-branch','wrong-operand','wrong-return','a-only','rmw-tag-only','omit-activation','safety-query-binding']:
        d=b/'faults-01'/name
        candidate=d/'mutant.ll' if (d/'mutant.ll').exists() else b/'conditional-lift-01/optimized.ll'
        cases.append((name,b/'capture-conditional-01',candidate,d/'backend',False))
    for name,c,p,q,raw in cases:
        r=check(c,p,q,out/name,raw=raw)
        results.append({'name':name,'result':r['result'],'reason':r.get('reason'),'earliest':r.get('earliest_proved_difference')})
    claim=out/'historical-raw/activation-0/source-Q/certificate.json'
    for name,kw in [('closed',{}),('unreachable',{'force_read':7}),('source-only',{'exclude_target':False})]:
        r=concretize(cap,cap/'source.ll',back,out/name,claim,**kw);results.append({'name':name,'result':r['result'],'reason':r.get('reason')})
    # A wrong actual solver assumption must not invalidate the separate true
    # worker equivalence, but must close the observation exclusion gate.
    c=b/'capture-conditional-01';p=b/'conditional-lift-01/optimized.ll';q=b/'faults-01/safety-query-binding/backend'
    f=source.load(c,out/'query-fault/source');actual,receipt,_=bind_actual(c,f,p,q,'lifted')
    host=target_frame(f,p.read_text(encoding='utf-8'),actual,out/'query-fault/host')
    r=check_target_queries(actual,q/'snapshots/query-audit.json',receipt,host,out/'query-fault/check')
    results.append({'name':'query-fault-exclusion-gate','result':r['result'],'reason':r.get('reason')})
    compare(out/'comparison')
    save_json(out/'results.json',results)
    return results


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',type=Path,required=True)
    print(json.dumps(run(p.parse_args().out.resolve()),indent=2))

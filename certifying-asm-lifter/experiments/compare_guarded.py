"""Same-object baseline adapters and exact static-map ablation; no tool race."""
import argparse
import json
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.evidence import save_json
from certification.composition import q_units
from diagnostics.objects import q_graph
from guarded import source, actual, llvm
from guarded.model import summarize
from experiments.detect_semantic_difference import associations, bind_actual
from experiments.detect_semantic_difference import direct_front
from experiments.certify_composition import load_front


def run(out):
    out.mkdir(parents=True,exist_ok=False);rows=[]
    base=ROOT/'experiments/guarded'
    for name,lift in [('merge','explore-lift-01'),('conditional','conditional-lift-01')]:
        d=out/name;cap=base/('capture-'+name+'-01');candidate=base/lift/'optimized.ll'
        f=source.load(cap,d/'source');q,_,binding=bind_actual(cap,f,candidate,base/('backend-'+name+'-01'),'lifted')
        a,t=associations(q,f)[0];r={'case':name,'binding':binding,'comparison_scope':'same raw worker Q and same fixed open history semantics'}
        for label,fn in [('ACTC_native_front',lambda:load_front(cap,d/'old-ACTC-front')),
                         ('diagnostics_native_front',lambda:direct_front(cap,d/'old-diagnostics-front'))]:
            try:fn();r[label]={'result':'FRONT_ADMITTED_ONLY'}
            except Exception as e:r[label]={'result':'UNSUPPORTED','reason':str(e)}
        for label,fn in [('ACTC_Q_adapter',lambda:q_units(t,a['argument'])),
                         ('diagnostics_Q_adapter',lambda:q_graph(q,t,a['argument'],d/'old-diagnostics-Q'))]:
            try:r[label]={'result':'Q_SUMMARY_ONLY','endpoints_or_units':len(fn())}
            except Exception as e:r[label]={'result':'UNSUPPORTED','reason':str(e)}
        # No fake old source activation. Its old source adapter only accepts
        # straight-line ops/pure scalar conditionals, not a guarded FAA call.
        # Quantified ablation bypasses BOTH extraction differences instead.
        qs=actual.paths(q,t,a['argument'],d/'Q')
        r['new_path_sensitive']=summarize(a['paths'],qs,d/'path-sensitive',objects=f['objects'])['result']
        r['same_extraction_uniform_static']=summarize(a['paths'],qs,d/'static',uniform=True,objects=f['objects'])['result']
        ls=llvm.paths(f['module'],a['worker'],a['argument'],f['interface'],'L')
        r['original_LLVM_to_Q']=summarize(ls,qs,d/'LLVM-Q',objects=f['objects'])['result']
        r['same_original_LLVM_uniform_static']=summarize(ls,qs,d/'LLVM-static',uniform=True,objects=f['objects'])['result']
        rows.append(r)
    save_json(out/'comparison.json',rows);return rows


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',type=Path,required=True)
    print(json.dumps(run(p.parse_args().out.resolve()),indent=2))

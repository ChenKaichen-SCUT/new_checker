"""Fixed small fault set on REAL compiler output / actual backend Program.

No source edit, hand-written reference LLVM, synthetic Q, or upstream bug claim.
The mutant LLVM files are explicitly controlled transformation faults.
"""
import argparse
import json
import re
from pathlib import Path
from certification.run_pipeline import ROOT, run_backend
from certification.interface import sha
from certification.evidence import save_json
from guarded.pipeline import check


def run(out):
    out.mkdir(parents=True,exist_ok=False)
    base=ROOT/'experiments/guarded'
    capture=base/'capture-conditional-01'
    candidate=base/'conditional-lift-01/optimized.ll'
    text=candidate.read_text(encoding='utf-8')
    specs=[('wrong-guard',r'icmp eq i32 %2, 0','icmp ne i32 %2, 0'),
           ('omitted-branch',r'br i1 %3, label %7, label %4','br i1 true, label %7, label %4'),
           ('wrong-operand',r'atomicrmw add ptr @x, i32 1 monotonic','atomicrmw add ptr @x, i32 2 monotonic'),
           ('wrong-return',r'icmp ne i32 %cert_[\w]+, 42','icmp ne i32 0, 42')]
    modes=['a-only','rmw-tag-only','omit-activation','safety-query-binding']
    save_json(out/'frozen.json',{'source_sha256':sha((capture/'source.c').read_bytes()),
        'compiler_candidate_sha256':sha(candidate.read_bytes()),'LLVM_faults':specs,'actual_Q_faults':modes,
        'origin':'CONTROLLED_INJECTION, not an upstream defect','frozen_before_backend_runs':True})
    rows=[]
    for name,pattern,replacement in specs:
        d=out/name;d.mkdir();mutant,n=re.subn(pattern,replacement,text);assert n==1
        p=d/'mutant.ll';p.write_bytes(mutant.encode())
        save_json(d/'mutation.json',{'pattern':pattern,'replacement':replacement,'count':n,'input_sha256':sha(candidate.read_bytes()),'output_sha256':sha(p.read_bytes())})
        b=run_backend(p,ROOT/'vendor/Dat3M-levels-positive-v1',ROOT/'experiments/levels/build-positive-01/build-receipt.json',d/'backend')
        c=check(capture,p,d/'backend',d/'check') if b['result']=='ACTUAL_BACKEND_CAPTURED' else b
        rows.append({'name':name,'backend':b['result'],'result':c['result'],'reason':c.get('reason'),'earliest':c.get('earliest_proved_difference')})
    for mode in modes:
        d=out/mode
        b=run_backend(candidate,ROOT/'vendor/Dat3M-levels-fault-v1',ROOT/'experiments/levels/build-fault-01/build-receipt.json',d/'backend',fault=mode)
        c=check(capture,candidate,d/'backend',d/'check') if b['result']=='ACTUAL_BACKEND_CAPTURED' else b
        rows.append({'name':mode,'backend':b['result'],'result':c['result'],'reason':c.get('reason'),'earliest':c.get('earliest_proved_difference')})
    save_json(out/'results.json',rows)
    return rows


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',type=Path,required=True)
    print(json.dumps(run(p.parse_args().out.resolve()),indent=2))

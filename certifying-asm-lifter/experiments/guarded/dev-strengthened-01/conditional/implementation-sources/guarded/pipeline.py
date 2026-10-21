"""Untrusted proposal plus raw-object reconstruction/checking; no SAFE output."""
import json
import re
from pathlib import Path
from certification.interface import llvm_site, sha
from certification.p1_entry import translate_all
from certification.run_pipeline import ROOT
from certification.evidence import save_json, Commands
from certification.provenance import require
from experiments.run_dat3m import linux
from experiments.detect_semantic_difference import bind_actual, associations
from guarded import source, llvm, actual
from guarded.model import summarize, verify_witness, serial
from certification.p0_host import llvm_main, program_main, Obligations
from certification.provenance import mapped_path
from certification.evidence import save_certificate


def target_frame(f, cm, q, out):
    """Keep all original main/init/lifecycle/monitor gates, not only workers."""
    h={}; proof=Obligations(h)
    try:
        llvm_main(cm,f['main_ops'],f['objects'],proof)
        pairs=associations(q,f)
        coverage={'actual_worker_threads':[t['id'] for a,t in pairs],
                  'continuations':[{'assertion_events':[e['id'] for e in t['events'] if e['class']=='Assert']} for a,t in pairs]}
        h.update(program_main(q,f['main_ops'],f['objects'],coverage,proof,mapped_path(f['receipt']['source_path'],f['receipt'])))
        h['result']='ACTUAL_TARGET_HOST_MONITORS_CHECKED'
    finally:save_certificate(out,h)
    return h


def lower(capture, out, optimize=True):
    f=source.load(capture,out/'source-check')
    interfaces=[];function=None
    for i,line in enumerate(f['module'].splitlines()):
        if line.startswith('define '):function=re.search(r'@([^ (]+)',line)[1]
        if re.search(r'\bcall\b.*\basm\b',line):
            site=llvm_site(f['module'],f['interface'],checked_line_index=i)
            site.update(instance_namespace=str(i)+'_',worker_name=function,call_context={'LLVM_static_line':i})
            interfaces.append(site)
    require(interfaces,'no actual inline asm')
    translate_all(interfaces,f['module'],out/'lifting')
    candidate=out/'lifting/candidate.ll'
    if optimize:
        tool=ROOT/'vendor/clang-local/root/usr'
        dest=out/'optimized.ll'
        Commands(out/'optimization').run(['wsl','-d','Ubuntu','--exec','env','LD_LIBRARY_PATH='+linux(tool/'lib/x86_64-linux-gnu'),
            linux(tool/'bin/clang-21'),'-O2','-S','-emit-llvm','-x','ir',linux(candidate),'-o',linux(dest)])
        save_json(out/'optimization-receipt.json',{'input_sha256':sha(candidate.read_bytes()),'output_sha256':sha(dest.read_bytes()),
            'purpose':'actual compiler pass, semantic correctness independently checked by path products'})
        candidate=dest
    return candidate


def check(capture, candidate, backend, out, *, raw=False):
    capture,candidate,backend,out=[Path(p).resolve() for p in (capture,candidate,backend,out)]
    out.mkdir(parents=True,exist_ok=False)
    impl={}
    for directory in ('guarded','certification','diagnostics','frontend','semantics','checker','lifter'):
        for p in (ROOT/directory).rglob('*.py'):
            impl[p.relative_to(ROOT).as_posix()]=sha(p.read_bytes())
    save_json(out/'implementation.json',impl)
    for name in impl:
        dst=out/'implementation-sources'/name;dst.parent.mkdir(parents=True,exist_ok=True);dst.write_bytes((ROOT/name).read_bytes())
    report={'result':'UNSUPPORTED','program_verdict_eligible':False,'closed_execution_claim':False,'activations':[]}
    try:
        f=source.load(capture,out/'producer/source')
        q,b,binding=bind_actual(capture,f,candidate,backend,'raw' if raw else 'lifted')
        report.update(binding=binding,actual_query_binding='retained, not consumed by open certification',
                      source=str(capture.relative_to(ROOT)),candidate=str(candidate.relative_to(ROOT)),backend=str(backend.relative_to(ROOT)))
        cm=candidate.read_text(encoding='utf-8')
        target_frame(f,cm,q,out/'producer/target-frame')
        for a,t in associations(q,f):
            d=out/('activation-'+str(a['create_index']))
            s=a['paths']
            ls=llvm.paths(f['module'],a['worker'],a['argument'],f['interface'],'L'+str(a['create_index']))
            ts=llvm.paths(cm,a['worker'],a['argument'],f['interface'],'I'+str(a['create_index']))
            qs=actual.paths(q,t,a['argument'],d/'actual-extraction')
            source_l=summarize(s,ls,d/'source-L',objects=f['objects'])
            require(source_l['result']=='GUARDED_OPEN_INCLUSION','original source/LLVM relation unproved')
            source_i=summarize(s,ts,d/'source-I',objects=f['objects'])
            i_q=summarize(ts,qs,d/'I-Q',objects=f['objects'])
            source_q=summarize(s,qs,d/'source-Q',objects=f['objects'])
            ab=summarize(s,qs,d/'static-ablation',uniform=True,objects=f['objects'])
            save_json(d/'summaries.json',{'C':serial(s),'L':serial(ls),'I':serial(ts),'Q':serial(qs)})
            report['activations'].append({'index':a['create_index'],'thread':t['id'],'source_L':source_l['result'],
                'source_I':source_i['result'],'I_Q':i_q['result'],'source_Q':source_q['result'],'static_ablation':ab['result'],
                'paths':{'C':len(s),'L':len(ls),'I':len(ts),'Q':len(qs)},
                'potential_endpoints':{k:len({e['id'] for p in ps for e in p['events']}) for k,ps in [('C',s),('L',ls),('I',ts),('Q',qs)]}})
        # Producer summaries and products are discarded. Reopen raw C/AST/L/I/Q.
        g=source.load(capture,out/'verifier/source')
        rq,_,rb=bind_actual(capture,g,candidate,backend,'raw' if raw else 'lifted')
        require(rb==binding,'raw identity drift')
        target_frame(g,candidate.read_text(encoding='utf-8'),rq,out/'verifier/target-frame')
        for a,t in associations(rq,g):
            d=out/('activation-'+str(a['create_index']))
            vs=a['paths'];vl=llvm.paths(g['module'],a['worker'],a['argument'],g['interface'],'L'+str(a['create_index']))
            vi=llvm.paths(candidate.read_text(encoding='utf-8'),a['worker'],a['argument'],g['interface'],'I'+str(a['create_index']))
            vq=actual.paths(rq,t,a['argument'],d/'verifier/Q-extraction')
            for name,left,right in [('source-L',vs,vl),('source-I',vs,vi),('I-Q',vi,vq),('source-Q',vs,vq)]:
                claim=json.loads((d/name/'certificate.json').read_bytes())
                verified=verify_witness(left,right,claim,d/'verifier'/name,objects=g['objects'])
                require(verified['result']=='INDEPENDENT_GUARDED_CLAIM_CHECKED','independent check '+name+': '+verified.get('reason',''))
        report['result']='GUARDED_OPEN_DIFFERENCE' if any(a['source_Q']=='OPEN_DIFFERENCE' for a in report['activations']) else 'GUARDED_OPEN_INCLUSION'
    except Exception as error:
        report['reason']=str(error)
    require(all(sha((ROOT/p).read_bytes())==h for p,h in impl.items()),'implementation changed during check')
    save_json(out/'certificate.json',report)
    print(json.dumps({k:report[k] for k in ('result','reason','activations') if k in report}),flush=True)
    return report

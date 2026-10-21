"""Byte-exact final obligation replay and raw provenance checks; not a benchmark."""
import argparse
import json
from pathlib import Path
import z3
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.evidence import save_json
from certification.provenance import require


def read(p):return json.loads(p.read_bytes())


def run(out):
    out.mkdir(parents=True,exist_ok=False);b=ROOT/'experiments/guarded';base=b/'final-02'
    expected={'merge':'GUARDED_OPEN_INCLUSION','conditional':'GUARDED_OPEN_INCLUSION',
              'historical-raw':'GUARDED_OPEN_DIFFERENCE','safety-query-binding':'GUARDED_OPEN_INCLUSION',
              'closed':'CONDITIONAL_CLOSED_ERROR_DIFFERENCE','unreachable':'UNREACHABLE_OPEN_WITNESS',
              'source-only':'REACHABLE_SOURCE_ERROR_ONLY','query-fault-exclusion-gate':'REJECT'}
    for n in ['wrong-guard','omitted-branch','wrong-operand','wrong-return','a-only','rmw-tag-only','omit-activation']:
        expected[n]='GUARDED_OPEN_DIFFERENCE'
    rows=read(base/'results.json');require({r['name']:r['result'] for r in rows}==expected,'fixed results')
    for p in base.glob('*/implementation.json'):
        for n,h in read(p).items():
            require(sha((ROOT/n).read_bytes())==h==sha((p.parent/'implementation-sources'/n).read_bytes()),'implementation drift')
    captures=[]
    for p in b.glob('capture-*/compiler-receipt.json'):
        r=read(p)
        for n,h in r['artifacts'].items():require(sha((p.parent/n).read_bytes())==h,'capture bytes')
        captures.append(p.parent.relative_to(ROOT).as_posix())
    backends=[]
    for p in b.rglob('backend-receipt.json'):
        r=read(p);require(r['result']=='ACTUAL_BACKEND_CAPTURED','backend capture')
        for n,h in r['snapshots'].items():require(sha((p.parent/'snapshots'/n).read_bytes())==h,'Q bytes')
        q=read(p.parent/'snapshots/before-encoding.json');a=read(p.parent/'snapshots/query-audit.json')
        require(q==read(p.parent/'snapshots/after-encoding.json') and q['run_id']==r['run_id']==a['run_id'],'same run')
        backends.append({'path':p.parent.relative_to(ROOT).as_posix(),'run_id':r['run_id'],'fault':r['controlled_fault'],
                         'actual_queries':[{k:x.get(k) for k in ['stage','result','state']} for x in a['queries']]})
    scopes=[base,b/'comparison-03',b/'explore-lift-01',b/'conditional-lift-01']
    stored={sha(p.read_bytes()):p for d in scopes for p in d.rglob('*.smt2')}
    unique={};occurrences=[]
    def replay(path,expected,certificate):
        data=path.read_bytes();h=sha(data)
        if h not in unique:
            s=z3.Solver();s.set(timeout=30000);s.from_string(data.decode('utf-8'));answer=str(s.check())
            unique[h]={'result':answer,'file':path.relative_to(ROOT).as_posix()}
        require(unique[h]['result']==expected!='unknown','replayed SMT status')
        occurrences.append({'file':path.relative_to(ROOT).as_posix(),'sha256':h,'expected':expected,'certificate':certificate})
    for d in scopes:
        for cp in d.rglob('certificate.json'):
            c=read(cp)
            for o in c.get('obligations',[]):
                if 'file' not in o:continue
                p=cp.parent/o['file']
                if not p.exists():p=stored[o['smt_sha256']]
                data=p.read_bytes();require(sha(data)==o['smt_sha256'],'obligation hash')
                if 'smt2' in o:require(data==o['smt2'].encode('utf-8'),'embedded SMT byte equality')
                replay(p,o['result'],cp.relative_to(ROOT).as_posix())
            for q in c.get('queries',[]):
                if isinstance(q,dict) and 'file' in q and 'replay' in q:
                    replay(cp.parent/q['file'],q['replay'],cp.relative_to(ROOT).as_posix())
    save_json(out/'smt-replay.json',{'occurrences':occurrences,'unique':unique,'solver':z3.get_version_string()})
    save_json(out/'actual-objects.json',{'captures':captures,'backends':backends})
    claims=[p for p in base.glob('*/activation-*/verifier/*/certificate.json') if p.parent.name in {'source-L','source-I','I-Q','source-Q'}]
    require(all(read(p)['result']=='INDEPENDENT_GUARDED_CLAIM_CHECKED' for p in claims),'independent claims')
    require(b'207 passed' in (b/'tests-final.stdout.log').read_bytes(),'full regression')
    comparison=read(b/'comparison-03/comparison.json')
    require(comparison[0]['same_extraction_uniform_static']=='UNIFORM_STATIC_CERTIFICATE_UNAVAILABLE','nontrivial static-map ablation')
    require(read(base/'closed/independent/certificate.json')['result']=='INDEPENDENT_SOURCE_ERROR_GRAPH_CHECKED','source graph witness')
    result={'result':'BOUNDED_GUARDED_REVIEW_COMPLETE','cases':len(rows),'independent_layer_claims':len(claims),
            'new_compiler_captures':len(captures),'new_backend_runs':len(backends),'reused_historical_backend_runs':1,
            'SMT_references':len(occurrences),'distinct_SMT_bytes':len(unique),'tests':207,
            'new_program_SAFE':0,'new_upstream_defects':0,'conditional_closed_historical_difference':1,
            'proved_unreachable_open_witnesses':1,'new_ISSTA_algorithm_novelty':'NO_GO'}
    save_json(out/'summary.json',result);print(json.dumps(result));return result


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',type=Path,required=True)
    run(p.parse_args().out.resolve())

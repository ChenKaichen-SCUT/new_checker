"""Synthetic algebra attacks + read-only real-object checks, never new bugs."""
import copy
import json
import pytest
import z3
from certification.run_pipeline import ROOT
from certification.p1_entry import obj
from guarded import model, source, llvm, actual, closed
from guarded.pipeline import target_frame
from guarded.target_queries import check_target_queries
from experiments.detect_semantic_difference import bind_actual, associations


def histories():
    flag=z3.BitVec('flag',32)
    a,_=model.faa('a',obj('@x'),z3.BitVecVal(1,32))
    b,_=model.faa('b',obj('@x'),z3.BitVecVal(2,32))
    c,_=model.faa('c',obj('@x'),z3.If(flag!=0,z3.BitVecVal(1,32),z3.BitVecVal(2,32)))
    return [{'guard':flag!=0,'events':a},{'guard':flag==0,'events':b}],[{'guard':z3.BoolVal(True),'events':c}]


def test_static_merge_and_quantifiers(tmp_path):
    s,t=histories();a=model.summarize(s,t,tmp_path/'path')
    assert a['result']=='GUARDED_OPEN_INCLUSION'
    assert model.verify_witness(s,t,a,tmp_path/'verify')['result']=='INDEPENDENT_GUARDED_CLAIM_CHECKED'
    assert model.summarize(s,t,tmp_path/'static',uniform=True)['result']=='UNIFORM_STATIC_CERTIFICATE_UNAVAILABLE'


def test_reverse_exclusive_duplication(tmp_path):
    s,t=histories()
    assert model.summarize(t,s,tmp_path/'path')['result']=='GUARDED_OPEN_INCLUSION'
    assert model.summarize(t,s,tmp_path/'static',uniform=True)['result']=='UNIFORM_STATIC_CERTIFICATE_UNAVAILABLE'


@pytest.mark.parametrize('fault',['guard','operand','return','missing','A','pair','extra'])
def test_path_sensitive_faults(fault,tmp_path):
    s,t=histories();t=copy.deepcopy(t)
    if fault=='guard':t[0]['guard']=z3.BitVec('flag',32)!=0
    if fault=='operand':t[0]['events'][1]['fields']['value']+=1
    if fault=='missing':t[0]['events']=t[0]['events'][:1]
    if fault=='extra':t[0]['events'].append(model.read_event('extra',obj('@x')))
    if fault=='A':t[0]['events'][0]['tags'].remove('A')
    if fault=='pair':t[0]['events'][1]['pair']='absent'
    if fault=='return':
        for p in s:p['events'].append(model.event('O','assert',fields={'condition':p['events'][0]['response']==0}))
        t[0]['events'].append(model.event('O','assertQ',fields={'condition':z3.BoolVal(True)}))
    c=model.summarize(s,t,tmp_path/'producer');assert c['result']=='OPEN_DIFFERENCE'
    assert model.verify_witness(s,t,c,tmp_path/'verify')['result']=='INDEPENDENT_GUARDED_CLAIM_CHECKED'


def test_empty_target_not_silently_accepted(tmp_path):
    s,t=histories();assert model.summarize(s,[],tmp_path)['result']=='UNKNOWN'


def test_missing_source_path_rejects(tmp_path):
    s,t=histories();assert model.summarize(s[:1],t,tmp_path)['result']=='UNKNOWN'


def test_unknown_solver_is_not_verdict(tmp_path,monkeypatch):
    def unknown(*_):raise RuntimeError('SMT UNKNOWN controlled test')
    monkeypatch.setattr(model.Queries,'ask',unknown)
    assert model.summarize(*histories(),tmp_path)['result']=='UNKNOWN'


def test_path_limit_never_truncates(tmp_path,monkeypatch):
    monkeypatch.setattr(model,'LIMIT',1)
    assert model.summarize(*histories(),tmp_path)['result']=='UNKNOWN'


def test_target_only_nondeterminism_refuses(tmp_path):
    s,t=histories();t[0]['events'][1]['fields']['value']+=z3.BitVec('fresh-target-choice',32)
    assert model.summarize(s,t,tmp_path)['result']=='UNKNOWN'


def test_forged_negative_claim_refuses(tmp_path):
    s,t=histories();claim={'result':'OPEN_DIFFERENCE','source_path':0,'witness':[]}
    assert model.verify_witness(s,t,claim,tmp_path)['result']=='REJECT'


def real(tmp_path,name='conditional',fault=None):
    b=ROOT/'experiments/guarded';cap=b/('capture-'+name+'-01')
    candidate=b/('conditional-lift-01' if name=='conditional' else 'explore-lift-01')/'optimized.ll'
    backend=b/('backend-'+name+'-01') if fault is None else b/'faults-01'/fault/'backend'
    f=source.load(cap,tmp_path/'source');q,r,_=bind_actual(cap,f,candidate,backend,'lifted')
    return cap,candidate,backend,f,q,r


def test_actual_conditional_both_paths(tmp_path):
    _,p,_,f,q,_=real(tmp_path);a,t=associations(q,f)[0]
    qs=actual.paths(q,t,a['argument'],tmp_path/'Q')
    assert len(qs)>1
    assert model.summarize(a['paths'],qs,tmp_path/'proof',objects=f['objects'])['result']=='GUARDED_OPEN_INCLUSION'


def test_llvm_undefined_phi_and_cycle_refuse(tmp_path):
    _,p,_,f,_,_=real(tmp_path);a=f['activations'][0];m=p.read_text(encoding='utf-8')
    with pytest.raises(Exception):llvm.paths(m.replace('[ %6, %4 ]','[ %unknown, %4 ]'),a['worker'],a['argument'],f['interface'],'I')
    with pytest.raises(Exception):llvm.paths(m.replace('br label %7,','br label %4,'),a['worker'],a['argument'],f['interface'],'I')


def test_query_fault_is_outside_open_semantics_but_blocks_exclusion(tmp_path):
    _,candidate,backend,f,q,b=real(tmp_path,fault='safety-query-binding')
    h=target_frame(f,candidate.read_text(encoding='utf-8'),q,tmp_path/'host')
    try:r=check_target_queries(q,backend/'snapshots/query-audit.json',b,h,tmp_path/'queries')
    except Exception:return
    assert r['result']!='BOUND_SAFETY_AND_BOUND_UNSAT'


def test_unsupported_closed_branch_is_unknown(tmp_path):
    b=ROOT/'experiments/guarded';cap=b/'capture-conditional-01'
    # Raw candidate identity cannot match the lifted backend: reject before any claim.
    r=closed.run(cap,cap/'source.ll',b/'backend-conditional-01',tmp_path/'closed',tmp_path/'absent')
    assert r['result']=='UNKNOWN'


@pytest.mark.parametrize('fault',['rf','co','pair','value','coverage'])
def test_concrete_graph_tampering_refuses(tmp_path,fault):
    b=ROOT/'experiments/diagnostics/acceptance-02';cap=b/'capture-unsafe';backend=b/'raw-unsafe-backend'
    f=source.load(cap,tmp_path/'source');q,_,_=bind_actual(cap,f,cap/'source.ll',backend,'raw')
    h=target_frame(f,f['module'],q,tmp_path/'host')
    es,g,bad=closed.graph(f,q,h,[a['paths'][0] for a in f['activations']],True)
    w=json.loads((ROOT/'experiments/guarded/dev-closed-01/source-execution/witness.json').read_bytes())['relations']
    assert closed.verify_graph(es,g,bad,w)
    if fault=='rf':w['rf'].pop()
    if fault=='co':w['co'].append(list(reversed(w['co'][0])))
    if fault=='pair':w['rmw'].pop()
    if fault=='value':w['values']['init:x']=7
    if fault=='coverage':w['values'].pop('init:x')
    with pytest.raises(Exception):closed.verify_graph(es,g,bad,w)

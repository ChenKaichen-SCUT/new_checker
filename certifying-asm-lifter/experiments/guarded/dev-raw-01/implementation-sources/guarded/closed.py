"""Optional finite source-execution and target-observation exclusion certificates.

Initial CLOSED domain: straight-line FAA workers, successful finite lifecycle,
complete globals and final main assertion. No worker errors/early termination.
Public UNSAT is a conservative unreachable result. A private-protocol completion
is additionally required for SAT. No SAT alone claims a translation difference.
"""
import itertools
import json
from pathlib import Path
import z3
from z3.z3util import get_vars
from certification.interface import sha
from certification.run_pipeline import ROOT
from certification.evidence import save_json, save_certificate
from certification.provenance import require, mapped_path
from certification.p0_host import program_main, Obligations
from certification.p1_entry import obj
from experiments.detect_semantic_difference import associations, bind_actual
from experiments.certify_p0 import GAMMA
from guarded import source, actual
from guarded.model import event, read_event, serial, summarize, verify_witness
from guarded.target_queries import check_target_queries, formula


def graph(f,q,host,paths,private):
    """A SOURCE execution model, never a replacement/fabricated Dat3M Q."""
    threads={0:[]};guards=[p['guard'] for p in paths];monitors=[]
    def add(t,e):
        e={**e,'thread':t};threads.setdefault(t,[]).append(e);return e
    def r(t,identity,name,width):return add(t,read_event(identity,obj('@'+name),width))
    def w(t,identity,name,width,v,tags=None,pair=None):
        e=event('W',identity,width,tags=tags or [],fields={'address':obj('@'+name),'value':v})
        if pair:e['pair']=pair
        return add(t,e)
    pairs=associations(q,f)
    runtime={}
    for (a,t),p in zip(pairs,paths):
        tid=t['id'];name='__com_'+t['name']+'#'+str(tid);runtime[a['create_index']]=(tid,name)
        if private:
            e=r(tid,'runtime-start-'+str(tid),name,2);guards.append(z3.Extract(0,0,e['response'])!=0)
        for e in p['events']:
            require(e['kind']!='O','closed initial scope excludes worker assertions / error-stop prefixes')
            add(tid,e)
        if private:
            e=r(tid,'runtime-finish-R-'+str(tid),name,2);e['tags']=['A','RMW']
            w(tid,'runtime-finish-W-'+str(tid),name,2,e['response']&2,['A','RMW'],e['id'])
    handles={};ci=0
    for oi,op in enumerate(f['main_ops']):
        if op['kind']=='create':
            tid,name=runtime[ci];ci+=1;handles[op['handle']]=(tid,name)
            if private:w(0,'runtime-create-'+str(tid),name,2,z3.BitVecVal(3,2))
        elif op['kind']=='join' and private:
            tid,name=handles[op['handle']]
            e=r(0,'runtime-join-R-'+str(tid),name,2);e['tags']=['A','RMW']
            w(0,'runtime-join-W-'+str(tid),name,2,e['response']&1,['A','RMW'],e['id'])
            # The checked real normal-success path executes ThreadJoin then
            # Assume. These are exactly its branch/assume predicates.
            guards += [z3.Extract(1,1,e['response'])!=0,z3.Extract(0,0,e['response'])==0]
        elif op['kind']=='read':
            add(0,event('R','source-main-'+str(oi),op['width'],response=op['value'],fields={'address':obj('@'+op['object'])}))
        elif op['kind']=='assert':monitors.append(op['condition'])
        else:require(op['kind'] in {'join','return'},'closed main unhandled operation')
    objects={**f['objects'],**(host['protocol_objects'] if private else {})}
    inits=[]
    for i,(name,o) in enumerate(sorted(objects.items())):
        inits.append({**event('W','init:'+name,o['width'],tags=['IW'],fields={'address':obj('@'+name),'value':z3.BitVecVal(o['initial'],o['width'])}),
                      'thread':-i-1})
    events=inits+[e for es in threads.values() for e in es]
    return events,guards,z3.Or(*[z3.Not(c) for c in monitors])


def encode(events,guards):
    """Direct finite instance of the exact pinned CAT expressions, with wf-rf/co."""
    n=len(events);require(n<=64,'global event budget')
    clauses=list(guards);reads=[i for i,e in enumerate(events) if e['kind']=='R'];writes=[i for i,e in enumerate(events) if e['kind']=='W']
    objname=lambda e:e['fields']['address'].sexpr()
    require(all(str(e['fields']['address']).startswith('object:') and z3.is_const(e['fields']['address']) for e in events),'source constant objects')
    require(all(a['width']==b['width'] for a in events for b in events if objname(a)==objname(b)),'no mixed widths')
    rank={i:z3.Int('co-rank-'+str(i)) for i in writes}
    for i in writes:clauses += [rank[i]>=0,rank[i]<len(writes)]
    for i,j in itertools.combinations(writes,2):
        if objname(events[i])==objname(events[j]):clauses.append(rank[i]!=rank[j])
    for i in writes:
        if 'IW' in events[i]['tags']:
            clauses += [rank[i]<rank[j] for j in writes if i!=j and objname(events[i])==objname(events[j])]
    F=z3.BoolVal(False)
    co=lambda i,j: rank[i]<rank[j] if i in rank and j in rank and objname(events[i])==objname(events[j]) else F
    rf={}
    for j in reads:
        choices=[]
        for i in writes:
            if objname(events[i])!=objname(events[j]):continue
            v=z3.Bool('rf-'+str(i)+'-'+str(j));rf[i,j]=v;choices.append((v,1))
            clauses.append(z3.Implies(v,events[j]['response']==events[i]['fields']['value']))
        clauses.append(z3.PbEq(choices,1))
    RF=lambda i,j:rf.get((i,j),F)
    FR=lambda i,j:z3.Or(*[z3.And(RF(w,i),co(w,j)) for w in writes]) if i in reads and j in writes else F
    po=lambda i,j:events[i]['thread']==events[j]['thread'] and i<j
    ext=lambda i,j:events[i]['thread']!=events[j]['thread']
    ur=[z3.Int('uniproc-rank-'+str(i)) for i in range(n)]
    tr=[z3.Int('tso-rank-'+str(i)) for i in range(n)]
    for xs in (ur,tr):
        clauses += [z3.And(x>=0,x<n) for x in xs]
    rmw=[]
    for j,e in enumerate(events):
        if 'pair' in e:
            i=next((i for i,r in enumerate(events) if r['id']==e['pair']),None)
            require(i is not None and events[i]['kind']=='R' and po(i,j),'closed RMW pair')
            rmw.append((i,j))
            clauses.append(z3.Not(z3.Or(*[z3.And(FR(i,k),co(k,j)) for k in writes if ext(i,k) and ext(k,j)])))
    for i in range(n):
        for j in range(n):
            if i==j:continue
            com=z3.Or(co(i,j),RF(i,j),FR(i,j))
            uni=z3.Or(z3.BoolVal(po(i,j) and objname(events[i])==objname(events[j])),com)
            k=po(i,j) and (events[i]['kind']=='R' or events[j]['kind']=='W' or
                           ('A' in events[i]['tags'] or 'A' in events[j]['tags']))
            ghb=z3.Or(z3.BoolVal(k),co(i,j),FR(i,j),RF(i,j) if ext(i,j) else F)
            clauses += [z3.Implies(uni,ur[i]<ur[j]),z3.Implies(ghb,tr[i]<tr[j])]
    return z3.And(*clauses),{'rf':rf,'co':co,'fr':FR,'rmw':rmw,'po':po}


def ask(name,f,out):
    s=z3.Solver();s.set(timeout=30000);s.add(f);answer=s.check()
    row={'name':name,'result':str(answer),'smt2':s.to_smt2()}
    if answer==z3.sat:row['model']=str(s.model())
    if answer==z3.unknown:row['reason']=s.reason_unknown()
    save_certificate(out,{'obligations':[row],'result':str(answer)})
    return answer,s.model() if answer==z3.sat else None


def witness(events,relation,model):
    def yes(f):return z3.is_true(model.eval(f,model_completion=True))
    values={e['id']:model.eval(e['response'] if e['kind']=='R' else e['fields']['value'],model_completion=True).as_long() for e in events}
    n=len(events)
    return {'values':values,'rf':[[events[i]['id'],events[j]['id']] for (i,j),f in relation['rf'].items() if yes(f)],
            'co':[[events[i]['id'],events[j]['id']] for i in range(n) for j in range(n) if yes(relation['co'](i,j))],
            'fr':[[events[i]['id'],events[j]['id']] for i in range(n) for j in range(n) if yes(relation['fr'](i,j))],
            'po':[[events[i]['id'],events[j]['id']] for i in range(n) for j in range(n) if relation['po'](i,j)],
            'rmw':[[events[i]['id'],events[j]['id']] for i,j in relation['rmw']],
            'A':[e['id'] for e in events if 'A' in e['tags']]}


def verify_graph(events,guards,bad,w):
    """Concrete graph checks independent of the solver's acyclicity encoding."""
    byid={e['id']:e for e in events};require(set(w['values'])==set(byid),'closed witness event coverage')
    sub=[(e['response'],z3.BitVecVal(w['values'][e['id']],e['width'])) for e in events if e['kind']=='R']
    eval_=lambda f:z3.simplify(z3.substitute(f,*sub))
    require(all(z3.is_true(eval_(g)) for g in guards),'closed path/protocol predicates')
    for e in events:
        require(0<=w['values'][e['id']]<2**e['width'],'closed value width')
        if e['kind']=='W':require(z3.is_true(eval_(e['fields']['value']==w['values'][e['id']])),'closed write expression')
    rf,co,fr,po,rmw=[set(map(tuple,w[k])) for k in ('rf','co','fr','po','rmw')]
    require(all(a in byid and b in byid for rel in [rf,co,fr,po,rmw] for a,b in rel),'relation domain')
    same=lambda a,b:z3.eq(byid[a]['fields']['address'],byid[b]['fields']['address'])
    ext=lambda a,b:byid[a]['thread']!=byid[b]['thread']
    for e in events:
        if e['kind']=='R':
            src=[a for a,b in rf if b==e['id']]
            require(len(src)==1 and byid[src[0]]['kind']=='W' and same(src[0],e['id']) and w['values'][src[0]]==w['values'][e['id']],'rf functionality/value')
    require(all(byid[a]['kind']=='W' and byid[b]['kind']=='R' for a,b in rf),'rf sorts')
    ws=[e['id'] for e in events if e['kind']=='W']
    require(all(a!=b and byid[a]['kind']==byid[b]['kind']=='W' and same(a,b) for a,b in co),'co sorts')
    for a,b in itertools.combinations(ws,2):
        if same(a,b):require(((a,b) in co)^((b,a) in co),'co totality')
    require(all((a,c) in co for a,b in co for bb,c in co if b==bb),'co transitivity')
    require(all((a,b) in co for a in ws for b in ws if a!=b and same(a,b) and 'IW' in byid[a]['tags']),'initial co first')
    require(fr=={(r,b) for a,r in rf for aa,b in co if a==aa},'derived fr')
    expected_po={(a['id'],b['id']) for i,a in enumerate(events) for b in events[i+1:] if a['thread']==b['thread']}
    require(po==expected_po and rmw=={(e['pair'],e['id']) for e in events if 'pair' in e} and set(w['A'])=={e['id'] for e in events if 'A' in e['tags']},'po/pair/A completeness')
    require(not any((r,a) in fr and ext(r,a) and (a,b) in co and ext(a,b) for r,b in rmw for a in ws),'CAT atomicity')
    def acyclic(rel):
        graph={i:set() for i in byid}
        for a,b in rel:graph[a].add(b)
        done=set()
        def visit(a,stack):
            require(a not in stack,'CAT cycle')
            if a in done:return
            for b in graph[a]:visit(b,stack|{a})
            done.add(a)
        for a in byid:visit(a,set())
    acyclic({(a,b) for a,b in po if same(a,b)}|rf|co|fr)
    k={(a,b) for a,b in po if byid[a]['kind']=='R' or byid[b]['kind']=='W' or 'A' in byid[a]['tags'] or 'A' in byid[b]['tags']}
    acyclic(k|co|fr|{(a,b) for a,b in rf if ext(a,b)})
    return z3.is_true(eval_(bad))


def run(capture,candidate,backend,out,open_claim, *, force_read=None, exclude_target=True):
    capture,candidate,backend,out=[Path(p).resolve() for p in (capture,candidate,backend,out)]
    out.mkdir(parents=True,exist_ok=False)
    report={'result':'UNKNOWN','program_verdict_eligible':False,'original_Gamma':GAMMA,'new_semantic_assumptions':[],
            'observation':'completed post-join user main error Boolean; not full trace equivalence'}
    try:
        f=source.load(capture,out/'source')
        q,b,binding=bind_actual(capture,f,candidate,backend,'raw')
        report['binding']=binding
        pairs=associations(q,f)
        require(all(len(a['paths'])==1 for a,t in pairs),'closed initial scope: unconditional straight-line workers')
        paths=[a['paths'][0] for a,t in pairs]
        require(all(all(e['kind']!='O' for e in p['events']) for p in paths),'closed main-only errors')
        # Validate actual runtime frames and every target worker path independently.
        qs=[actual.paths(q,t,a['argument'],out/('target-worker-'+str(t['id']))) for a,t in pairs]
        claim=json.loads(Path(open_claim).read_bytes())
        checked=verify_witness(pairs[0][0]['paths'],qs[0],claim,out/'open-witness')
        require(claim['result']=='OPEN_DIFFERENCE' and checked['result']=='INDEPENDENT_GUARDED_CLAIM_CHECKED','valid open witness required')
        host={};proof=Obligations(host)
        coverage={'actual_worker_threads':[t['id'] for a,t in pairs], 'continuations':[{'assertion_events':[]} for _ in pairs]}
        host.update(program_main(q,f['main_ops'],f['objects'],coverage,proof,mapped_path(f['receipt']['source_path'],f['receipt'])))
        host['result']='ACTUAL_TARGET_HOST_MONITORS_CHECKED';save_certificate(out/'target-host',host)
        public,g,bad=graph(f,q,host,paths,False);pf,_=encode(public,g)
        # Source-open witness binds scalar read responses only. Object addresses
        # are nominal disjoint source objects, not physical placements to infer.
        scalar={str(e['response']):e['response'] for e in public if e['kind']=='R'}
        equalities=[scalar[v['name']]==v['value'] for v in claim['witness'] if v['name'] in scalar]
        if force_read is not None:
            e=next(e for e in paths[0]['events'] if e['kind']=='R')
            equalities.append(e['response']==force_read)
            probe=summarize(pairs[0][0]['paths'],qs[0],out/'extended-open-witness',fixed_witness=equalities)
            require(probe['result']=='OPEN_DIFFERENCE','probe must remain an open difference')
            verify=verify_witness(pairs[0][0]['paths'],qs[0],probe,out/'extended-open-check')
            require(verify['result']=='INDEPENDENT_GUARDED_CLAIM_CHECKED','probe independently checked')
            report['controlled_witness_extension']={'first_source_read_value':force_read,'not_a_backend_injection':True}
        st,_=ask('public-source-witness-feasibility',z3.And(pf,*equalities),out/'public-feasibility')
        if st==z3.unsat:
            report['result']='UNREACHABLE_OPEN_WITNESS'
        elif st==z3.unknown:
            report['reason']='source feasibility UNKNOWN'
        else:
            full,guards,bad=graph(f,q,host,paths,True);ff,relations=encode(full,guards)
            st,model=ask('source-runtime-completion-and-main-error',z3.And(ff,bad,*equalities),out/'source-execution')
            if st!=z3.sat:
                report.update(result='OPEN_DIFFERENCE',reason='no checked completed source ERROR witness; not proof of unreachability')
            else:
                w=witness(full,relations,model)
                require(verify_graph(full,guards,bad,w),'concrete graph does not violate main property')
                save_json(out/'source-execution/witness.json',{'graph':serial(full),'relations':w,'initialization':f['objects'],
                    'lifecycle':host['main_links'],'error_observation':True,'provenance':'derived SOURCE graph, never actual Q'})
                # Rebuild source/path/graph again before checking the stored witness.
                independent=source.load(capture,out/'independent/source')
                ipaths=[a['paths'][0] for a in independent['activations']]
                ev,gg,bb=graph(independent,q,host,ipaths,True)
                require(verify_graph(ev,gg,bb,json.loads((out/'source-execution/witness.json').read_bytes())['relations']),'independent source witness')
                report.update(result='REACHABLE_SOURCE_ERROR_ONLY',source_error_checked=True)
                if exclude_target:
                    query=check_target_queries(q,backend/'snapshots/query-audit.json',b,host,out/'target-queries')
                    report['query_binding']=query['result']
                    if query['result']=='BOUND_SAFETY_AND_BOUND_UNSAT':
                        # Drop symmetry: exclusion must not rely on a symmetry
                        # quotient being complete for the chosen observation.
                        audit=json.loads((backend/'snapshots/query-audit.json').read_bytes())
                        c={k:formula(v) for k,v in audit['components'].items()}
                        userids=set(host['user_assertions'])
                        obs=z3.Or(*[z3.And(formula(m['execution']),z3.Not(formula(m['condition']))) for m in audit['monitors'] if m['event'] in userids])
                        st,_=ask('all-target-user-error-exclusion-no-symmetry',z3.And(c['program'],c['memory_model'],c['variable_bounds'],obs),out/'target-exclusion')
                        if st==z3.unsat:report.update(result='CONDITIONAL_CLOSED_ERROR_DIFFERENCE',all_target_error_executions_excluded=True)
                        else:report['reason']='target matching error execution not excluded'
                    else:report['reason']='actual target query/coverage not sufficient for exclusion'
    except Exception as error:report['reason']=str(error)
    save_json(out/'certificate.json',report)
    print(json.dumps({k:report[k] for k in ('result','reason','query_binding') if k in report}),flush=True)
    return report

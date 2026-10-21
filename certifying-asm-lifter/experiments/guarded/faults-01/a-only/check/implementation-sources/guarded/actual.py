"""Read-only finite paths from the captured final Dat3M Program."""
import z3
from certification.provenance import require, unique
from certification.p0_host import Obligations, basic_event, mem, literal
from certification.p1_entry import obj, qexpr
from certification.continuation import core_expr
from certification.evidence import save_certificate
from diagnostics.objects import completeness
from guarded.model import event, read_event, truth, LIMIT


def paths(q, thread, argument, out):
    report={}; proof=Obligations(report)
    try:
        completeness(q); require(q['format']=='dat3m-core-snapshot-v1' and q['arch']=='TSO','actual Q model')
        es=thread['events']; ids=[e['id'] for t in q['threads'] for e in t['events']]
        require(len(ids)==len(set(ids)),'actual event identity')
        for i,e in enumerate(es): basic_event(e,es[i+1]['id'] if i+1<len(es) else None)
        require([e['class'] for e in es[:4]]==['ThreadStart','Load','Assume','ThreadArgument'] and
                [e['class'] for e in es[-4:]]==['Load','RMWStore','ThreadReturn','Label'],'runtime frame')
        start,r,assume,arg=es[:4]; cr,cw,ret,end=es[-4:]
        creator=unique([e for t in q['threads'] for e in t['events'] if e['id']==start['creator']],'creator')
        require(creator['class']=='ThreadCreate' and creator['spawned_thread']==thread['id'] and arg['creator']==creator['id']
                and arg['argument_index']==0 and len(creator['arguments'])==1 and arg['writes']['type']=='bv64','argument lifecycle')
        av=qexpr(creator['arguments'][0],{}); expected=z3.BitVecVal(0,64) if argument=='null' else obj(argument)
        proof.prove('thread-argument',av==expected)
        runtime=f"__com_{thread['name']}#{thread['id']}"
        for e,tags in [(r,['M','R','_']),(cr,['A','M','R','RMW','_']),(cw,['A','M','W','RMW','_'])]:
            mem(e,runtime,2,tags);require(e.get('source') is None,'private runtime namespace')
        require(cw['rmw_load']==cr['id'] and end['successor'] is None,'runtime pair/exit')
        literal(ret['return_value'],64,0)
        rv,cv=z3.BitVec('start',2),z3.BitVec('finish',2)
        proof.prove('startup',core_expr(assume['condition'],{r['writes']['name']:rv})==(z3.Extract(0,0,rv)!=0))
        proof.prove('completion',core_expr(cw['value'],{cr['writes']['name']:cv})==(cv&2))
        body=es[4:-4]; byid={e['id']:e for e in body}; exit_id=cr['id']; entry=body[0]['id'] if body else exit_id
        edges={}
        for e in body:
            nexts=[e['successor']]+([e['jump']] if e['class']=='CondJump' else [])
            require(all(n in byid or n==exit_id for n in nexts),'Q branch escapes worker region')
            if e['class']=='CondJump': require(e['jump']==exit_id or byid[e['jump']]['class']=='Label','Q jump target is not label')
            edges[e['id']]=nexts
        seen=set()
        def dag(n,stack):
            if n==exit_id:return
            require(n not in stack,'Q cycle')
            if n in seen:return
            for t in edges[n]:dag(t,stack|{n})
            seen.add(n)
        dag(entry,set());require(seen==set(byid),'uncovered Q node')
        results=[]
        def walk(n,env,guard,evs,visited):
            require(len(results)<LIMIT,'Q path budget')
            env=dict(env);evs=list(evs);visited=list(visited)
            while n!=exit_id:
                e=byid[n];visited.append(n);cls=e['class'];eid='Q'+str(thread['id'])+':'+str(n)
                if cls=='CondJump':
                    c=qexpr(e['guard'],env);require(z3.is_bool(c),'Q Boolean guard')
                    # Both edges are interpreted, including infeasible branches.
                    walk(e['jump'],env,z3.And(guard,c),evs,visited)
                    walk(e['successor'],env,z3.And(guard,z3.Not(c)),evs,visited);return
                if cls in {'Label','StringAnnotation'}:
                    require(not e['reads'] and e['writes'] is None,'silent node has effect')
                elif cls=='Local':
                    v=qexpr(e['expr'],env);require(e['writes']['type']==('bool' if z3.is_bool(v) else 'bv'+str(v.size())),'Q local type')
                    env[e['writes']['name']]=v
                elif cls in {'Load','Store','RMWStore'}:
                    kind='R' if cls=='Load' else 'W';width=e['width']
                    require(width in {32,64} and {kind,'M'}<=set(e['tags'])<= {kind,'M','_','A','RMW'},'public memory scope')
                    a=qexpr(e['addr'],env);require(a.size()==64,'Q address type')
                    ep=read_event(eid,a,width) if kind=='R' else event('W',eid,width,fields={'address':a,'value':qexpr(e['value'],env)})
                    ep['tags']=[t for t in e['tags'] if t in {'A','RMW'}]
                    if kind=='R':
                        require(e['writes']['type']=='bv'+str(width),'Q read type');env[e['writes']['name']]=ep['response']
                    else:
                        require(ep['fields']['value'].size()==width,'Q stored value type')
                        if cls=='RMWStore':ep['pair']='Q'+str(thread['id'])+':'+str(e['rmw_load'])
                    evs.append(ep)
                elif cls=='Assert':
                    require(e['error_message']=='user assertion','monitor role')
                    c=qexpr(e['condition'],env);require(z3.is_bool(c),'monitor Boolean')
                    evs.append(event('O',eid,fields={'condition':c}))
                else: raise ValueError('unconsumed actual Q event '+cls)
                n=e['successor']
            results.append({'guard':guard,'events':evs,'visited':visited})
        walk(entry,{arg['writes']['name']:av},z3.BoolVal(True),[],[])
        report.update(result='FINITE_Q_PATHS',complete_body_nodes=sorted(seen),paths=len(results))
        return results
    finally:save_certificate(out,report)

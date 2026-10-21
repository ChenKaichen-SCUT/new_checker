"""Finite LLVM CFG paths with actual SSA/phi edges, no backend name guesses."""
import copy
import re
import z3
from certification.interface import llvm_site
from certification.provenance import require, unique
from certification.p1_entry import obj
from guarded.model import faa, read_event, event, truth, LIMIT

V = r'(?:%[-\w.$]+|@[-\w.$]+|-?\d+|true|false)'


def paths(module, function, argument, interface, prefix):
    lines=module.splitlines()
    start=unique([i for i,l in enumerate(lines) if re.match(r'define .*@'+re.escape(function)+r'\(',l)],'LLVM definition')
    end=next(i for i in range(start+1,len(lines)) if lines[i]=='}')
    header=lines[start]
    formal=unique(re.findall(r'(%[-\w.$]+)',header),'one LLVM parameter')
    require(' ptr @'+function+'(' in header and re.search(r'\(ptr .*'+re.escape(formal)+r'\)',header),'worker signature')
    entry=str(int(formal[1:])+1) if formal[1:].isdigit() else '0'
    blocks={entry:[]}; current=entry
    for i in range(start+1,end):
        text=lines[i].split(';',1)[0].strip() if ' asm ' not in lines[i] else lines[i].strip()
        if not text: continue
        label=re.fullmatch(r'([-\w.$]+):',text)
        if label:
            current=label[1]; require(current not in blocks or not blocks[current],'duplicate block')
            blocks[current]=[]
        else: blocks[current].append((i,re.split(r',\s*!',text)[0]))
    # Independent whole-CFG validation, including infeasible/unreachable blocks.
    edges={}
    for b,ins in blocks.items():
        require(ins,'empty LLVM block')
        terminator=ins[-1][1]
        if terminator=='ret ptr null': successors=[]
        elif re.fullmatch(r'br label %[-\w.$]+',terminator): successors=re.findall(r'label %([-\w.$]+)',terminator)
        elif re.fullmatch(r'br i1 '+V+r', label %[-\w.$]+, label %[-\w.$]+',terminator): successors=re.findall(r'label %([-\w.$]+)',terminator)
        else: raise ValueError('unsupported LLVM terminator '+terminator)
        require(all(t in blocks for t in successors),'closed LLVM CFG')
        require(not any(x.startswith(('ret ','br ')) for _,x in ins[:-1]),'interior terminator')
        edges[b]=successors
    seen=set()
    def dag(b,stack):
        require(b not in stack,'LLVM cycle')
        if b in seen:return
        for t in edges[b]:dag(t,stack|{b})
        seen.add(b)
    dag(entry,set()); require(seen==set(blocks),'unreachable LLVM block requires independent admission')
    results=[]
    def walk(b,pred,env,guard,events,visited):
        require(len(results)<LIMIT,'LLVM path budget')
        env=dict(env);events=list(events);visited=list(visited)
        def val(x,bits):
            if x.startswith('%'): require(x in env,'undefined LLVM SSA '+x); v=env[x]
            elif x.startswith('@'): v=obj(x)
            else: v=z3.BitVecVal(1 if x=='true' else 0 if x=='false' else int(x),bits)
            require(v.sort()==z3.BitVecSort(bits),'LLVM SSA type');return v
        for idx,text in blocks[b]:
            visited.append(idx); eid=prefix+':'+str(idx)
            if text=='ret ptr null':results.append({'guard':guard,'events':events,'visited':visited});return
            if text.startswith('br '):
                dest=edges[b]
                if len(dest)==1:walk(dest[0],b,env,guard,events,visited)
                else:
                    c=truth(val(re.match(r'br i1 ('+V+')',text)[1],1))
                    walk(dest[0],b,env,z3.And(guard,c),events,visited)
                    walk(dest[1],b,env,z3.And(guard,z3.Not(c)),events,visited)
                return
            m=re.fullmatch(r'(%[-\w.$]+) = (.*)',text)
            if not m:
                a=re.fullmatch(r'(?:tail )?call void @__VERIFIER_assert\(i32 (?:noundef )?('+V+r')\)(?: #\d+)?',text)
                require(a is not None,'unconsumed LLVM '+text)
                events.append(event('O',eid,fields={'condition':val(a[1],32)!=0}));continue
            dst,op=m.groups();require(dst not in env,'duplicate SSA definition')
            if ' asm sideeffect ' in ' '+op:
                f=llvm_site(module,interface,checked_line_index=idx)
                pointer=unique([v for k,v in f['bindings'].items() if k.startswith('p')],'memory input')
                value=unique([v for k,v in f['bindings'].items() if not k.startswith('p')],'scalar input')
                require(not f['llvm_entry_conditions'],'LLVM range condition requires proof')
                es,v=faa(eid,val(pointer,64),val(value,32));events.extend(es)
            elif op.startswith('phi '):
                ph=re.fullmatch(r'phi i(1|32) (.*)',op);require(ph is not None,'phi type')
                pairs=re.findall(r'\[ ('+V+r'), %([-\w.$]+) \]',ph[2])
                require(', '.join('[ '+a+', %'+bb+' ]' for a,bb in pairs)==ph[2], 'phi complete parse')
                require(len({bb for _,bb in pairs})==len(pairs) and {bb for _,bb in pairs}=={x for x,ds in edges.items() if b in ds},'phi incoming edge coverage')
                v=val(unique([a for a,bb in pairs if bb==pred],'actual phi predecessor'),int(ph[1]))
            elif op.startswith('load '):
                ld=re.fullmatch(r'load i(32|64), ptr ('+V+r'), align (\d+)',op);require(ld is not None,'LLVM load grammar')
                require(int(ld[3])>=int(ld[1])//8,'load alignment')
                e=read_event(eid,val(ld[2],64),int(ld[1]));events.append(e);v=e['response']
            elif op.startswith('atomicrmw '):
                a=re.fullmatch(r'atomicrmw add (?:ptr|i32\*) ('+V+r'), i32 ('+V+r') (monotonic|seq_cst)(?:, align (\d+))?',op)
                require(a is not None,'LLVM atomic operation/order')
                es,v=faa(eid,val(a[1],64),val(a[2],32));events.extend(es)
            elif op.startswith('icmp '):
                a=re.fullmatch(r'icmp (eq|ne) i(1|32|64) ('+V+r'), ('+V+r')',op);require(a is not None,'LLVM comparison')
                c=val(a[3],int(a[2]))==val(a[4],int(a[2]));v=z3.If(c if a[1]=='eq' else z3.Not(c),z3.BitVecVal(1,1),z3.BitVecVal(0,1))
            elif op.startswith('zext '):
                a=re.fullmatch(r'zext i1 ('+V+r') to i32',op);require(a is not None,'LLVM extension');v=z3.ZeroExt(31,val(a[1],1))
            elif op.startswith('select '):
                a=re.fullmatch(r'select i1 ('+V+r'), i32 ('+V+r'), i32 ('+V+r')',op);require(a is not None,'LLVM select')
                v=z3.If(truth(val(a[1],1)),val(a[2],32),val(a[3],32))
            else:
                a=re.fullmatch(r'(add|sub|and|or|xor) i(1|32) ('+V+r'), ('+V+r')',op);require(a is not None,'unsupported LLVM expression '+op)
                x,y=val(a[3],int(a[2])),val(a[4],int(a[2]))
                v={'add':lambda:x+y,'sub':lambda:x-y,'and':lambda:x&y,'or':lambda:x|y,'xor':lambda:x^y}[a[1]]()
            env[dst]=v
    walk(entry,None,{formal:z3.BitVecVal(0,64) if argument=='null' else obj(argument)},z3.BoolVal(True),[],[])
    return results

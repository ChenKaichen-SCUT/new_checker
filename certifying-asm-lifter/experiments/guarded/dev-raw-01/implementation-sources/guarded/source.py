"""Complete finite AST interpretation for the declared direct GNU subset."""
import copy
import json
import re
import z3
from certification.interface import source_interface, sha
from certification.provenance import require, unique, children, single, unsigned, pointer, call_arguments, same_type
from certification.p0_host import source_main, llvm_main, Obligations
from certification.p1_entry import obj
from certification.evidence import save_certificate
from frontend.gnu import parse
from guarded.model import event, read_event, faa, truth, LIMIT


def load(capture, out):
    receipt = json.loads((capture/'compiler-receipt.json').read_bytes())
    require(receipt['result'] == 'SAME_INVOCATION_DIRECT_CAPTURED' and 'clang version 21.1.8' in receipt['compiler_version'], 'same invocation capture')
    require(receipt['compiler_binary_sha256']=='412bbe8c60571a1eb06f48fde89635033621caeb01a9b4ee76d46711bae8e932','pinned Clang binary')
    for name, h in receipt['artifacts'].items():
        require(sha((capture/name).read_bytes()) == h, 'capture bytes')
    obs = json.loads((capture/'observer.json').read_bytes())
    raw = json.loads((capture/'observer.json.ast.json').read_bytes())
    module = (capture/'source.ll').read_text(encoding='utf-8')
    mapping=unique([s[len('-fdebug-prefix-map='):] for s in receipt['flags'] if s.startswith('-fdebug-prefix-map=')],'actual debug prefix flag')
    before,after=mapping.split('=',1)
    require(receipt['command'][-2]=='-o','actual compiler output command')
    receipt={**receipt,'debug_prefix':{'from':before,'to':after},'source_path':receipt['command'][-3]}
    interface = source_interface((capture/'source.c').read_bytes(), raw)
    block = parse(interface['normalized'], interface['width'])
    require(interface['width'] == 32 and len(block.instructions) == 1 and block.instructions[0].startswith('lock xaddl '), 'existing FAA32 only')
    functions = {f['id']: f for f in obs['functions']}
    require(len(functions) == len(obs['functions']), 'unique function definitions')
    main = unique([f for f in functions.values() if f['name']=='main'], 'main')
    symbols = {s['id']: s for s in obs['symbols']}
    targets = set()
    for s in children(main['body']):
        if s['kind']=='CallExpr' and symbols[s['callee']]['name']=='pthread_create':
            a = call_arguments(s, s['callee'])[2]
            require(a.get('cast')=='FunctionToPointerDecay', 'direct worker address')
            targets.add(functions[single(a)['decl']]['name'])
    # Explicit and implicit NullToPointer of literal zero denote the same
    # pointer under the pinned ABI. This is a checked AST interpretation rule,
    # never a change to captured C/AST/LLVM bytes or a new compiler assumption.
    view=copy.deepcopy(obs); null_rules=[]
    def null_view(n):
        if isinstance(n,dict):
            if n.get('kind')=='CStyleCastExpr' and n.get('cast')=='NullToPointer':
                c=single(n)
                require(c['kind']=='IntegerLiteral' and int(c['value'])==0 and n['type'].get('pointer') and n['type'].get('bits')==64,'defined explicit null conversion')
                null_rules.append(n['begin']['raw']);n['kind']='ImplicitCastExpr'
            for v in n.values():null_view(v)
        elif isinstance(n,list):
            for v in n:null_view(v)
    null_view(view)
    objects, ops = source_main(view, receipt, raw, targets, typed_entry=True)
    report = {}
    try:
        llvm_main(module, ops, objects, Obligations(report))
        report.update(result='ORIGINAL_MAIN_LLVM_EXACT', explicit_null_interpretations=null_rules)
    finally:
        save_certificate(out/'main-llvm',report)
    globals_ = {g['id']: g for g in obs['globals']}
    asm_def = unique([f for f in functions.values() if any(s['kind']=='GCCAsmStmt' for s in children(f['body']))], 'single asm definition')
    require(set(functions) == {main['id'], asm_def['id']} | {f['id'] for f in functions.values() if f['name'] in targets}, 'unaccounted definition')
    acts=[]
    for ci, op in enumerate(o for o in ops if o['kind']=='create'):
        worker=unique([f for f in functions.values() if f['name']==op['target']], 'worker')
        require(len(worker['parameters'])==1 and worker['parameters'][0]['type']['canonical']=='void *', 'worker parameter')
        argument = z3.BitVecVal(0,64) if op['argument']=='null' else obj(op['argument'])
        paths = interpret(worker, {worker['parameters'][0]['id']: argument}, globals_, objects, functions, symbols,
                          asm_def, interface, 'S'+str(ci))
        require(all(p['returned'] and z3.is_true(z3.simplify(p['return']==0)) for p in paths), 'worker terminal null return')
        acts.append({'create_index':ci,'worker':worker['name'],'argument':op['argument'],'paths':paths})
    reads={e['fields']['address'].sexpr() for a in acts for p in a['paths'] for e in p['events'] if e['kind']=='R' and 'A' not in e['tags']}
    writes={e['fields']['address'].sexpr() for a in acts for p in a['paths'] for e in p['events'] if e['kind']=='W'}
    require(not reads&writes,'mixed ordinary C/asm conflict')
    return {'activations':acts,'objects':objects,'main_ops':ops,'module':module,'interface':interface,'receipt':receipt}


def interpret(function, env, globals_, objects, functions, symbols, asm_def, interface, prefix):
    def identity(n): return prefix+':'+str(n['begin']['expansion']['offset'])
    def address(v, width):
        require(any(z3.eq(v,obj('@'+name)) and o['width']==width for name,o in objects.items()), 'valid whole object / no unknown alias')
        return v
    def expr(n, s):
        k=n['kind']; cs=children(n); ty=n.get('type',{})
        require(ty.get('qualifiers',0)==0,'qualified expression')
        if k=='ParenExpr': return expr(single(n),s)
        if k=='IntegerLiteral':
            require(ty.get('bits')==32 and 0<=int(n['value'])<2**32,'integer literal range')
            return z3.BitVecVal(int(n['value']),32)
        if k in {'ImplicitCastExpr','CStyleCastExpr'}:
            cast=n['cast']; c=single(n)
            if cast=='LValueToRValue':
                if c['kind']=='DeclRefExpr' and c['decl'] not in globals_:
                    require(c['decl'] in s['env'] and s['env'][c['decl']] is not None, 'undefined source local')
                    return s['env'][c['decl']]
                a = obj('@'+globals_[c['decl']]['name']) if c['kind']=='DeclRefExpr' else expr(single(c),s) if c['kind']=='UnaryOperator' and c['opcode']=='*' else None
                require(a is not None and unsigned(ty) and ty['bits']==32,'ordinary read grammar/type')
                e=read_event(identity(n),address(a,32)); s['events'].append(e); return e['response']
            v=expr(c,s)
            if cast=='BitCast':
                require(ty.get('pointer') and c['type'].get('pointer') and ty.get('bits')==64 and v.size()==64, 'pointer preserving cast')
                return v
            if cast=='NullToPointer':
                require(z3.is_true(z3.simplify(v==0)) and ty.get('pointer'), 'null cast')
                return z3.BitVecVal(0,64)
            if cast=='IntegralCast':
                require(v.size()==ty.get('bits')==32,'same-width C integral conversion')
                return v
            raise ValueError('unsupported C cast '+cast)
        if k=='DeclRefExpr':
            require(n['decl'] in s['env'] and s['env'][n['decl']] is not None,'undefined C declaration')
            return s['env'][n['decl']]
        if k=='UnaryOperator' and n['opcode']=='&':
            c=single(n); require(c['kind']=='DeclRefExpr' and c['decl'] in globals_,'address of complete global')
            return obj('@'+globals_[c['decl']]['name'])
        if k=='BinaryOperator':
            require(len(cs)==2,'binary arity')
            a,b=[expr(c,s) for c in cs]; require(a.sort()==b.sort(),'C operand types')
            op=n['opcode']
            if op in {'==','!='}: return z3.If(a==b if op=='==' else a!=b,z3.BitVecVal(1,32),z3.BitVecVal(0,32))
            require(unsigned(ty) and ty['bits']==32 and op in {'+','-','&','|','^'},'only total unsigned arithmetic')
            return {'+':lambda:a+b,'-':lambda:a-b,'&':lambda:a&b,'|':lambda:a|b,'^':lambda:a^b}[op]()
        if k=='CallExpr':
            require(n['callee']==asm_def['id'] and function['id']!=asm_def['id'],'one-level checked FAA helper')
            args=call_arguments(n,n['callee']); ps=asm_def['parameters']
            require(len(ps)==len(args)==2 and all(same_type(p['type'],a['type']) for p,a in zip(ps,args)), 'typed substitution')
            vals=[expr(a,s) for a in args]
            sub=interpret(asm_def,dict(zip([p['id'] for p in ps],vals)),globals_,objects,functions,symbols,asm_def,interface,identity(n))
            require(len(sub)==1 and sub[0]['returned'] and z3.is_true(z3.simplify(sub[0]['guard'])),'helper complete straight-line body')
            s['events'].extend(sub[0]['events']); return sub[0]['return']
        raise ValueError('unsupported source expression '+k)
    def statement(n,s):
        require(not s['returned'],'source statements after return')
        k=n['kind']; s['visited'].append(identity(n))
        if k=='CompoundStmt':
            states=[s]
            for child in children(n):
                states=[v for st in states for v in statement(child,st)]
                require(len(states)<=LIMIT,'C path budget')
            return states
        if k=='IfStmt':
            cs=children(n); require(len(cs) in {2,3},'if full child census')
            cond=truth(expr(cs[0],s)); results=[]
            for positive in [True,False]:
                st=copy.deepcopy(s); st['guard']=z3.And(st['guard'],cond if positive else z3.Not(cond))
                results+=statement(cs[1],st) if positive else statement(cs[2],st) if len(cs)==3 else [st]
            return results
        if k=='DeclStmt':
            ds=n.get('declarations',[]); require(ds and children(n)==[d['init'] for d in ds if d['init'] is not None],'declaration initializer census')
            for d in ds:
                require(d['id'] not in s['env'] and (unsigned(d['type']) or pointer(d['type'])),'local type/freshness')
                v=expr(d['init'],s) if d['init'] else None
                require(v is None or v.size()==d['type']['bits'],'declaration width')
                s['env'][d['id']]=v
        elif k=='BinaryOperator' and n['opcode']=='=':
            a,b=children(n); require(a['kind']=='DeclRefExpr' and a['decl'] in s['env'] and unsigned(a['type']),'local scalar assignment only')
            v=expr(b,s); require(v.size()==a['type']['bits']==32,'assignment type'); s['env'][a['decl']]=v
        elif k=='GCCAsmStmt':
            require(len(children(n))==2,'asm operand count')
            reg=children(n)[interface['register_output']]; mem=children(n)[1-interface['register_output']]
            require(reg['kind']=='DeclRefExpr' and mem['kind']=='UnaryOperator' and mem['opcode']=='*','asm actual lvalues')
            delta=expr(reg,s); ptr=expr(single(mem),s); address(ptr,32)
            es,ret=faa(identity(n),ptr,delta); s['events'].extend(es); s['env'][reg['decl']]=ret
        elif k=='CallExpr':
            require(symbols[n['callee']]['name']=='__VERIFIER_assert' and symbols[n['callee']]['type']['canonical']=='void (int)','only assertion statement')
            a=unique(call_arguments(n,n['callee']),'assert argument')
            s['events'].append(event('O',identity(n),fields={'condition':truth(expr(a,s))}))
        elif k=='ReturnStmt':
            s['return']=expr(single(n),s); s['returned']=True
        else: raise ValueError('unconsumed source statement '+k)
        return [s]
    return statement(function['body'],{'env':dict(env),'guard':z3.BoolVal(True),'events':[],'visited':[],'returned':False})

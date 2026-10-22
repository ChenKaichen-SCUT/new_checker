"""Paired DSL-only budgets, including preprocessing, failures and validation."""
import argparse
import json
import random
import subprocess
import sys
import time
import traceback
from pathlib import Path
from semantic_testing.dsl import digest
from semantic_testing.run import load,save,memory
from semantic_testing.features import syntax_features
from .grammar import decode,random_choices
from .encode import synthesize
from .check import evaluate,accept_synthesis,grammar_membership


def worker(config, output, deadline):
    start,cpu = time.perf_counter(),time.process_time()
    output=Path(output); cfg=load(config); d=cfg['domain']; m=cfg['manifest']; seed=cfg['seed']; strategy=cfg['strategy']
    rng=random.Random(seed); goals=list(m['targets']); rng.shuffle(goals)
    seen,seen_rel,covered,selected,attempts,syntax = set(),set(),set(),[],[],set()
    unavailable=set(); cursor=0; features=set()
    def dump():
        save(output/'progress.json',dict(attempts=attempts,selected=selected,covered=sorted(covered),
            wall_seconds=time.perf_counter()-start,cpu_seconds=time.process_time()-cpu,peak_bytes=memory()))
    def done():
        attempt_limit=m.get('time_max_attempts',m['max_attempts']) if cfg['mode']['outputs'] is None else m['max_attempts']
        return time.perf_counter() >= deadline or (attempt_limit is not None and len(attempts) >= attempt_limit) or (cfg['mode']['outputs'] is not None and len(selected) >= cfg['mode']['outputs'])
    def selection_done():
        return time.perf_counter() >= deadline or (cfg['mode']['outputs'] is not None and len(selected) >= cfg['mode']['outputs'])
    def candidate(p=None,goal=None):
        idx=len(attempts); dest=output/f'a{idx:03d}'
        row=dict(index=idx,status='STARTED',started_elapsed=time.perf_counter()-start)
        attempts.append(row); dump()
        try:
            if goal:
                sr=synthesize(d,[dict(pattern=goal)],dest,min(m['synthesis_seconds'],max(.001,deadline-time.perf_counter())),seed+idx)
                row.update(goal=goal['name'],synthesis_status=sr['status'],synthesis_queries=sr['queries'])
                if sr['status'] != 'SAT_CANDIDATE':
                    row['status']=sr['status']
                    if sr['status'] == 'BOUNDED_UNSAT': unavailable.add(goal['name'])
                    dump(); return None
                p=load(dest/'program.json')
            else: dest.mkdir()
            grammar_membership(p,d)
            sha=digest(p); row['program_sha256']=sha
            if sha in seen:
                row['status']='DUPLICATE_PROGRAM'; save(dest/'duplicate-program.json',p); dump(); return None
            seen.add(sha)
            result=accept_synthesis(dest,m['targets']) if goal else evaluate(p,dest/'oracle',m['targets'])
            row.update(status=result['status'],graphs=result['graphs'],observations=result['observations'],oracle_queries=result['queries'],
                       completed_elapsed=time.perf_counter()-start,deadline_eligible=time.perf_counter() <= deadline)
            if result['status'] != 'EXACT_INDEPENDENT': dump(); return None
            row['hits']=list(result['hits']); f=result['features']
            key=digest([f['objective'],f['heldout_three']]); row['relation_key']=key
            dump(); return dict(index=idx,result=result,p=p,key=key)
        except Exception as e:
            row.update(status='INTERNAL_ERROR',reason=repr(e)); dest.mkdir(exist_ok=True)
            (dest/'worker-failure.log').write_text(traceback.format_exc(),encoding='utf-8'); dump(); return None
    def choose(c):
        if c is None or time.perf_counter() > deadline: return
        if c['key'] in seen_rel:
            attempts[c['index']]['selection']='DUPLICATE_RELATION_SET'; dump(); return
        seen_rel.add(c['key']); r=c['result']; selected.append(dict(index=c['index'],selected_elapsed=time.perf_counter()-start))
        covered.update(r['hits']); features.update(r['features']['objective']); syntax.update(syntax_features(c['p'])); dump()
    dump()
    while not done():
        if strategy == 'inverse':
            possible=[g for g in goals if g['name'] not in unavailable and g['name'] not in covered]
            if not possible: possible=[g for g in goals if g['name'] not in unavailable]
            if not possible: break
            goal=possible[cursor%len(possible)]; cursor+=1; choose(candidate(goal=goal))
        elif strategy == 'random':
            p=decode(d,random_choices(d,rng)); choose(candidate(p))
        else:
            batch=[decode(d,random_choices(d,rng)) for _ in range(m['pool_size'])]
            save(output/f'batch-{len(attempts):03d}.json',batch)
            if strategy == 'syntax':
                while batch and not done():
                    p=max(batch,key=lambda p:len(set(syntax_features(p))-syntax)); batch.remove(p)
                    choose(candidate(p))
            else:
                complete=[]; failed=False
                for p in batch:
                    if done(): failed=True; break
                    c=candidate(p)
                    if c is None: failed=True
                    else: complete.append(c)
                # A partial precomputed pool cannot masquerade as complete.
                if failed:
                    save(output/f'incomplete-pool-{len(attempts):03d}.json',dict(completed=[c['index'] for c in complete]))
                    continue
                while complete and not selection_done():
                    c=max(complete,key=lambda c:(len(set(c['result']['hits'])-covered),len(set(c['result']['features']['objective'])-features)))
                    complete.remove(c); choose(c)
    dump()
    save(output/'worker-complete.json',dict(status='BUDGET_STOP',wall_seconds=time.perf_counter()-start,cpu_seconds=time.process_time()-cpu))


def process_rss(pid):
    if sys.platform != 'win32':
        try: return int(Path(f'/proc/{pid}/status').read_text().split('VmRSS:')[1].split()[0])*1024
        except (OSError,IndexError): return 0
    import ctypes
    from ctypes import wintypes
    class Counters(ctypes.Structure):
        _fields_=[('cb',wintypes.DWORD),('faults',wintypes.DWORD)]+[(x,ctypes.c_size_t) for x in ('peak','working','peakPaged','paged','peakNonPaged','nonPaged','pagefile','peakPagefile')]
    kernel=ctypes.WinDLL('kernel32'); kernel.OpenProcess.restype=wintypes.HANDLE
    kernel.OpenProcess.argtypes=[wintypes.DWORD,wintypes.BOOL,wintypes.DWORD]
    kernel.CloseHandle.argtypes=[wintypes.HANDLE]
    h=kernel.OpenProcess(0x410,False,pid)
    if not h: return 0
    c=Counters(); c.cb=ctypes.sizeof(c)
    get=ctypes.WinDLL('psapi').GetProcessMemoryInfo; get.argtypes=[wintypes.HANDLE,ctypes.POINTER(Counters),wintypes.DWORD]
    ok=get(h,ctypes.byref(c),c.cb); kernel.CloseHandle(h)
    return c.peak if ok else 0


def campaign(manifest,output):
    root=Path(output); root.mkdir(parents=True,exist_ok=False); m=load(manifest); rows=[]
    configs=[]
    for d in m['domains']:
        for seed in m['seeds']:
            for mode in m['modes']:
                order=list(m['strategies']); random.Random(seed+100*d['threads']+(1 if mode['outputs'] else 2)).shuffle(order)
                for strategy in order: configs.append(dict(domain=d,seed=seed,mode=mode,strategy=strategy,manifest=m))
    save(root/'schedule.json',configs)
    for cfg in configs:
        name=f"t{cfg['domain']['threads']}-{cfg['seed']}-{cfg['mode']['name']}-{cfg['strategy']}"
        out=root/name; out.mkdir(); save(out/'config.json',cfg)
        start=time.perf_counter(); deadline=start+cfg['mode']['seconds']; peak=0; stop=None
        with (out/'process.log').open('w',encoding='utf-8') as log:
            proc=subprocess.Popen([sys.executable,'-m','relation_synthesis.benchmark','worker','--config',str(out/'config.json'),'--output',str(out),'--deadline',str(deadline)],stdout=log,stderr=subprocess.STDOUT)
            while proc.poll() is None:
                peak=max(peak,process_rss(proc.pid))
                if peak > m['process_memory_bytes']: stop='MEMORY_LIMIT'
                if time.perf_counter() > deadline+m['hard_grace_seconds']: stop='HARD_TIME_LIMIT'
                if stop: proc.kill(); proc.wait(); break
                time.sleep(.05)
        row=dict(name=name,threads=cfg['domain']['threads'],seed=cfg['seed'],mode=cfg['mode']['name'],strategy=cfg['strategy'],
                 exit_code=proc.returncode,stop_reason=stop,wall_seconds=time.perf_counter()-start,peak_bytes=peak,
                 evidence_bytes=sum(f.stat().st_size for f in out.rglob('*') if f.is_file()))
        save(out/'parent-resource.json',row); rows.append(row); save(root/'progress.json',rows)
        print(name,row['exit_code'],round(row['wall_seconds'],3),flush=True)
    save(root/'runs.json',rows)


if __name__ == '__main__':
    ap=argparse.ArgumentParser(); ap.add_argument('command',choices=['worker','campaign']); ap.add_argument('--output',required=True)
    ap.add_argument('--manifest'); ap.add_argument('--config'); ap.add_argument('--deadline',type=float)
    a=ap.parse_args()
    if a.command == 'worker': worker(a.config,a.output,a.deadline)
    else: campaign(a.manifest,a.output)

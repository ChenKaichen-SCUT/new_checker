"""Publication replay. All accepted artifacts are rebuilt, never merely trusted."""
import time
import traceback
from pathlib import Path
from semantic_testing.run import load,save
from semantic_testing.dsl import require,canonical
from semantic_testing.audit import check_case
from semantic_testing.witness import verify
from .check import replay,grammar_membership
from .patterns import matches


def run(root,output):
    root=Path(root); start=time.perf_counter(); rows=[]; failures=[]
    for f in sorted(root.rglob('synthesis.json')):
        directory=f.parent
        try:
            r=replay(directory); rows.append(dict(kind='synthesis',path=str(directory.relative_to(root)),result=r))
        except Exception as e: failures.append(dict(path=str(directory),error=repr(e),trace=traceback.format_exc()))
    for f in sorted(root.rglob('evaluation.json')):
        directory=f.parent
        try:
            ev=load(f)
            if ev['status']!='EXACT_INDEPENDENT':
                rows.append(dict(kind='incomplete',path=str(directory.relative_to(root)),status=ev['status'])); continue
            result=check_case(directory)
            p=load(directory/'input.json'); r=load(directory/'result.json')
            cfg=directory.parent.parent/'config.json'
            if cfg.exists():
                config=load(cfg); grammar_membership(p,config['domain']); targets=config['manifest']['targets']
            else:
                from .patterns import targets as definitions
                targets=definitions()
            hits={}
            for i,cert in enumerate(r['graphs']):
                g=verify(p,cert)
                for t in targets:
                    if t['name'] not in hits:
                        embedding=matches(g,t)
                        if embedding is not None: hits[t['name']]=dict(graph=i,embedding=embedding)
            require(canonical(hits)==canonical(ev['hits']),'AUDIT_FULL_TARGET_SET')
            rows.append(dict(kind='oracle',path=str(directory.relative_to(root)),result=result))
        except Exception as e: failures.append(dict(path=str(directory),error=repr(e),trace=traceback.format_exc()))
        if len(rows)%20==0: print('replayed',len(rows),'failures',len(failures),flush=True)
        save(output,dict(status='RUNNING',rows=rows,failures=failures,seconds=time.perf_counter()-start))
    final=dict(status='VERIFIED' if not failures else 'REJECTED',rows=rows,failures=failures,seconds=time.perf_counter()-start)
    save(output,final)
    return final


if __name__=='__main__':
    import sys
    if run(sys.argv[1],sys.argv[2])['status']!='VERIFIED': raise SystemExit(1)

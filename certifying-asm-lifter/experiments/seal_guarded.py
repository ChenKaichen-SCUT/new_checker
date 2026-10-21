"""Static baseline byte protection, scoped delivery manifest and provenance seal."""
import ast
import hashlib
import json
from pathlib import Path
import re
import subprocess

ROOT=Path(__file__).resolve().parents[1];REPO=ROOT.parent;PREFIX=ROOT.name+'/'
BASE='ebbe82856ea15e31b6ff5da352ee9ae51e0b08b9'
THEOREM='8f4f91dc9a4002563389609879a653512ae7d687ac38c4bae164146c55d9d596'
EVIDENCE=ROOT/'experiments/guarded';DOCS=ROOT/'docs/guarded'
ALLOWED={'AGENTS.md','README.md'}|{PREFIX+n for n in ['README.md','docs/00-progress.md','artifact-manifest.json']}
SCRIPTS={'experiments/'+n+'.py' for n in ['capture_guarded','run_guarded_faults','accept_guarded','compare_guarded','review_guarded','seal_guarded']}
SCRIPTS|={'tests/test_guarded.py','benchmarks/guarded-merge.c','benchmarks/guarded-conditional.c'}


def require(v,s):
    if not v:raise RuntimeError(s)


def git(*a):return subprocess.check_output(['git',*a],cwd=REPO)
def sha(b):return hashlib.sha256(b).hexdigest()
def read(p):return json.loads(p.read_bytes())
def save(p,v):p.write_bytes((json.dumps(v,ensure_ascii=False,indent=2)+'\n').encode())
def names():return sorted(set(filter(None,git('ls-files','--cached','--others','--exclude-standard','-z').decode('utf-8').split('\0'))))
def scoped(n):return n in {PREFIX+p for p in SCRIPTS} or any(n.startswith(PREFIX+p) for p in ['guarded/','docs/guarded/','experiments/guarded/'])


def entries(ns):
    rows=[]
    for n in ns:
        b=(REPO/n).read_bytes();require(len(b)<100_000_000,'oversize '+n)
        rows.append({'path':n[len(PREFIX):],'sha256':sha(b),'bytes':len(b)})
    return rows


def main():
    old_names=set();protected=[]
    for row in git('ls-tree','-r','-z',BASE).split(b'\0'):
        if not row:continue
        header,n=row.split(b'\t',1);_,kind,h=header.split();n=n.decode('utf-8');old_names.add(n)
        p=REPO/n;require(kind==b'blob' and p.is_file(),'missing baseline '+n)
        if n not in ALLOWED:
            b=p.read_bytes();require(hashlib.sha1(b'blob '+str(len(b)).encode()+b'\0'+b).hexdigest()==h.decode(),'baseline modified '+n)
            protected.append(n)
    require(all(scoped(n) for n in set(names())-old_names),'out-of-scope additions')
    previous_raw=git('show',BASE+':'+PREFIX+'artifact-manifest.json');previous=json.loads(previous_raw)
    history=[r for r in previous['files'] if r['path'].startswith('experiments/')]
    for r in history:require(sha((ROOT/r['path']).read_bytes())==r['sha256'],'historical evidence drift')
    require(sha((ROOT/'docs/system-review/01-end-to-end-guarantee.md').read_bytes())==THEOREM,'E2E theorem')
    tree=ast.parse((ROOT/'experiments/certify_p0.py').read_text(encoding='utf-8'))
    gamma=next(ast.literal_eval(n.value) for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='GAMMA' for t in n.targets))
    require(len(gamma)==8,'eight original Gamma')
    for n in names():
        if scoped(n) and n.endswith('.py'):ast.parse((REPO/n).read_text(encoding='utf-8'))
    review=read(EVIDENCE/'review-02/summary.json')
    require(review['result']=='BOUNDED_GUARDED_REVIEW_COMPLETE' and review['cases']==15 and review['independent_layer_claims']==88,'final review')
    require(review['new_backend_runs']==10 and len(list(EVIDENCE.rglob('before-encoding.json')))==10,'frozen backend census')
    require(review['tests']==207 and b'207 passed' in (EVIDENCE/'tests-final.stdout.log').read_bytes(),'regression')
    for name,h in read(EVIDENCE/'frozen.json')['cases'].items():require(sha((ROOT/'benchmarks'/(name+'.c')).read_bytes())==h,'frozen source changed')
    for p in (EVIDENCE/'final-02').glob('*/implementation.json'):
        for n,h in read(p).items():require(sha((ROOT/n).read_bytes())==h==sha((p.parent/'implementation-sources'/n).read_bytes()),'final code drift')
    broken=[]
    for p in [*DOCS.glob('*.md'),ROOT/'README.md',REPO/'README.md',ROOT/'docs/00-progress.md']:
        for link in re.findall(r'\[[^\]]*\]\(([^)]+)\)',p.read_text(encoding='utf-8')):
            if '://' not in link and not link.startswith('#') and not (p.parent/link.partition('#')[0]).exists():broken.append([str(p),link])
    require(not broken,'broken links '+str(broken))
    save(EVIDENCE/'integrity.json',{'result':'STATIC_INTEGRITY_CHECKED','baseline':BASE,'protected_baseline_files':len(protected),
        'historical_experiment_files_sha256_checked':len(history),'allowed_existing_updates':sorted(ALLOWED),
        'historical_exceptions':[],'old_theorems_code_evidence_unchanged':True,'original_E2E_SHA256':THEOREM,
        'original_Gamma':gamma,'new_semantic_Gamma':[],'semantic_execution_by_this_script':False,
        'added_checking_surface':'guarded/*.py under original Gamma_check; untrusted candidates not a premise',
        'final_review':review,'proof_machine_checked':False,'broken_links':broken})
    delivery=[n for n in names() if scoped(n) and n!=PREFIX+'experiments/guarded/manifest.json']
    save(EVIDENCE/'manifest.json',{'baseline':BASE,'status':'restricted guarded increment; no SAFE; novelty NO_GO; STOP',
                                  'files':entries(delivery),'sealer_sha256':sha(Path(__file__).read_bytes())})
    allfiles=[n for n in names() if n.startswith(PREFIX) and n!=PREFIX+'artifact-manifest.json']
    save(ROOT/'artifact-manifest.json',{'manifest_version':previous['manifest_version']+1,'date':'2026-10-21',
        'baseline_commit':BASE,'status':'guarded and conditional closed diagnostics; STOP for review',
        'previous_manifest_sha256':sha(previous_raw),'previous_manifest_version':previous['manifest_version'],
        'files':entries(allfiles)})
    print(json.dumps({'protected_baseline_files':len(protected),'historical_experiments':len(history),'delivery_files':len(delivery),
                      'all_project_files':len(allfiles),'broken_links':0,'semantic_execution':False}))


if __name__=='__main__':main()

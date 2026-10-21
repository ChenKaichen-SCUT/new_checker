"""Static-only seal for the completed bounded diagnostic delivery.

No project module imports or compiler/backend/SMT/test execution. Development
and failed outputs remain inventoried; final results are identified explicitly.
"""
import ast
import hashlib
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]
REPO = ROOT.parent
PREFIX = ROOT.name + '/'
BASELINE = '3c67f7b2116a3eb7f090f1807e4c2c41beeb01b6'
THEOREM = '8f4f91dc9a4002563389609879a653512ae7d687ac38c4bae164146c55d9d596'
DOCS, EVIDENCE = ROOT / 'docs/diagnostics', ROOT / 'experiments/diagnostics'
ALLOWED = {'AGENTS.md', 'README.md'} | {PREFIX + p for p in
    ('README.md', 'docs/00-progress.md', 'artifact-manifest.json')}
SCRIPTS = {'experiments/' + p for p in ('detect_semantic_difference.py', 'capture_diagnostic_direct.py',
           'run_diagnostic_acceptance.py', 'review_diagnostic_results.py', 'seal_diagnostic_review.py')}
SCRIPTS.add('tests/test_diagnostics.py')


def require(value, message):
    if not value:
        raise RuntimeError(message)


def git(*args):
    return subprocess.check_output(['git', *args], cwd=REPO)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes((json.dumps(value, ensure_ascii=False, indent=2) + '\n').encode('utf-8'))


def paths():
    return sorted(set(filter(None, git('ls-files', '--cached', '--others', '--exclude-standard', '-z').decode('utf-8').split('\0'))))


def is_new(name):
    return any(name.startswith(PREFIX + p) for p in ('docs/diagnostics/', 'experiments/diagnostics/', 'diagnostics/')) or name in {PREFIX + p for p in SCRIPTS}


def entries(names):
    rows = []
    for name in names:
        data = (REPO / name).read_bytes()
        require(len(data) < 100_000_000, 'oversized file ' + name)
        rows.append({'path': name[len(PREFIX):], 'sha256': sha(data), 'bytes': len(data)})
    return rows


def main():
    old_names, protected = set(), []
    for row in git('ls-tree', '-r', '-z', BASELINE).split(b'\0'):
        if not row:
            continue
        header, name = row.split(b'\t', 1)
        _, kind, blob = header.split()
        name = name.decode('utf-8')
        old_names.add(name)
        p = REPO / name
        require(kind == b'blob' and p.is_file(), 'missing baseline file ' + name)
        data = p.read_bytes()
        if name not in ALLOWED:
            current = hashlib.sha1(b'blob ' + str(len(data)).encode() + b'\0' + data).hexdigest()
            require(current == blob.decode(), 'baseline byte changed ' + name)
            protected.append(name)
    require(all(is_new(p) for p in set(paths()) - old_names), 'unexpected new file')
    old_raw = git('show', BASELINE + ':' + PREFIX + 'artifact-manifest.json')
    old = json.loads(old_raw)
    historical = [r for r in old['files'] if r['path'].startswith('experiments/')]
    for row in historical:
        require(sha((ROOT / row['path']).read_bytes()) == row['sha256'], 'historical experiment drift ' + row['path'])
    require(sha((ROOT / 'docs/system-review/01-end-to-end-guarantee.md').read_bytes()) == THEOREM, 'old theorem')
    tree = ast.parse((ROOT / 'experiments/certify_p0.py').read_text(encoding='utf-8'))
    gamma = next(ast.literal_eval(n.value) for n in tree.body if isinstance(n, ast.Assign)
                 and any(isinstance(t, ast.Name) and t.id == 'GAMMA' for t in n.targets))
    require(len(gamma) == 8, 'Gamma census')
    for name in SCRIPTS:
        ast.parse((ROOT / name).read_text(encoding='utf-8'))
    for p in (ROOT / 'diagnostics').glob('*.py'):
        ast.parse(p.read_text(encoding='utf-8'))
    # Actual new Q is confined to the three explicitly recorded fresh runs.
    require(len(list(EVIDENCE.rglob('before-encoding.json'))) == 3, 'unexpected fresh backend count')
    development = json.loads((EVIDENCE / 'development-01/branch/diagnostic-report.json').read_bytes())
    require(not development['program_verdict_eligible'], 'development SAFE claim')
    capture = json.loads((EVIDENCE / 'acceptance-01/capture-safe/compiler-receipt.json').read_bytes())
    require(capture['result'] == 'SAME_INVOCATION_DIRECT_CAPTURED', 'development capture inventory')
    for name, expected in capture['artifacts'].items():
        require(sha((EVIDENCE / 'acceptance-01/capture-safe' / name).read_bytes()) == expected, 'capture hash')
    error = (EVIDENCE / 'acceptance-commands-01/000.stderr.log').read_bytes()
    require(b'direct unused thread argument must be null' in error, 'failed-attempt evidence missing')
    final = json.loads((EVIDENCE / 'review-04/summary.json').read_bytes())
    require(final['result'] == 'BOUNDED_DIAGNOSTIC_EVIDENCE_REVIEWED' and final['cases'] == 13
            and final['verified_worker_claims'] == 24, 'final review')
    require(b'39 passed' in (EVIDENCE / 'unit-02.stdout.log').read_bytes(), 'unit result')
    for p in (EVIDENCE / 'final-03').glob('*/implementation.json'):
        for name, expected in json.loads(p.read_bytes()).items():
            require(sha((ROOT / name).read_bytes()) == expected, 'final code/proof drift ' + name)
            require(sha((p.parent / 'implementation-sources' / name).read_bytes()) == expected, 'snapshot drift')
    status = {'result': 'BOUNDED_PROTOTYPE_DELIVERED',
        'latest_scope': 'user reauthorized prototype/compiler/backend/SMT/targeted tests after analysis-only pause',
        'new_semantic_claims_accepted_for_delivery': ['restricted open-worker histories; no automatic L3/L4'],
        'new_program_SAFE_certificates': [], 'final_review': final,
        'development_before_scope_restriction': {'historical_Q_replay_cases': 1, 'fresh_Clang_captures': 1,
            'fresh_Dat3M_runs': 0, 'planned_acceptance_cases': 13, 'completed_acceptance_suite': False,
            'recorded_adapter_failure': 'ptr noundef null not accepted by draft text check'},
        'scope_chronology': ['prototype authorized', 'analysis-only pause obeyed', 'explicit execution reauthorization', 'bounded delivery'],
        'theory': ['total-order collapse proved', 'guarded-summary conditional inclusion design'],
        'unimplemented': ['guarded extraction and completeness', 'closed execution counterexamples', 'general full-client analysis'],
        'novelty': 'NO_GO', 'new_real_upstream_defects_established': 0}
    save(EVIDENCE / 'research-status.json', status)
    known = {(EVIDENCE / 'integrity.json').resolve(), (EVIDENCE / 'manifest.json').resolve()}
    broken = []
    for p in [*DOCS.glob('*.md'), ROOT / 'README.md', REPO / 'README.md', ROOT / 'docs/00-progress.md']:
        for target in re.findall(r'\[[^\]]*\]\(([^)]+)\)', p.read_text(encoding='utf-8')):
            if '://' in target or target.startswith('#'):
                continue
            resolved = (p.parent / target.partition('#')[0]).resolve()
            if not resolved.exists() and resolved not in known:
                broken.append([str(p), target])
    require(not broken, 'broken paths ' + str(broken))
    save(EVIDENCE / 'integrity.json', {'result': 'STATIC_INTEGRITY_CHECKED', 'baseline': BASELINE, 'date': '2026-10-21',
        'protected_baseline_files': len(protected), 'historical_experiment_files_sha256_checked': len(historical),
        'allowed_existing_updates': sorted(ALLOWED), 'historical_exceptions': [],
        'old_theorems_code_evidence_unchanged': True, 'original_E2E_SHA256': THEOREM, 'original_Gamma': gamma,
        'new_external_semantic_assumptions': [], 'new_diagnostics_code_status': 'RESTRICTED_OPEN_DIAGNOSTICS_ACCEPTED; NO_SAFE_API',
        'research_status_sha256': sha((EVIDENCE / 'research-status.json').read_bytes()), 'broken_paths': broken,
        'semantic_execution_by_this_script': False, 'proof_checked_by_this_script': False})
    delivery = [p for p in paths() if is_new(p) and p != PREFIX + 'experiments/diagnostics/manifest.json']
    save(EVIDENCE / 'manifest.json', {'baseline': BASELINE, 'status': 'bounded-diagnostic-delivery; novelty-NO_GO; STOP',
        'files': entries(delivery), 'sealing_script_sha256': sha(Path(__file__).read_bytes())})
    all_names = [p for p in paths() if p.startswith(PREFIX) and p != PREFIX + 'artifact-manifest.json']
    save(ROOT / 'artifact-manifest.json', {'manifest_version': old['manifest_version'] + 1, 'date': '2026-10-21',
        'baseline_commit': BASELINE, 'status': 'bounded-diagnostic-delivery; no-new-SAFE; novelty-NO_GO; STOP',
        'previous_manifest_sha256': sha(old_raw), 'previous_manifest_version': old['manifest_version'], 'files': entries(all_names)})
    print(json.dumps({'protected_baseline_files': len(protected), 'historical_experiments': len(historical),
        'delivery_files': len(delivery), 'all_project_files': len(all_names), 'broken_paths': 0,
        'semantic_execution': False}))


if __name__ == '__main__':
    main()

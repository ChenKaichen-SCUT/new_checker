"""Actual-object diagnostic driver. No program SAFE or closed-counterexample API."""
import argparse
import json
import re
from pathlib import Path
import z3
from certification.run_pipeline import ROOT
from certification.interface import sha
from certification.evidence import save_json
from certification.provenance import require, unique
from certification.prepare import prepare
from certification.coverage import supported_worker
from experiments.certify_composition import load_front
from experiments.certify_p0 import GAMMA
from diagnostics.objects import source_graph, q_graph, serialize, completeness
from diagnostics.matching import diagnose
from diagnostics.verify import verify
from frontend.gnu import initial_bindings, parse

BASELINE = '3c67f7b2116a3eb7f090f1807e4c2c41beeb01b6'


def read(path):
    return json.loads(Path(path).read_bytes())


def direct_front(capture, out):
    receipt = read(capture / 'compiler-receipt.json')
    require(receipt['result'] == 'SAME_INVOCATION_DIRECT_CAPTURED'
            and 'clang version 21.1.8' in receipt['compiler_version'], 'direct capture identity')
    for name, expected in receipt['artifacts'].items():
        require(sha((capture / name).read_bytes()) == expected, 'direct artifact hash')
    module = (capture / 'source.ll').read_text(encoding='utf-8')
    translation = prepare((capture / 'source.c').read_bytes(), read(capture / 'observer.json.ast.json'), module, out / 'translation')
    f = translation['interface']
    scope = supported_worker(module, f)
    block = parse(f['normalized'], f['width'])
    slots = initial_bindings(block)
    pointer = unique([k for k in slots if k.startswith('p')], 'direct memory input')
    value = unique([k for k in slots if not k.startswith('p')], 'direct scalar input')
    require(f['bindings'][pointer].startswith('@'), 'direct object')
    f.update(slots={'pointer': pointer, 'value': value}, call_context={'source_line': f['line']}, worker_definition=scope['function'])
    require(not scope['live_output'], 'direct adapter supports only the existing dead-output worker')
    activations = []
    for index, line in enumerate(scope['pthread_create_lines']):
        require(re.search(r', ptr(?: noundef)? null\)', module.splitlines()[line]),
                'direct unused thread argument must be null')
        activations.append({'create_index': index, 'worker': scope['function'], 'argument': 'null',
            'ops': [{'kind': 'asm', 'interface': f, 'pointer': f['bindings'][pointer],
                     'input': z3.BitVecVal(int(f['bindings'][value]), f['width']),
                     'value': z3.BitVec('direct-response-' + str(index), f['width'])}, {'kind': 'return'}]})
    return {'activations': activations, 'module': module, 'interfaces': [f]}, out / 'translation/candidate.ll'


def front(capture, out, direct=False):
    return direct_front(capture, out) if direct else load_front(capture, out)


def bind_actual(capture, prepared, candidate, backend_dir, route):
    b = read(backend_dir / 'backend-receipt.json')
    imported = capture / 'source.ll' if route == 'raw' else candidate
    require(b['candidate_sha256'] == sha(imported.read_bytes()), 'actual imported LLVM mismatch')
    qpath = backend_dir / 'snapshots/before-encoding.json'
    q, after = read(qpath), read(backend_dir / 'snapshots/after-encoding.json')
    require(q == after and q['run_id'] == b['run_id'], 'actual Program/run mismatch')
    if b.get('snapshots'):
        for name, expected in b['snapshots'].items():
            require(sha((backend_dir / 'snapshots' / name).read_bytes()) == expected, 'snapshot identity')
    require(b['build']['commit'] == read(ROOT / 'backend/dat3m/pins.json')['commit'], 'fixed backend')
    require(b['build']['cat_pins'] == {k: v for k, v in read(ROOT / 'backend/dat3m/pins.json')['files'].items() if k.startswith('cat/')}, 'fixed CAT')
    binding = {'baseline': BASELINE, 'source': sha((capture / 'source.c').read_bytes()),
               'capture': sha((capture / 'compiler-receipt.json').read_bytes()),
               'L': sha((capture / 'source.ll').read_bytes()), 'imported_LLVM': sha(imported.read_bytes()),
               'Q': sha(qpath.read_bytes()), 'run_id': b['run_id'], 'route': route,
               'program_verdict_eligible': False, 'backend_receipt': sha((backend_dir / 'backend-receipt.json').read_bytes())}
    return q, b, binding


def associations(q, prepared):
    main = unique([t for t in q['threads'] if t['name'] == 'main'], 'main')
    creates = [e for e in main['events'] if e['class'] == 'ThreadCreate']
    require(len(creates) == len(prepared['activations']), 'source/Q activation census')
    rows, seen = [], set()
    # This is the old finite main lifecycle contract, not the event matcher:
    # main source/LLVM creation order defines activation identity. Worker effects
    # are then matched by the new unrestricted typed candidate construction.
    for create, a in zip(creates, prepared['activations']):
        thread = unique([t for t in q['threads'] if t['id'] == create['spawned_thread']], 'spawned thread')
        require(thread['name'] == a['worker'] and thread['id'] not in seen, 'activation function/identity')
        seen.add(thread['id'])
        rows.append((a, thread))
    require({t['id'] for t in q['threads'] if t['name'] in {a['worker'] for a in prepared['activations']}} == seen,
            'extra/uncovered known worker')
    return rows


def run(capture, backend_dir, out, *, direct=False, route='lifted', origin='UNCLASSIFIED'):
    capture, backend_dir, out = [Path(p).resolve() for p in (capture, backend_dir, out)]
    out.mkdir(parents=True, exist_ok=False)
    report = {'result': 'UNSUPPORTED', 'program_verdict_eligible': False,
              'closed_program_counterexample': False, 'evidence_origin': origin,
              'original_Gamma': GAMMA, 'new_external_assumptions': [], 'route': route,
              'capture': capture.relative_to(ROOT).as_posix(), 'backend_directory': backend_dir.relative_to(ROOT).as_posix(),
              'stage_claim': 'none', 'workers': []}
    implementation = {}
    for base in ('diagnostics', 'certification', 'frontend', 'checker', 'lifter', 'semantics'):
        for p in (ROOT / base).rglob('*.py'):
            implementation[p.relative_to(ROOT).as_posix()] = sha(p.read_bytes())
    for name in ('experiments/detect_semantic_difference.py', 'docs/diagnostics/01-model-proof.md'):
        implementation[name] = sha((ROOT / name).read_bytes())
    save_json(out / 'implementation.json', implementation)
    for name in implementation:
        dst = out / 'implementation-sources' / name
        dst.parent.mkdir(parents=True, exist_ok=True)
        dst.write_bytes((ROOT / name).read_bytes())
    try:
        prepared, candidate = front(capture, out / 'producer/front', direct)
        q, backend, binding = bind_actual(capture, prepared, candidate, backend_dir, route)
        report.update(binding=binding, backend_observation=backend.get('observed_verdict'),
                      prior_local_checks='source/interface, L1 and candidate LLVM fragment checked; not a general Clang theorem')
        completeness(q)
        pairs = associations(q, prepared)
        for a, t in pairs:
            case = out / ('thread-' + str(t['id']))
            source = source_graph(a, case / 'source')
            target = q_graph(q, t, a['argument'], case / 'target')
            save_json(case / 'graphs.json', {'source': serialize(source), 'target': serialize(target)})
            claim = diagnose(source, target, case / 'diagnosis')
            report['workers'].append({'thread': t['id'], 'create_index': a['create_index'], 'result': claim['result'],
                                      'witness_kind': claim.get('witness_kind'), 'candidates': claim.get('candidates')})
        # Reopen/reconstruct raw facts, not producer-supplied endpoint JSON.
        independent, independent_candidate = front(capture, out / 'verifier/front', direct)
        rq, _, rb = bind_actual(capture, independent, independent_candidate, backend_dir, route)
        require(rb == binding, 'independent artifact drift')
        for a, t in associations(rq, independent):
            case = out / ('thread-' + str(t['id']))
            claim = read(case / 'diagnosis/certificate.json')
            s = source_graph(a, case / 'independent/source')
            target = q_graph(rq, t, a['argument'], case / 'independent/target')
            if claim['result'] in {'OPEN_HISTORY_EQUIVALENT', 'OPEN_HISTORY_DIFFERENCE'}:
                verified = verify(s, target, claim, case / 'independent/witness')
                require(verified['result'] == 'VERIFIED_OPEN_CLAIM', 'independent witness rejected: ' + verified.get('reason', ''))
            else:
                report['result'] = 'UNKNOWN'
                report['reason'] = 'at least one worker has no verified positive/negative claim'
                break
        else:
            results = {r['result'] for r in report['workers']}
            report['result'] = 'OPEN_HISTORY_DIFFERENCE' if 'OPEN_HISTORY_DIFFERENCE' in results else 'OPEN_HISTORY_EQUIVALENT'
            if report['result'] == 'OPEN_HISTORY_DIFFERENCE':
                report['stage_claim'] = ('LLVM inline-asm import to actual Q' if route == 'raw' else 'checked replacement LLVM to actual Q')
                report['location_guarantee'] = 'first proved differing observed interval; not a unique internal compiler pass/root cause'
        save_json(out / 'reproduce.json', {'module': 'experiments.detect_semantic_difference',
                  'capture': report['capture'], 'backend': report['backend_directory'], 'direct': direct, 'route': route,
                  'instruction': 'Use a fresh --out; source/candidate/Q are reopened and hash-bound; no mutation required.'})
    except Exception as error:
        reason = str(error)
        report.update(result='CAPTURE_UNKNOWN' if 'CAPTURE_INCOMPLETE' in reason else 'UNSUPPORTED', reason=reason)
        # Do not relabel a parser failure as a semantics counterexample.
    require(all(sha((ROOT / name).read_bytes()) == h for name, h in implementation.items()), 'diagnostic implementation changed during run')
    save_json(out / 'diagnostic-report.json', report)
    print(json.dumps({k: report[k] for k in ('result', 'reason', 'stage_claim', 'workers') if k in report}), flush=True)
    return report


if __name__ == '__main__':
    p = argparse.ArgumentParser()
    p.add_argument('--capture', required=True, type=Path)
    p.add_argument('--backend', required=True, type=Path)
    p.add_argument('--out', required=True, type=Path)
    p.add_argument('--direct', action='store_true')
    p.add_argument('--route', choices=['raw', 'lifted'], default='lifted')
    p.add_argument('--origin', default='UNCLASSIFIED')
    args = p.parse_args()
    run(args.capture, args.backend, args.out, direct=args.direct, route=args.route, origin=args.origin)

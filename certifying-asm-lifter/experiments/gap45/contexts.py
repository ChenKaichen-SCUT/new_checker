"""Descriptive complete static call/debug census, never an activation proof."""
import argparse
import re
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.evidence import save_json
from experiments.gap45.common import read


def walk(n):
    if isinstance(n, dict):
        yield n
        for c in n.get('children', []): yield from walk(c)


def run(out):
    out.mkdir(parents=True, exist_ok=False); base = ROOT / 'experiments/gap45'
    reg = read(base / 'registration-04/tasks.json'); source = []; llvm = []
    for t in reg['tasks']:
        for i, u in enumerate(t['units']):
            d = base / 'capture-02' / t['id'] / ('tu-' + str(i))
            if not (d / 'census.json').exists(): continue
            obs = read(d / 'observer.json'); census = read(d / 'census.json')
            funcs = {f['id']: f['name'] for f in obs['functions']}
            names = {**{s['id']: s.get('name') for s in obs['symbols']}, **funcs}
            asm_defs = {s['function'] for s in obs['sites']}
            for f in obs['functions']:
                for n in walk(f['body']):
                    if n.get('kind') == 'CallExpr':
                        source.append({'task': t['id'], 'TU': i, 'caller': f['name'], 'callee': names.get(n.get('callee')),
                                       'direct_asm_definition_call': n.get('callee') in asm_defs,
                                       'location': n.get('begin'), 'indirect_or_unresolved': n.get('callee') not in names})
            module = (d / 'source.ll').read_text()
            md = dict(re.findall(r'^!(\d+) = (.*)$', module, re.M))
            for s in census['LLVM_sites']:
                initial = re.findall(r'!dbg !(\d+)', s['llvm_call']); chain = []; seen = set()
                at = initial[0] if len(initial) == 1 else None; complete = at is not None
                while at is not None:
                    if at in seen or at not in md:
                        complete = False; break
                    seen.add(at); text = md[at]; scopes = re.findall(r'scope: !(\d+)', text)
                    chain.append({'metadata_id': at, 'location': text,
                                  'scope': [{'id': x, 'definition': md.get(x)} for x in scopes]})
                    parent = re.findall(r'inlinedAt: !(\d+)', text)
                    if len(parent) > 1: complete = False; break
                    at = parent[0] if parent else None
                llvm.append({'task': t['id'], 'TU': i, 'LLVM_site': s['id'], 'function': s['function'],
                             'debug_chain': chain, 'debug_chain_syntactically_complete': complete,
                             'semantic_call_correspondence_certified': False,
                             'note': 'debug hints only; L2 certificate separately checks admitted sites'})
    save_json(out / 'source-call-sites.json', source); save_json(out / 'LLVM-contexts.json', llvm)
    save_json(out / 'summary.json', {'source_call_occurrences': len(source), 'direct_calls_to_asm_definitions': sum(s['direct_asm_definition_call'] for s in source),
              'unresolved_call_occurrences': sum(s['indirect_or_unresolved'] for s in source), 'LLVM_sites': len(llvm),
              'complete_debug_chains': sum(s['debug_chain_syntactically_complete'] for s in llvm),
              'dynamic_activation_coverage': 'UNPROVED; loops/callbacks/environment not replaced by observed Q count'})


if __name__ == '__main__':
    p = argparse.ArgumentParser(); p.add_argument('--out', required=True, type=Path)
    run(p.parse_args().out.resolve())

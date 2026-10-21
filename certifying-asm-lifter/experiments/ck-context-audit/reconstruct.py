"""Read-only static evidence reconstruction. No compiler, solver or checker runs.

Uses the frozen lossless evidence package; the output is an audit index, NOT a
semantic certificate, capture adapter, call-graph proof or execution trace.
"""
import argparse
import csv
import gzip
import hashlib
import io
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
BASELINE = 'caed1a34dd551ba6ac1bfdf153675fb8cb13dc77'


def digest(data):
    return hashlib.sha256(data).hexdigest()


def encoded(value):
    return (json.dumps(value, ensure_ascii=False, indent=2) + '\n').encode()


class Evidence:
    def __init__(self):
        self.package = ROOT / 'experiments/gap45/published'
        self.index = json.loads((self.package / 'index.json').read_bytes())['files']
        self.used = {}

    def read(self, name):
        if name in self.index:
            meta = self.index[name]
            h = meta['sha256']
            data = gzip.decompress((self.package / 'objects' / h[:2] / (h + '.gz')).read_bytes())
            assert len(data) == meta['bytes'] and digest(data) == h, name
            storage = 'experiments/gap45/published/index.json'
        else:
            data = (ROOT / name).read_bytes()
            storage = 'tracked-file'
        self.used[name] = {'sha256': digest(data), 'bytes': len(data), 'storage': storage}
        return data

    def json(self, name):
        return json.loads(self.read(name))


def nodes(node, pointer, ancestors=()):
    if node is None:
        return
    yield node, pointer, ancestors
    for i, child in enumerate(node.get('children', [])):
        yield from nodes(child, pointer + '/children/' + str(i), ancestors + (node,))


def location(n):
    return {k: n.get('begin', {}).get(k) for k in ('expansion', 'spelling', 'chain')}


def function_facts(obs, raw):
    symbols = {s['id']: s['name'] for s in obs['symbols']}
    raw_decls = {n['id']: n for n in raw['inner'] if n.get('kind') == 'FunctionDecl'}
    raw_defs = {}
    for i, n in enumerate(raw['inner']):
        if n.get('kind') != 'FunctionDecl' or not any(c.get('kind') == 'CompoundStmt' for c in n.get('inner', [])):
            continue
        chain = [n['id']]
        while 'previousDecl' in raw_decls[chain[-1]]:
            previous = raw_decls[chain[-1]]['previousDecl']
            assert previous not in chain
            chain.append(previous)
        assert chain[-1] not in raw_defs
        raw_defs[chain[-1]] = (i, n)
    result = []
    for i, f in enumerate(obs['functions']):
        assert f['id'] in raw_defs, (f['name'], 'missing raw definition')
        ri, rf = raw_defs[f['id']]
        assert rf['name'] == f['name']
        calls, loops, declarations = [], [], []
        for n, ptr, ancestors in nodes(f['body'], f'/functions/{i}/body'):
            k = n['kind']
            fact = {'pointer': ptr, 'kind': k, 'location': location(n)}
            if k == 'CallExpr':
                fact.update(callee=symbols.get(n.get('callee')), callee_decl=n.get('callee'),
                            ancestor_kinds=[a['kind'] for a in ancestors],
                            enclosing_loops=[location(a) for a in ancestors if a['kind'] in {'ForStmt', 'WhileStmt', 'DoStmt'}])
                calls.append(fact)
            if k in {'ForStmt', 'WhileStmt', 'DoStmt'}:
                loops.append(fact)
            if k == 'DeclStmt':
                declarations.extend({'pointer': ptr + '/declarations/' + str(j),
                                     **{key: d.get(key) for key in ('id', 'name', 'type')}}
                                    for j, d in enumerate(n.get('declarations', [])))
        result.append({'name': f['name'], 'decl': f['id'], 'observer_pointer': f'/functions/{i}',
                       'raw_AST_pointer': f'/inner/{ri}', 'location': location(f['body']),
                       'parameters': f['parameters'], 'return_type': f['return_type'],
                       'calls_syntactic_not_dynamic': calls, 'loops': loops, 'locals': declarations})
    return result


def llvm_facts(text):
    """Descriptive CFG only. Never treats this lightweight parser as semantics."""
    lines = text.splitlines()
    result = {}
    for i, line in enumerate(lines):
        m = re.match(r'define .*@([^ (]+)\(', line)
        if not m:
            continue
        end = next(j for j in range(i + 1, len(lines)) if lines[j] == '}')
        # LLVM's implicit entry label is the next unnamed slot after parameters.
        args = line.split('(', 1)[1].rsplit(')', 1)[0]
        slots = [int(x) for x in re.findall(r'%(\d+)\b', args)]
        entry = str(max(slots) + 1 if slots else 0)
        blocks = {entry: []}
        b = entry
        for j in range(i + 1, end):
            lab = re.match(r'^([-\w.$]+):', lines[j])
            if lab:
                b = lab[1]; blocks[b] = []
            elif lines[j].strip():
                blocks[b].append(j + 1)
        edges = {b: re.findall(r'label %([-\w.$]+)', ' '.join(lines[j-1] for j in ns)) for b, ns in blocks.items()}
        assert all(d in blocks for ds in edges.values() for d in ds), (m[1], 'unparsed label')
        def reaches(a, target, seen):
            return a == target or (a not in seen and any(reaches(v, target, seen | {a}) for v in edges[a]))
        cyclic = [b for b in blocks if any(reaches(v, b, set()) for v in edges[b])]
        result[m[1]] = {'line_start': i + 1, 'line_end': end + 1, 'header': line,
                        'blocks': blocks, 'edges': edges, 'cyclic_blocks': cyclic,
                        'direct_calls': [{'line': j + 1, 'callee': x} for j in range(i + 1, end) if ' asm ' not in lines[j]
                                         for x in re.findall(r'\bcall\b.*?@([^ (]+)\(', lines[j])],
                        'asm_lines': [j + 1 for j in range(i + 1, end) if re.search(r'\bcall\b.*\basm\b', lines[j])]}
    return result


def debug_chain(lines, instruction):
    metadata = {m[1]: (i+1, m[2]) for i, l in enumerate(lines) if (m := re.match(r'^!(\d+) = (.*)', l))}
    d = re.search(r'!dbg !(\d+)', instruction)
    result = []; seen = set()
    while d:
        key = d[1]; assert key not in seen; seen.add(key)
        line, text = metadata[key]
        scope = re.search(r'scope: !(\d+)', text)
        result.append({'id': key, 'LLVM_line': line, 'record': text,
                       'scope_record': metadata[scope[1]][1] if scope else None})
        d = re.search(r'inlinedAt: !(\d+)', text)
    return result


def reconstruct():
    ev = Evidence(); outputs = {}
    all_sites = ev.json('experiments/gap45/summary-02/LLVM-sites.json')
    selected = [r for r in all_sites if r['L2']]
    assert len(selected) == 15 and len({(r['task'], r['TU'], r['id']) for r in selected}) == 15
    registration = ev.json('experiments/gap45/registration-04/tasks.json')
    outputs['raw/CK-LICENSE'] = ev.read('experiments/gap45/environment-final/licenses/ck/LICENSE')
    tasks = {t['id']: t for t in registration['tasks']}
    summaries = ev.json('experiments/gap45/summary-02/tasks.json')
    outputs['task-summaries.json'] = encoded([t for t in summaries if t['id'] in {r['task'] for r in selected}])
    outputs['registration.json'] = encoded({k: v for k, v in tasks.items() if k in {r['task'] for r in selected}})
    units = sorted({(r['task'], r['TU']) for r in selected} | {('ck-ec-complete', 0)})
    rows = []
    for task, tu in units:
        cap = f'experiments/gap45/capture-02/{task}/tu-{tu}'
        receipt = ev.json(cap + '/compiler-receipt.json')
        assert receipt['result'] == 'SAME_INVOCATION_NATIVE_UPSTREAM_CAPTURED'
        for filename, h in receipt['artifacts'].items():
            assert digest(ev.read(cap + '/' + filename)) == h, filename
        obs = ev.json(cap + '/observer.json'); raw = ev.json(cap + '/observer.json.ast.json')
        source = ev.read(cap + '/source.c'); module = ev.read(cap + '/source.ll')
        assert digest(source) == tasks[task]['units'][tu]['sha256']
        base = f'raw/{task}/tu-{tu}'
        outputs[base + '/source.c'] = source; outputs[base + '/source.ll'] = module
        outputs[base + '/compiler-receipt.json'] = ev.read(cap + '/compiler-receipt.json')
        for j, buf in enumerate(obs['buffers']):
            data = buf['content'].encode()
            assert len(data) == buf['bytes'] and digest(data) == buf['sha256'], buf['path']
            # Complete upstream header copies, including their license notices.
            if buf['path'].endswith(('include/ck_ec.h', 'include/gcc/x86_64/ck_pr.h', '/common.h')):
                outputs[base + '/buffers/' + str(j) + '-' + Path(buf['path']).name] = data
        fs = function_facts(obs, raw)
        lf = llvm_facts(module.decode())
        outputs[f'facts/{task}-tu{tu}.json'] = encoded({'capture': cap, 'functions': fs, 'LLVM': lf,
            'warning': 'Syntactic call inventory includes unevaluated expressions and infeasible branches; not dynamic coverage.'})
        symbols = {f['id']: f['name'] for f in obs['functions']}
        for r in [r for r in selected if r['task'] == task and r['TU'] == tu]:
            sitepath = f'experiments/gap45/sites-02/{task}/tu-{tu}'
            site = sitepath + '/' + r['id']
            result = next(s for s in ev.json(sitepath + '/result.json')['sites'] if s['id'] == r['id'])
            assert result['L1'] and result['L2'] and result['result'] == 'LLVM_SITE_EXACT'
            interface = ev.json(site + '/site/interface.json')
            assert interface['llvm_sha256'] == digest(module) == r['module_sha256']
            lines = module.decode().splitlines(); num = int(r['id'][4:])
            assert interface['llvm_line_index'] == num-1 and lines[num-1] == r['LLVM_instruction'] == interface['llvm_call'].rstrip('\n')
            assert len(r['origin_indices']) == 1
            oi = r['origin_indices'][0]; origin = obs['sites'][oi]
            assert interface['source_function_decl'] == origin['function']
            assert interface['origin']['cookies'] == origin['cookies']
            assert [o['constraint'] for o in interface['operands']] == [o['constraint'] for o in origin['operands']]
            # Read every original certificate/obligation/validation log for these
            # L2 sites, checking CAS bytes, without replaying the SMT solver.
            for name in ev.index:
                if name.startswith(site + '/'):
                    ev.read(name)
            f = lf[r['function']]
            block = next(b for b, ns in f['blocks'].items() if num in ns)
            row = dict(r, source_function=symbols[origin['function']], source_asm_location=origin['begin'],
                       source_template=origin['template'], GNU_constraints=[o['constraint'] for o in origin['operands']],
                       clobbers=origin['clobbers'], width=interface['width'], operands=interface['operands'],
                       LLVM_bindings=interface['bindings'], result_ssa=interface['result_ssa'],
                       LLVM_entry_conditions=interface['llvm_entry_conditions'],
                       LLVM_block=block, site_on_cycle=block in f['cyclic_blocks'],
                       LLVM_debug_chain=debug_chain(lines, lines[num-1]),
                       observer_site_pointer=f'/sites/{oi}', interface_evidence=site + '/site/interface.json',
                       host_evaluation=interface['host_evaluation'],
                       result_uses=[{'line': j, 'instruction': lines[j-1]} for j in range(f['line_start']+1, f['line_end'])
                                    if j != num and re.search(re.escape(interface['result_ssa']) + r'(?![\w.])', lines[j-1])])
            rows.append(row)
    outputs['sites.json'] = encoded(rows)
    out = io.StringIO(newline=''); writer = csv.writer(out, lineterminator='\n')
    writer.writerow(['task', 'TU', 'site', 'LLVM_function', 'source_function', 'width', 'template', 'constraints', 'bindings', 'result_ssa', 'site_on_cycle', 'interface_evidence'])
    for r in rows:
        writer.writerow([r['task'], r['TU'], r['id'], r['function'], r['source_function'], r['width'],
                         r['source_template'], ','.join(r['GNU_constraints']), json.dumps(r['LLVM_bindings']),
                         r['result_ssa'], r['site_on_cycle'], r['interface_evidence']])
    outputs['sites.csv'] = out.getvalue().encode()
    for name in ['guarded/source.py','guarded/llvm.py','guarded/actual.py','guarded/model.py','guarded/pipeline.py',
                 'certification/p0_host.py','docs/guarded/01-proof.md','docs/guarded/03-implementation-and-boundaries.md']:
        ev.read(name)
    outputs['inputs.json'] = encoded({'baseline': BASELINE, 'artifacts': ev.used,
                                    'mode': 'STATIC_BYTES_AND_STRUCTURE_ONLY_NO_SMT_REPLAY'})
    outputs['reconstruction.json'] = encoded({'result': 'STATIC_EVIDENCE_RECONSTRUCTED', 'sites': len(rows),
        'FAA32_sites': sum(r['width']==32 and r['source_template']=='lock xaddl %1, %0' for r in rows),
        'capture_units': len(units), 'authenticated_files': len(ev.used),
        'compiler_backend_solver_runs': 0, 'new_semantic_certificates': 0,
        'output_hashes': {p: digest(b) for p,b in sorted(outputs.items())}})
    return outputs


if __name__ == '__main__':
    ap = argparse.ArgumentParser(); ap.add_argument('--verify', action='store_true'); args = ap.parse_args()
    outputs = reconstruct(); dest = HERE / 'evidence'
    if args.verify:
        assert {p.relative_to(dest).as_posix() for p in dest.rglob('*') if p.is_file()} == set(outputs)
        for name, data in outputs.items():
            assert (dest/name).read_bytes() == data, name
        print('STATIC_RECONSTRUCTION_BYTE_IDENTICAL', len(outputs), 'files; no semantic verdict')
    else:
        assert not dest.exists(), 'refuse overwrite of an audit evidence directory'
        for name, data in outputs.items():
            p = dest/name; p.parent.mkdir(parents=True, exist_ok=True); p.write_bytes(data)
        print(outputs['reconstruction.json'].decode().split('"output_hashes"')[0])

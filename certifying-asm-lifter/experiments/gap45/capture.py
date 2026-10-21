"""Native capture/census of every pre-registered TU, without source rewriting.

No checker acceptance is inferred from census, opcode names, or compiler exit.
"""
import argparse
import concurrent.futures
import json
import os
from pathlib import Path
import re
import queue
import shlex
import shutil
import sys
from certification.run_pipeline import ROOT
from certification.evidence import save_json
from certification.interface import nodes
from certification.provenance import require
from experiments.gap45.common import digest, execute, read


def flags(command):
    args = command['args'][1:]
    result = []
    i = 0
    while i < len(args):
        s = args[i]
        if s in {'-o', '-MF', '-MT', '-MQ'}:
            i += 2; continue
        if s in {'-c', '-MD', '-MMD', '-MP', '-M', '-MM', '-S', '-emit-llvm'}:
            i += 1; continue
        if s in {'-shared', '-version-info', '-rpath'} or s.startswith('-Wl,') or (not s.startswith('-') and s.endswith(('.o', '.lo', '.a', '.la', '.so', '.c'))):
            if s in {'-version-info', '-rpath'}:
                i += 1
            i += 1; continue
        result.append(s); i += 1
    return result


def one(task, unit, out):
    out.mkdir(parents=True, exist_ok=False)
    source = Path(task['project_root']) / unit['source']
    require(digest(source) == unit['sha256'], 'registered source drift')
    cwd = Path(unit['cwd'])
    tool = ROOT / 'vendor/clang-local/root/usr'
    compiler = ['env', 'LD_LIBRARY_PATH=' + str(tool / 'lib/x86_64-linux-gnu'), str(tool / 'bin/clang-21')]
    build = read(ROOT / 'experiments/ck-provenance/observer-build-05/receipt.json')
    observer = ROOT / 'vendor/clang-observer.so'
    require(digest(observer) == build['binary_sha256'] and digest(tool / 'bin/clang-21') == build['clang_sha256'], 'unchanged tool identity')
    fs = flags(unit['command']) + ['-gline-tables-only', '-fdebug-prefix-map=/opt/actc-gap45=/cert-source']
    receipt = {'result': 'CAPTURE_FAILED', 'project': task['project'], 'commit': task['upstream_commit'],
               'source_path': str(source), 'original_command': unit['command'], 'flags': fs,
               'source_sha256': unit['sha256'], 'observer_build': build, 'compiler_binary_sha256': build['clang_sha256'],
               'debug_prefix': {'from': '/opt/actc-gap45', 'to': '/cert-source'},
               'trust': 'original Gamma_capture/front; no additional semantic assumption'}
    (out / 'source.c').write_bytes(source.read_bytes())
    shutil.copyfile(ROOT / 'frontend/clang/Observe.cpp', out / 'observer-source.cpp')
    save_json(out / 'observer-build-receipt.json', build)
    try:
        version = execute([*compiler, '--version'], out / 'version', cwd=cwd)
        require(version['exit_code'] == 0, 'compiler launch failed')
        receipt['compiler_version'] = (out / 'version/stdout.log').read_text()
        dep = execute([*compiler, *fs, '-M', '-MT', 'CERT', str(source)], out / 'dependency-command', cwd=cwd)
        require(dep['exit_code'] == 0, 'original configuration dependency capture failed')
        text = (out / 'dependency-command/stdout.log').read_text()
        require(text.startswith('CERT:'), 'dependency syntax')
        paths = [str((cwd / p).resolve()) for p in shlex.split(text.partition(':')[2].replace('\\\n', ''))]
        require(str(source) in paths and len(paths) == len(set(paths)), 'dependency completeness')
        dependencies = {}
        for i, path in enumerate(paths):
            name = 'dependencies/' + f'{i:04d}-' + Path(path).name
            dst = out / name; dst.parent.mkdir(exist_ok=True)
            dst.write_bytes(Path(path).read_bytes())
            dependencies[path] = {'file': name, 'sha256': digest(dst)}
        receipt['dependencies'] = dependencies
        args = [*compiler, *fs, '-Xclang', '-load', '-Xclang', str(observer), '-Xclang', '-plugin-arg-cert-observe',
                '-Xclang', str(out / 'observer.json'), '-S', '-emit-llvm', str(source), '-o', str(out / 'source.ll')]
        run = execute(args, out / 'compiler-command', cwd=cwd)
        receipt.update(command=args, compilation=run)
        require(run['exit_code'] == 0, 'original TU compilation failed')
        require(all(digest(p) == v['sha256'] for p, v in dependencies.items()), 'dependency drift during compilation')
        require(digest(observer) == build['binary_sha256'] and digest(source) == unit['sha256'], 'tool/source drift')
        receipt['artifacts'] = {p: digest(out / p) for p in ['source.c', 'source.ll', 'observer.json', 'observer.json.ast.json']}
        receipt['result'] = 'SAME_INVOCATION_NATIVE_UPSTREAM_CAPTURED'
        save_json(out / 'census.json', census(out, task))
    except Exception as e:
        receipt['reason'] = str(e)
    save_json(out / 'compiler-receipt.json', receipt)
    return receipt


def census(directory, task):
    obs = read(directory / 'observer.json'); raw = read(directory / 'observer.json.ast.json')
    module = (directory / 'source.ll').read_text()
    require(sum(n.get('kind') == 'GCCAsmStmt' for n in nodes(raw)) == len(obs['sites']), 'whole AST observer census')
    buffers = {b['file_id']: b for b in obs['buffers']}
    require(len(buffers) == len(obs['buffers']), 'duplicate buffer')
    sources = []
    for i, s in enumerate(obs['sites']):
        loc = s['begin']
        sources.append({'index': i, 'function_decl': s['function'], 'template': s['template'],
                        'cookies': s['cookies'], 'begin': loc, 'empty': not s['template'].strip(),
                        'key': {'spelling': loc.get('spelling'), 'expansion': loc.get('expansion')}})
    metadata = dict(re.findall(r'^!(\d+) = !\{([^\n]*)\}', module, re.M))
    calls = []; function = None
    for i, line in enumerate(module.splitlines()):
        if line.startswith('define '):
            m = re.search(r'@([^ (]+)', line); function = m[1] if m else None
        if not re.search(r'\b(call|invoke|callbr)\b.*\basm\b', line):
            continue
        md = re.findall(r'!srcloc !(\d+)', line)
        cookies = [int(x) for x in re.findall(r'i(?:32|64) (\d+)', metadata.get(md[0], ''))] if len(md) == 1 else []
        origins = [s['index'] for s in sources if s['cookies'] == cookies] if cookies else []
        template = sources[origins[0]]['template'] if len(origins) == 1 else None
        calls.append({'id': 'line' + str(i + 1), 'llvm_line_index': i, 'function': function, 'llvm_call': line,
                      'cookies': cookies, 'origin_indices': origins, 'template': template,
                      'family_candidate': bool(template is not None and re.search(r'\b(?:xadd|xchg|cmpxchg)[bwlq]?\b', template)),
                      'empty': template is not None and not template.strip(),
                      'static_context': {'llvm_function': function, 'debug_attachment': re.findall(r'!dbg !(\d+)', line)}})
    kinds = [n.get('kind') for n in nodes(raw)]
    return {'source_asm_occurrences': len(sources), 'source_sites': sources, 'LLVM_sites': calls,
            'LLVM_sha256': digest(directory / 'source.ll'), 'source_syntactic_obstacles': {
                k: kinds.count(k) for k in ['ForStmt', 'WhileStmt', 'DoStmt', 'IndirectGotoStmt', 'GCCAsmStmt', 'MSAsmStmt', 'FileScopeAsmDecl']},
            'dynamic_instances': None, 'dynamic_instance_status': 'NOT_INFERRED_FROM_STATIC_OR_OBSERVED_COUNTS',
            'functions': [{'id': f['id'], 'name': f['name']} for f in obs['functions']],
            'task': task['id'], 'no_certification_claim': True}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--registration', type=Path, required=True)
    ap.add_argument('--out', type=Path, required=True)
    ap.add_argument('--task')
    a = ap.parse_args(); reg = read(a.registration); out = a.out.resolve()
    if a.task:
        task = next(t for t in reg['tasks'] if t['id'] == a.task)
        rows = []
        for i, unit in enumerate(task['units']):
            r = one(task, unit, out / task['id'] / ('tu-' + str(i)))
            rows.append({'unit': i, 'source': unit['source'], 'result': r['result'], 'reason': r.get('reason')})
        save_json(out / task['id'] / 'result.json', rows)
        return
    out.mkdir(parents=True, exist_ok=False)
    save_json(out / 'input-seal.json', {'registration_sha256': digest(a.registration), 'tasks': len(reg['tasks']), 'workers': 4})
    slots = queue.Queue()
    for i in range(4):
        slots.put(list(range(i * 8, i * 8 + 8)))
    def run(t):
        cpus = slots.get()
        try:
            result = execute([sys.executable, '-m', 'experiments.gap45.capture', '--registration', str(a.registration.resolve()),
                              '--out', str(out), '--task', t['id']], out / 'jobs' / t['id'], cwd=ROOT, timeout=600, isolate=True, cpus=cpus)
        finally:
            slots.put(cpus)
        return {'id': t['id'], 'exit_code': result['exit_code'], 'status': result['process_status']}
    with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
        rows = list(pool.map(run, reg['tasks']))
    save_json(out / 'execution.json', rows)
    complete = {p.relative_to(out).as_posix(): digest(p) for p in out.rglob('census.json')}
    save_json(out / 'census-seal.json', {'registration_sha256': digest(a.registration), 'censuses': complete,
                                       'frozen_before_any_site_certification': True})


if __name__ == '__main__':
    main()

"""Apply unchanged kernels to every frozen native site, and retain refusals.

The generalized artifact loader is transport/provenance plumbing. It does not
interpret new C statements, instructions or Q events and never releases SAFE.
"""
import argparse
import concurrent.futures
import json
from pathlib import Path
import posixpath
import queue
import re
import sys
from certification.run_pipeline import ROOT
from certification.evidence import save_json
from certification.interface import sha, llvm_site
from certification.provenance import require, unique
from certification.third_party_ports import abstract_port
from certification.prepare import _translate_checked_interface
from certification.templates import TemplatePool
from checker.check import check as block_check
from frontend.gnu import parse
from lifter.lift import lift
from experiments.gap45.common import digest, execute, read


def load_raw(cap, task, unit):
    receipt = read(cap / 'compiler-receipt.json')
    require(receipt['result'] == 'SAME_INVOCATION_NATIVE_UPSTREAM_CAPTURED', 'capture unavailable')
    require(receipt['source_sha256'] == unit['sha256'] == digest(cap / 'source.c'), 'registered source mismatch')
    require(receipt['commit'] == task['upstream_commit'], 'wrong project revision')
    require(receipt['compiler_binary_sha256'] == '412bbe8c60571a1eb06f48fde89635033621caeb01a9b4ee76d46711bae8e932', 'compiler pin')
    for name, h in receipt['artifacts'].items():
        require(digest(cap / name) == h, 'raw artifact changed')
    command = read(cap / 'compiler-command/command.json')
    require(command['requested'] == receipt['command'] and command['exit_code'] == 0, 'compiler invocation binding')
    require(digest(cap / 'observer-source.cpp') == receipt['observer_build']['source_sha256'], 'observer source binding')
    deps = {}
    for path, item in receipt['dependencies'].items():
        data = (cap / item['file']).read_bytes(); require(sha(data) == item['sha256'], 'dependency changed')
        deps[path] = data
    obs = read(cap / 'observer.json'); buffers = {}
    for b in obs['buffers']:
        data = b['content'].encode()
        require(b['file_id'] not in buffers and sha(data) == b['sha256'] and len(data) == b['bytes'], 'buffer identity')
        if b['path'].startswith('<'):
            require(b['path'] in {'<scratch space>', '<built-in>', '<command line>'}, 'virtual buffer')
        else:
            path = posixpath.normpath(posixpath.join(command['cwd'], b['path']))
            require(deps.get(path) == data, 'buffer dependency mismatch')
        buffers[b['file_id']] = b
    return obs, buffers, (cap / 'source.ll').read_text(), receipt


def certify_unit(cap, task, unit, out):
    out.mkdir(parents=True, exist_ok=False)
    report = {'result': 'UNSUPPORTED', 'sites': [], 'program_verdict_eligible': False,
              'guarantee': 'existing typed open port L1/L2 only; no host, instance or program claim'}
    try:
        obs, buffers, module, receipt = load_raw(cap, task, unit)
        census = read(cap / 'census.json')
        require(census['LLVM_sha256'] == sha(module), 'frozen LLVM census drift')
        actual_lines = [i for i, line in enumerate(module.splitlines()) if re.search(r'\b(call|invoke|callbr)\b.*\basm\b', line)]
        require(actual_lines == [r['llvm_line_index'] for r in census['LLVM_sites']], 'complete LLVM site census')
        for row in census['LLVM_sites']:
            d = out / row['id']
            item = {**row, 'L1': False, 'L2': False, 'L3': False, 'L4': False, 'result': 'UNSUPPORTED'}
            try:
                require(len(row['origin_indices']) == 1, 'missing/ambiguous original source cookie')
                site = obs['sites'][row['origin_indices'][0]]
                require(site['cookies'] == row['cookies'], 'cookie identity drift')
                require(row['family_candidate'], 'instruction family outside frozen support (empty barrier counted separately)')
                interface = abstract_port(site, buffers, module, row)
                ir = lift(parse(interface['normalized'], interface['width']))
                cert = block_check(interface['normalized'], ir, interface['width'], output_dir=d / 'block')
                save_json(d / 'block/certificate.json', cert)
                require(cert['result'] == 'EXACT', cert.get('reason', 'block not exact'))
                item['L1'] = True
                interface = llvm_site(module, interface, checked_line_index=row['llvm_line_index'])
                interface['result'] = 'INTERFACE_MATCH'
                evidence = _translate_checked_interface(interface, module, d / 'site')
                candidate = d / 'site/candidate.ll'
                tool = ROOT / 'vendor/clang-local/root/usr'
                compiled = execute(['env', 'LD_LIBRARY_PATH=' + str(tool / 'lib/x86_64-linux-gnu'),
                                    str(tool / 'bin/clang-21'), '-cc1', '-emit-llvm-bc', '-disable-llvm-passes',
                                    '-x', 'ir', str(candidate), '-o', str(d / 'validated.bc')], d / 'validation')
                require(compiled['exit_code'] == 0, 'actual replacement LLVM rejected by Clang')
                # Reopen the authentic artifacts and reconstruct this site's
                # interface for independent checking; do not trust item/map.
                o2, b2, m2, _ = load_raw(cap, task, unit)
                s2 = unique([s for s in o2['sites'] if s['cookies'] == row['cookies']], 'independent source origin')
                i2 = llvm_site(m2, abstract_port(s2, b2, m2, row), checked_line_index=row['llvm_line_index'])
                i2['result'] = 'INTERFACE_MATCH'
                verified = _translate_checked_interface(i2, m2, d / 'independent')
                require(verified['candidate_llvm'] == evidence['candidate_llvm'], 'independent candidate drift')
                item.update(L2=True, result='LLVM_SITE_EXACT', missing=['complete host/lifecycle/activation domain', 'complete actual target Q correspondence'])
            except Exception as e:
                item['reason'] = str(e)
                if item['L1']:
                    item['result'] = 'BLOCK_EXACT_ONLY'
            save_json(d / 'result.json', item); report['sites'].append(item)
        report['result'] = 'ALL_FROZEN_SITES_REPORTED'
    except Exception as e:
        report['reason'] = str(e)
    save_json(out / 'result.json', report)
    return report


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--registration', type=Path, required=True)
    ap.add_argument('--captures', type=Path, required=True)
    ap.add_argument('--out', type=Path, required=True)
    ap.add_argument('--task')
    a = ap.parse_args(); reg = read(a.registration); out = a.out.resolve(); caps = a.captures.resolve()
    require((caps / 'census-seal.json').exists(), 'entire potential site population must be frozen first')
    if a.task:
        task = next(t for t in reg['tasks'] if t['id'] == a.task)
        for i, unit in enumerate(task['units']):
            certify_unit(caps / task['id'] / ('tu-' + str(i)), task, unit, out / task['id'] / ('tu-' + str(i)))
        return
    out.mkdir(parents=True, exist_ok=False)
    save_json(out / 'input-seal.json', {'registration': digest(a.registration), 'census_seal': digest(caps / 'census-seal.json'),
                                       'capture_layer_adapter': 'generic binding equivalent to old fixed-client load_unit; all expression/port/LLVM kernels unchanged'})
    slots = queue.Queue()
    for i in range(4):
        slots.put(list(range(i * 8, i * 8 + 8)))
    def run(t):
        cpus = slots.get()
        try:
            r = execute([sys.executable, '-m', 'experiments.gap45.analyze', '--registration', str(a.registration.resolve()),
                         '--captures', str(caps), '--out', str(out), '--task', t['id']], out / 'jobs' / t['id'],
                        cwd=ROOT, timeout=600, isolate=True, cpus=cpus)
            return {'id': t['id'], 'status': r['process_status'], 'exit_code': r['exit_code']}
        finally:
            slots.put(cpus)
    with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
        save_json(out / 'execution.json', list(pool.map(run, reg['tasks'])))


if __name__ == '__main__':
    main()

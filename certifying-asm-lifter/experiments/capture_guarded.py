"""Read-only same-invocation capture of the explicitly frozen direct input; reuses pinned read-only capture."""
import argparse
from pathlib import Path
import shlex
from certification.run_pipeline import ROOT
from certification.evidence import Commands, save_json
from certification.interface import sha
from certification.provenance import require
from experiments.run_dat3m import linux
import json


def capture(out, source, expected=2):
    out = Path(out).resolve()
    out.mkdir(parents=True, exist_ok=False)
    logs = Commands(out / 'commands')
    tool = ROOT / 'vendor/clang-local/root/usr'
    compiler = ['env', 'LD_LIBRARY_PATH=' + linux(tool / 'lib/x86_64-linux-gnu'), linux(tool / 'bin/clang-21')]
    observer = ROOT / 'vendor/clang-observer.so'
    build = json.loads((ROOT / 'experiments/ck-provenance/observer-build-05/receipt.json').read_bytes())
    source = Path(source).resolve()
    require(expected in {0, 2}, 'fixed property variants only')

    def invoke(args):
        return logs.run(['wsl', '-d', 'Ubuntu', '--exec', *args])[1]
    before = source.read_bytes()
    require(sha(observer.read_bytes()) == build['binary_sha256'], 'observer pin')
    version = invoke([*compiler, '--version']).decode()
    require('clang version 21.1.8' in version, 'Clang pin')
    compiler_hash = invoke(['sha256sum', compiler[-1]]).decode().split()[0]
    require(compiler_hash == build['clang_sha256'], 'Clang build identity')
    flags = ['-std=gnu11', '-target', 'x86_64-pc-linux-gnu', '-O1', '-gline-tables-only',
             '-fdebug-prefix-map=' + linux(ROOT.parent) + '=/cert-source', '-DEXPECT=' + str(expected)]
    dep = invoke([*compiler, *flags, '-M', '-MT', 'CERT', linux(source)]).decode()
    require(shlex.split(dep.partition(':')[2].replace('\\\n', '')) == [linux(source)], 'unexpected dependency')
    command = [*compiler, *flags, '-Xclang', '-load', '-Xclang', linux(observer),
               '-Xclang', '-plugin-arg-cert-observe', '-Xclang', linux(out / 'observer.json'),
               '-S', '-emit-llvm', linux(source), '-o', linux(out / 'source.ll')]
    invoke(command)
    require(before == source.read_bytes() and sha(observer.read_bytes()) == build['binary_sha256'], 'capture input drift')
    (out / 'source.c').write_bytes(before)
    (out / 'observer-source.cpp').write_bytes((ROOT / 'frontend/clang/Observe.cpp').read_bytes())
    save_json(out / 'observer-build-receipt.json', build)
    receipt = {'result': 'SAME_INVOCATION_DIRECT_CAPTURED', 'compiler_version': version,
               'compiler_binary_sha256': compiler_hash, 'observer_build': build,
               'source_path': source.relative_to(ROOT).as_posix(), 'flags': flags, 'command': command,
               'source_unmodified': True, 'property_configuration': expected,
               'artifacts': {name: sha((out / name).read_bytes()) for name in
                             ('source.c', 'source.ll', 'observer.json', 'observer.json.ast.json')},
               'trust': 'original Gamma_capture/front; no compiler correctness claim'}
    save_json(out / 'compiler-receipt.json', receipt)
    return receipt


if __name__ == '__main__':
    p = argparse.ArgumentParser()
    p.add_argument('--out', required=True, type=Path)
    p.add_argument('--source', required=True, type=Path)
    p.add_argument('--expect', type=int, choices=[0, 2], default=2)
    args = p.parse_args()
    print(capture(args.out, args.source, args.expect)['result'])

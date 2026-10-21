"""Package the existing Linux ELF tools and their resolved runtime, not WSL.

Run with Linux Python in the original environment. The archive is private
transfer material, never a Git artifact. Manifest hashes are public evidence.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import tarfile


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--root', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    a = p.parse_args()
    a.out.mkdir(parents=True, exist_ok=False)
    root = a.root.resolve()
    vendor = root / 'vendor'
    tool = vendor / 'clang-local/root/usr'
    env = dict(os.environ, LD_LIBRARY_PATH=str(tool / 'lib/x86_64-linux-gnu'))
    ldd = subprocess.check_output(['ldd', str(tool / 'bin/clang-21')], env=env, text=True)
    libraries = []
    for line in ldd.splitlines():
        part = line.split('=>', 1)[-1].strip()
        if part.startswith('/'):
            libraries.append(Path(part.rsplit(' (0x', 1)[0]))
    files = {}
    for name in ('clang-local/root', 'clang-observer-sdk/usr', 'apache-maven-3.9.9'):
        for f in (vendor / name).rglob('*'):
            if f.is_file():
                files['vendor/' + f.relative_to(vendor).as_posix()] = f
    files['vendor/clang-observer.so'] = vendor / 'clang-observer.so'
    for f in libraries:
        files['vendor/clang-runtime/' + f.name] = f
    manifest = {n: {'sha256': hashlib.sha256(f.read_bytes()).hexdigest(),
                    'bytes': f.stat().st_size, 'original_path': str(f)} for n, f in files.items()}
    (a.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    (a.out / 'ldd.txt').write_text(ldd)
    with tarfile.open(a.out / 'toolchain.tar.gz', 'w:gz', compresslevel=1, dereference=True) as tf:
        for n, f in files.items():
            tf.add(f, arcname=n, recursive=False)
    print(json.dumps({'files': len(files), 'uncompressed_bytes': sum(x['bytes'] for x in manifest.values()),
                      'archive_bytes': (a.out / 'toolchain.tar.gz').stat().st_size}))


if __name__ == '__main__':
    main()

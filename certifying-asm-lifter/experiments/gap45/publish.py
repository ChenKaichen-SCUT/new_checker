"""Lossless content-addressed public evidence; no tool binaries or credentials.

Hydration rejects traversal and overwrites. Every original artifact remains
byte-identical; compression is storage, not a new certificate or interpretation.
"""
import argparse
import gzip
import hashlib
import json
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.evidence import save_json


def pack(destination, include=None):
    base = ROOT / 'experiments/gap45'; destination.mkdir(parents=True, exist_ok=False)
    index = {}; blobs = {}; total = 0
    for top in sorted(base.iterdir()):
        if include is not None and top.name not in include: continue
        if not top.is_dir() or top.name in {'published', '__pycache__'} or top.name.startswith('summary-'):
            continue
        for p in sorted(top.rglob('*')):
            if not p.is_file() or '__pycache__' in p.parts or p.suffix == '.pyc': continue
            data = p.read_bytes()
            if data.startswith(b'\x7fELF') or p.suffix.lower() in {'.jar', '.deb', '.exe', '.dll', '.so'}:
                raise ValueError('tool binary in evidence tree: ' + str(p))
            h = hashlib.sha256(data).hexdigest(); relative = p.relative_to(ROOT).as_posix()
            index[relative] = {'sha256': h, 'bytes': len(data)}; total += len(data)
            if h not in blobs:
                obj = destination / 'objects' / h[:2] / (h + '.gz'); obj.parent.mkdir(parents=True, exist_ok=True)
                obj.write_bytes(gzip.compress(data, compresslevel=6, mtime=0)); blobs[h] = obj.stat().st_size
    save_json(destination / 'index.json', {'format': 'gap45-lossless-cas-v1', 'files': index,
        'file_count': len(index), 'raw_bytes': total, 'unique_blobs': len(blobs), 'compressed_bytes': sum(blobs.values()),
        'maximum_blob_bytes': max(blobs.values()), 'scope': 'all new raw evidence directories, including failed attempts; no vendor/tool binaries'})


def hydrate(package, prefix=None):
    r = json.loads((package / 'index.json').read_bytes()); count = 0
    for name, v in r['files'].items():
        if prefix and not any(name.startswith('experiments/gap45/' + x.rstrip('/') + '/') for x in prefix): continue
        target = (ROOT / name).resolve()
        if not target.is_relative_to(ROOT.resolve()) or not name.startswith('experiments/gap45/'):
            raise ValueError('outside new evidence namespace')
        h = v['sha256']; data = gzip.decompress((package / 'objects' / h[:2] / (h + '.gz')).read_bytes())
        if len(data) != v['bytes'] or hashlib.sha256(data).hexdigest() != h: raise ValueError('corrupt evidence')
        if target.exists():
            if target.read_bytes() != data: raise ValueError('refuse overwrite: ' + name)
        else:
            target.parent.mkdir(parents=True, exist_ok=True); target.write_bytes(data)
        count += 1
    print(json.dumps({'hydrated_or_verified': count}))


if __name__ == '__main__':
    p = argparse.ArgumentParser(); p.add_argument('--pack', action='store_true')
    p.add_argument('--package', type=Path, default=ROOT / 'experiments/gap45/published')
    p.add_argument('--prefix', nargs='*')
    p.add_argument('--include', nargs='*', help='explicit supplemental packing directories')
    a = p.parse_args()
    if a.pack: pack(a.package.resolve(), a.include)
    else: hydrate(a.package.resolve(), a.prefix)

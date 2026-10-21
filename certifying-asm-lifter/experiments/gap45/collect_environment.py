"""Collect public build provenance/licenses; never capture credentials/env."""
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import tarfile
from certification.run_pipeline import ROOT
from certification.evidence import save_json
from experiments.gap45.common import digest, read


def run():
    server = Path('/opt/actc-gap45'); out = ROOT / 'experiments/gap45/environment-final'
    out.mkdir(parents=True, exist_ok=False)
    for p in server.glob('*.log'):
        shutil.copyfile(p, out / p.name)
    for p in [server / 'env.sh', server / 'bin/clang-21', server / 'closed-fresh.py']:
        if p.exists(): shutil.copyfile(p, out / (p.name + '.txt'))
    packages = subprocess.run(['dpkg-query', '-W', '-f=${Package}\t${Version}\n'], capture_output=True, check=True).stdout
    (out / 'dpkg-packages.tsv').write_bytes(packages)
    (out / 'pip-freeze.txt').write_bytes(subprocess.check_output(['python', '-m', 'pip', 'freeze']))
    archives = []; source_checks = []; licenses = out / 'licenses'; licenses.mkdir()
    for name in ['ck', 'urcu', 'libvsync', 'Dat3M']:
        archive = server / (name + '.tgz'); root = server / 'upstreams' / (name + '-archive')
        archives.append({'name': name, 'sha256': digest(archive), 'bytes': archive.stat().st_size})
        rows = []
        with tarfile.open(archive) as tf:
            for member in tf:
                if not member.isfile(): continue
                rel = Path(*Path(member.name).parts[1:]); p = root / rel
                if rel.suffix in {'.c', '.h', '.java', '.cat'}:
                    data = tf.extractfile(member).read()
                    rows.append({'path': rel.as_posix(), 'sha256': hashlib.sha256(data).hexdigest(),
                                 'unchanged': p.is_file() and p.read_bytes() == data})
                if rel.name.upper().startswith(('LICENSE', 'LICENCE', 'COPYING')):
                    dest = licenses / name / rel; dest.parent.mkdir(parents=True, exist_ok=True)
                    dest.write_bytes(tf.extractfile(member).read())
        source_checks.append({'project': name, 'files': rows})
    ao = server / 'upstreams/atomic_ops'
    (out / 'AO-tracked-diff.txt').write_bytes(subprocess.check_output(['git', 'diff', '--name-only'], cwd=ao))
    for p in ao.glob('COPYING*'): shutil.copyfile(p, licenses / ('atomic_ops-' + p.name))
    for p in ao.glob('LICENSE*'): shutil.copyfile(p, licenses / ('atomic_ops-' + p.name))
    for package in ['libc6', 'libc6-dev', 'linux-libc-dev', 'openjdk-21-jdk-headless']:
        p = Path('/usr/share/doc') / package / 'copyright'
        if p.exists(): shutil.copyfile(p, licenses / (package + '-copyright'))
    for tree in [ROOT / 'vendor/clang-local/root/usr/share/doc', ROOT / 'vendor/clang-observer-sdk/usr/share/doc']:
        for p in tree.glob('*/copyright'):
            shutil.copyfile(p, licenses / (p.parent.name + '-copyright'))
    config = out / 'configurations'; config.mkdir()
    for project, root in [('ck', server / 'upstreams/ck-archive'), ('urcu', server / 'upstreams/urcu-archive'),
                          ('atomic_ops', ao), ('vatomic', server / 'build-vatomic-debug'), ('libvsync', server / 'build-libvsync')]:
        for p in root.rglob('*'):
            if p.is_file() and p.name in {'config.log', 'config.status', 'config.h', 'ck_md.h', 'ck_cc.h', 'CMakeCache.txt', 'compile_commands.json', '.config'}:
                dest = config / project / p.relative_to(root); dest.parent.mkdir(parents=True, exist_ok=True); shutil.copyfile(p, dest)
    save_json(out / 'archives.json', archives); save_json(out / 'source-integrity.json', source_checks)
    save_json(out / 'integrity-summary.json', {'source_files': sum(len(r['files']) for r in source_checks),
        'changed_source_files': [{'project': r['project'], 'path': f['path']} for r in source_checks for f in r['files'] if not f['unchanged']],
        'llvm_link_package': {'sha256': digest(server / 'llvm21.deb'), 'version': '1:21.1.8-6ubuntu1'},
        'raw_Dat3M_jar': digest(server / 'upstreams/Dat3M-archive/dartagnan/target/dartagnan.jar')})


if __name__ == '__main__': run()

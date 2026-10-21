"""Freeze original upstream test populations/commands BEFORE certification.

Scope is purposeful, not a claim to cover every client in these libraries.
Make/CMake commands are read from the actual unmodified upstream build system.
"""
import argparse
import json
import re
import shlex
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.evidence import save_json
from experiments.gap45.common import BASELINE, digest, execute, read


def compiler_commands(text, cwd):
    rows = []
    for line in text.replace('\\\n', ' ').splitlines():
        try:
            words = shlex.split(line)
        except ValueError:
            continue
        indices = [i for i, s in enumerate(words) if s.endswith('/bin/clang-21')]
        if not indices:
            continue
        a = words[indices[0]:]
        stop = next((i for i, x in enumerate(a) if x in {'&&', ';', '||'}), len(a))
        a = a[:stop]
        # Libtool's actual compile line and its announced command can repeat.
        if not any(s.endswith('.c') for s in a):
            continue
        sources = [str((cwd / s).resolve()) for s in a[1:] if s.endswith('.c') and (cwd / s).is_file()]
        if sources:
            row = {'cwd': str(cwd), 'args': a, 'sources': sources, 'original_line': line}
            if not any(x['args'] == a and x['cwd'] == str(cwd) for x in rows):
                rows.append(row)
    return rows


def make_commands(cwd, target, out):
    # -B would also force autotools to regenerate configure/Makefiles even in
    # a dry run. Mark only actual C prerequisites, preserving configuration.
    force = [a for path in sorted(cwd.glob('*.c')) for a in ['-W', path.name]]
    r = execute(['make', '-n', *force, target], out, cwd=cwd)
    text = (out / 'stdout.log').read_text()
    return compiler_commands(text, cwd), r


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--server-root', type=Path, default=Path('/opt/actc-gap45'))
    ap.add_argument('--out', type=Path, required=True)
    a = ap.parse_args()
    out = a.out.resolve(); out.mkdir(parents=True, exist_ok=False)
    r = a.server_root.resolve()
    projects = {p['name']: p for p in read(ROOT / 'benchmarks/upstream/sources.json')}
    roots = {n: r / 'upstreams' / (n if n == 'atomic_ops' else n + '-archive') for n in projects}
    tasks = []

    def add(name, project, entry, commands, *, link='COMPLETE_SOURCE_LINK_SET', category='upstream-test'):
        project_root = roots[project]
        relevant = []
        for c in commands:
            for path in c['sources']:
                unit = {'source': str(Path(path).relative_to(project_root)), 'sha256': digest(path),
                        'command': c, 'cwd': c['cwd']}
                if not any(u['source'] == unit['source'] and u['command'] == c for u in relevant):
                    relevant.append(unit)
        tasks.append({'id': name, 'project': project, 'upstream_commit': projects[project]['sha'],
                      'category': category, 'entry': entry, 'project_root': str(project_root),
                      'units': relevant, 'link_status': link,
                      'property': 'all original reachable assertions; no added verifier assertion',
                      'input_domain': 'original program arguments/environment; no invented finite restriction',
                      'program_safe_eligible_by_registration': False})

    # Every actual target in this fixed original directory, not just FAA targets.
    ck = roots['ck']; d = ck / 'regressions/ck_pr/validate'
    commands, result = make_commands(d, 'all', out / 'make-ck-pr')
    assert result['exit_code'] == 0 and commands, 'CK original command enumeration failed'
    for c in commands:
        assert len(c['sources']) == 1
        source = Path(c['sources'][0])
        add('ck-' + source.stem, 'ck', str(source.relative_to(ck)), [c])
    ec = ck / 'regressions/ck_ec/validate'
    commands, result = make_commands(ec, 'ck_ec_smoke_test', out / 'make-ck-ec')
    assert result['exit_code'] == 0 and len(commands) == 1 and len(commands[0]['sources']) == 2
    add('ck-ec-complete', 'ck', 'regressions/ck_ec/validate/ck_ec_smoke_test.c', commands,
        category='complete-upstream-client')

    # Libraries needed by the original URCU atomic tests, including TAP output.
    urcu = roots['urcu']
    common, rc = make_commands(urcu / 'src', 'liburcu-common.la', out / 'make-urcu-common')
    tap, rt = make_commands(urcu / 'tests/utils', 'libtap.a', out / 'make-urcu-tap')
    for sub in ['unit', 'benchmark']:
        commands, status = make_commands(urcu / 'tests' / sub, 'test_uatomic', out / ('make-urcu-' + sub))
        main = [c for c in commands if any(Path(s).name == 'test_uatomic.c' for s in c['sources'])]
        assert main, 'URCU original command missing'
        add('urcu-' + sub + '-uatomic', 'urcu', 'tests/' + sub + '/test_uatomic.c',
            main + common + (tap if sub == 'unit' else []),
            link='COMPLETE_SOURCE_LINK_SET' if all(x['exit_code'] == 0 for x in [status, rc, rt]) else 'BUILD_GRAPH_INCOMPLETE')

    ao = roots['atomic_ops']
    base, rb = make_commands(ao / 'src', 'libatomic_ops.la', out / 'make-ao-base')
    gpl, rg = make_commands(ao / 'src', 'libatomic_ops_gpl.la', out / 'make-ao-gpl')
    for target in ['test_atomic', 'test_atomic_generalized', 'test_atomic_pthreads', 'test_stack', 'test_malloc']:
        commands, status = make_commands(ao / 'tests', target, out / ('make-ao-' + target))
        main = [c for c in commands if any(Path(s).name in {'test_atomic.c', 'test_stack.c', 'test_malloc.c'} for s in c['sources'])]
        assert main, 'AO original command missing: ' + target
        add('ao-' + target, 'atomic_ops', str(Path(main[0]['sources'][0]).relative_to(ao)),
            main + base + (gpl if target in {'test_stack', 'test_malloc'} else []),
            link='COMPLETE_SOURCE_LINK_SET' if all(x['exit_code'] == 0 for x in [status, rb, rg]) else 'BUILD_GRAPH_INCOMPLETE')

    # All original C files in these two fixed atomic-client directories.
    # Upstream template-generated cross-product tests are outside this population.
    vs = roots['libvsync']
    databases = [r / 'build-vatomic-debug/compile_commands.json', r / 'build-libvsync/compile_commands.json']
    db = [x for path in databases for x in read(path)]
    selected = sorted((vs / 'vatomic/test/atomics').glob('*.c')) + sorted((vs / 'test/atomics').glob('*.c'))
    for path in selected:
        entries = [c for c in db if Path(c['file']).resolve() == path.resolve()]
        assert len(entries) == 1, 'ambiguous/missing original CMake entry: ' + str(path)
        c = entries[0]
        cmd = {'cwd': c['directory'], 'args': shlex.split(c['command']),
               'sources': [str(path)], 'original_line': c['command']}
        add('libvsync-' + path.stem, 'libvsync', str(path.relative_to(vs)), [cmd])

    assert len({t['id'] for t in tasks}) == len(tasks)
    schema = {'baseline': BASELINE, 'frozen_before_capture_and_certification': True,
              'projects': projects, 'tasks': tasks, 'task_denominator': len(tasks),
              'selection_rule': 'all actual CK ck_pr validate targets + complete CK ec smoke; URCU unit/benchmark uatomic; all five AO original check targets; all original C in two libvsync atomic-test directories',
              'excluded_population': 'other library algorithms, benchmark directories, C++, generated vatomic type/function Cartesian product; not removed based on analysis outcome',
              'source_unit': 'unique project/commit/spelling and expansion location + configuration; counts kept separately from TU occurrences',
              'LLVM_unit': 'actual module hash + LLVM instruction location',
              'activation_unit': 'only certified finite source enumeration; UNKNOWN for loops/unknown calls',
              'failure_rule': 'keep compile failure, no asm, unsupported family, parser refusal, UNKNOWN, timeout, crash, missing full Q in fixed denominator',
              'budget': {'whole_task_seconds': 600, 'memory_bytes': 16 * 1024**3, 'prepare_workers': 4,
                         'performance_cpus': list(range(8)), 'performance_concurrency': 1, 'repeats': 5,
                         'cache': 'input files deliberately primed; fresh processes; no claim that every system cache is warm',
                         'existing_inner_bounds': 'unchanged: backend 120s, symbolic paths 128, source graph 64 endpoints, per-SMT original timeout'},
              'capture_repeat_population': ['ck-ck_pr_faa', 'ck-ec-complete', 'urcu-unit-uatomic', 'ao-test_atomic', 'libvsync-dispatcher_test', 'libvsync-atomicptr_stamped_test'],
              'performance_rule': 'paired same objects and guarantee intersection only; unsupported is not a wrong answer; all five outcomes retained; no per-task retuning'}
    save_json(out / 'tasks.json', schema)
    save_json(out / 'seal.json', {'tasks_sha256': digest(out / 'tasks.json'), 'tasks': len(tasks),
                                'source_files': len({(t['project'], u['source']) for t in tasks for u in t['units']})})
    print(json.dumps(read(out / 'seal.json')))


if __name__ == '__main__':
    main()

"""Nonsemantic experiment I/O, process/resource accounting, and hashing."""
import hashlib
import json
import os
from pathlib import Path
import signal
import subprocess
import time
import uuid
from certification.evidence import save_json
from certification.platform_launch import native_args

BASELINE = 'b0a788edafbd6c1251c93f49c52e8c4d111c96cb'


def digest(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def read(p):
    return json.loads(Path(p).read_bytes())


def execute(args, out, *, cwd=None, timeout=600, env=None, isolate=False, cpus=None):
    out = Path(out)
    out.mkdir(parents=True, exist_ok=False)
    actual = native_args(args)
    command = ['/usr/bin/time', '-v', '-o', str(out.resolve() / 'time.txt'), *actual]
    unit = None
    if isolate:
        unit = 'actc-gap45-' + uuid.uuid4().hex
        settings = dict(os.environ if env is None else env)
        passed = [k + '=' + v for k, v in settings.items() if k in {'PATH', 'PYTHONPATH', 'JAVA_TOOL_OPTIONS'} or k.startswith('ACTC_CLANG_')]
        command = ['systemd-run', '--quiet', '--wait', '--pipe', '--unit=' + unit,
                   '-p', 'MemoryMax=17179869184', '-p', 'MemorySwapMax=0',
                   '-p', 'AllowedCPUs=' + ','.join(map(str, cpus or range(8))),
                   '-p', 'WorkingDirectory=' + str(Path(cwd or os.getcwd()).resolve()),
                   '-p', 'RuntimeMaxSec=' + str(timeout),
                   '/usr/bin/env', *passed, *command]
    record = {'requested': list(map(str, args)), 'executed': actual, 'cwd': str(Path(cwd or os.getcwd()).resolve()),
              'timeout_seconds': timeout, 'started_utc': time.strftime('%Y-%m-%dT%H:%M:%SZ', time.gmtime())}
    if unit:
        record.update(cgroup_unit=unit, memory_max_bytes=17179869184, allowed_cpus=list(cpus or range(8)),
                      launch_argv=command, memory_metric='GNU time max process RSS; aggregate kernel peak unavailable on this 5.15 host')
    tick = time.monotonic()
    with (out / 'stdout.log').open('wb') as stdout, (out / 'stderr.log').open('wb') as stderr:
        p = subprocess.Popen(command, cwd=cwd, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
        try:
            record['exit_code'] = p.wait(timeout=timeout)
            record['process_status'] = 'EXITED'
        except subprocess.TimeoutExpired:
            if unit:
                subprocess.run(['systemctl', 'kill', '--signal=KILL', unit], capture_output=True)
            os.killpg(p.pid, signal.SIGKILL)
            p.wait()
            record.update(exit_code=None, process_status='TIMEOUT')
    record['wall_seconds'] = time.monotonic() - tick
    if (out / 'time.txt').exists():
        fields = {}
        for line in (out / 'time.txt').read_text().splitlines():
            if ': ' in line:
                key, value = line.strip().rsplit(': ', 1)
                fields[key] = value
        record['gnu_time'] = fields
        for key, name in [('User time (seconds)', 'user_seconds'), ('System time (seconds)', 'system_seconds'),
                          ('Maximum resident set size (kbytes)', 'max_process_rss_kib')]:
            try:
                record[name] = float(fields[key])
            except (KeyError, ValueError):
                record[name] = None
    record['stdout_sha256'] = digest(out / 'stdout.log')
    record['stderr_sha256'] = digest(out / 'stderr.log')
    if unit:
        status = subprocess.run(['systemctl', 'show', unit, '--property=Result,ExecMainStatus,CPUUsageNSec,MemoryPeak'], capture_output=True)
        record['service_status'] = status.stdout.decode(errors='replace')
        subprocess.run(['systemctl', 'reset-failed', unit], capture_output=True)
    save_json(out / 'command.json', record)
    return record

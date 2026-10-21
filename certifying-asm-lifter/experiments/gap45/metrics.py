"""Derive size and process tables from immutable published bytes, no reruns."""
import gzip
import json
from certification.run_pipeline import ROOT
from experiments.gap45.summarize import table


def run():
    b = ROOT / 'experiments/gap45'; p = b / 'published'; files = json.loads((p / 'index.json').read_bytes())['files']
    sizes = {}; commands = []
    for name, item in files.items():
        marker = 'experiments/gap45/performance-01/'
        if name.startswith(marker):
            task = name[len(marker):].split('/')[0]
            row = sizes.setdefault(task, {'name': task, 'certificate_json_bytes': 0, 'SMT_bytes': 0, 'SMT_files': 0})
            if name.endswith('/certificate.json'): row['certificate_json_bytes'] += item['bytes']
            if name.endswith('.smt2'):
                row['SMT_bytes'] += item['bytes']; row['SMT_files'] += 1
        if name.endswith('/command.json'):
            h = item['sha256']; r = json.loads(gzip.decompress((p / 'objects' / h[:2] / (h + '.gz')).read_bytes()))
            commands.append({'file': name, **{k:r.get(k) for k in ['started_utc','process_status','exit_code','timeout_seconds','wall_seconds','user_seconds','system_seconds','max_process_rss_kib','allowed_cpus','memory_max_bytes']},
                             'argv': r['executed'], 'note': 'nested command rows are not additive with their parent task'})
    table(b / 'summary-02/certificate-sizes.csv', list(sizes.values()))
    table(b / 'summary-02/all-process-metrics.csv', commands)


if __name__ == '__main__': run()

"""Lossless derived task/method taxonomy; backend answers are not oracles."""
import gzip
import json
import re
from certification.run_pipeline import ROOT
from experiments.gap45.summarize import table


def run():
    b = ROOT / 'experiments/gap45'; pkg = b / 'published'
    index = json.loads((pkg / 'index.json').read_bytes())['files']
    def data(name):
        row = index.get('experiments/gap45/' + name)
        if row is None: return None
        h = row['sha256']; return gzip.decompress((pkg / 'objects' / h[:2] / (h + '.gz')).read_bytes())
    def obj(name):
        raw = data(name); return json.loads(raw) if raw else {}
    reg = obj('registration-04/tasks.json'); rows = []
    for task in reg['tasks']:
        pre = 'programs-01/' + task['id'] + '/'
        r = obj(pre + 'result.json'); methods = r.get('methods', {})
        for label, command, receipt in [('original-Dat3M', 'original-dat3m/', None),
                                         ('read-only-actual-Q', None, 'actual-raw-backend/backend-receipt.json')]:
            if command:
                c = obj(pre + command + 'command.json')
                text = (data(pre + command + 'stdout.log') or b'').decode(errors='replace')
                text += (data(pre + command + 'stderr.log') or b'').decode(errors='replace')
                status = 'TIMEOUT' if c.get('process_status') == 'TIMEOUT' else 'PROCESS_COMPLETED' if c.get('exit_code') == 0 else 'PROCESS_ERROR'
                row = {'task': task['id'], 'method': label, 'classification': status, 'raw_result': re.findall(r'Result:\s*(\S+)', text),
                       'raw_reason': re.findall(r'Reason:\s*([^\n]+)', text), 'exit_code': c.get('exit_code'),
                       'wall_seconds': c.get('wall_seconds'), 'evidence': pre + command, 'program_claim': False}
            else:
                c = obj(pre + receipt); reason = c.get('reason', '')
                text = (data(pre + 'actual-raw-backend/backend.log') or b'').decode(errors='replace')
                cmds = obj(pre + 'actual-raw-backend/commands/commands.json')
                if c.get('result') == 'ACTUAL_BACKEND_CAPTURED': status = 'ACTUAL_Q_CAPTURED_NOT_CERTIFIED'
                elif 'incomplete exported object' in reason: status = 'CAPTURE_INCOMPLETE'
                elif isinstance(cmds, list) and any(x.get('timeout_seconds') for x in cmds): status = 'TIMEOUT'
                elif 'OutOfMemoryError' in text: status = 'RESOURCE_EXHAUSTED'
                elif 'ParsingException' in text: status = 'BACKEND_PARSE_ERROR'
                elif 'UnsupportedOperationException' in text: status = 'BACKEND_UNSUPPORTED'
                else: status = 'UNKNOWN_CAPTURE_FAILURE'
                row = {'task': task['id'], 'method': label, 'classification': status, 'reason': reason,
                       'raw_reason': re.findall(r'Reason:\s*([^\n]+)', text), 'evidence': pre + receipt, 'program_claim': False}
            rows.append(row)
        for label, field in [('ACTC','ACTC/composition-certificate.json'),('diagnostics','diagnostics/diagnostic-report.json')]:
            c = obj(pre + field)
            rows.append({'task':task['id'],'method':label,'classification':c.get('result','NOT_RUN'),'reason':c.get('reason'),'evidence':pre+field,'program_claim':False})
        for label in ['guarded','lifter_no_checker','uniform_static_ablation']:
            c = methods.get(label,{})
            rows.append({'task':task['id'],'method':label,'classification':c.get('result','NOT_RUN'),'reason':c.get('reason'),'evidence':pre+'result.json','program_claim':False})
        rows.append({'task':task['id'],'method':'lifted-optimized-LLVM-to-Q','classification':'NOT_RUN_FRONTEND_REFUSED',
                     'reason':'no full-source candidate admitted; no partial rewrite or invented target Q','program_claim':False})
    table(b / 'summary-02/method-results.csv',rows)


if __name__=='__main__':run()

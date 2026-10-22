"""Raw-ledger aggregation; never removes incomplete or late tasks."""
import csv
import statistics
from collections import Counter
from pathlib import Path
from semantic_testing.run import load,save


def aggregate(root, output):
    root,output=Path(root),Path(output); output.mkdir(parents=True,exist_ok=False)
    runs,attempts=[],[]
    for cfgfile in sorted(root.glob('*/config.json')):
        folder=cfgfile.parent; cfg=load(cfgfile); parent=load(folder/'parent-resource.json')
        progress=load(folder/'progress.json') if (folder/'progress.json').exists() else dict(attempts=[],selected=[],covered=[])
        keys=('objective','heldout_three','heldout_behavior','syntax')
        union={k:set() for k in keys}; hits=set(); obs=set(); paths=set(); graphs=0
        for chosen in progress['selected']:
            dest=folder/f"a{chosen['index']:03d}"/'oracle'; ev=load(dest/'evaluation.json'); r=load(dest/'result.json')
            hits.update(ev['hits']); graphs+=ev['graphs']
            for k in keys: union[k].update(ev['features'][k])
            from semantic_testing.dsl import canonical
            obs.update(canonical(o) for o in r['observations'])
            for g in r['graphs']:
                paths.add(canonical([[e['kind']+str(int(e['atomic'])) for e in g['events'] if e['thread']==t] for t in range(cfg['domain']['threads'])]))
        query_count=0; component=Counter(); raw_status=Counter(); all_graphs=0
        from .check import grammar_membership
        generated=[]
        if cfg['strategy'] in ('syntax','semantic'):
            for batch in folder.glob('batch-*.json'): generated.extend(load(batch))
        elif cfg['strategy']=='inverse': generated=[load(f) for f in folder.glob('a*/program.json')]
        else: generated=[load(f) for f in folder.glob('a*/oracle/input.json')]
        for p in generated: grammar_membership(p,cfg['domain'])
        for a in progress['attempts']:
            dest=folder/f"a{a['index']:03d}"; a=dict(a,run=folder.name)
            if a['status']=='STARTED': a['status']='INTERRUPTED_OR_INCOMPLETE'
            raw_status[a['status']]+=1
            if (dest/'synthesis.json').exists():
                s=load(dest/'synthesis.json'); query_count+=s['queries']
                component['synthesis_total_seconds']+=s['wall_seconds']
                for k in ('encoding_seconds','solve_seconds'): component['synthesis_'+k]+=s.get(k,0)
            if (dest/'oracle'/'result.json').exists():
                r=load(dest/'oracle'/'result.json'); query_count+=len(r['queries']); all_graphs+=len(r['graphs'])
                for k,v in r['metrics'].items(): component['oracle_'+k]+=v
            if (dest/'oracle'/'resource.json').exists():
                rr=load(dest/'oracle'/'resource.json'); component['A_seconds']+=rr['independent_phase_seconds']
                component['expectations_seconds']+=rr['expectation_phase_seconds']
            if (dest/'oracle'/'evaluation.json').exists(): component['evaluation_total_seconds']+=load(dest/'oracle'/'evaluation.json')['wall_seconds']
            if (dest/'oracle'/'features.json').exists(): component['features_seconds']+=load(dest/'oracle'/'features.json')['feature_seconds']
            attempts.append(a)
        row=dict(name=folder.name,threads=cfg['domain']['threads'],mode=cfg['mode']['name'],seed=cfg['seed'],strategy=cfg['strategy'],
            selected=len(progress['selected']),attempts=len(progress['attempts']),exact=sum(a['status']=='EXACT_INDEPENDENT' for a in progress['attempts']),
            observable_generated=len(generated),generated_grammar_verified=len(generated),
            target_hits=len(hits),target_denominator=len(cfg['manifest']['targets']),target_names=sorted(hits),
            full_selected_graphs=graphs,all_recorded_graphs=all_graphs,observations=len(obs),path_structures=len(paths),
            **{k:len(v) for k,v in union.items()},wall_seconds=parent['wall_seconds'],cpu_seconds_recorded=progress.get('cpu_seconds',0),
            peak_bytes=max(parent['peak_bytes'],progress.get('peak_bytes',0) or 0),
            evidence_bytes=sum(f.stat().st_size for f in folder.rglob('*') if f.is_file()),
            recorded_queries_lower_bound=query_count,query_accounting_complete=parent['stop_reason'] is None,
            exit_code=parent['exit_code'],stop_reason=parent['stop_reason'],statuses=dict(raw_status),components=dict(component),
            duplicate_programs=raw_status['DUPLICATE_PROGRAM'],duplicate_relation_sets=sum(a.get('selection')=='DUPLICATE_RELATION_SET' for a in progress['attempts']))
        runs.append(row)
    summary=[]
    metrics=('selected','target_hits','objective','heldout_three','heldout_behavior','observations','path_structures','wall_seconds','peak_bytes','recorded_queries_lower_bound','evidence_bytes')
    for t in sorted({r['threads'] for r in runs}):
        for mode in sorted({r['mode'] for r in runs}):
            for strategy in ('random','syntax','semantic','inverse'):
                group=[r for r in runs if (r['threads'],r['mode'],r['strategy'])==(t,mode,strategy)]
                summary.append(dict(threads=t,mode=mode,strategy=strategy,n=len(group),
                    metrics={k:dict(median=statistics.median(r[k] for r in group),min=min(r[k] for r in group),max=max(r[k] for r in group)) for k in metrics}))
    paired=[]
    for r in runs:
        if r['strategy']!='inverse': continue
        for baseline in ('random','syntax','semantic'):
            b=next(x for x in runs if (x['threads'],x['seed'],x['mode'],x['strategy'])==(r['threads'],r['seed'],r['mode'],baseline))
            paired.append(dict(threads=r['threads'],seed=r['seed'],mode=r['mode'],baseline=baseline,
                target_difference=r['target_hits']-b['target_hits'],F3_difference=r['heldout_three']-b['heldout_three'],
                wall_ratio=r['wall_seconds']/b['wall_seconds'],outputs_inverse=r['selected'],outputs_baseline=b['selected']))
    save(output/'runs.json',runs); save(output/'attempts.json',attempts); save(output/'summary.json',summary); save(output/'paired.json',paired)
    for name,data in [('runs',runs),('paired',paired)]:
        with (output/(name+'.csv')).open('w',encoding='utf-8',newline='') as f:
            writer=csv.DictWriter(f,fieldnames=list(data[0])); writer.writeheader(); writer.writerows(data)
    lines=['# 自动导出：全部种子中位数（范围见JSON）','','|线程|预算|策略|输出|目标|F2|留出F3|秒|','|---|---|---|---:|---:|---:|---:|---:|']
    for r in summary:
        m=r['metrics']; lines.append('|'+ '|'.join(map(str,[r['threads'],r['mode'],r['strategy'],m['selected']['median'],m['target_hits']['median'],m['objective']['median'],m['heldout_three']['median'],round(m['wall_seconds']['median'],3)]))+'|')
    (output/'table.md').write_text('\n'.join(lines)+'\n',encoding='utf-8')
    return runs


if __name__=='__main__':
    import sys
    aggregate(sys.argv[1],sys.argv[2])

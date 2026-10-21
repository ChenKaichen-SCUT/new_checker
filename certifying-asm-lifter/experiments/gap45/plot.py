"""Descriptive figures only; no missing values imputed as successful zero cost."""
from pathlib import Path
import json
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from certification.run_pipeline import ROOT


def run():
    b = ROOT / 'experiments/gap45/summary-02'; out = ROOT / 'docs/gap45/figures'; out.mkdir(parents=True, exist_ok=True)
    projects = json.loads((b / 'projects.json').read_bytes())
    fig, ax = plt.subplots(figsize=(8, 4.2), layout='constrained')
    names = [x['project'] for x in projects]; accepted = [x['L2'] for x in projects]
    nonempty = [x['LLVM_occurrences'] - x['empty'] - x['L2'] for x in projects]; empty = [x['empty'] for x in projects]
    ax.barh(names, accepted, color='#287a58', label='L2 accepted')
    ax.barh(names, nonempty, left=accepted, color='#a0a9b8', label='Other nonempty asm')
    ax.barh(names, empty, left=[a+n for a,n in zip(accepted,nonempty)], color='#e4be6d', label='Empty asm')
    for i, x in enumerate(projects): ax.text(x['LLVM_occurrences']+3, i, f"{x['L2']}/{x['LLVM_occurrences']}", va='center')
    ax.set_xlim(0,470); ax.set_xlabel('Frozen surviving LLVM instruction sites (641 total)')
    ax.set_title('Original upstream tasks: L2 coverage; all L3/L4 counts are zero')
    ax.legend(loc='lower right'); ax.spines[['top','right']].set_visible(False)
    for ext in ['png','svg']: fig.savefig(out / ('coverage.'+ext), dpi=180)
    plt.close(fig)
    perf = json.loads((b / 'performance-summary.json').read_bytes())
    fig, axes = plt.subplots(1,2,figsize=(9,4),layout='constrained')
    for ax, case in zip(axes,['merge','conditional']):
        rows = [next(x for x in perf if x['case']==case and x['mode']==m) for m in ['path','static','guarded']]
        med=[x['inner_elapsed_seconds']['median'] for x in rows]
        lo=[m-x['inner_elapsed_seconds']['min'] for m,x in zip(med,rows)]
        hi=[x['inner_elapsed_seconds']['max']-m for m,x in zip(med,rows)]
        ax.bar(['Path producer','Static ablation','Full guarded'],med,yerr=[lo,hi],capsize=5,color=['#367da4','#cc9c40','#287a58'])
        ax.set_ylim(0,0.85);ax.set_ylabel('Seconds; median and min/max, n=5');ax.set_title(case)
        ax.tick_params(axis='x',labelrotation=15);ax.spines[['top','right']].set_visible(False)
        ax.text(1,med[1]+.07,'Unavailable' if case=='merge' else 'Static map exists',ha='center',fontsize=8)
    fig.suptitle('Same objects; full guarded includes independent reconstruction (unequal work)')
    for ext in ['png','svg']: fig.savefig(out / ('controlled-cost.'+ext), dpi=180)
    plt.close(fig)
    # Derived SVG formatting only; never normalize raw experiment evidence.
    for p in out.glob('*.svg'):
        p.write_bytes(('\n'.join(line.rstrip() for line in p.read_text().splitlines()) + '\n').encode())


if __name__=='__main__':run()

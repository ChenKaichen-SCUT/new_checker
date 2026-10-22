"""Static scientific figures from the immutable per-run table."""
from pathlib import Path
from semantic_testing.run import load


def plot(summary,output):
    import matplotlib
    matplotlib.use('Agg')
    import matplotlib.pyplot as plt
    import numpy as np
    rows=load(summary); output=Path(output); output.mkdir(parents=True,exist_ok=False)
    methods=['random','syntax','semantic','inverse']; colors=['#8b98a5','#daa047','#579779','#4569b2']
    metrics=[('target_hits','Requested patterns (of 9)'),('heldout_three','Held-out 3-endpoint patterns'),('wall_seconds','Whole process time (seconds)')]
    fig,axes=plt.subplots(2,3,figsize=(13,7))
    for row,t in enumerate((2,3)):
        for col,(metric,label) in enumerate(metrics):
            ax=axes[row,col]
            for j,(method,color) in enumerate(zip(methods,colors)):
                vals=[next(r for r in rows if (r['threads'],r['mode'],r['strategy'])==(t,mode,method))['metrics'][metric] for mode in ('count3','time12')]
                med=np.array([v['median'] for v in vals]); low=np.array([v['min'] for v in vals]); high=np.array([v['max'] for v in vals])
                ax.bar(np.arange(2)+(j-1.5)*.19,med,width=.18,color=color,label=method,
                       yerr=[med-low,high-med],capsize=2,error_kw=dict(lw=.8))
            ax.set_xticks([0,1],['3 outputs','12s budget']); ax.set_ylabel(label); ax.set_title(f'{t} threads')
            ax.grid(axis='y',alpha=.2); ax.set_axisbelow(True)
            if metric=='target_hits': ax.set_ylim(0,9.5)
    handles,labels=axes[0,0].get_legend_handles_labels(); fig.legend(handles,labels,loc='upper center',ncol=4)
    fig.suptitle('Fixed common grammar, 3 seeds: median and full range',y=.955)
    fig.tight_layout(rect=(0,0,1,.92)); fig.savefig(output/'comparison.png',dpi=180); fig.savefig(output/'comparison.svg'); plt.close(fig)


if __name__=='__main__':
    import sys
    plot(sys.argv[1],sys.argv[2])

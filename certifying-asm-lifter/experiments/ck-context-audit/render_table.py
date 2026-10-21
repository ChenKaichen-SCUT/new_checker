"""Render reviewed judgements alongside independently reconstructed raw facts."""
import argparse
import csv
import io
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]


def outputs():
    facts = json.loads((HERE/'evidence/sites.json').read_bytes())
    assessment = json.loads((HERE/'assessments.json').read_bytes())
    key = lambda r: (r['task'],r['TU'],r['id'])
    rows = assessment['rows']; index={key(r):r for r in rows}
    assert len(index)==len(rows)==len(facts)==15 and set(index)=={key(r) for r in facts}
    text = ['# 全部 15 个 L2 位置审计表', '',
        '固定分母来自原 summary-02 的全部 L2 成功项，未过滤失败上下文。全部最终分类为 **语义范围外**；零个完整域内待接入，零个新认证成功，零个仅因证据不足而无法分类。局部未知条件见六项详审。', '',
        'C 是各原始测试源行，H 是 ck_ec.h 行，L/line 是原始 LLVM 行；均采用一基行号。`tu1` 的六项属于同一个完整双 TU 客户端，不是六个程序。', '',
        'GNU 接口均为两个读写输出 `+m`、`+q`，无独立输入；FAA clobber 为 memory/cc，XCHG 为 memory。LLVM 显式拆为 `=*m,=q,*m,1` 及实际 clobber；完整约束/类型、模块 SHA、原始指令、macro chain、SSA使用和证书身份见 [sites.json](../../experiments/ck-context-audit/evidence/sites.json)。', '',
        '| # | 任务/TU/LLVM位点（函数） | 原 GNU 定义/宏位置 | 指令/位宽 | 实际p0/o1 → 返回SSA | 完整真实调用上下文 | 对象与观察 | 排除条件/层 |',
        '|---|---|---|---|---|---|---|---|']
    csvout=io.StringIO(newline=''); fields=['task','TU','id','function','source_function','template','width','GNU_constraints','clobbers','bindings','result_ssa','context','object','observation','decisive','blocked_layer','classification','interface_evidence']
    writer=csv.DictWriter(csvout,fieldnames=fields,lineterminator='\n');writer.writeheader()
    merged=[]
    for n,f in enumerate(facts,1):
        a=index[key(f)]; loc=f['source_asm_location']; b=f['LLVM_bindings']
        merged.append({**f,**a,'classification':'OUTSIDE_SEMANTIC_SCOPE','semantic_certificate':False})
        origin=f"`{f['source_function']}`; x86_64/ck_pr.h 拼写{loc['spelling']['line']}，宏实例{loc['expansion']['line']}"
        text.append('| '+ ' | '.join([str(n),f"{f['task']}/tu{f['TU']}/**{f['id']}** (`{f['function']}`)",origin,
            f"`{f['source_template']}` / {f['width']}",f"`{b['p0']}` / `{b['o1']}` → `{f['result_ssa']}`",a['context'],a['object']+'；'+a['observation'],a['decisive']+'；'+a['blocked_layer']])+' |')
        row={k:a.get(k,f.get(k,'')) for k in fields}
        row.update(template=f['source_template'],GNU_constraints=','.join(f['GNU_constraints']),clobbers=','.join(f['clobbers']),bindings=json.dumps(b),classification='OUTSIDE_SEMANTIC_SCOPE')
        writer.writerow(row)
    text += ['', '每个原证书路径为 `experiments/gap45/sites-02/<task>/tu-<TU>/<line>/site/interface.json`，同目录 block/llvm-fragment 与 independent 结果逐字核对但未重跑 SMT。原文件在公开 CAS 中，定位清单见 [inputs.json](../../experiments/ck-context-audit/evidence/inputs.json)。', '',
             '32 位 FAA 主候选为第2、3、4、8、10、13项。其他9项均保留完整身份/调用/观察，不把局部 L2 的较宽指令域误认为 guarded 的支持域。CK 64 位逻辑计数的实际FAA增量2/84/2/8来自原实现的编码，并非人为改变输入。', '',
             '所有项另有 native/direct 捕获入口不兼容；这只是 schema 层，未用来替代上表语义排除证据。完整客户端另有原实际Q的 Alloc 导出缺失；三个PR测试虽已有原Q捕获，仍无源循环/宿主的完整对应证书。']
    return {'audit-table.csv':csvout.getvalue().encode(),
            'audit-table.json':(json.dumps(merged,ensure_ascii=False,indent=2)+'\n').encode(),
            '../../../docs/ck-context-audit/03-all-sites.md':('\n'.join(text)+'\n').encode()}


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--verify',action='store_true');a=p.parse_args()
    for name,data in outputs().items():
        target=(HERE/name).resolve() if not name.startswith('../') else ROOT/'docs/ck-context-audit/03-all-sites.md'
        if a.verify:assert target.read_bytes()==data, str(target)
        else:target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(data)
    print('15/15 table rows match the frozen L2 census; judgements remain a static audit, not certification')

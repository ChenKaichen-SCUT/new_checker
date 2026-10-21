# 自动恢复、区域划分与独立组合证书

本轮使用全部值等式，不使用 PD-SAFE 的义务省略或多写者值修复。
算法适用域与证明见 [01](01-model-proof.md)。代码新增于
[composition.py](../../certification/composition.py)，不改原认证器路径。

## 1. 审阅后的关键障碍

| 现有能力 | 尚不能自动推出什么 | 本轮处理 |
|---|---|---|
| L1 的开放 asm/IR 证明 | 实参求值、实际位点和所有调用 | 保留逐静态位点 L2；每个激活重新绑定 |
| L2 的 GNU/LLVM 来源、约束、结果 SSA 和未改框架 | 原 C 宿主及 Q 端点/控制/实例 | 复用严格源/LLVM解释；独立重建 Q 效果摘要 |
| `program_workers` 顺序消费匹配效果 | 单独可审阅/可修改的组合计划与边界完整性 | 新模块分别恢复两侧，再产生计划；核验器不调用 producer |
| 模板证明复用 | 第二个调用的参数/返回值关系和动态身份 | 响应变量按激活/实际读端点区分；所有依赖显式穿越边界 |
| 单个 worker 成功 | main、额外线程、初始化、pthread、全部监视器 | 继续完整 `program_main` 检查和原运行时契约 |
| 局部语义成功 | 同次实际安全/bound 查询及整个源程序 SAFE | 保留 C4；新的 ACTC 标签与原 L1–L4 分开 |
| HCC 声明 | 完整客户端的宿主/循环归纳/编码保证 | 无 provider 仍拒绝；不把声明当证明 |

此前 ITEExpr 缺字段是实际导出器问题；较早的 Dat3M shared-write 转换缺陷是历史
真实反例。它们证明需要实际对象检查，但不能自动证明本轮有新算法或新上游缺陷。
旧证据、原定理和源语言并发冲突排除都保留。

## 2. 生产候选与核验分离

```text
GENERATE(raw P/AST/L/L'/Q, phi):
  validate existing origin/interface/L1/L2 and strict source/LLVM adapters
  enumerate SOURCE create occurrences and all calls in each worker
  identify actual threads by create.spawned_thread/start.creator/argument
  recover Q effect sequence independently of source operation kinds/counts
  abstract every pure def-use DAG using fresh read responses
  propose complete order-preserving typed unit map (rank matching in D_AC0)
  cut after each effect unit; keep both RMW endpoints in one unit
  compute both-side crossing read-response dependencies and typed ports
  serialize bindings, maps, region membership, actual-node census and ports

VERIFY(raw artifacts, proposal):
  reopen source capture; rerun origin/L1/L2/host checks; reconstruct L'
  reopen identical actual same-run Q; independently repeat fact recovery
  validate total source activation census and actual creator linkage
  check total ordered bijections and contiguous disjoint region partitions
  independently derive ALL cross-boundary ports/edges from both sides
  compare derived boundary with proposal; reject any missing/extra claim
  prove ALL region field equalities for arbitrary typed inputs/responses
  check all main/init/runtime/worker events and all monitor identities
  bind actual property/assumption/query stacks and safety/bound results
  release only the appropriate transfer or conditional-safe result
```

该验证器可接受不同的有效连续分区，既不要求与 producer 默认分区相同，也不
依赖 producer 正确性。受控检查包含“每个效果一区”和“每个 worker 合为一区”。
这检验接口分离，但不把这种分区自由度包装为独立创新。

## 3. 摘要与边界到底包含什么

实际 Q 解释器顺序读取 Local/Load/RMWStore/Assert/annotation；地址、值、ITE、
类型和依赖均由原独立解释器处理。每次写寄存器使用当时定义，保存事件版本。
不从 LLVM `%name` 猜 Q 名，不使用 Q 的 source 行号决定区域身份。未知事件、
额外控制/标签、未闭合 pair 或共享效果出现在 pair 内均拒绝。

普通读是一个效果单位；FAA 读/写及中间纯节点是一个不可拆单位；断言是一个
单位。前面的纯节点归入下一单位，末尾纯节点归入最后单位。实际全部节点恰被
分区；独立事实来自原始节点，不来自候选 JSON。SSA 纯表达式可以改变树形，
只要总的类型化语义义务成立。源 if→LLVM select→Q ITE 使用任意读响应上的等式，
不以固定输入取值或实际安全模型解释分支。

跨区域接口使用响应端口，不强制两个阶段中间寄存器同名或逐节点相等。例：
第一次 FAA 返回 u，第二次写 `v + (seen==2 ? delta+u : u)`，则第二区域输入
包含 u、seen、delta；v 是该区域自身的新响应。输出是否跨界由实际后续用途决定。
第一调用证书不能被第二调用复用为实例证书；二者可复用同一个 L1 模板。

边界证书的可序列化结构为 `actc-plan-v1`：

| 字段 | 核验规则 |
|---|---|
| binding | 源、捕获收据、L、L'、完整 Q、run、全部用户断言、固定 CAT 哈希 |
| activations | 源 create index 与实际 ThreadCreate/ThreadStart 的双向关系；完整且无重用 |
| pairs | 全部 source unit→实际 Q unit 的有序双射；种类、宽度、每个字段另证 |
| regions.source_units | 非空、连续、不交叠、完全覆盖；不能割裂 RMW |
| actual_nodes | 从原始 Q 恢复的区域全部节点；不能漏死 Local/annotation |
| input/output_ports | 从两侧表达式的实际自由读响应重建，须完整且类型一致 |
| crossing_dependencies | 两侧跨区域依赖的并集；不能仅检查源依赖 |

SMT 义务名称携带线程、源操作身份、实际 Q 单位及字段；`facts.json` 给出对应
LLVM 位点和源调用上下文。SAT 的开放响应模型定位的是某个普遍对应义务失败，
**不是自动得到全局合法源缺陷执行**。后者还需 rf/co/运行时及源回译证据。

## 4. 前提—实现对应与可信边界

| 证明前提 | 实现 |
|---|---|
| F0 实际对象/来源与完整静态范围 | 原 `authenticate_capture`、`prepare_ports`、`prepare_scope`；新 driver 绑定完整 Q 和重建候选 |
| F1 开放本地语义及 C/LLVM | 原 `TemplatePool`、`translate_all`、`prepare_property_source`；后者仅复用纯分支语义，不调用 PD 省略器 |
| F2 Q 类型/真实 pair/A/因果事实 | 新 `q_units`、`recover`；原 `basic_event`、`core_expr`；每个未消费节点拒绝 |
| F3 独立完整映射和边界 | 新 `dependencies`、`boundary`、`check`；读取原始事实，不信候选摘要 |
| F4 全部值等式 | 新 `check` 逐字段调用原 `Obligations`；SAT/UNKNOWN/timeout 均拒绝 |
| F5 全图与查询 | 原 `program_main` 全分区、`check_queries` 原样复用；Gamma_runtime/encode 等仍外部 |

源/LLVM 前端仍有签名/声明初始化/有限 main 等限制，runtime 仍是固定后端协议。
新模块没有消除这些已审计模板，不声称一个通用 C/跨过程分析器已经落地。
实现增加 `Gamma_check` 覆盖的代码量；不新增语义 Gamma，不声称 TCB 更小。
捕获、源码语义、ISA 桥、运行时、编码和求解器未被本轮机械证明。

原查询 API 的内部 `D2_OPEN_HOST_EXACT` 标记仅用于消费已经完整检查的 main/
监视器事实；公开结论是 ACTC 自己的定理和标签，不能把带纯分支的输入重标为
原 D2/L4。历史静态捕获重放仅报告 `ACTC_BOUND_SAFE_REPLAYED`，不另签新 SAFE。
新运行只有正常构建且所有检查成立才报告 `ACTC_CONDITIONAL_SAFE`。

## 5. 已知范围与拒绝

该引擎可恢复当前直线效果域的完整关系，生成完整可审阅的组合计划，但没有
扩大原 source adapter 接受的语言。没有算法处理任意事件删除/移动、未知别名、
任意宏来源歧义、条件共享事件、CAS、用户 fence、循环或一般调用图。
这些对象的拒绝不是翻译错误的证据，更不能由测试通过暗中改变适用域。

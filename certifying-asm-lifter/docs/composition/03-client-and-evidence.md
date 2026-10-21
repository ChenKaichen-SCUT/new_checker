# 实际对象验收、历史问题与完整 CK 客户端

范围在首次运行前固定于 [主验收清单](../../experiments/composition/final-01/fixed-cases.json)。
仅三个新 Clang/Dat3M 正常构建输入、少量历史实际受控故障重验及独立证书攻击。
不是覆盖率/性能实验。没有修改 CK 接口、客户端、已有基准或后端。

## 1. 新鲜真实端到端运行

原始 `ck-workers.c`、`ck-hcc-branch.c`、`ck-workers-unsafe.c` 均未修改。
每个重新由固定 Clang 21.1.8 同次生成 AST/LLVM，保留依赖和原始命令；实际 L'
经 Clang 验证后交给固定 Dat3M。最终完整 Program 来自该次求解的 before/after
encoding 捕获，对象相同；安全查询、bound 查询和 assumption 绑定均重新检查。

| 实际输入 | asm 动态实例 / 默认区域 | 实际结果 | 正确解读 |
|---|---:|---|---|
| [两个不同 worker](../../experiments/composition/final-01/workers/composition-certificate.json) | 2 / 6 | ACTC_CONDITIONAL_SAFE | 新 ACTC 定理及原八项 Γ 下，完整对应和同次安全/bound 结果成立 |
| [两调用、纯分支、活跃依赖](../../experiments/composition/final-01/branch/composition-certificate.json) | 4 / 14 | ACTC_CONDITIONAL_SAFE | 每次调用独立，if→select→ITE 的开放等式及跨区域端口完整 |
| [不安全性质变体](../../experiments/composition/final-01/unsafe/composition-certificate.json) | 2 / 6 | ACTC_QUERY_SAT_NO_SAFE | 转换对应成立，实际安全查询 SAT；不签 SAFE，也不据 SAT 自动签源反例 |

分支程序中边界输入端口计 18 次引用；这不是 18 个独立源输入，也不是成本优势。
区域数包括普通读取和用户断言，不能当作 asm 数。所有条件式结论继续列明八项 Γ。
旧 D2/分支/P0 标签没有改写；本轮公开标签与 L1–L4 分离。

## 2. 受控故障及定位

以下 Q 都是**历史真实后端受控故障捕获**，本轮没有手写事件替代实际对象。
本轮重新生成候选/证明；原记录与其查询原样保留。拒绝原因和当时后端文本见
[审阅结果](../../experiments/composition/evidence-review.json)。

| 故障 | 检查器结果 / 定位 |
|---|---|
| 交换返回值 | `thread-1-a0-u5-Q-53-condition` 开放语义 SAT，保存模型 |
| 丢失跨调用普通共享读 | 两侧完整效果清单不同，候选无法完成；独立核验也另测拒绝 |
| 某 worker 遗漏一个调用 | 同上；不能用其他激活的证书替代 |
| ITE 条件/分支错误 | `thread-1-a0-u3-Q-47-write_value` SAT |
| 单独丢失 A 标签 | 实际读标签检查拒绝，配对没有代替原子标签 |
| 实际安全 assumption 错绑 | 转换关系仍 EXACT，`actual-safety-assumption-binding` 失败，SAFE 关闭 |
| [入口 SSA 错绑](../../experiments/composition/supplement-01/entry-ssa/composition-certificate.json) | `thread-1-a0-u1-Q-44-write_value` SAT |
| [单独丢失 RMW 标签](../../experiments/composition/supplement-01/rmw-tag-only/composition-certificate.json) | 真实标签检查拒绝；与 A-only 分开 |

这些不是新上游缺陷，也不因当时后端 PASS 而改变结论。SAT 模型说明开放对应
义务不普遍成立；若要宣称一个新的全局合法源缺陷，还需证明该开放赋值可由统一
rf/co 与宿主实现。本轮没有这样的新真实缺陷主张。

## 3. 独立证书核验与正向接受

[针对性测试](../../tests/test_composition.py)最终 **17 passed**，
[完整输出](../../experiments/composition/unit-commands-02/000.stdout.log)与
[原始输入、证书及 SMT](../../experiments/composition/unit-raw-02)保存。

测试覆盖有效的逐效果分区及有效的整 worker 合并分区；漏边界端口、漏依赖、
漏实际节点、漏调用/worker、错映射；单因素值、A、pair、ITE 条件错误；仅删除
Q 行号提示仍可通过 worker 对应。后者是**有标记的对象变异单元检查**，没有
绕过捕获/查询绑定将变异 JSON 宣称为新的实际 Q 或 SAFE。

另把四份历史实际故障 Q 直接送入独立核验器并提供旧良性计划，完全不运行候选
生成器，均拒绝。这区分了“候选生成失败”与“独立 Checker 能阻止错误计划”。
实际正常端到端运行使用的是原样捕获，没有用这些变异副本做正向认证。

所有语义证明义务仍逐字段检查；区域合并没有减少必须成立的方程。17 个测试不是
数学证明或覆盖率估计。未运行完整旧实验套件；生产旧文件不变另由静态 seal 检查。
`development-01` 和 `unit-commands-01/unit-raw-01` 保留为开发记录，最终以
`final-01`、`supplement-01`、`unit-commands-02/unit-raw-02` 为准。

独立证据审阅检查 11 份运行记录、**960 个 SMT 引用哈希**、实现快照、完整 Q
分区、原八项 Γ、候选/原始 Q/查询绑定；这不是对 960 条数学结论的独立证明证书
内核验证。具体方程由既有 SMT 求解器检查，仍属于 Gamma_check/Gamma_solve。

## 4. 冻结完整 CK 客户端：哪些障碍真的解除了

复核对象仍是 CK `8f0847cfe57b1479d8e63b89028831d94d0e4d26` 的完整 event-counter
smoke-test：原始 `regressions/ck_ec/validate/ck_ec_smoke_test.c` 和 `src/ck_ec.c`。
固定 113 个 LLVM 存活 asm（80+33）不变；8 个指令族候选、既有 6 个 L1/L2，
完整客户端 L3/L4 仍 **0/1**，本轮 ACTC 也是 **0/1**。
原始源码、两个 TU、AST/LLVM/config 和依赖未删改；没有新编译或伪造客户端 Q。

[本轮静态复核](../../experiments/composition/client-review.json)记录各原始文件哈希、
全部位置清单核对和源码障碍行。AST 循环统计包括头文件内联定义，**不当作运行
激活次数**。具体障碍包括：

| 位置/对象 | 所需条件 | 本轮是否解除 |
|---|---|---|
| tu0 `source.c:319,337,365,383` 等 helper 中的 create，main 调多个测试上下文 | 一般跨过程创建/返回/生命周期摘要；当前只支持受限直接 main census | 否 |
| tu1 `source.c:149,334` 的等待/回退循环、`176` 的时间条件 | 对所有有限错误前缀成立的归纳接口和不截断查询保证 | 否 |
| tu1 `source.c:281,304` 的 ops callback、predicate 回调 | 完整间接调用目标及副作用摘要，不能以观察到一次调用代替 | 否 |
| tu0 `source.c:47,69,78,98` 等 futex syscall | 已验证或明确适用的系统调用/等待/唤醒契约 | 否 |
| struct counter、局部对象、低位指针转换及混合操作族 | 对象/别名/生命周期/宽度证明及完整效果语义 | 否 |
| 未提供完整链接客户端的实际最终 Q 和查询 | 真实全图、完整模型及捕获/属性证明 | 否 |

自动边界引擎解决的是已进入受限适配域后的可审阅计划构造；它不会产生缺失的
Q，也不使尚未解释的宿主语义自动成为总函数。因此没有解除这个完整客户端的
关键 L3/L4 前提。准确结论不是“Dat3M 永远不能导入它”，而是本轮没有获得能
满足定理前提的完整输入及证据。继续逐条硬编码这个客户端不属于交付成果。

## 5. 历史真实缺陷与新发现的区分

[原始 Dat3M asm 副作用丢失复现](../11-dartagnan-reproducer.md)仍是历史真实结果：
固定后端在不支持原 asm 时只生成返回 nondet 而丢共享写。它未使用本轮新捕获
协议，所以本轮没有把旧打印 IR 手工转换成 Q 再声称重新认证。完整效果清单
条件从逻辑上会排除这种缺失，但本轮的实际对象负验收是上述受控故障。

ITE 导出缺字段是历史捕获组件缺陷，已经由先前轮次修补。本轮新发现真实上游
缺陷数为 **0**；历史真实问题、人工故障和候选证书攻击分别报告。

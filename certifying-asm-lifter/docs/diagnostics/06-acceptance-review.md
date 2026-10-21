# 最终验收、证明—实现对应与独立结论

基线 `3c67f7b`；固定 Clang 21.1.8、Dat3M
`b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8`、原 TSO CAT 与只读实际 Program
导出构建。未改旧认证器、上游 CK、历史证据、E2E-SAFE 或八项 Γ。

## 1. 固定范围与实际对象

首次运行前固定 13 项分类；最初入口适配失败保留。恢复授权后的
[acceptance-02](../../experiments/diagnostics/acceptance-02/fixed-cases.json)
产生两次实际 Clang 同次 AST/LLVM、三次实际 Dat3M 求解。
最终诊断代码增加对象不重叠条件后，使用同一批原始对象生成
[final-03](../../experiments/diagnostics/final-03/results.json)，没有另造近似 Q。
其余 10 项是明确标记的历史实际 Program 重验，不记为新后端运行。

实际后端前后快照、run ID、LLVM 哈希、固定构建/CAT 哈希、完整查询审计及
stdout/stderr 均保留。后端代码中捕获钩子只读，三个新运行没有故障注入。
原始 `benchmarks/backend-source.c` 字节未变；EXPECT 由原有编译宏区分性质。

| 新运行 | 实际安全查询 | 实际 bound 查询 | 后端文本 | 新开放诊断 |
|---|---|---|---|---|
| 原始 asm，EXPECT=2 | SAT | 求解流程没有发起 | FAIL | DIFFERENCE：两个 worker 各缺 R32/W32 |
| 同源码经 Lifter，EXPECT=2 | UNSAT | UNSAT | PASS | EQ：两个 worker 各完整对应 |
| 原始 asm，EXPECT=0 | UNSAT | UNSAT | PASS | DIFFERENCE：两个 worker 各缺 R32/W32 |

[实际查询清单](../../experiments/diagnostics/review-04/actual-query-inventory.json)
如实保留未运行的 bound 阶段，不补造 UNSAT。上述查询只说明该实际 Q 的求解
情况；没有自动核验这些新 direct 样本的完整宿主转移，故不释放程序 SAFE。

## 2. 全部结果和同对象对照

| 案例 | 来源类别 | 最终诊断 | 同 Q 的旧 ACTC |
|---|---|---|---|
| raw-safe / raw-unsafe | 已有真实上游缺陷的新回归 | 端点计数开放差异 | 旧 ACTC 不是 raw asm 诊断入口；不宣称旧系统漏报 |
| lifted-control | 无注入的相同源正向控制 | 开放等价 | 本项不作 ACTC 比较 |
| branch-good / workers-good | 原始 CK 例程 + 自建受控宿主 | 开放等价 | 两项原有条件式结果重放通过 |
| return | 历史实际后端人工故障 | 共同开放反例，后续 monitor 条件差异 | 拒绝相同条件义务 |
| missing-read / missing-call | 历史实际后端人工故障 | 读/写 sort 缺额；不指定唯一丢失发生 | 拒绝效果数量 |
| condition | 历史实际后端人工故障 | 后续写值差异 | 拒绝写值义务 |
| atomic-A | 历史实际后端人工故障 | 标签差异 | 拒绝 Q 读标签 |
| entry-ssa | 历史实际后端人工故障 | 写值差异；不声称自动唯一归因到入口代码 | 拒绝写值义务 |
| ite-export-history | 历史导出组件缺陷 | CAPTURE_UNKNOWN，给出不完整字段路径 | 拒绝不完整捕获 |
| query-binding | 历史查询人工故障 | worker 开放等价，查询不在比较域 | 拒绝 actual-safety-assumption-binding |

[同对象完整对照](../../experiments/diagnostics/review-04/comparison.json)
与 [24 份核验结论/诊断前沿](../../experiments/diagnostics/review-04/claims.json)
记录实际路径、哈希与失败原因。未输入故障位置、目标事件映射或故障类别作为
匹配约束；`evidence_origin` 只是预先固定的报告元数据，不参与诊断计算。

**没有发现基线不能拒绝的新错误类别。** 原始副作用丢失过去已有人为和旧链
证据，本轮增量是自动生成绑定实际 Q 的端点缺额证据。对人工返回/操作数故障，
新诊断的字段与旧失败字段一致；不能把更详细输出或共同模型称作独立定位创新。

## 3. 证明与独立检查的一一对应

| 充分条件/引理 | 当前实现 | 必须保留的边界 |
|---|---|---|
| 受限 GNU 接口和真实 LLVM 来源 | 原 prepare/load_front；新 direct_front | 复用旧强来源/有限宿主域；不是任意 Clang 正确性 |
| 同次实际 Q 与实际导入 LLVM | bind_actual、backend receipt、before/after、run_id | 哈希证明身份，捕获真实性仍依赖原工具契约 |
| 完整开放摘要 | objects.source_graph / q_graph | 完整消费被声明 worker 的 body 和协议；不等于全 Q 宿主检查 |
| 源合法对象域 D | matching.domain | 源常对象自然对齐、非空且区间不重叠；目标不能缩小 D |
| 所有类型对应 B 完备 | 生成器 DFS；核验器分组排列 | 512 上限；超限 UNKNOWN，不得在部分候选上判差异 |
| 每一 E_m 的字段、po、pair、A | constraints、独立重建输入 | 共享公式 kernel 仍需审阅；未机械证明 Python |
| EQ 全称义务 | D ∧ ¬E_m 的 UNSAT、核验器重新求解 | 只支持无条件有限公共端点；纯 ITE 值可支持，条件共享事件不可 |
| DIFF 共同见证 | D ∧ ∧m ¬E_m；重建后逐候选求值 | 开放响应可在完整程序不可达；不颁发可执行缺陷 |
| 结构差异 | 双侧完整 sort census、不重复实例 | 无候选并不唯一确定删除位置；不把未知提取当空体 |
| 诊断前沿 | 全候选非全称义务集合的最小值、交/并集重算 | 成本模型内保证；不等于唯一编辑/编译 pass/根因 |
| 实际查询绑定 | 原 ACTC/P0 query checker 单独复用 | 新 detector 不检查完整查询，EQ 不授权安全 |

源对象域补充证明：各完整对象起点由源接口固定，宽度只能为 32 或 64，令
对象长度为相应字节数。源约束给非零、自然对齐与两两区间分离；端点用 65 位
整数对应的零扩展 BV 加法计算，因此不发生 64 位环绕。长度整除地址空间且
起点自然对齐，最大合法起点加长度不超过 2^64。每个已检查有效源对象布局满足
这些条件，故 D 不排除合法源入口；目标字段从未参与 D 的构造，错误目标不能
通过缩小域藏匿反例。未知地址/别名/宽度不满足常对象摘要前提时拒绝。
这里的数值布局与响应仍是开放模型参数，不能代替实际程序的初始化/可达性证明。

[01 的解析证明](01-model-proof.md) 与 [03 的退化/guarded 设计](03-collapse-and-guarded-design.md)
仍与测试分开：guarded 模型的摘要完整性、条件定义使用和活跃覆盖仅有条件式
解析推导，未落地为真实提取器。本轮不将这些未实现条件转移成新增 Γ。

## 4. 核验和复现

[最终核验摘要](../../experiments/diagnostics/review-04/summary.json)：
13 项固定分类全部符合预期，24 个 worker 结论经重新提取和独立核验；
2,434 个 SMT 义务引用全部核对，1,771 份不同原始查询字节重新求解结果一致。
共享模板义务仍按每条引用登记，只有字节相同才复用此次重求解结果。
[完整 SMT 记录](../../experiments/diagnostics/review-04/smt-replay.json) 包含每个
文件/引用/哈希/状态，不能把这些具体 UNSAT 当普遍证明。

[最终测试输出](../../experiments/diagnostics/unit-02.stdout.log)：22 项新测试 +
17 项原 ACTC 回归 = 39 通过。新测试包括纯运算重排正例、错误值/返回/次序、
缺失/额外端点、独立 A/配对、宽度、对象分离、候选截断、模拟 UNKNOWN、证书
篡改与不完整捕获；合成代数测试和内存中修改的 JSON 不算真实后端故障。

在项目根目录、已安装固定工具的原环境中，用新输出目录运行：

```powershell
D:\python\python.exe -m experiments.run_diagnostic_acceptance --out experiments/diagnostics/reproduce-new
D:\python\python.exe -m experiments.run_diagnostic_acceptance --out experiments/diagnostics/replay-new --reuse experiments/diagnostics/acceptance-02
D:\python\python.exe -m pytest tests/test_diagnostics.py tests/test_composition.py -q
```

单个案例另有 `reproduce.json`：包含真实 capture/backend 路径、raw/lifted 路由。
SMT 模型和失败义务在每个 `thread-*/diagnosis`，独立核验在
`thread-*/independent/witness`，源位点/调用/LLVM 行与目标实际事件在 `graphs.json`。
不必手填事件映射；这些摘要本身不是核验输入的权威来源。

## 5. 独立结论

已证明的是受限开放摘要上的条件可靠性、候选完备性、诊断成本模型保证以及
总序退化；已实际核验的是上述固定对象。实际源语义、捕获/运行时/后端编码与
求解器仍依赖原适用契约。没有新的端到端安全定理、闭合反例或新上游缺陷。

未改完整 CK 客户端依旧缺真实 Q/宿主摘要，不能完成端到端差异搜索；原 113 个
位置的分母和旧 6 个 L1/L2 保留。TInA/VALID/Alive2 等仅进行机制比较，未实测
它们，不用“不支持 Dat3M”代替算法胜负。当前无法证明实质新机制或检测增量，
故独立算法与 ISSTA 完整实验为 **No-Go**。保留诊断原型，发布后停止等待审阅。

# 第二轮受控验收：活跃输出、CAS 与真实库接入

日期：2026-10-20。结论：**里程碑 1、2 在明确受限范围和外部可信前提下通过；
里程碑 3 的原始 Concurrency Kit 接口被拒绝，尚未达到第三方例程认证目标。**
五个单因素真实后端错误均被拒绝。没有进行 SV-COMP、批量性能评测或增加 asm
指令族；本轮到此停止。所有 `program_verdict_eligible` 均为 `false`。

这不是整程序形式化正确性结论，也不是独立方法创新性确认。
此前[最小验收](13-minimal-acceptance.md)的原始材料保持不变。

## 1. 本轮对象与结果

| 输入 | 实际对象与检查结果 | 边界 |
|---|---|---|
| [live-output.c](../benchmarks/live-output.c) | 两个真实 worker，`lock xaddl` 的旧值进入后续 `__VERIFIER_assert(delta != 2)`；接口、块、实际 LLVM、区域、活跃输出、断言条件与全部实例通过 | 只支持受限直线断言后继，不支持任意宿主 CFG |
| [cas-success.c](../benchmarks/cas-success.c) | 一个真实 worker，初值 0、expected=0、desired=2；条件写、A、真实配对和活跃旧值通过 | 固定 Clang/Dat3M/TSO 条件 |
| [cas-failure.c](../benchmarks/cas-failure.c) | 一个真实 worker，初值 1、expected=0、desired=2；失败读取和输出保留，条件写不执行 | 未进行独立失败排序 litmus 实验；排序由标签检查和既有 CAT 引理保证 |
| [live-unsupported.c](../benchmarks/live-unsupported.c) | 真实输出控制额外共享写；拒绝 LLVM `br` 后继 | 没有跳过宿主分支或把该程序记为认证成功 |
| [ck-live.c](../benchmarks/ck-live.c) | 调用原始头文件 `ck_pr_faa_32`；真实 AST/LLVM 已保存，接口检查拒绝 | 没有转换或运行 Dat3M；第三方目标未达标 |

固定编译器为 Ubuntu Clang **21.1.8 (6ubuntu1)**；Dat3M 上游固定为
`b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8`。正例继续使用原最小验收的
只读导出构建 `minimal-acceptance/build-03`，其 JAR SHA-256 为
`2cff74ed089a3f28a434a9446331755c3a738ebb99c1d080195e53d84d70126e`。
负例使用独立、显式标记的故障构建，生产入口拒绝将该构建当作正例构建。

原始运行分别保存在
[live-01](../experiments/controlled-round/live-01/acceptance.json)、
[cas-success-01](../experiments/controlled-round/cas-success-01/acceptance.json)、
[cas-failure-01](../experiments/controlled-round/cas-failure-01/acceptance.json)。
代码审阅后，对**相同原始对象**重放局部检查，得到
[最终复核](../experiments/controlled-round/reviewed/summary.json)。
该复核没有重新编译源程序、重新处理后端或替换任何快照。

每次原始运行均保存源文件、真实 AST、完整原始 LLVM、候选 IR、实际替换片段、
完整候选 LLVM、Clang 全模块语法验证、模型文件、后端日志、同次编码前后快照、
实际后端 SMT 与各层检查义务。`validated.bc` 只是语法验证副产物，不是后端输入，
不随 Git 分发。实际后端始终接收记录 SHA-256 的 `candidate.ll`。

## 2. 活跃输出的自动对应为何不是手填映射

原 GNU 输出位置由约束解析确定；真实 LLVM 的单个返回 SSA 由实际调用确定。
随后从真实区域 RegWriter 集合与全部区域外 RegReader 集合求交，要求活跃输出
恰有一个同宽寄存器。程序没有接收用户提供的名称，亦没有利用 `r`+SSA 名称推定。
候选对应还必须通过对所有入口状态和开放读取值成立的输出等式。

活跃 xadd 的原 LLVM 输出为 `%2`，两个实际 worker 的输出寄存器均为
`rcert_150e328a9c7e_0`（分别属于不同线程）。CAS 的实际寄存器却是
`LlvmCmpXchg.oldValue#1`。这两个名称来自实际对象，不是硬编码规则。
对应的 xadd 区域为线程 1 的 E43–E44、线程 2 的 E56–E57；
两个 CAS 程序的区域均为各自运行中线程 1 的 E27–E30。

仅证明区域出口值还不充分。新增的
[continuation.py](../certification/continuation.py) 独立解释**原始 LLVM 后继**
和**实际核心后继**，以同一个新鲜值表示已证明相等的输出，逐个证明断言条件
等价；其余寄存器保持独立符号。它还检查断言数量、运行时前后缀和所有未消费事件。
任何未识别指令、额外用户共享操作、假设或跨区域分支都拒绝。

另有 SAT 义务检查输出确实能改变断言条件，排除“形式上使用、实际上恒真”的
假活跃用例。因此不能以“所有义务 UNSAT”作为本阶段的判据。最终复核中：

| 正例 | 等价/结构相关 UNSAT | 活跃性 SAT | 说明 |
|---|---:|---:|---|
| live-output | 32 | 2 | 每个实际 worker 各一项活跃性检查 |
| CAS success | 22 | 1 | 包含条件写存在性与出口输出 |
| CAS failure | 22 | 1 | 同样检查任意读取响应，而非只代入初值 |

这些数量仅是实现执行记录。充分性来自
[C-live 的归纳证明及前提](revision/06-live-continuation-proof.md)，仍未完成
证明助手中的实现精化。

## 3. 真实 CAS 的成功、失败与排序

两个原始程序均通过 `"+a"` / `"+m"` / `"r"` 的实际 GNU 接口恢复。真实最终对象为：

```
E27: Load x -> LlvmCmpXchg.oldValue#1       tags A,M,R,RMW
E28: if NOT(old == 0) goto E30
E29: RMWStore x <- 2                       tags A,M,W,RMW; loadEvent=E27
E30: Label
```

对象中始终存在静态写节点 E29，不能把它误报为失败执行中发生了写入。DAG 检查
证明其执行守卫恰为 `u=0`，读取存在性为真，输出为 `u`，真实配对指针为 E27。
成功与失败两个逻辑分支的论证见
[CAS 定理实例化](revision/07-cas-and-related-work.md)；没有改动参考语义。

关于两个程序为何分别对应成功/失败，还需与实际初始化联系：
已保存对象中，对 x 的写只有初始化 E39 和该 CAS 的 E29；主线程 E17 是读取。
在既定 TSO 模型的读取来源与 `po-loc|rf` 无环条件下，E27 不可能读取位于其后的
E29，否则形成 E27→E29→E27 环。因此任何到达该 CAS 的执行必须读初始化值。
初值 0 时守卫成立；初值 1 时守卫不成立且 accumulator=1。这个论证依赖已声明的
内存对象隔离、模型和运行时前提，不依赖后端 PASS，也不主张一个 PASS 结果就是
具体执行轨迹或程序终止证明。

失败时 E27 仍带 A。既有 TSO 引理保留前置 W→E27 的 `implied` 边，
以及 E27→后继内存操作的 `po-tso` 边，即使 E29 不执行。
本轮没有用经验上的“断言没出错”替代这项排序论证，也没有宣称覆盖其他 ISA、
缓存类型、任意内存对象或泛化的 LLVM 并发语义。

## 4. 单因素故障的隔离与检测

故障发生在同一个实际 Program 上，位置是后端预处理之后、静态分析和编码之前，
从而避免使用变异前的过期分析。保存 `pre-fault`、`post-fault`、
`before-encoding`、`after-encoding` 四份真实对象导出。后三者完全一致；
前两者逐字段比较，确保只改变指定因素。

| 故障 | 实际改变 | 其他关键条件 | 拒绝位置 | 后端自身结果 |
|---|---|---|---|---|
| a-only | 只移除 CAS 读取的 A 标签 | RMW 标签、配对、guard 和值不变 | 端点标签检查 | **PASS** |
| pair-only | 一个 RMWStore 的真实 loadEvent 改指另一 worker 的读取 | A、地址、值、guard、线程数不变 | 配对不在本区域 | FAIL |
| guard-only | 只取反 CAS 的 CondJump guard | 目标标签、端点、配对、输出不变 | `endpoint-1-presence` SAT | FAIL |
| live-use-only | 只取反后续实际断言条件 | asm 区域及输出对应不变 | continuation 条件等价 SAT | FAIL |
| omit-instance | 删除第二个 worker 的两个 asm 端点 | 原 LLVM 全字节、线程、ThreadCreate、首个实例、运行时前后缀不变 | 实例消失检查 | FAIL |

最后一例使用原 `backend-source.c` 的已认证候选文件，没有改变第二个
pthread_create 或 worker 函数名。删除事件必需的唯一邻接后继改动单独记录，
不算另一种语义错误。配对错误是刻意构造的无效跨线程配对，仅用于证明配对
检查确实能拒绝，不能据此断言已有真实后端会产生这种错误。

每个变异前实际对象都由同一个检查器通过；变异后拒绝。
完整隔离差异、义务和日志见
[single-factor](../experiments/controlled-round/single-factor/summary.json)。
其中 A-only 清楚表明后端 PASS 不能替代转换契约检查。
这些结果只验证检测能力，不是正确性证明，更不是全面故障覆盖率。

## 5. 第三方例程：真实输入成立，自动认证未成立

选择 [Concurrency Kit](https://github.com/concurrencykit/ck) 的提交
`8f0847cfe57b1479d8e63b89028831d94d0e4d26`，使用原始
`include/gcc/x86_64/ck_pr.h` 的 `CK_PR_FAA` / `CK_PR_FAA_S(32, uint32_t, "xaddl")`。
保留 `uint32_t (uint32_t *, uint32_t)`、`"+m" (*(C *)target)`、`"+q"(d)`、
原始 clobbers 与宏展开；只增加调用该 API 的宿主验收程序。
所有上游文件按 Git blob ID 校验；构建前后原文件不变。

[真实编译记录](../experiments/controlled-round/ck-admission-05/compiler-receipt.json)
保存 39 个实际依赖及其原始字节、AST、LLVM。最终 LLVM 中唯一的非空 asm 为
`lock xaddl $1, $0`；所选函数的 AST 类型保留 typedef 与 canonical type。
诊断发现 AST 有 188 个 GCCAsmStmt，所选 asm 的起止位置均有
`spellingLoc` / `expansionLoc`，其内存操作数还有原始类型转换。

生产接口检查首先以“要求一个 GCCAsmStmt”拒绝；单独诊断所选节点时，
直接位置读取器同样以“macro-expanded source location: unsupported”拒绝。
诊断选择没有被当作接口证明，也没有过滤 AST、手写返回映射或把宏改成直接 asm。
所以[最终拒绝](../experiments/controlled-round/ck-admission-05/admission.json)
发生在前端，后端没有运行。多头文件/宏/内联实例的来源认证仍是实质性缺口。

接入过程还暴露了可复现环境问题，失败记录均保留：
Clang 本地解包原来缺少资源头文件；现补入同版本
`libclang-common-21-dev 1:21.1.8-6ubuntu1`，按 Ubuntu 元数据 SHA-256 校验，
没有更换编译器。CK 原 configure 对带空格构建路径处理失败，使用记录在案的
无空格符号链接运行原脚本解决，没有修改上游代码或配置头模板。
原始失败不能与最后的语义接口拒绝混为一谈。

## 6. 五项验收标准与可信边界

| 标准 | 实现证据/证明依据 | 仍未由本实现证明的部分 |
|---|---|---|
| 真实且在主张范围内的输入 | 实际 source/AST/LLVM 交叉匹配、类型、约束、clobbers、固定依赖与版本；CK 因超出范围拒绝 | Clang 对 GNU C/asm 的前端语义正确性 |
| 对象确为实际转换结果 | 候选完整字节、帧不变、JAR/model 哈希、同 JVM Task/Program 身份和编码前后相等；故障前后实际对象 | OS、构建过程、导出器与捕获记录的真实性/正确性属于 TCB |
| 条件足以对应定理 | H/L/V/D/R/T/C 加 C-live；逐条消费原 LLVM 后继、解释真实节点、输出等式和断言等价 | 实现没有机械精化证明；定理是受限模型的条件式逻辑证明 |
| 不绕过未满足前提 | 没有 caller 输出投影参数、未知形式拒绝、断言真值不参与等价证明、正例入口拒绝故障构建、程序 gate 关闭 | 编译器/普通宿主/pthread/join/断言编码仍不是本检查器验证的转换 |
| 不支持时可靠拒绝 | 解析器白名单与默认拒绝；真实宿主分支、原始 CK 宏接口、五个隔离故障均拒绝 | 有限负例不能证明所有实现路径无漏洞；需要后续独立审计/实现精化 |

新增代码没有被自动当成前提保证。此次审阅特别核对了：候选寄存器发现与等价
证明分离；后续断言独立解释；没有借用程序断言作为证明假设；外部读取无漏计；
实际运行时前后缀的精确形状；CAS 写存在性与值相等分开；全部 worker 创建链接
与区域实例检查；未知语法和 solver UNKNOWN 的拒绝路径。

## 7. 新发现、创新性与下一步条件

本轮补上的是实际实现缺口：旧自动覆盖只准死输出，底层投影参数没有自动宿主
对应证据，先前负例有交叉触发。新增活跃后继检查和独立故障注入解决了本轮的
受限验收目标。**没有在未注入的本轮正例里发现新的 Dat3M 语义错误。**
开发中故障构建第一次使用了上游 Java release 不支持的 List API，构建明确失败；
已改为兼容写法，失败构建日志仍保存。不能把这个工程错误写成后端语义发现。

[现有工作核查](revision/07-cas-and-related-work.md) 排除了对组合式弱内存验证、
开放读取、两端点 RMW、模型关系判定、带语义保证的混合语言 lifting 等概念的
“首次”主张。Hetrify/Hetrify+ 全文算法与并发边界仍未充分取得并排除。
本轮只增强了系统可行性证据，**独立方法创新性仍未确认**。

目前不具备直接进入真实并发库批量验收的条件。若批准下一轮，应先建立原始
头文件宏展开、typedef/操作数表达式和内联实例到最终对象的可验证来源链；
同时完成 Hetrify/Hetrify+ 全文逐算法比较，再决定是否存在论文级独立贡献。
本轮不擅自实现这些扩展，也不进入竞赛实验。

## 8. 材料与复核

- [完整材料目录](../experiments/controlled-round/)及
  [原始字节清单](../experiments/controlled-round/manifest.json)；
- [最终源码与对象复核](../experiments/controlled-round/reviewed/summary.json)，
  `reviewed/implementation-sources` 保存复核实际使用的检查器源码；
- [静态完整性报告](../experiments/controlled-round/static-audit.json)；
- [活跃后继证明](revision/06-live-continuation-proof.md)与
  [CAS/文献核查](revision/07-cas-and-related-work.md)。

在项目目录执行 `python -m experiments.verify_controlled_evidence` 只作静态材料
核对，不运行编译器、后端或新的性能实验。历史最小验收的静态检查器现在显式读取
历史提交 `3e2326c1feec3b596d9e9a2d67a30a20df0c164a` 中的源码，不将本轮代码冒充
旧运行版本。旧证据的 651 个原始文件保持逐字节一致。

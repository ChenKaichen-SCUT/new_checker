# 四级认证交付与独立审阅

交付日期：2026-10-21。冻结基线：`795e2a9ee95ba7446d4964430f7bda78bf6ddf76`。本轮停止扩展，等待审阅。

**结论：分级机制能够在不认证整个 C 宿主的情况下，独立检查原始 CK 完整客户端中的 6 个 GNU/LLVM 静态转换位置；本轮没有认证这个完整客户端的最终 Q，也没有获得它的程序级 SAFE。** 受控分支程序新增达到 L3，既有 D2 安全程序维持 L4。独立新算法创新仍为 No-Go；工具系统路线有条件继续研究，但现有证据尚不足以支持 FSE/CAV/ISSTA 论文有效性结论。

这里的“独立”指独立参考解释、义务生成与实际对象核对，不是摆脱编译器、捕获代码、Checker 或求解器的可信前提。没有引入新的外部语义假设，没有获得新的已验证 HCC 提供者。实现代码增多，不能声称 TCB 变小。

## 1. 四级保证和实现

完整定义、充分条件及解析证明见 [四级证明](01-levels-and-proof.md) 和 [量词、有限归纳与全局关系附录](04-formal-appendix.md)，逐项实现及可信边界见 [检查对应表](02-check-map.md)。原 E2E-SAFE 文件及八项 Γ 保持不变。

| 层级 | 本轮可检查的结论 | 不能据此推出 |
|---|---|---|
| L1 BLOCK_EXACT | 原始 GNU 类型化端口与 Event IR 对合法入口和开放读取响应一致 | C 调用方求值正确、LLVM 对应或程序安全 |
| L2 LLVM_SITE_EXACT | 实际来源、操作数/约束/类型、原结果 SSA、实际替换片段和未修改模块框架 | 任意 C 宿主的控制流、指针有效性、无数据竞争或最终 Q 正确 |
| L3 ACTUAL_Q_EXACT | 独立恢复的有限激活域中，全部调用/实例、实际事件、返回值、跨区域依赖及整个 Q 分区一致 | 未核查的 C 宿主语义或完整错误查询正确 |
| L4 CONDITIONAL_SAFE | 原 C0–C4、完整受限宿主检查、同次安全/bound 查询及八项 Γ 全部满足 | 无条件的 C11/编译器/验证器正确性 |

L2 的量词域是**定义良好且有效的类型化 LLVM/GNU 端口输入**。实际 LLVM `range` 属性逐字解析并记录；块等价在更大的位向量域成立，因此可限制到该定义域。没有把域外 poison 或未知 C 参数求值当作合法输入。不同位置分别检查；模板相同不意味着来源、绑定、实例证书可以共用。

L3 新增的有限 LLVM 依赖检查只处理现有 FAA、普通只读输入、ADD、icmp、zext、select 和断言。来源 asm 是无条件直接声明初始化调用，循环、条件激活、间接调用、未消费指令均拒绝。受控 C 分支优化为 select 后，其实际 LLVM→Q 关系可检查；这不构成 C 分支编译正确性证明。

审计中补上了 L3 的完整 Q 分区条件：已知 worker 检查之外，还调用现有 `program_main` 检查 main、初始化、运行时及所有线程。否则，额外未知线程可能被已知 worker 筛选漏掉。新增负测试以实际 Q 为基础插入一个未解释线程，确认拒绝。没有新增通用 C 解释器；受限 main 检查仍然存在。

## 2. ITEExpr 修复与实际分支

检查了固定 Dat3M `b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8` 的实际 ITEExpr、Expression 和编码实现。带许可及哈希的源代码审阅副本位于 [ITE 源码审阅](../../experiments/levels/ite-source-review/receipt.json)。新正向导出器只读取条件、真/假分支、精确类型和 `getRegs()`，不改 Program；独立解释器递归检查类型、三元结构、依赖集合及全部分支，再解释为 `z3.If`。

固定 Clang 21.1.8 与新只读后端构建均有原始日志/收据；后端 669 个上游构建输入均按 Git blob 核对。历史 jar、捕获和结论未改写。

[最终分支证书](../../experiments/levels/final-04/branch/level-certificate.json) 区分了四个事实：

1. 同次最终 Q 完整导出，含 2 处实际 ITE 表达式；求解前后对象相同。
2. 两个静态位置分别达到 L1/L2。
3. 两个 worker 中共 4 个适用 asm 实例、跨调用数据依赖及完整 Q 分区达到 L3。
4. 原始 worker 的 C 分支没有足够宿主提供者，**L4 拒绝**。后端文本 PASS 不改变这个结论。

ITE 真/假分支交换是在真实 Program 表达式中实施；遗漏依赖、错误类型、截断表达式是三个分别实施的**导出器故障**，没有谎称它们是上游 Program 错误。四者都阻止 L3，保留已成立的 L1/L2。解析证明是结构归纳；这些故障检查不代替证明。

## 3. 未修改完整客户端：固定分母和逐位置结果

对象是冻结的 CK **event-counter smoke-test 完整客户端**，不是新选取的生产应用。CK 提交 `8f0847cfe57b1479d8e63b89028831d94d0e4d26`；两个原始 TU 分别为 `regressions/ck_ec/validate/ck_ec_smoke_test.c` 和 `src/ck_ec.c`。原编译配置、源码、头文件、AST、LLVM、全部函数、循环、回调、系统调用和共享操作原样保留。

首次认证前保存 [113 位置冻结清单](../../experiments/levels/frozen-sites.json)。两个 TU 分别含 80/33 个实际存活 asm；全部纳入分母，包括空 asm。逐位置结果与拒绝原因见 [113 行审阅表](../../experiments/levels/site-results.md) 和 [完整 JSON](../../experiments/levels/client-reuse-04/results.json)。

| 统计项 | 结果 |
|---|---:|
| 完整客户端 / TU / 全部存活 asm | 1 / 2 / 113 |
| 预先固定指令族候选 | 8 |
| 达到 L1 / L2 / L3 / L4 的位置 | 6 / 6 / 0 / 0 |
| 达到 L3 / L4 的完整客户端 | 0/1 / 0/1 |
| 固定指令族外 | 97 |
| 无可验证原始 GCCAsmStmt 来源 | 8 |
| 候选 CAS 的 flag-output/类型接口不支持 | 2 |

97 个族外位置包含 28 个具有来源的空 asm；另 8 个缺少 `!srcloc` 的空 LLVM 屏障无法连接到唯一原始 GNU 节点。没有把空屏障当作无影响而删除，也没有将缺失来源通过文本猜测补齐。两个 CAS 是接口障碍，不宣称新增 CAS 已认证。

6 个成功位置如下；行号为冻结原始 LLVM 的一基行号，各自保留独立绑定与片段义务。

| 位置 | 原始函数 | 宽度 |
|---|---|---:|
| tu0-line553 | test_update_counter_32 | 32 |
| tu0-line617 | test_update_counter_64 | 64 |
| tu0-line651 | test_update_counter_64 | 64 |
| tu0-line782 | test_threaded_add_32 | 32 |
| tu0-line840 | test_threaded_inc_64 | 64 |
| tu0-line899 | test_threaded_add_64 | 64 |

每次候选仅替换该位置，整个 TU 的其余字节框架不变，并用固定 Clang 检查实际候选 LLVM。原始源码、上游接口没有修改。没有通过删减客户端生成 Q，没有假定循环/回调执行次数；本轮也没有把一次失败导入测试包装成“Dat3M 永远不能处理”。准确结论是：**完整原始链接客户端的可信 Q、完整激活域和宿主保证尚未提供，因此 L3/L4 未执行且不能释放。**

证书包 [外部可信边界](../../experiments/levels/client-reuse-04/certificate-package.json) 绑定全部逐位置证书哈希、形式化定义及原八项 Γ，并列出未核查的宿主/Q/查询条件。6/8 是候选子集结果；主要真实覆盖率仍为 **6/113（约 5.31%）**，不能用子集分母替代。

## 4. 正负验收与对照

[最终固定验收](../../experiments/levels/final-04/results.json) 共 16 项：2 个安全正例达到 L4；实际不安全性质变体的安全查询 SAT，保留 L3；分支正例 L3；12 个针对性故障全部阻止应阻止的层级。故障分为 8 个实际 Program 故障、3 个导出器故障和 1 个查询绑定故障。12 项中有 10 项后端报告 PASS，门禁仍拒绝对应高等级。

故障覆盖 ITE 控制依赖、错误入口 SSA、交换两次返回值、丢失跨区域读取、遗漏第二调用、遗漏一个 worker 中的调用、单独删除 A、单独删除 RMW 标签且保留配对，以及实际安全 assumption 错绑。后者保留 L3、拒绝 L4。另有 [2 个实际 LLVM 片段故障](../../experiments/levels/llvm-faults-02/results.json)：错误操作数、错误返回值均阻止 L2，L1 参考证明保留。所有修改都是受控故障，不计为上游缺陷。

完整既有及新增测试 **129 passed**；原始 pytest 输出见 [回归日志](../../experiments/levels/final-local-04/002.stdout.log)，测试产生的义务与反例也保存。审阅脚本核对 1,203 个 SMT 引用、实现快照、模板引用、同次 Q、覆盖、查询和故障差异，结果见 [独立证据审阅](../../experiments/levels/evidence-review.json)。这是证据完整性与实现检查，不是形式化验证 Checker 自身。

以下都是单次受控运行的原始观测，**不是统计性能结论**。证书大小为运行目录中 `*certificate.json` 总字节数，含嵌入和引用重复；SMT 数是独立保存的局部义务文件，不含后端安全查询。输入和候选哈希相同的 workers 对照经过独立核对。

| 同一 workers 输入 | 开放块证明次数 | 局部 SMT 文件 | 证书字节 | 墙钟秒 | 结论 |
|---|---:|---:|---:|---:|---|
| 原逐调用 certify_p1 | 2 | 64 | 191207 | 12.715 | L4 对应保证 |
| 已有 HCC 模板复用 | 1 | 59 | 211876 | 13.172 | L4 对应保证 |
| 新分级路径 | 1 | 71 | 237777 | 12.950 | L4 |

分级路径额外执行并保存独立激活域/完整分区检查，因此该控制下 SMT 与证书总量增加。没有测得足以宣称速度提升的证据。旧逐句路径对 branch 拒绝；已有 HCC 路径保留局部证据但不进入实际 Q；本轮分级路径以 3.540 秒得到 L3，并继续拒绝 L4。

| 同一完整客户端、全部 113 位置 | 开放块证明次数 | 局部 SMT 文件 | 证书字节 | 墙钟秒 | L2 |
|---|---:|---:|---:|---:|---:|
| 每位置重新证明 | 6 | 60 | 185391 | 1.932 | 6 |
| 模板复用 | 2 | 40 | 172551 | 1.896 | 6 |

这里的 2 是 32/64 位两种已支持模板。12 次模板请求中含各位置的 L1 和 L2 请求，不能将“避免 10 次请求重证”混同于与每位置基线相比只减少 4 份独立证明。每个实际位置仍独立验证来源、操作数、片段与框架。

## 5. 提供者、贡献和停止条件

[HCC 提供者与创新性审阅](03-provider-and-novelty.md) 对照 TInA、VALID、Stellite、CompCertTSO、DESTIVA 及 CompCertOC 的原始论文/具体构件。没有找到可直接为本次 GNU/Clang/Dat3M/TSO 对象产生并可独立核查完整开放宿主模拟的组件。本轮没有实施通用 HCC，也没有把未验证编译行为重新命名为外部证明。

**已证明的条件式结果**：开放端口实例化、有限激活/事件组合、ITE 解释的结构归纳，以及满足原 C0–C4 时对原 E2E-SAFE 的应用。它们复用已有原理，不申报新通用对应合成算法。

**实际检查的进展**：未修改完整客户端中 6 个端口的真实来源/LLVM 转换证书；受控分支的实际 Q 和四实例证书；良性接受和错误转换拒绝；模板证明次数及字节数可复核。

**仍被信任/尚缺**：捕获和 Checker 实现精化、合法内存域/ISA-TSO 桥、Clang 元数据语义、完整客户端的宿主编译与激活/Q 保证、足够宽的独立项目样本、实际有用的消费端以及真实缺陷发现证据。原八项 Γ 未被证明，也未被替换。新的解析/导出/激活代码扩大了 Γ_check/Γ_capture 的实现表面。

决定：独立算法创新 **No-Go**；当前投稿准备度 **No-Go**；作为工具系统研究，是否继续取决于审阅者是否认可这种明确受限的局部认证用途。后续必须在不增加未经证明语义前提的情况下，证明更多独立真实软件上的有效覆盖或有价值的检查成本收益。本轮不继续拓展。

## 6. 可复核运行与历史完整性

从项目目录运行（工具链需按现有固定配置安装，输出目录必须不存在）：

```text
python -m experiments.certify_client_levels --out <new-dir> --reuse
python -m experiments.certify_levels --capture experiments/hcc/capture-branch --out <new-dir>
python -m experiments.run_levels_acceptance --out <new-dir>
python -m pytest -q
python -m experiments.review_levels
python -m experiments.seal_levels
```

`review_levels` 固定审阅本次 `final-04`、`client-*-04`、`comparison-02` 和 `llvm-faults-02`；不把新的任意 EXACT JSON 当作授权证书。原始运行命令及标准输出/错误都随证据保存。

`development-*`、`final-01/02/03`、`client-*-01/02/03`、`unit-*-02/03` 和旧比较均保留为开发记录，**不得混为最终接受集**。开发中修正了相对来源路径恢复和声明初始化节点形状造成的拒绝；`final-02` 因后者失败。保存原始 pytest 义务时，Windows 原生 Z3 文件路径接口不能读取含 Unicode 的路径；回归测试改为读取同一 UTF-8 SMT 字节并调用 parse_smt2_string，未更改 SMT 或求解语义。最终重跑已包含这些修订以及完整 Q 分区修补。

所有基线文件按 Git blob 复核，历史实验文件另按旧 manifest SHA-256 复核；只允许列明的当前代码、导航和清单更新。完整 seal 见 [完整性结果](../../experiments/levels/integrity.json) 与 [本轮清单](../../experiments/levels/manifest.json)。

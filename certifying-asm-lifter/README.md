# Certifying Inline Assembly Lifting — restricted research prototype

2026-10-21。核心交付：有明确假设的开放事件等价数学证明、可运行独立检查器、
真实 Dat3M 后端反例与实验材料。**不是已经完整认证的 GNU C→Dat3M 编译链，也未达到投稿完成状态。**

当前审阅入口：[四级认证、ITE 修复与真实逐位置覆盖](docs/levels/00-delivery.md)。
冻结基线 `795e2a9ee95ba7446d4964430f7bda78bf6ddf76`：完整 CK 客户端 6/113 位置
达到 L1/L2，完整客户端 L3/L4 为零；受控分支 4 实例达到 L3，但不释放程序 SAFE。
原 D2 正例继续条件式 L4。129 项测试及 16 项分级验收通过，2 项 LLVM 故障拒绝。
模板复用减少重复证明，没有统计耗时优势主张；新代码增加可信实现表面。
原八项 Γ、原定理、历史证据保留，无新通用 HCC。独立算法创新/投稿准备度 No-Go。
完成发布后停止扩展，等待审阅。

历史审阅入口：[方案 A 审阅报告](docs/hcc/00-delivery.md)。
从 `8412b600293161e173ed7f7b94bb3c316d46f796` 冻结 D2，交付非循环 HCC 定义、
条件式组合证明、模板复用和严格门禁。22 个 case、120 项单元测试通过。
缺少可信宿主 provider 时只保留局部结果，不能输出程序 SAFE；程序级范围未扩大，
完整第三方客户端仍 0/1，未显示耗时收益。方案 A 的主要扩展主张当前 **No-Go**。
原八项 Γ 和历史证据不变。停止扩展，等待审阅。

历史审阅入口：[源语义风险修补与不同 worker](docs/p2/00-delivery.md)。
基线 `884c06a8d2076c8f9443bfbfc30637151d89c73d`。旧普通读取与 asm 并发写同对象的
输入当前拒绝；独立只读输入、两调用依赖、不同 worker 的真实认证通过，原八项 Γ 不变。
111 项单元回归及全部受控验收完成；修补 SMT 文件字节哈希的 Windows 换行错误。
完整原始 CK 事件计数器客户端超出宿主域，0/1 接受；未删减行为或伪造 Q。
本轮停止扩展，等待审阅。历史 [P1 交付](docs/p1/00-delivery.md)保留，
其混合访问输入的当前程序授权已撤回；不是无条件 C11 正确性证据。

前次审阅入口：[P0 程序级条件式安全门禁](docs/p0/00-delivery.md)。
以 `7309c4e48521f2b2baed6f9fb418dce5bb8f8fa5` 为基线，完成受限 main、
初始化、create/join、完整断言与同次实际安全/bound 查询绑定。
原 CK harness 得到携带原八项 Γ 的 `CONDITIONAL_SAFE`；一个不安全性质变体 SAT；
三个隔离故障均拒绝，尽管其后端均显示 PASS。Clang/Dat3M/求解器等语义仍在原 TCB。
范围只是 D₀ 的严格子集；没有无条件整程序正确性或论文成熟度结论。
本轮完成后停止，等待审阅，不进入 P1。

前次审阅入口：[工具／系统论文可行性审阅](docs/system-review/00-delivery.md)。
以 `25e67f8cf379c74857dd78bdf6e83f334555a269` 为基线，交付条件式端到端定理
及完整解析证明、实现缺口、真实库覆盖障碍和严格评测计划。
当前 main/生命周期、完整属性与查询任务绑定尚未独立核对，程序级 gate 仍关闭。
通用非双射算法路线暂停；工具开发条件性 Go，投稿成熟度 No-Go。
本轮未改认证器、未运行任何语义实验；停止等待用户批准受控实现。

前次审阅入口：[已有方法组合可行性审查](docs/combination-review/00-delivery.md)。
以 `58dccfad29c9285f4280b90e6372fd202d1d2483` 为基线，固定有限无环 x86/TSO。
最强已有组合、受限引理及反例已交付；本轮候选独立算法创新为 **No-Go**，
不是已实现完整组合，也未判断工具/系统贡献达到可发表水平。
没有认证器改动或任何新实验。完成后停止，等待用户审阅。

前一批审阅入口：[自动对应合成第一批](docs/correspondence/00-delivery.md)。
包含算法级文献审计、对象/保证方向定义、联合搜索与证书构想、解析反例及基线审阅。
候选新定理和实现尚未交付；没有新方法接受实例或新实验结果。
本批完成后停止，等待用户审阅再推进证明与实现。

上一里程碑：[原始 CK 宏来源与活跃输出验收](docs/15-ck-acceptance.md)。
原始 `ck_pr_faa_32` 已通过同次 Clang 来源连接、类型化内联绑定和真实 Dat3M
两个实例的受限检查；[条件性证明](docs/revision/09-ck-composition-proof.md)
逐项列出检查与可信前提。[独立方法贡献复核](docs/16-method-contribution-review.md)
仍不支持宣布方法创新已经建立。程序级判定转移关闭，本里程碑停止扩展。
历史材料：[第二轮活跃输出/CAS/CK 拒绝](docs/14-controlled-acceptance.md)、
[最小验收](docs/13-minimal-acceptance.md)；原始失败证据不覆盖。
前置定义与条件式证明见[第 1–4 阶段修订](docs/12-review-repair.md)。

## 阅读顺序

1. [阶段记录](docs/00-progress.md)；
2. [范围和原模型](docs/01-scope-and-semantics.md)、[源码审计](docs/02-existing-implementation-audit.md)；
3. [形式定义](docs/03-formal-model.md)、[解析反例](docs/04-counterexamples.md)；
4. [算法](docs/05-checker-algorithm.md)、[正确性证明](docs/06-correctness-proof.md)；
5. [弱内存扩展](docs/07-weak-memory-extension.md)、[模型实例完整证明及缺口](docs/08-complete-proofs.md)；
6. [实验报告](docs/09-experimental-evaluation.md)、[对抗性审阅](docs/10-adversarial-review.md)。

下列旧命令是原型接口说明，不代表本次授权执行范围。
P0 当轮仅运行原 CK harness、一个不安全性质变体和三个隔离故障；
具体命令、原始对象和日志见 [P0 验收报告](docs/p0/02-acceptance.md)。

## 运行

在本目录运行，Python 3.10+，依赖 Z3 Python binding 和 pytest。
本次实际环境为 Windows Python 3.13、Z3 5.0.0、WSL Ubuntu、Java 21。

```
python -m pip install -r requirements.txt
python -m pytest -q
python cli.py benchmarks/cmpxchg.asm --out certificates/example
python cli.py benchmarks/cmpxchg.asm --target certificates/example/target.json --out certificates/recheck
python experiments/evaluate.py
python experiments/make_backend_cases.py
python experiments/compile_native.py
python experiments/run_dat3m.py --print-ir
```

后两项要求本地 WSL、GCC，以及 `vendor/clang-local` 中解包的 Clang。
后端脚本只用于当前 Windows/WSL 布局，跨平台移植需修改路径封装。
`run_dat3m.py` 无参数会运行 `benchmarks/backend/*.ll`；
输出保存在 `experiments/backend-results.json` 和逐程序日志。

固定 Dat3M 版本为 `b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8`，源码在 vendor。
从 GitHub archive 构建缺 .git，故只跳过 git 版本元数据插件：

```
mvn -B -pl dartagnan -am package -DskipTests -Dmaven.gitcommitid.skip=true
```

这是早期探索构建命令。后续验收另建了带明确只读导出 hook 的固定版本构建，
以及隔离的负例故障构建；差异和日志见各轮验收报告，不能把故障构建当成正例后端。

## 认证范围

旧 `cli.py` 的输入是**一条受限 GNU asm 声明**，不是整个 C 翻译单元。
输出 EXACT/REJECT。EXACT 说明在证书 Γ 下块转换保持开放事件和公开输出；
证书 `backend=UNVERIFIED` 明确禁止把块认证解释成程序 TRUE。
源解析器、参考语义和 IR 解释器都在 TCB；候选 lifter 不在。
SMT-LIB 可重放，但没有独立小内核检查 UNSAT 证明。
不支持的指令、语法、接口、未知 SMT 结果都拒绝。

新的 `prepare_observed` 入口接受已认证的真实编译捕获目录，内部自动遍历整个
翻译单元的 asm 清单；当前只认证一个 surviving 静态内联调用及其有限 worker
激活，拒绝一般宿主 CFG。生产入口不接受用户指定的 AST 节点或寄存器映射。
两种入口的局部 EXACT 均不授权整程序判定；本轮命令与材料见最新验收报告。
只有新增 `experiments.certify_p0` 在完整 C0–C4 检查后，可以给携带原 Γ 的
`CONDITIONAL_SAFE`；所有旧局部入口的 gate 保持关闭。

目录中的 `benchmarks/upstream` 是固定版本原始资料；
`raw-extracted` 保留原始约束/表达式；
`normalized.json` 明列人工宏/类型规范化，不冒充无改动上游程序。
`benchmarks/backend-source.c` 是真实 GNU C 双线程复现，Clang 原始输出和 GCC 本机运行均保留。
未经检查的错误 adapter 仅作为消融，不作为可用转换模式。

## 正确性条件覆盖

|条件|证明|实现/实验|
|---|---|---|
|独立每次共享读响应|06引理1–3|fresh u_i；重复读负例|
|符号地址含别名|08 W1|地址 BV64，不加不等约束|
|中间事件不删除|06引理3|事件数/种类检查、删写变异|
|CAS 成功/失败|07§2、08 W1|has_write 全称检查、返回值检查|
|原子性和排序|04-C5/C6、08 W2|RMW 标签，拆分/丢排序变异|
|GNU tie/early-clobber|06引理4|初始化映射和未来输入 hazard|
|C compiler barrier|07§1|保留元数据，拒绝变成 Fence|
|C UB 不被目标引入|03、04-C10|BV IR；只给有效内存域保证|
|后端最终处理程序|未普遍证明|保存处理后程序；探索性 adapter|
|SMT 结论可独立核验|未实现小核证明|完整查询可重放，Z3 在 TCB|

第三方源码保留上游版权和许可证。研究原型为本工作新增文件；
不将上游代码的许可证混同为整个目录的统一许可证。

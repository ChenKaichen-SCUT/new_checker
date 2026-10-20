# Certifying Inline Assembly Lifting — restricted research prototype

2026-10-20。核心交付：有明确假设的开放事件等价数学证明、可运行独立检查器、
真实 Dat3M 后端反例与实验材料。**不是已经完整认证的 GNU C→Dat3M 编译链，也未达到投稿完成状态。**

## 阅读顺序

1. [阶段记录](docs/00-progress.md)；
2. [范围和原模型](docs/01-scope-and-semantics.md)、[源码审计](docs/02-existing-implementation-audit.md)；
3. [形式定义](docs/03-formal-model.md)、[解析反例](docs/04-counterexamples.md)；
4. [算法](docs/05-checker-algorithm.md)、[正确性证明](docs/06-correctness-proof.md)；
5. [弱内存扩展](docs/07-weak-memory-extension.md)、[模型实例完整证明及缺口](docs/08-complete-proofs.md)；
6. [实验报告](docs/09-experimental-evaluation.md)、[对抗性审阅](docs/10-adversarial-review.md)。

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

这不修改验证器语义。本项目没有修改 vendor 的 Java 源码。
实际构建日志保留第一次缺 .git 的失败与第二次成功。

## 认证范围

输入是**一条受限 GNU asm 声明**，不是整个 C 翻译单元。
输出 EXACT/REJECT。EXACT 说明在证书 Γ 下块转换保持开放事件和公开输出；
证书 `backend=UNVERIFIED` 明确禁止把块认证解释成程序 TRUE。
源解析器、参考语义和 IR 解释器都在 TCB；候选 lifter 不在。
SMT-LIB 可重放，但没有独立小内核检查 UNSAT 证明。
不支持的指令、语法、接口、未知 SMT 结果都拒绝。

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

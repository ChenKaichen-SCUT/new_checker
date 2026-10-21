# Guarded 跨层对应与反例具体化：独立交付

冻结基线 `ebbe82856ea15e31b6ff5da352ee9ae51e0b08b9`，2026-10-21。
**三个 Gap 在明确受限域内取得实现增量；独立算法创新仍 No-Go。**
没有新的程序 SAFE、无条件 C 正确性或新上游漏洞声明。完成发布后停止等待审阅。

1. **非平凡实际对应**：真实 C 的两个互斥 FAA 调用，经原始 Clang LLVM、
   Lifter、真实 Clang O2 后成为一个 select+atomicrmw，最终 Q 为一对 R/W。
   每激活潜在端点 6→4，路径敏感检查通过；同提取结果的统一静态单射消融
   UNSAT。另一个真实 Q 保留条件分支，旧两个 Q 核拒绝，新核完整认证。
2. **实际检测增量**：7 个分支/操作数/返回值/标签/效果遗漏故障独立检出，
   分别定位至导入 LLVM 或实际 Q。查询错绑保持正确的 worker 语义结论，
   但独立查询门禁拒绝。故障都是标明来源的人工注入。
3. **具体化**：历史副作用丢失案例获得 20 端点、统一 rf/co/fr、实际生命周期
   的源错误图，并排除同次 Q 的全部用户错误执行；状态为原八 Γ 下的
   CONDITIONAL_CLOSED_ERROR_DIFFERENCE。读取 7 的开放见证证明不可达；
   缺少目标排除时只报告 REACHABLE_SOURCE_ERROR_ONLY。

阅读顺序：

- [G1 模型、路径积、包含与差异证明](01-proof.md)：设计先于原型；新增限制见实现表。
- [G-CLOSED 具体化、全局兼容性、观察排除的完整受限证明](02-closed-proof.md)。
- [模块/前提对应、算法伪代码、证书结构、实际支持边界及 TCB](03-implementation-and-boundaries.md)。
- [结果、同对象消融、失败记录和第一手文献创新性审阅](04-results-and-novelty.md)。

最终材料：

- [15 项验收结果](../../experiments/guarded/final-02/results.json)、
  [同对象比较](../../experiments/guarded/comparison-03/comparison.json)、
  [88 份跨层结论及 SMT 重放汇总](../../experiments/guarded/review-02/summary.json)。
- [完整源错误图](../../experiments/guarded/final-02/closed/source-execution/witness.json)、
  [独立源图核验](../../experiments/guarded/final-02/closed/independent/certificate.json)、
  [条件式闭合反例](../../experiments/guarded/final-02/closed/certificate.json)、
  [不可达开放见证](../../experiments/guarded/final-02/unreachable/certificate.json)。
- [全部回归日志：207 passed](../../experiments/guarded/tests-final.stdout.log)、
  [字节相同的 SMT 逐引用重放](../../experiments/guarded/review-02/smt-replay.json)。
- 原对象在 `experiments/guarded/capture-*-01`、`backend-*-01`、`faults-01`；
  旧 raw 缺陷实际 Q 引用 `experiments/diagnostics/acceptance-02/raw-unsafe-backend`，
  未改写或替换。开发失败与中间版本全部保留。

复现（从项目目录，使用配置好的 Python/z3、WSL pinned toolchain；输出须为新目录）：

```text
python -m experiments.accept_guarded --out experiments/guarded/replay-NEW
python -m experiments.compare_guarded --out experiments/guarded/comparison-NEW
python -m pytest -q
```

第一个命令从保存的真实原始对象重新提取和核验，不新造 Q。需要重新捕获/运行
时使用 `capture_guarded.py --source ... --out ...`、`guarded.pipeline.lower` 和
原 `run_pipeline.run_backend`；实际参数和工具散列已保存。受控错误转换由
`run_guarded_faults.py` 生成，不能与生产候选或真实上游错误混淆。

规模固定为 2 次新 Clang 捕获、2 次实际提升后优化、10 次新后端运行和 1 个
历史实际对象重用；15 项结果、88 份跨层独立核验、1,419 条 SMT 引用/1,167 份
不同字节重放、207 项回归测试。没有覆盖或性能比较。源分支具体化、循环、任意
别名、事件重排、完整第三方客户端和更强观察的排除仍未完成。每条活跃路径
内部仍采用由完整公共顺序确定的对应，突破的是**潜在静态事件对应**的退化。

新增 `guarded/` 约 1,180 行受信检查实现；候选生成器不成为语义前提，但共享
提取/公式核属于明确 Γ_check。原八 Γ、旧代码、旧定理及历史证据保持不变。
数学证明是受限语义模型上的解析证明，测试/SMT 实例不是普遍证明的替代品。

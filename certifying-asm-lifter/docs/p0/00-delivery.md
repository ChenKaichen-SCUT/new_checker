# P0 交付：受限程序级条件式安全门禁

基线 `7309c4e48521f2b2baed6f9fb418dce5bb8f8fa5`，2026-10-20。
本轮仅完成用户批准的 P0；不进入 P1。

**结论：原 CK harness 已通过完整的受限 main、实例和同次查询门禁，
得到原八项 Γ 前提下的 `CONDITIONAL_SAFE`。这不是无条件整程序形式化正确。**
一个明确不安全的性质变体得到实际安全查询 SAT；三项隔离错误均拒绝，
尽管对应后端均输出 PASS。

| 最终真实运行 | 门禁结果 | 决定性事实 |
|---|---|---|
| 原 `ck-live.c` | CONDITIONAL_SAFE | C0–C4 的实现条件、实际 safety UNSAT、实际 bound UNSAT |
| 仅 main 改成 `x != 2` | SAFETY_QUERY_SAT_NO_SAFE_TRANSFER | 同次模型 main 读 2，用户断言失败；不释放 SAFE |
| 在不安全变体实际 Program 删除 main Assert | REJECT | 源/LLVM 仍有断言，实际事件完整消费失败 |
| 改原程序第一个实际 ThreadJoin 的目标 | REJECT | 实际 joined thread 与源 handle 对应不符 |
| 对不安全变体将实际安全 assumption 改为 false | REJECT | 两次实际 UNSAT、日志 PASS，仍因安全 assumption 不匹配拒绝 |

阅读与复核入口：

1. [原条件、实现对应及完整推导](01-proof-and-checks.md)；
2. [最小验收报告、反例和复现命令](02-acceptance.md)；
3. [对抗性审阅、外部 TCB 与未关闭的问题](03-adversarial-review.md)。

关键材料：

- [实际程序级正例证书](../../experiments/p0/final-reviewed/safe/program-certificate.json)；
- [main/初始化/完整监视器证书](../../experiments/p0/final-reviewed/safe/host/certificate.json)；
- [同次属性/查询证书](../../experiments/p0/final-reviewed/safe/queries/certificate.json)；
- [实际安全查询](../../experiments/p0/final-reviewed/safe/queries/actual-query-0.smt2)、
  [实际 bound 查询](../../experiments/p0/final-reviewed/safe/queries/actual-query-1.smt2)；
- [五例结果](../../experiments/p0/final-reviewed/results.json)、
  [隔离性审计](../../experiments/p0/evidence-review/fault-isolation.json)、
  [同次实际反例值](../../experiments/p0/evidence-review/actual-counterexample-projection.json)；
- [证据复核](../../experiments/p0/evidence-review/review.json)。
- [字节完整性核查](../../experiments/p0/integrity.json)、
  [本轮全部证据摘要](../../experiments/p0/manifest.json)、
  [固定后端源文件及实际构建钩子](../../experiments/p0/backend-sources/manifest.json)。

Clang/AST、GNU 接口/ISA、实际 pthread 协议语义、Dat3M 编码/分析的 ENC−、
导出/构建/OS、检查器实现和求解器可靠性仍按**原定理**列为可信条件。
本轮自动检查的是它们所作用的真实对象、有限语法、完整对应和查询绑定，
没有证明这些工具的语义正确性。原定理及全部既有证据保留。

已完成实现、同输入最小验收和针对性回归；论文成熟度没有由此自动变成 Go。
**在此停止，等待审阅；不开展 P1、全量 SV-COMP、性能评测、新库或新指令。**

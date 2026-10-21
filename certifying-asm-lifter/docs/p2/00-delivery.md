# 源语义风险修补、不同 worker 与固定外部客户端审阅

基线：`884c06a8d2076c8f9443bfbfc30637151d89c73d`。日期：2026-10-20。
本轮三个阶段已完成到明确的受限结论：修补源语义适用性缺口；不同 worker 的真实
条件式认证通过；固定完整第三方客户端拒绝。没有扩大 ISA 或开展竞赛/性能实验。

## 1. 首先收缩旧结论，而不是补一个外部假设

旧 `ck-input.c`/`ck-multi.c` 把 `&x` 传给两个 worker，普通读取 `*p` 与别的线程
locked FAA 写同一对象。原证明在约定的硬件事件扩展下成立，但普通 C 竞争访问
如何获得该语义并未闭合；Clang 确实输出 LLVM、GNU memory clobber 或后端 PASS 都不能
补上这个前提。旧证据不删除、不改成失败文件，也不再作为无条件 C11 正确性证据。
当前程序门禁对它们返回 `MIXED_C_ASM_CONFLICT: x`。

[五层语义审计](01-source-semantics-audit.md)明确区分 ISO C、GNU 接口、Clang/LLVM、x86
及 Dat3M TSO，并给出反例攻击。[受限证明](02-restricted-proof.md)先建立全局对象效果
分离、类型化入口、依赖实例覆盖与统一 rf/co 的解析证明，再对应实现。
所有普通 worker 读取对象必须与所有 asm 写入对象全局不相交；main 的读仍只在全部
join 之后。整个源程序都被解释，不能漏掉另一个 worker 的写来“证明只读”。

新 `ck-readonly.c`、`ck-readonly-multi.c` 使用两个独立、类型正确、静态有效且并发期间
不被写入的输入对象 `input_a/input_b`，共享 x 仅在 worker 中经原 CK FAA 修改。
优化后的实际 LLVM 仍有 `%2 = load i32, ptr %0`，原 asm 接收该 SSA。
两次调用版本还保留第一次返回值进入第二次 FAA，以及中间普通输入读取和全部断言。
输入对象初始化分别为 1/2：这是**有限闭合 harness + 非固定函数 SSA/开放普遍等式**，
不是任意外部非确定性输入程序；没有用固定 LLVM literal 冒充非固定入口。

## 2. 不同 worker 定义已在真实链上闭合

`ck-workers.c` 保留原始 CK 接口；`worker` 与 `worker_other` 各调用一次 FAA，分别
由 main 将 `&input_a` 与 `&input_b` 传入。完整 source/LLVM/Q main、两函数体、用户
监视器、两个 create/join 及实际动态激活均独立检查。示例的最终区域证据为：

| 源 create | worker | 实际 LLVM 行索引（零基） | 实际 Q thread | RMW read/write |
|---:|---|---:|---:|---|
| 0 | worker | 12 | 1 | 44 / 45 |
| 1 | worker_other | 30 | 2 | 58 / 59 |

这些标识来自实际对象，未由用户填写。不同函数中的 `%3` 可以同名，但对应键包含
真实函数定义、调用上下文和激活；相同 SMT 公式不是另一实例的证书。
预期覆盖集是“每个 create 的目标函数内的调用集合”的依赖并集；实际 endpoint ID
必须互斥。返回值及后续断言通过真实定义—使用链普遍比较。

当前只接受一个或两个 worker 定义、总计一个或两个存活 CK FAA 静态调用、有限直线
host、已知完整 unsigned 对象、受限比较/断言。没有推广到任意调用图、循环、分支、
字段/heap 指针、失败 pthread 创建、用户 Fence 或新的指令接口。
保持 C0–C4 与原八项 Γ；[前提—代码—证据表](03-premise-check-map.md)逐项说明边界。

## 3. 最终验收与回归

最终材料均为下列 **`-02`** 目录。开发/首轮目录保留但不作为当前最终授权材料。

| 验收组 | 固定 case 数 | 结果 |
|---|---:|---|
| [独立只读输入](../../experiments/p2/final-readonly-02/results.json) | 6 | 1 CONDITIONAL_SAFE、1 实际安全查询 SAT、4 隔离错误拒绝 |
| [两调用活跃依赖](../../experiments/p2/final-multi-02/results.json) | 9 | 1 CONDITIONAL_SAFE、1 SAT、7 隔离错误拒绝 |
| [不同 worker](../../experiments/p2/final-workers-02/results.json) | 12 | 1 CONDITIONAL_SAFE、1 SAT、3 源域攻击拒绝、7 实际对象故障拒绝 |
| [原 P0 实际回归](../../experiments/p2/regression-p0-02/results.json) | 5 | 原安全/不安全/main 断言遗漏/join/query 结果保持 |
| [原 P1 全 case 门禁回归](../../experiments/p2/regression-legacy-p1-02/results.json) | 16 | 原捕获全部被新增源域前提拒绝；不再进入后端 |
| [完整单元回归](../../experiments/p2/unit-final-02/000.stdout.log) | 111 | 全部通过 |

16 项旧 P1 回归的期望**有意收缩**，不能说旧 CONDITIONAL_SAFE 仍保持源语言授权。
其后端能力回归在无冲突输入上完整重做：P1a 四故障、P1b 七故障均在相应独立门禁处
拒绝；原“不同 worker”范围障碍由新的无冲突双定义程序单独验收。
无输入前提的旧 case 提前拒绝不被计作检验其后端故障的证据。

本轮 18 个实际对象故障中，A-only 仅移除一对端点的 A 标签，真实 rmw 配对不变；
错误线程参数仅改一个 ThreadCreate 参数；错误输入对象仅改一个 Load 地址；错误
入口/操作数仅改变对应值表达式；查询错误不改 Program。活跃输出、两返回值交换、
静态/动态调用遗漏和中间读取遗漏均保留实际 pre/post snapshot。
遗漏调用用删除 store、将旧 load 替为同 writer 的 Local 保持后端对象有效；这是一项
逻辑“丢失调用效果”故障，不冒称只改了一个字段，也不冒称删除了整条线程。
详细字段差异见 [独立证据审查](../../experiments/p2/evidence-review.json)。
包含 P0 在内有 17 项错误转换后端显示 PASS，但门禁拒绝。

不安全变体的实际查询/模型保留；此外可直接给出源见证：x 初值 1，按顺序执行
input_a=1 的 worker，再执行 input_b=2 的 worker，单调用/不同定义的最终 x=4；
双调用版本按 A 的两次调用、B 的两次调用顺序得到 x=8。各 worker 的非零/相异
监视器成立，而 main 的 `x==0` 失败。这是该有限源见证的解析核对，不能把任意后端
SAT 自动提升成真实源反例，也不把测试当作一般正确性证明。

新增发现并修补了 Windows SMT 写盘换行导致证书字节哈希失配的问题。修复后重跑
全部最终组；独立审查逐项核对 SMT 字节、实现源快照、证明哈希、同次 Program、
实际查询和实例键，48 个程序 case 均符合其记录期望。原始历史文件保持原字节。

## 4. 固定完整第三方客户端：拒绝，不能计作真实库成功

固定 CK `ck_ec_smoke_test.c`，分母 1，完整保留其 `src/ck_ec.c`、配置、回调、等待、
系统调用和共享操作。原配置编译链接成功，两份真实 AST/LLVM 已保存；实际 LLVM
asm 数为 80/33。这不等于认证了这些指令。
完整对象不满足单 TU、main 签名与有限宿主语义域，故 **OUTSIDE_D2_REJECT，0/1**。
没有构造近似 Q/查询，也没有删行为制造通过。
[独立外部审阅](04-external-client.md)区分完整上游客户端、上游例程加自建 harness 与
受控故障，说明精确阻塞及仍缺证据。

## 5. 可复核入口与结论边界

- [语义审计](01-source-semantics-audit.md)、[解析证明](02-restricted-proof.md)、[实现对应](03-premise-check-map.md)。
- [不同 worker 的实际程序证书](../../experiments/p2/final-workers-02/safe/program-certificate.json)、
  [源/LLVM 证书](../../experiments/p2/final-workers-02/safe/preparation/entry/certificate.json)、
  [实际事件](../../experiments/p2/final-workers-02/safe/backend/snapshots/before-encoding.json)、
  [查询证书](../../experiments/p2/final-workers-02/safe/queries/certificate.json)。
- [不安全实际查询](../../experiments/p2/final-workers-02/unsafe/queries/certificate.json)、
  [A-only 对象](../../experiments/p2/final-workers-02/lost-atomic-label/backend/snapshots/post-fault.json)、
  [错误线程参数义务](../../experiments/p2/final-workers-02/wrong-thread-argument/regions/certificate.json)。
- [全材料哈希](../../experiments/p2/manifest.json)、[历史完整性](../../experiments/p2/integrity.json)。

**已证明：**新增受限充分条件下的解析组合与条件式安全转移。
**实际检查：**真实无冲突输入、不同 worker、原始 CK 调用和所有实例/查询的指定能力。
**仍外部可信：**Clang、GNU/ISA/CAT 桥接、capture、pthread runtime、编码、检查器实现、
求解器及原 domain 契约。未证明通用 GNU/Clang 混合内存模型，未获得无条件 C11/整程序
编译正确性。工具覆盖取得受控增量；完整外部客户端与投稿充分性仍未达到。

本轮不把这些常规充分条件或现有技术组合包装为独立算法创新。发布后停止扩展，
等待用户审阅，再决定是否值得投入完整第三方宿主语义。

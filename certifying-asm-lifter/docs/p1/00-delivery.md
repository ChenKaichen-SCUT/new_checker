# P1a / P1b 独立审阅报告

基线：`274a5a58c27637ab8d45a988c3be393aa981b913`。日期：2026-10-20。
结论：**P1a 与受限 P1b 已完成实现和真实最小验收；保留八项原 Γ 的
CONDITIONAL_SAFE。不是无条件编译链正确性，不是通用对应合成算法。**

## 1. 本轮实际突破及边界

- **P1a**：未经修改的 CK `ck_pr_faa_32` 使用普通共享读取产生的非固定增量。
  Clang 实际保留 `%2 = load i32, ptr %0`，asm 实际消费 `%2`。
  源线程参数为 `&x`，经 `void *` 回转为正确的 `uint32_t *`。
  Q 的入口和寄存器关系来自实际 ThreadCreate、ThreadArgument、Load 写入者
  和表达式定义—使用链；删除了旧区域 API 的 `%name → rname` 猜测。
- **P1b**：同一 worker 中两次原始 CK 调用；第二次增量直接使用第一次返回值。
  两次调用之间保留一条实际普通共享读取；两个返回值和中间读参与后续断言。
  从全部 **188 个 AST asm** 中确定原始定义，再分别验证两个 inline 调用上下文。
  两个实际 worker × 两个静态调用产生 **四份不同的实际端点证书**，
  完整核对 **七个用户监视器**，以及原有 main、初始化、生命周期和查询条件。
- **明确未接受**：同一 CK 例程分别出现在两个不同 worker 定义中。
  已用真实源文件捕获 AST/LLVM，并在完整静态调用清单检查处拒绝；
  未启动后端、未生成近似 Q。障碍是当前宿主/创建关联只解释一个 worker 定义，
  不是已经证明宏来源无法对应。不能把这个拒绝案例写成成功。

原始 CK 文件、GNU 类型/约束/clobber 未改；没有手写替代 LLVM 或人工寄存器表。
新路径目前只接受一个或两个直接调用、单一 worker 定义、共同已知全局对象参数、
直线控制、无指针算术、受限无副作用监视器及非固定 SSA 增量。
新的正例验证了 uint32_t xadd；没有宣称任意参数求值、别名、C++、嵌套内联、
Fence/CAS 新扩展或循环已得到支持。原 P0 常量程序仍通过原门禁。

## 2. 证明与实现

按阶段先写充分条件和解析证明，再实现与验收：

1. [类型化入口关系与 D1a 条件式定理](01-entry-design-and-proof.md)；
2. [P1a 前提／检查对应和对抗审阅](02-p1a-check-correspondence.md)；
3. [P1a 阶段交付，先于 P1b 实现](03-p1a-acceptance.md)；
4. [多调用顺序组合、激活覆盖和 D1b 定理](04-multiple-call-proof.md)。

证明使用同一开放读取向量沿宿主与 asm 顺序传递；各调用、各激活有不同读取身份。
实际端点必须完整、互不重叠、保持跨区域 po。全局证明运输源的**一套 rf/co**，
不让不同片段分别挑选环境。RMW 必须检查真实配对和 A 标签。
未支持的 Fence 或额外共享事件会使完整事件清单拒绝。
安全转移使用“源错误前缀 ⇒ 实际 Q 错误前缀 ⇒ 绑定查询 SAT”的方向，
与实际安全/bound UNSAT 矛盾。SAT 证书本身不自动授权源 FALSE。

原 [E2E-SAFE 文件](../system-review/01-end-to-end-guarantee.md) 保持原始字节。
D1a/D1b 是明确标注的新受限充分条件推论，不把 D0 文档悄悄改成多调用定理。
代码将新宿主结果标为 `D1a_OPEN_HOST_EXACT` / `D1b_OPEN_HOST_EXACT`；
query binder 默认仍要求 D0，P1 必须显式选择相应域。

核心实现：
[入口、来源、LLVM 与实际 Q 解释器](../../certification/p1_entry.py)、
[程序门禁](../../experiments/certify_p1.py)、
[保留的 main/生命周期检查](../../certification/p0_host.py)、
[同次查询绑定](../../certification/p0_queries.py)。
已有 BLOCK_EXACT 与 LLVM_FRAGMENT_EXACT 独立检查继续执行。
多调用替换逐段保存证书，重新构造整个未修改宿主框架，并检查跨片段 SSA 新鲜性。
实际 Q 的 `OPEN_RMW_EXACT` 与完整 `TYPED_WORKERS_EXACT` 合起来落实 C1/C2/C3；
它们是有具体字段义务的新入口路径，不是把旧常量区域检查的结果重命名。

## 3. 实际验收与故障隔离

最终代码下的 [P1a 六项回归](../../experiments/p1b/regression-p1a/results.json)：
安全例 CONDITIONAL_SAFE；不安全性质例实际 safety SAT；
错误入口定义、固定错误增量、错误断言及错误 assumption 均在相应语义条件处拒绝。
原阶段材料保留在 [P1a 首次验收](../../experiments/p1a/acceptance-01/results.json)。

[P1b 十项验收](../../experiments/p1b/acceptance-01/results.json)：

| 案例 | 后端观察 | 门禁结果 |
|---|---|---|
| 原始 CK 两次调用、活跃依赖、中间共享读 | PASS | CONDITIONAL_SAFE |
| 仅 main 性质改为 x==0 | FAIL / safety SAT | 不转移 SAFE |
| 后续上下文交换两次返回值 | PASS | 开放监视器等价失败 |
| 仅第二次增量改为 1 | PASS | 第二次 RMW 写值等价失败 |
| 每个 worker 都遗漏第二调用 | FAIL | 完整源／实际事件消费失败 |
| 只遗漏第二 worker 的第二调用激活 | FAIL | 该激活完整事件消费失败 |
| 中间共享读取替换为局部常量 | PASS | 普通读取种类／标签检查失败 |
| 仅后续断言取反 | FAIL | 开放监视器等价失败 |
| 实际 safety assumption 换为 false | PASS | 查询绑定失败 |
| 两个不同 worker 定义的调用上下文 | 未运行 | 源／LLVM 作用域拒绝 |

返回值交换只影响两个调用完成后的实际使用；单独的第二操作数故障检查调用间依赖。
断言包含不对称的返回值使用，避免 `old != next` 的对称性掩盖交换。
遗漏故障保持原 LLVM 和 main/create/join 不变；实际第二调用的读写被删除，
原返回寄存器改由纯 Local 给常量以保持目标对象可编码。静态遗漏使实际 RMW
计数从 `(2,2)` 变为 `(1,1)`；单个激活遗漏仅变为 `(2,1)`。
它们测试事件／实例覆盖，不借 LLVM 框架损坏触发拒绝。

[独立证据复核](../../experiments/p1b/evidence-review.json) 保存真实 pre/post
对象差分、原始候选模块哈希、同次 Q 与 query 哈希、不同实例端点身份和完整结果。
所有负例的 runner 都要求对应语义拒绝原因，不能靠“负例 build 一律不许 SAFE”
这一最后防线冒充检测成功。故障为实际对象或实际 solver 调用注入，未修改事件 JSON。

不安全 P1b 性质有直接源见证：x 初值 1；先完整运行 worker 1，x 经 2 到 3；
再完整运行 worker 2，x 经 6 到 9；所有 worker 断言成立，join 后 x==0 失败。
P1a 的非固定性也有两个合法调度见证：第二 worker 在第一次更新前读取，增量为 1；
或在更新后读取，增量为 2。不是仅在 LLVM 上把常量写成 SSA。
这些见证和故障检查不替代上述全称解析证明。

## 4. 保留的可信边界与发现

每份程序证书完整列出原八项：
Γ_front、Γ_ISA、Γ_capture、Γ_runtime、Γ_encode、Γ_check、Γ_solve、Γ_domain。
新门禁还检查其内容与原 P0 常量一致。没有新增“源程序安全”“寄存器名字可靠”
或“后端 PASS 可靠”假设。

自动检查的事实包括捕获与实际对象身份、类型和定义—使用、原始接口、完整效果、
端点配对、活跃数据流、调用/激活覆盖、完整监视器及同次实际查询绑定。
仍被信任的是原八项中明确列出的 Clang/观察器语义、参考 ISA/CAT 桥接、
运行时前缀与排序实现、编码充分性、检查器实现精化及求解器可靠性等。
哈希、SAT/UNSAT 重放及测试均没有消除这些信任。

本轮修复了旧 API 的未经证明的符号寄存器命名路径，并在开发时修正一个运行时
寄存器复用导致的保守拒绝。新增验收没有发现并确认新的独立后端转换缺陷；
不可把注入故障算作真实缺陷发现。有限顺序组合证明属于标准方法的受限应用，
不声称重新建立独立算法创新。

## 5. 回归、复现与交付状态

- [完整单元回归日志](../../experiments/p1b/unit-regression/000.stdout.log)：**103 passed**。
- [原 P0 五项真实回归](../../experiments/p1b/regression-p0/results.json)：全部保持原结果，
  包括 main 断言遗漏、错误 join 和错误查询在后端 PASS 下被拒绝。
- [最终 P1a 六项回归](../../experiments/p1b/regression-p1a/results.json)：全部保持预期结果。
- [原始证据完整性检查](../../experiments/p1b/integrity.json)：
  对照本轮 Git 基线验证历史文件，原 P0 原始证据及原定理不变。
- [新增材料清单](../../experiments/p1b/manifest.json) 与
  [项目总清单](../../artifact-manifest.json) 含哈希；开发态失败和后续正式验收分别保留。

正例使用固定 Clang 21.1.8 与 Dat3M `b81ec6c...`；正后端复用未改动的
P0 Program/query 观察器。负后端有独立 pinned 构建回执。
AST、LLVM、转换结果、实际事件、独立 SMT、实际查询/结果、日志和实现快照均随各 run 保存。
工具二进制和下载缓存不进入 Git，版本、源文件与运行时哈希保留。

复现命令在项目目录执行；必须换用不存在的输出目录：

```text
python -m experiments.run_p1a_acceptance --out experiments/p1-replay/p1a
python -m experiments.run_p1b_acceptance --out experiments/p1-replay/p1b
python -m experiments.run_p0_acceptance --out experiments/p1-replay/p0
python -m experiments.review_p1
```

`review_p1` 固定复核本次封存的正式路径；新 replay 目录应查看各自的
`results.json`、程序证书和实际运行日志，不混称为本次已封存证据。

本轮到此停止。没有全量 SV-COMP、批量性能评测、新指令族或第三方扩展。
不同 worker 定义、不同参数对象和更一般调用/控制流仍需后续明确批准与证明；
当前结果不足以给出整个真实库覆盖率或论文成熟度结论。

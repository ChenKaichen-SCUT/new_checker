# 原始 CK 调用上下文的 guarded 适用性审计

冻结研究基线：`caed1a34dd551ba6ac1bfdf153675fb8cb13dc77`。独立审计分支：`codex/ck-guarded-context-audit`。
CK 上游提交：`8f0847cfe57b1479d8e63b89028831d94d0e4d26`。
本报告是静态 Go/No-Go 审查，不是新的转换认证或上游缺陷报告。

## 结论与停止条件

**No-Go：这 15 个 L2 位置中，没有一个未经修改的完整上游调用上下文属于当前 D_G1/guarded 实现域。不能仅通过捕获适配层完成接入。**

| 最终分类 | 位置数 | 含义 |
|---|---:|---|
| 完整域内但尚未完成接入 | 0 | 没有证明只剩 schema 障碍的对象 |
| 通用接入且认证成功 | 0 | 本轮未开发适配器、未运行认证 |
| 语义范围外 | 15 | 每项至少有一个已证实的必要条件违反 |
| 证据不足，无法判定是否域内 | 0 | 部分后续条件仍未知，但不影响已有的排除理由 |

15 个位置分布在 4 个翻译单元、4 个原始任务中；完整任务的审计读取 5 个翻译单元（另含 CK 客户端实现 TU0）。其中 5 个 FAA64、4 个 XCHG 首先违反 FAA32 接口范围。六个 FAA32 的最小排除证据是：

| 位置（均为 LLVM 行号） | 完整上下文的决定性障碍 |
|---|---|
| `ck_pr_faa:97` | 32 位 asm 访问同一 64 位局部对象，后续观察为 64 位；不满足完整同宽全局对象条件 |
| `ck_pr_faa:109` | 同上；这是同一宽度测试的第二次操作，不是第二个独立项目或随机循环中的位置 |
| `ck_pr_faa:135` | 相关 FAA 本身位于保留的 200000 次循环中，存在真实 LLVM 回边；输入来自 `random` |
| `ck_pr_fax:109` | `run_test_faa_uint` 中相关 FAA 位于 2000000 次循环；普通参考实现、随机输入和文本错误观察必须保留 |
| `ck-ec-complete:tu1:553` | 本函数自身无循环，但同一对象的 `movl`、`incl/setle`、屏障以及 `assert`/唤醒分支也属于完整上下文；当前源提取不支持这些语义 |
| `ck-ec-complete:tu1:782` | 相关 waiter 在同一计数器上执行完整等待链，含循环、CAS/其他 asm、回调和 futex；加法不位于被认证 worker 内，线程参数是栈对象 |

这不是“把所有 AST 中的循环都算成障碍”。97/109 的位点自身不在循环里；553 的函数 CFG 无环。本报告对它们分别使用对象条件及同路径其他操作作为排除依据。782 的等待循环则通过真实 `pthread_create` 实参、waiter 定义及跨 TU 调用到达同一计数器，具有直接相关性。

**按照用户设定的停止规则，本轮不编写捕获适配器，不修改 receipt，不启动 Clang/Lifter/优化/Dat3M/SMT，不增加 C 或 ISA 支持。** 原有 15 份 L2 结果继续保留；没有新的 L3、guarded 开放包含、闭合反例或程序 SAFE。

## 审计对象与可复核材料

入口为基线的 `experiments/gap45/summary-02/LLVM-sites.json`，筛选条件严格为 `L2 == true`，得到恰好 15 项；没有根据本轮结果变更分母。`tasks.json`、预登记 `registration-04/tasks.json`、原始同次 AST/observer/LLVM、15 个位置的原始接口及 producer/independent L1/LLVM 片段证书均被读取。

原始大文件在冻结仓库的 `experiments/gap45/published/index.json` 和 `objects/<prefix>/<sha256>.gz` 中。审计重建器直接从这些对象解压读取，逐文件核对 SHA-256/长度；不依赖后来手工整理的事件 JSON。五个 TU 的 receipt artifact 散列、原始源文件与预登记源散列、全部 observer buffer 内容散列、15 个接口的模块/行/来源声明/约束均重新核对。实际读取 731 个文件引用（含 CK 原许可证）。原有 SMT 文件被核对原字节，**没有重新调用求解器，也没有把字节完整性称为语义重证明**。

- [15 位置可读表](03-all-sites.md)：完整来源、宏、LLVM、操作数、用途与结论。
- [六个重点候选的逐条件审查](02-six-candidates.md)：已支持 / 违反 / 证据不足，逐项定位。
- [审计复核与边界](04-replay-and-review.md)：重建命令、实现限制和自查记录。
- [机器可读位点事实](../../experiments/ck-context-audit/evidence/sites.json)、[CSV](../../experiments/ck-context-audit/evidence/sites.csv)：完整 GNU 类型/约束/clobber、SSA 实参/返回值、原始 DILocation 链和接口证书路径。
- [输入散列清单](../../experiments/ck-context-audit/evidence/inputs.json)：每个原文件的公开 CAS 定位。
- `experiments/ck-context-audit/evidence/raw/`：五个 TU 的完整源文件、LLVM、receipt，以及原 observer 中完整 CK 头文件/common.h 的逐字副本，保留其许可证文本。
- `evidence/facts/`：所有原始定义的 observer/raw-AST JSON pointer、语法调用/循环/局部声明，以及 LLVM CFG 边、位点和返回值使用。该清单不是新的调用解析器或动态覆盖证明；`sizeof` 等未求值节点也会列出，不能把条目数量视作执行次数。

本轮未访问或重新构建上游仓库。固定提交、配置与原始文件来自已公开的冻结捕获，原始编译命令完整保存在 `registration.json` 与各 receipt 中。CK PR 测试的原配置包含 `-std=gnu99 -fstrict-aliasing -O2`，未固定随机种子、未修改 R_REPEAT/REPEAT。完整 CK 客户端保留 `src/ck_ec.c` 与 `regressions/ck_ec/validate/ck_ec_smoke_test.c` 两个 TU 和原注册配置。

## 实际使用的域与门禁

既有理论为 `docs/guarded/01-proof.md` 的 D_G1、提取引理和 G1-INCLUSION/G1-DIFF；保证方向仍是开放源历史包含于目标历史。域要求有限无环直接 worker、总的 unsigned32 标量表达式、完整分离对齐全局对象、普通读输入与 asm 写对象分离、完整监视器以及有限 create/join。

| 条件 | 实现证据（基线文件行号） | 此次判断方法 |
|---|---|---|
| G0 捕获身份 | `guarded/source.py:17–28` | 原始 native receipt 与 direct receipt 不同，记录为独立捕获问题；从不作为语义 No-Go 的唯一依据 |
| G1 FAA32 接口 | `source.py:30–35` | 原始 asm、类型、约束、宏来源及真实 LLVM 操作数逐项读取 |
| G2 完整宿主、直接一层 helper | `source.py:68–79,132–138,141–180` | 追踪相关函数及其真实调用；其他 helper 不能默认为纯计算 |
| G3 无环、所有路径可提取 | `llvm.py:27–51`; `actual.py:34–49` | 检查相关源循环与 LLVM 回边；非循环对象不借用其他函数的循环拒绝 |
| G4 定义良好的表达式 | `source.py:94–140`; `llvm.py:77–119` | 区分 unsigned32 算术与普通有符号/宽度转换、结构成员、未知调用；未知 UB 不判为真实缺陷 |
| G5 完整对象、无未知别名 | `source.py:87–89,120–121`; `p0_host.py:43–66` | 查看真实 alloca/global、类型与访问宽度，而非仅看 LLVM `elementtype` |
| G6 main、线程及观察 | `p0_host.py:70–177`; `actual.py:18–33` | 不允许假造 worker；原 main/create/join/错误观察必须全部保留 |
| G7 全部事件与边界 | `pipeline.py:19–29,33–41,67–102` | 不因只选一个 L2 位点而丢弃同路径其他 asm、普通共享访问或生命周期 |
| G8 开放比较、覆盖与查询 | `model.py:75–103`; `pipeline.py:67–102` | 需独立完整路径提取；L2 和原始后端捕获均不足以推出此条件 |

现有入口还有强于上述语义概述的工程限制：direct source extraction、唯一 asm 定义、精确 worker 签名/LLVM 属性、定义全集限制、路径预算 128。这些也记录在证据中，但本轮没有将无关头文件 helper 的存在当成核心不可行性证明。

独立于 schema 的推理是：设 `Eligible(p)` 要求既有条件 G1–G8 全部成立。对每个位点完整上下文，报告给出至少一个由原源码/LLVM 直接见证的必要条件违反；故 `¬Eligible(p)`。此推理不需要原程序安全、不需要后端 PASS，也不依赖那些尚未知的后续条件。更换 schema 名称不能改变这些反例证据。若要接受它们，至少需要新对象/宿主/循环/观察语义及相应证明，超过本轮授权。

## 证据不足与错误观察的处理

1. 三个 PR 测试的已保存原始 Q 捕获状态只说明后端形成了对象，不说明源循环的所有激活已覆盖。后端原有默认 bound 不能代替无界/完整源保证。本轮不使用它授权。
2. CK 完整客户端原始 Q 记录为 `REJECT`，原因为未完整导出 `com.dat3m.dartagnan.program.event.core.Alloc`。这是额外的实际 Q 阻碍；即便修复，也不能解决前述源域问题。此次没有重新导出或修复它。
3. `ck_pr_faa/fas` 的失败观察为 `printf` 后 `exit(EXIT_FAILURE)`；`ck_pr_fax` 的不匹配分支输出后返回，main 最终可返回 0。不能把“返回 0”当作原测试成功，也不能把它们无证明地换成 `__VERIFIER_assert`。
4. CK smoke 的真实 `assert` 展开为 `__assert_fail`/`unreachable`。存在原始错误观察是事实；它与当前 main/worker 监视器协议的完整语义对应尚未证明。
5. 宽度测试的 GNU/ISO C 有效类型问题、有符号参考计算的完整定义域、外部 libc/OS 行为、create 成功性和全局 rf/co/fr 均未得到本轮新的保证。这里的域外结论不是认定 CK 有 UB 或真实缺陷。

## 对适用性与研究路线的含义

本次审计比“native 捕获 schema 不兼容”多回答了一层：**在这批冻结对象中，即使提供忠实的通用来源恢复，也没有可直接调用现有 guarded 证明核的完整宿主。** 15 个局部 L2 仍体现原 asm→LLVM 端口认证的价值；不能把它们解释为 15 个真实程序可组合认证。

六个 FAA32 中存在真实分支、SP/MP 模式和活跃返回值，但没有对象满足执行路径提取前提，因此本轮不能宣称观察到非平凡 guarded 对应，更不能产生新的消融收益或 ISSTA 实验成功数。

No-Go 限于“固定的 15 个位置、原始调用上下文、当前域、仅做通用捕获适配”这一命题，不是 CK、局部认证或未来受控扩展的总体否定。后续若继续，需要用户另行选择语义范围/证明目标；本轮不据此启动循环摘要、栈/子对象模型、系统调用契约或新指令工作。旧定理、八项 Γ、认证器和全部历史结果保持不变。

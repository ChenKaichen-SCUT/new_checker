# 真实认证链审计：已经检查什么，还缺什么

基线 `25e67f8cf379c74857dd78bdf6e83f334555a269`；只做静态代码及既有证据读取。
本轮没有运行 Clang、Dat3M、SMT、重放、测试或构建。
审计对象包括当前认证模块、捕获/导出代码、既有 CK 报告与证明，
以及固定后端的求解/属性编码源码。文件身份见 [证据清单](evidence/source-records.json)。
这是一项有针对性的链路审阅，不是完整 Python/Clang/Java 代码库的形式审计。

状态用语：**已检查**是代码有相应接受条件且历史记录中运行过；
**TCB**是明确外部可信语义；**缺失**是释放程序结果前必须补的实际核对；
**范围限制**是可靠拒绝，不能自动算实现错误。

## 1. 逐层结果

| 层与实际代码 | 已实现的接受条件 | 仍未覆盖的保证 |
|---|---|---|
| [capture_ck.py](../../experiments/capture_ck.py)、[provenance.py](../../certification/provenance.py) | 同次 CodeGen/观察器产物；依赖/buffer/token 哈希；全部 AST asm 与实际 LLVM cookie 连接，唯一性、内联位置检查 | Clang/观察器保真仍可信；只允许一个 surviving asm、一个直接调用上下文；错误元数据不在当前保证内 |
| [interface.py](../../certification/interface.py)、provenance 的类型求值 | 实际 GNU 输出/input/tie/clobber 消费；原始 uint32_t/指针恒等转换、全局地址和常量实参；wrapper 返回值 | 一般别名/结构体地址/非固定 SSA 输入/限定符/多个输出未接入；不是完整 GNU 接口验证 |
| [reference.py](../../semantics/reference.py)、[check.py](../../checker/check.py) | 独立于 lifter 的受限 ISA 参考；开放读响应、值/guard/输出的差异 SMT；SAT/unknown 拒绝 | 参考语义与真实 ISA/内存域的桥仍可信；旧 `MODEL_VERSION` 名字不是实际 TSO/CAT 认证 |
| [prepare.py](../../certification/prepare.py) | 只替换实际 asm 文本区间；前后框架字节不变；SSA 碰撞拒绝 | 未修改文本不证明原始宿主编译正确；当前前缀按源摘要生成，未来多位置不能简单循环调用而不做新鲜性/全域覆盖 |
| [lowering.py](../../certification/lowering.py) | 重新解释实际 LLVM 替换文本；所有 SSA 定义、类型、事件、返回值；严格语法拒绝未知/poison 形式 | 解释明确针对固定 Dat3M TSO，不是通用 LLVM 并发语义；替换后优化不在支持域 |
| [run_pipeline.py](../../certification/run_pipeline.py)、[Snapshot.java](../../backend/dat3m/Snapshot.java) | 固定构建/CAT/输入身份；实际同一 Task/Program 的前后快照，字段完整性与配置检查 | Program 身份不证明 Task 属性、分析约束、实际 Wmm 解释、查询协议/编码正确 |
| [endpoints.py](../../certification/endpoints.py) | 实际闭合 DAG 区域的 guard、读写、A、RMWStore/load 配对、输出与参考匹配 | 基于源行提出候选，仍限稳定来源/固定拆分；实际区域 Fence 被拒绝；非固定入口存在命名绑定风险，见下 |
| [continuation.py](../../certification/continuation.py) | 从真实读写寄存器集合恢复唯一 live-out；worker eq/ne→assert 逐项比较；固定 runtime 前后缀 | 不支持一般输出计算/地址/分支；runtime 形状相符不是完整 pthread 精化证明 |
| [coverage.py](../../certification/coverage.py) | C/LLVM 创建位置与真实 spawned_thread/creator 双射；每个 worker 区域和后继覆盖；用户共享事件不能逃出区域 | 只覆盖所支持直线创建及 worker 形状；main 普通语义和 join/属性未由该检查推出 |
| [host_contracts.py](../../certification/host_contracts.py) | LLVM 全局初始化与 Q MemoryObject/Init、线程入口/返回、额外初始化线程检查 | 源初值到 LLVM 仍信任 Clang；main 内的全部指令、断言、join 关联未独立语义核对 |
| [certify_ck.py](../../experiments/certify_ck.py) | 串联上述检查；保存 scoped-chain 结果与 TCB | `program_verdict_eligible=false`，正确地未发布整程序安全结论 |

历史 CK 验收：[15](../15-ck-acceptance.md)。
它认证了原始上游一个例程在自建 harness 中的局部链，两个潜在 worker 激活，
不是一份未修改的上游并发客户端/数据结构的整程序验证结果。
历史通过/拒绝记录均不改写。

## 2. 三项最重要的新增明确化

### G1：main 和生命周期是程序级缺口，不是尾部文案

`provenance._reconcile_objects` 约第 470–510 行限制 main 的语句及调用名字，
恢复 pthread_create 清单；`prove_source_assertions` 则核对 **worker** 的观察。
`host_contracts.check_host_objects` 约第 25–68 行核对全局与线程边界，
没有对 main 的每个 Assert/Load/Join 做语义解释。
`coverage._certify_workers` 的核心循环也以 worker 为对象。

因此目前无法由这些检查推出：

- main 的源断言条件与实际 Q Assert 相同，且全部源监视器存在；
- 被 join 的 handle 精确对应应等待的线程，返回/等待条件保持；
- main 的普通共享读写和控制既不遗漏也不凭空增加；
- LLVM 初始化确实实现源初始化，而不是仅与 Q 一致。

导出器已经提供 ThreadJoin.joined_thread、ThreadCreate.spawned_thread、
参数及 Assert.expression 等字段，故部分缺口可以在 D₀ 内直接利用真实对象补齐。
不必以一般程序对齐为前置研究，但也不能只比较数量、调用名或源码行。
完整 pthread 内部协议仍可作为单独、受版本约束的 TCB，不能被结构检查“证明”。

### G2：真实 Program 与真实错误查询之间还有一层

固定上游
[AssumeSolver.java](https://github.com/hernanponcedeleon/Dat3M/blob/b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8/dartagnan/src/main/java/com/dat3m/dartagnan/verification/solving/AssumeSolver.java)
在程序/模型预处理、静态分析后，加入程序、模型、对称性和变量边界编码，
通过 assumption literal 激活属性，先查安全错误；若 UNSAT，再查 bound 事件。
属性合成类型还会影响结果解释。
[PropertyEncoder.java](https://github.com/hernanponcedeleon/Dat3M/blob/b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8/dartagnan/src/main/java/com/dat3m/dartagnan/encoding/PropertyEncoder.java)
区分 safety/reachability，并对 ASSERT 编码执行到的断言违反。

当前 [instrument.py](../../backend/dat3m/instrument.py) 的两个钩子位于编码前与
加入 assumedSpec 后；同对象检查很有价值，但没有导出/核对上述完整求解任务语义。
`run_backend` 验证日志中的 PASS/FAIL、退出码、快照和 SMT 文件存在及哈希，
不独立核验属性监视器集合、查询栈及 assumption 的对应关系。

**静态读到的实际细节**：历史
[candidate.ll.smt2](../../experiments/ck-provenance/acceptance-01/backend/solver-output/candidate.ll.smt2)
第 960–969 行，第一次查询 push 后 assert `DAT3M_spec_assumption`，
查询后 pop；第二次 Bound encoding 加入 `assert false` 再查。
该文本与后端“无 bound 事件时界限违反公式为 false”的代码相符。
这里没有重跑或发现新的后端错误；结论是：
**最后一次 UNSAT、文件含 UNSAT 注释、或将整个文件末态重放，都不是错误查询证明。**

最小补强是保存和核对任务包：Program/CAT/config 身份、属性种类、全部用户
监视器、输入域、bound 义务、查询编号、push/pop/assumptions、结果及 verdict 规则。
编码/分析/对称性不会遗漏错误仍属 Γ_encode，不能仅靠多导出一份 JSON 消除。

### G3：放宽“常量操作数”前必须关闭潜在错误绑定路径

`endpoints.py:114–125` 的 `llvm_value` 对 `%name` 尝试使用后端寄存器
`r` 加原名称，并检查其存在和位宽；它没有证明这两个对象表达同一入口值。
当前生产 CK 路径由 `coverage.supported_worker` 限制为静态全局地址及十进制常量，
因而不能据此宣称已有正例发生了错误认证。

但是**直接解除常量限制不安全**。下一次非固定实参扩展必须从实际 LLVM 定义、
参数/调用绑定及 Q 定义使用链得到入口关系，逐值检查；不能把名字巧合当作证明。
这正是工程扩展与可信边界的接合点，不需要命名成新 correspondence 算法。

## 3. 程序级最小补齐顺序（仅建议，未实施）

| 优先项 | 最小交付条件 | 保留的信任/拒绝 |
|---|---|---|
| P0-A，完整 D₀ census | 源/LLVM/Q 的 main、worker、全局、所有普通访存/监视器/创建/join 都有清单；无剩余可执行对象 | 未支持控制或外部调用拒绝；哈希不替代来源真实性 |
| P0-B，宿主与 monitor | 解释 D₀ main 的初始化、直接调用参数/handle、join、末尾共享读及 assert；与实际对象逐项关联 | Clang 域内宿主编译与 runtime 开放协议仍明确可信，逐步缩小而不隐去 |
| P0-C，真实查询任务 | 绑定安全属性、输入/边界、全部监视器、两次查询及结果；UNKNOWN/不匹配拒绝 | 固定编码/分析/求解器 TCB；不从 PASS 推编码正确 |
| P0-D，结论分级 | C0–C4 全成立才可标注条件式程序 SAFE；缺项保留 scoped-chain/REJECT | 仍不宣称无条件验证整个 GNU 编译器；FALSE 另需源反例见证 |

最小扩展无需换 Clang/Dat3M、加入新指令或实现一般宿主语言。
用户批准后才可按项实现和验收；本轮没有打开任何 gate。

## 4. 仍属于范围/证据问题的事项

- MFENCE 在参考/LLVM 层可表达，不代表实际端点导出已支持；
  参考 `F` 在当前 region 检查被拒绝。SFENCE/LFENCE 不能自动等同 MFENCE。
- 空 asm 的 compiler barrier 必须由宿主编译约束保留，不是硬件 Fence；
  允许其无内存端点不等于允许编译器越过它任意搬移共享访存。
- region 从行号获得候选，不消除元数据 TCB；当前强唯一性是可靠拒绝的一部分。
- 本地证书保存 SMT 查询而非内核可校验的证明，solver/checker 仍在 TCB；
  `EXACT` 是相应判据的结果，不是无条件 ISA/整程序正确性证明。
- 一次 build hash 对齐不证明编译器、Java 分析实现及导出器没有 bug。
  需要工程审计、独立反例和版本回归，但测试不能替代 [01](01-end-to-end-guarantee.md) 的证明。

本轮发现的是**具体、可定位的未闭合检查及扩展风险**；
没有新运行证据，未声称发现一个新的已接受错误实例。

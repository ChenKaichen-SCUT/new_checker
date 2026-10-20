# 基线阅读、证明前提与复用边界

基线：`b7b3b2e3aa25fbd2746bd602caae68003e490026`，开始时本地 HEAD 与之相同，
工作区干净。本批只新增研究文档和更新入口/交付清单，不修改认证器或历史验收材料。
[基线摘要清单](evidence/baseline-files.json) 固定文件身份；
字节保持检查不构成实现正确性证明。

## 1. 既有成果的准确位置

[CK 报告](../15-ck-acceptance.md) 记录固定上游 CK
`8f0847cfe57b1479d8e63b89028831d94d0e4d26`、Clang 21.1.8 和 Dat3M
`b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8` 的受限证据链：
188 个 GCCAsmStmt 中连接一个存活静态 asm、一个直接内联调用上下文，
覆盖两个真实 worker 激活。保留原始 uint32_t、指针转换、`+m`/`+q` 和 clobber，
后继断言使用返回值。33 个局部 UNSAT 与 2 个 SAT 可达性义务是历史结果，
本批未重跑；后端 PASS 不是认证前提。

六个组件故障和两个真实后端故障的拒绝记录仍保留。
此前 [CK 拒绝](../14-controlled-acceptance.md)、[最小验收](../13-minimal-acceptance.md)、
[修补报告](../12-review-repair.md) 是各自阶段的历史状态，未重写成后来的成功。
程序级判定转移门禁保持关闭。

## 2. 已有算法与逻辑证明

| 材料 | 本轮复核的关键内容 | 对新任务的意义 |
|---|---|---|
| [01 范围](../01-scope-and-semantics.md)、[03 模型](../03-formal-model.md)、[04 反例](../04-counterexamples.md) | GNU/ISA 子类、开放读、观察与 TRUE/FALSE 方向、错误排除条件 | 保留原语义边界；不把新方向误写成已证明 |
| [05 算法](../05-checker-algorithm.md)、[06 证明](../06-correctness-proof.md) | 全响应表达式义务、接口分配、开放前缀耦合、上下文图构造 | 可复用独立参考和局部数据检查 |
| [07 弱内存](../07-weak-memory-extension.md)、[08 模型实例](../08-complete-proofs.md) | 保标号双射输送关系及模型公理 | 不适用于一般删除/合并后的非双射 |
| [修订 01](../revision/01-interface-and-scope.md)、[02](../revision/02-objects-and-obligations.md)、[03](../revision/03-algorithm-and-proofs.md) | H/L/V/D/R/T：实际接口、LLVM 片段、DAG 与固定 TSO 端点 | 串联对象身份与语义；R/T 仍依赖展开端点对应 |
| [修订 04](../revision/04-implementation-and-review.md)、[05](../revision/05-preflight-audit.md) | 实现与证明前提差异、门禁、无法检查时拒绝 | 代码存在不等于证明前提已保证 |
| [修订 06](../revision/06-live-continuation-proof.md)、[07](../revision/07-cas-and-related-work.md) | C-live、失败 CAS 的读/条件写/配对/A 标签 | 继续保留，不能因结构推广删除 |
| [修订 08](../revision/08-provenance-design.md)、[09](../revision/09-ck-composition-proof.md) | P/I/N：唯一 cookie、类型化内联、源与实际 worker census | 来源唯一性和单调用限制正是待替换部分 |
| [现有创新性审计](../16-method-contribution-review.md)、[对抗审阅](../10-adversarial-review.md) | 未建立独立方法贡献、明确可信边界 | 本批补入 VALID/PAA/JTFG/SEQ 等强竞争基线 |

原 [06 定理 2](../06-correctness-proof.md) 已正确区分 TRUE/FALSE 的包含方向。
本批强调方向是因为新任务引入“合法优化/事件删除”，**不是发现原证明把方向写反**。
同样，新反例攻击的是候选泛化，不能当作本批复现了新代码错误。

## 3. 真实实现逐层审阅

路径均相对于项目根；链接可直接查看源码。

| 实现 | 已做的事 | 不能外推的事 |
|---|---|---|
| [Observe.cpp](../../frontend/clang/Observe.cpp) | 在实际 Clang 运行中保存 asm census、SourceManager、类型化函数体、源缓冲区 | 不是完整 GNU C/C++ 语义解释器，也不证明 Clang 正确 |
| [provenance.py](../../certification/provenance.py) | 固定捕获身份；将实际 asm 的 srcloc cookie 与全部 AST 候选连接；要求唯一存活调用；检查直接内联、原始参数/约束和后继 | 无不可信/缺失来源的搜索；无多存活 asm、多直接调用的一般算法 |
| [interface.py](../../certification/interface.py) | GNU/LLVM 约束消费、ties、内存指针/宽度、结果 SSA 与替换外字节保持 | 单 asm 和严格表达式子类；框架字节相同不证明编译前后的全部宿主语义 |
| [prepare.py](../../certification/prepare.py) | 受控入口必须经过捕获/接口，再提升与独立检查实际替换 | 不能把内部较弱 API 单独调用当完整认证入口 |
| [reference.py](../../semantics/reference.py)、[check.py](../../checker/check.py)、[target.py](../../checker/target.py) | 独立源解释与候选解释、全称位向量义务、开放新读响应、接口 hazard | 骨架和逐位置事件比较，非任意对应搜索 |
| [lift.py](../../lifter/lift.py)、[llvm_tso.py](../../backend/llvm_tso.py)、[lowering.py](../../certification/lowering.py) | 不可信候选生成；实际 LLVM 片段重解释；RMW 更新时点等已修补 | 仅白名单指令/表达式；没有完整 LLVM 并发语义等价证明 |
| [endpoints.py](../../certification/endpoints.py) | 实际 successor/跳转闭合、无环解释、guard/值/配对/A 标签；共享端点逐位置比较 | 预期拆分和相同端点数；参考 Fence 接入仍拒绝，不支持任意区域变换 |
| [continuation.py](../../certification/continuation.py) | 从区域写与后继读自动确定 live-out，检查实际 Local/Assert 和 LLVM 后继 | 单 live-out 与有限后继语法，不是一般 SSA/控制流对应 |
| [coverage.py](../../certification/coverage.py) | LLVM worker 形状、有限 main 创建结构、实际线程创建链接、区域外访存与未知控制拒绝 | 一次 asm、有限直接 worker、常量/静态地址；依赖 debug 定位候选实例 |
| [host_contracts.py](../../certification/host_contracts.py) | LLVM 与 Q 全局布局/初始化、线程运行前后框架的白名单检查 | 没有独立证明原始 C 的全部初始化、join 与 main 断言语义 |
| [Snapshot.java](../../backend/dat3m/Snapshot.java)、[instrument.py](../../backend/dat3m/instrument.py) | 在实际编码前后从同一 task/Program 导出类型化对象、配对和身份；固定 hook | 不是从哈希证明导出忠实或 encoder 正确；未知类别须拒绝 |
| [run_pipeline.py](../../certification/run_pipeline.py)、[evidence.py](../../certification/evidence.py) | 固定构建、同次对象、完整记录和失败门禁；PASS 不作为局部接受条件 | 没有给全部 Python/Java/SMT 编码作机械实现精化证明 |

### 宿主范围中特别需要保留的边界

源级检查确实核对选中 CK 调用、有限 worker 后继和创建 census，不能说全部宿主
都未经检查；但 `Globals` 捕获并不是完整初始化表达式语义，普通 main/运行时
框架的全部 C→LLVM→Q 行为也未独立证明。相关检查只覆盖白名单事实，其余属于
明列 TCB。这不推翻已按 TCB 限定的 CK 结果，但禁止把它升级为整程序证明。

来源捕获、接口、实际片段、实际端点各自重建对象，有助于避免“用输出定义预期”；
不过它们共享解析器/参考库/求解器等 TCB。模块分开不等于实现证明独立，
也不等于两个模块不能犯相同错误。

## 4. 五类前提不能因泛化而混在一起

| 前提 | 基线现状 | 新任务中的正确处理 |
|---|---|---|
| 历史来源提示 | 固定 Clang 来源契约加唯一性检查 | 提示可错；语义覆盖重新证明；历史不可辨识时不声称唯一来源 |
| 活跃表达式与调用绑定 | 狭窄源/LLVM/Q 关系已经检查 | 扩展语法必须有新解释规则与义务，不能只扩 parser |
| 端点结构 | 展开参考与实际端点保标号对应 | 非双射需要模型专属历史/模拟证明，不能改 zip 就宣布成立 |
| 动态覆盖 | 有限直接创建实例已核对 | 多调用/循环/分支需要执行覆盖及进展，不能仅增加允许数量 |
| 宿主/后端和实现 | 显式外部假设与未机械化部分 | 继续列出；不能把“不依赖提示”扩大为“无 TCB” |

## 5. 复用建议与冻结范围

可复用：真实捕获及摘要、GNU 约束解释、参考指令语义、LLVM 片段重解释、
实际 Q 导出、表达式 SMT 义务、失败结果保存。
应被新证书层替换或泛化：唯一来源选择、单调用/单输出形状、逐位置区域关系、
动态出现的关系组合。扩充之前先有充分性证明。

本批**没有新代码缺陷复现**，没有新增接受实例；发现的是候选泛化的证明风险、
更直接的竞争算法和实现边界。原始材料的哈希检查只验证保存完整性。
文献审计亦为本研究中的对抗性复核，不冒充独立外部同行审稿。

# 充分条件、实现与可信边界

本表对应 [受限定理及证明](01-model-and-proof.md)。数学证明是解析证明，
Python/Java/C++ 实现没有机器核验的 refinement 证明。实际检查结果不取代这一差别。

| 条件 | 实现及证据 | 不能据此声称 |
|---|---|---|
| 真实 P/AST/L/配置、原始 CK 接口与完整 LLVM site census | 复用 `authenticate_capture`、`prepare_ports`、类型化接口、L1/L2、未修改 LLVM frame 检查 | Clang 已形式化验证；支持任意 GNU C |
| 有限直接 create/site 激活及完整 C→LLVM 宿主行为 | `property_source.prepare_property_source` 调用 `prepare_scope` 与逐语句 `source_worker(pure_conditionals=True)`，逐操作比较地址、类型、调用上下文、输入、断言 | 不再需要宿主语义；支持隐藏语句/循环/条件创建 |
| 新增纯 if 的充分条件 | `p1_entry.source_worker` 消费条件与两个 compound arm；仅现有无符号局部赋值/加法；构造 ITE，比较实际 LLVM | 一般分支或条件共享写的正确性 |
| 全部实际 Q 结构/顺序/标签/配对/输入/返回使用 | `program_workers(collect_only=True)` 仍逐事件消费；只暂存通用等式，状态为 PENDING；完整 main/init/runtime 由 `program_main` 检查 | PENDING 等于 EXACT；单个片段代表完整激活 |
| 双侧完整对象访问表及单动态 owner | `property_obligations.reconstruct` 从所有源操作与实际 Q Load/Store/RMW/Init 重建访问 census，核对 Counter；只接受完整常地址对象 | C storage class 等于动态独占；未知别名安全 |
| 两侧数据/条件依赖和并发闭包 | 实际 Q 符号解释与源式的未简化自由变量；read→全部同对象 write；所有非 owner write 与边界等式为根 | 仅靠源侧切片或某次 rf 选择证明无干扰 |
| 无干扰边界及全义务覆盖 | `check_plan` 重建 facts；`verify` 独立检查哈希、根、闭包、owner、完整 selected/omitted census；唯一可省类型为 FAA write-value | 任意未匹配区域均可省略；可以删除原子事件 |
| 所选等式普遍成立 | 原 `Obligations` 对否定式检查 UNSAT，10 秒超时，SAT/UNKNOWN 拒绝；省略式仍保留 PENDING 原式/SMT/哈希 | UNSAT 是算法普遍正确性的证明；省略式已被证明相等 |
| 统一 TSO rf/co/fr、A、rmw、fence、po | 复用全结构检查；新证明 Lemma C/D 在一张源图上作值重建，保持全部关系端点 | 独立片段的 rf/co 可以任意拼接；通过删除 fence 得到同样保证 |
| 同次实际性质/assumption/安全与 bound 查询 | 原查询检查器增加显式 PD0 profile；仍校验完整监视器、实际约束/查询栈/结果与重放 | 最后一次 UNSAT 或 PASS 足够；性质证书可自动变成 L4 |
| 最终授权 | `experiments.certify_property` 从真实对象重新执行上述全部检查；核对 Q 前后相同、实现快照、原 Γ/定理；仅无故障正构建可授权 `PROPERTY_CONDITIONAL_SAFE` | 受控修改后的分析/编码仍自动满足 Γ_encode；已证明原程序无条件安全 |

## 独立性与边界证书

候选生成器只输出闭合集和 selected/omitted 名单。它不能输入可信 owner、
可信依赖图、可信 EXACT 或源/目标寄存器表。生产入口先从实际对象完成结构与
宿主检查，再由 `check_plan` 重建图/owner。`verify` 是内部接口，其 facts 必须来自
这一可信重建；直接加载任意 JSON 后调用 `verify` 不构成完整认证。离线重放应
从原始 capture/Q 重新执行重建，不能把已有证书状态当作前提。

省略的是特定 **等式义务**，不是全部区域。L1/L2、所有宿主语句、完整实际事件、
线程、运行时同步与查询仍检查。读输出的通用 reference-return 恒等式也继续求解；
仅当其实际使用不通向性质/边界时，不把“存在返回值”本身作为相关性根。

候选闭包使用邻接表工作队列；闭包部分 O(n+e)。访问/同对象干扰构造保守为
O(s+n²)。算法文档中 O(s+n+e) 的证书检查界对应按对象预建索引的实现；当前
`verify` 仍逐 owner 扫描读写表，并排序核对规范形式，实际保守上界为
O(s+n²+n log n)，不能声称原型已实现线性证书核验。独立核对仍处理所有原始
表达式和义务；SMT 最坏成本可指数增长。
开发版 `final-01` 用重复扫描计算同一最小闭包；最终 `final-02` 改为工作队列，
不是新的语义规则，也没有性能收益实验。独立检查并不要求闭合集最小。

## 新旧 TCB 对照

八项 Γ 的证书文字直接导入原 P0 常量，没有新增 HCC 或编译器正确性假设。
这不等于 TCB 变小：新增 C 分支解释、依赖/owner 重建、边界核验及授权代码
均扩大 Γ_check 下的可信实现表面，仍需审阅。

| 原 Γ | 本轮状态 |
|---|---|
| Γ_front | 原 Clang 预处理/类型/声明/元数据真实性和开放宿主编译契约仍是外部假设；受限语句的独立检查提供实例证据，没有一般 compiler proof |
| Γ_ISA | 原 x86 WB/对齐有效对象/参考解释器/TSO CAT 桥不变；未增加指令族 |
| Γ_capture | 原只读 observer/exporter、操作系统与构建记录真实性不变；新增测试故障类不属于正构建 |
| Γ_runtime | 固定 pthread 协议覆盖源生命周期错误前缀、无附加限制/别名的外部契约不变；仍完整检查协议形状及式子 |
| Γ_encode | 原 ENC-minus、分析/对称性/界限/CAT/错误前缀编码覆盖假设不变；受控故障构建不授权 SAFE |
| Γ_check | 新模块也必须实现其数学条件；没有机械化证明。这是实现 TCB 扩大，非新增语义保证 |
| Γ_solve | 本地 SMT/实际后端 UNSAT 的可靠性仍被信任；重放不是独立 proof object 核验 |
| Γ_domain | LP64、有效完整非混宽对象、成功生命周期、定义良好宿主行为不变；普通输入对象与 asm 修改对象仍分离 |

## 证明状态和支持范围

- **已解析证明**：总的类型化表达式依赖；纯 if 环境合并；闭包可靠性；
  单动态 owner 的 TSO 最新写性质；同一全局图上的目标值修复；有限错误前缀包含。
- **条件式结论**：PD-SAFE 需要上述检查事实和原八项 Γ；可靠 UNSAT 才能推出
  固定 phi 的安全。目标 SAT 不据此推出真实源 bug。
- **仅实验支持**：本实现通过所列正负验收、Z3 重放和旧路径回归；这些不证明实现普遍正确。
- **未解决**：多写线程值修复、条件事件/CAS、用户 fence 新范围、循环归纳、
  任意性质子集、一般别名/宿主语义、通用 HCC，以及独立方法创新。

历史 L1–L4 和 E2E-SAFE 未改。即使新证书没有省略任何义务，也不自动重标为 L4；
需要原路径自己的完整检查。新分支能力仅在显式 PD0 路径启用，旧路径继续拒绝
自己不理解的 C 分支，保持已有层级的含义。

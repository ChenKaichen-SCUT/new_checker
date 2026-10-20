# P0：原 E2E-SAFE 的受限实例与检查对应

基线：`7309c4e48521f2b2baed6f9fb418dce5bb8f8fa5`。
本文件说明新增代码如何落实原条件；**不替换、不放宽**
[原定理](../system-review/01-end-to-end-guarantee.md)。
原文件 SHA-256：
`8f4f91dc9a4002563389609879a653512ae7d687ac38c4bae164146c55d9d596`。
生产入口检查此摘要，不接受悄然更换的定理版本。

## 1. 精确接受域与观察

P0 实现接受 D₀ 的严格子集，称为 D₀-P0：

- 原始 GNU C，固定 Clang 21.1.8、x86-64 LP64、固定 Dat3M 提交和 TSO CAT；
  仍使用同次编译的 observer、完整 raw AST 和实际 LLVM。既有宏/接口准入不放宽。
- 文件级全局对象为无显式初始化器的 unsigned 32/64 位整数定义；
  C 静态零初始化分别与 LLVM global、Program MemoryObject 和 Init 对比。
  `extern`、TLS、未知属性、复杂初始化器拒绝。
- main 无参数、返回 int，直线执行。局部变量只允许未初始化的 64 位 pthread handle；
  直接 create 到已认证 worker，attr 和参数为 null；每个 handle 创建一次、join 一次；
  所有 create 在 join 前，所有用户断言在全部 join 后，最终 return 0。
- main 断言为共享全局读取与同类型常量的 `==` / `!=` 比较。
  每次读取分配独立自由位向量 U，不使用最终值、PASS、rf 或 co 限制 U。
  **main 的显式普通共享写不在本次接受语法内**：遇到就拒绝；
  对当前输入的完整写清单确认为空，目标中额外用户写也会拒绝。
- worker 继续受原宏来源、单存活静态 asm、直接内联、常量标量参数、
  静态全局地址、有限 create 激活和活跃输出检查约束。没有 P1 扩展。
- LLVM main 的每条指令、外部声明和属性组均消费或拒绝；只接受当前固定 ABI、
  对齐、局部 lifetime、handle load、create/join、共享 load、icmp、zext、assert、return。
  不接受循环、任意分支、poison/undef、未知调用或后续优化。
- Q 全部线程和全部事件必须落在 main、已认证 worker 或初始化线程分区。
  pthread 协议必须是本次固定对象模板；用户 Fence、其他事件结构不在 P0 范围。

这是保守缩小实现域，不是把所有 D₀ 输入标为已支持。
实际验收仅涉及一个 unsigned 32 位全局 `x`、两次 worker 激活和三处用户断言。
支持语法中的位宽参数不等于已有 64 位系统验收证据。

观察是所有源用户断言的身份及真假、main 返回值；worker 返回的旧值通过其断言保持活跃。
用户断言失败按**有限前缀**解释。程序级证书不把正常结束作为源错误存在的必要条件。
线程库成功、有效地址和 WB 内存等环境限制仍是原 Γ_domain。
不通过 ISO C 数据竞争 UB 排除源行为。

## 2. 条件与实现一一对应

| 原条件 | 自动检查与具体位置 | 尚不等于什么 |
|---|---|---|
| C0，S/A/L 身份 | `authenticate_capture` / `prepare_observed`：完整依赖、原 CK 字节、同次 AST/LLVM、全部 asm 来源与消费；`certify_p0.run` 固定构建和定理摘要 | 不证明 Clang/observer 语义正确 |
| C0，L′/Q/Task 身份 | 原 frame 检查、Clang 无 passes 的模块验证、`run_backend` 实际 candidate 摘要、同次 before/after Program；P0Audit 的 Task/context 身份及 run ID；查询检查器复核实际文件摘要 | 不抵御被信任的 OS/导出器蓄意伪造 |
| C1 | 原 GNU 接口、BLOCK、LLVM_FRAGMENT、每个真实区域和自动活跃输出投影检查原样保留；每一激活重新检查 | 不扩大 ISA、非固定绑定或区域支持 |
| C2.1 | `source_main` 的 raw AST 全局定义清单；`llvm_main` 全部 globals；`program_main` 全部 MemoryObject/Init；地址、宽度、初值、对齐、对象分离 | 不证明任意别名分析 |
| C2.2 | C main 解释为逻辑操作序列；LLVM 全指令解释；各共享 read 使用相同自由 U；C↔LLVM、C↔Q 监视器差异 UNSAT；既有 worker 开放接续 | 不是在 `x=2` 下检查断言 |
| C2.3 | 未消费 C 语句、LLVM 指令、Q 事件均拒绝；main 共享写清单为空；初始化与普通 load 不能省略；所有事件字段完整性/读写清单核对 | 不支持源显式赋值后自动忽略 |
| C2.4 | C handle declaration → LLVM alloca/实际 load → create → 实际 spawned thread；join operand → 同一 handle → 实际 joined thread；协议内存对象从实际事件恢复并绑定 worker；模板字段逐项检查 | **Γ_runtime 的全环境、前缀和排序语义仍被信任** |
| C2.5 | main 逐断言核对，worker 源接续与 Q 逐断言核对；实际全部 Assert 清单等于三处用户监视器加两处运行时监视器；任意额外 assume 不能被跳过 | 监视器前缀编码保全仍需 Γ_encode |
| C3 | 源/LLVM create 清单、实际 worker/ThreadCreate 唯一覆盖；main/worker/init 分区穷尽全部实际事件；successor 链、区域闭合、join 前向 CFG、所有线程用户端点顺序 | 不把不同线程的局部 rf/co 拼接为存在性证明 |
| C4，属性 | P0Audit 读取同一 VerificationTask 的 PROGRAM_SPEC、SAFETY、ASSERT、全部实际 Assert 的执行式/条件式、实际 bound 事件 | 不自行重定义“错误” |
| C4，查询 | 实际传给 prover 的四个基础公式、属性、assumption、assumed property、bound 公式；同次调用阶段、参数和布尔返回值；实际 SMT 栈解析与公式等价检查 | 不根据日志 PASS 或最后 UNSAT 释放 |
| C4，完整性 | 源/Q 有限无环、无 bound 事件；SAFE 必须有 safety UNSAT 和后续 bound UNSAT 两个完整调用，且实际审计 completed；重放实际两条查询 | bound=false 的 UNSAT 不授权安全 |
| Γ | `certify_p0.GAMMA` 的八项固定文本随每份证书发布；条件式结论、`unconditional_safe=false`、`external_semantic_assumptions_proved=false` | 没有自动证明 Γ 成立，没有扩大 TCB 来跳过 C2/C4 |

生产入口不接受人工 AST 节点、事件 JSON、返回寄存器映射或“已通过”布尔参数。
局部 API 不是认证入口；外部调用局部 `check_host` 得到 EXACT 不能释放 SAFE。

## 3. 宿主检查充分性引理

**引理 H-P0。** 在原 Γ_front、Γ_capture、Γ_check、Γ_domain 下，
若既有接口/worker 检查接受且新宿主检查返回 `D0_OPEN_HOST_EXACT`，
则 D₀-P0 的 C2.1–C2.3、用户监视器对应、有限控制/激活清单条件成立；
在额外使用原 Γ_runtime 时，C2.4 及其前缀、顺序和协议投影条件成立。

**证明。**

1. 对源 main 语句表按长度归纳。空前缀只有已核对的零初始化对象和未初始化私有 handle。
   声明只引入无初始化计算的固定宽度私有存储，不产生用户端点。
   其他所有接受分支都显式追加逻辑操作，未识别语句拒绝，所以没有默许的源副作用。
   raw AST 与 observer 全局身份清单相等排除未检查的初值；全 LLVM global 和 Q 对象/Init
   清单相等排除未检查的目标初始化。
2. 对 LLVM main 指令表归纳。alloca/lifetime 仅管理已识别的私有 handle；
   create 必须消费下一项源 create，并把真实指针 SSA 绑定源 handle；
   私有 load 只能读取活跃且已经 create 的 handle，join 只能使用此实际 load 的值，
   并消费该 handle 的下一项源 join。没有由 `%9 → r9` 等名字约定产生的关系。
   pthread 返回状态必须真的未被使用；否则不能把它当无关状态。
3. 每个用户 load 消费源序列中的同对象同宽度 load，并把对应自由 U 赋给实际 SSA。
   icmp/zext 独立解释为精确位向量函数。每个 assert 消费源断言，并检查
   `¬(P_C(U)=P_L(U))` 不可满足。由 Γ_check/local UNSAT 可靠性，等式对所有 U 成立。
   归纳没有加入初值、线程调度或最终安全事实；所以是开放等价，不是闭程序特殊值检查。
   未消费指令、操作顺序不符或缺少结尾都拒绝。
4. 对 Q main 的逻辑操作消费顺序归纳。create 必须有实际协议 Store 和 ThreadCreate，
   子线程及参数精确匹配，协议对象与 worker 启动/结束对象相同。
   join 必须有固定的前向、闭合模板，真实 joined thread 与该源 handle 的 create 相同；
   读/写宽度、A/RMW 标签、实际 load 配对、更新式、两个跳转、assume 和内部断言分别检查。
   join 状态和读取响应使用自由符号比较模板表达式；不会假定某条分支不发生。
   这一步**只识别并密封**协议实例，不从模板名称推导运行时精化。
   原 Γ_runtime 恰好提供其隐去协议后的全环境生命周期实现，故可用于已核对的实例。
5. 用户 load 把同一个 U 赋给实际 Q writer。实际表达式的所有寄存器都从导出的字段恢复；
   全读写清单、类型和字段完整性检查排除隐藏的寄存器依赖。每个实际用户 Assert
   对自由 U 与源谓词比较；可靠 UNSAT 给开放相等。内部断言单独列出，不可替代用户断言。
   每个用户操作前后顺序由消费次序和实际 successor 链固定。没有额外的未消费 assume 或 Fence。
6. worker 使用既有开放接口/区域/接续引理；main 返回和 worker null 返回均实际核对。
   所有 worker、main 和初始化事件分区穷尽 Q，且身份唯一。每个实际 create 使用唯一激活，
   每个源 create 被消费一次，join 关联和返回保持。有限直线源、有限线程创建以及前向目标
   区域/协议给有限秩。源或目标剩余事件/出边不能作为“无需检查”逃逸。
7. 因而，对任意合法洞输出和共享读取响应，全部用户端点、监视器和程序顺序保持；
   依原 Γ_runtime 处理完整协议和前缀。原 Γ_encode 的前缀条件仍不可省：
   模板被识别不证明后端不会用未来的条件消去已有错误。□

这不是 Python/Java 的机器精化证明。代码忠实于上述语法与检查规则仍属于原 Γ_check。
针对性故障检查提供实现证据，不代替此归纳。

## 4. 查询绑定引理

令实际基础约束为
`B = Program ∧ MemoryModel ∧ Symmetry ∧ VariableBounds`；
`a` 为实际 assumption literal；
`E_i`、`P_i` 为同次实际 Assert 的执行式和条件式；
`Bad = ⋁_i(E_i ∧ ¬P_i)`，包括用户及内部运行时断言。
令实际属性公式为 `F`，实际 assumed property 为 `J`。

检查器不是简单比较 `F=Bad`：固定 PropertyEncoder 还使用一个报告用布尔变量。
自动取 `V = FV(F) \ FV(Bad)`，要求 V 全为布尔量且与 B、a 不相交；
要求 a 是独立布尔变量，既不出现在 B 也不出现在 Bad 中。
不靠手工填写报告变量名称，而检查：

```
J ↔ (a ⇒ F)
(∃V. F) ↔ Bad
Φ_safety ↔ (B ∧ J ∧ a)
```

这些是本轮新增查询义务。`Φ_safety` 是从同次真实 SMT 文本及 push/pop 栈恢复的公式；
`a` 的实际传参另与导出的 assumption literal 比较。
SMT 流中的状态文本只是交叉核对；接受结果来自原 solver 调用实际返回值以及对应查询重放。

**引理 Q-P0。** 上述检查成立时，
`∃a,V. Φ_safety` 与 `B ∧ Bad` 等价。若正确绑定的实际安全查询可靠 UNSAT，
则实际基础编码中无被遗漏的 Assert 违例。

**证明。** 用第一、三式替换：
`Φ_safety ≡ B ∧ (a⇒F) ∧ a ≡ B ∧ a ∧ F`。
因为 a 不出现在 B 或 F 中（后者由与 Bad、V 分离推出），可以消去存在量化的 a。
V 不出现在 B 中，故
`∃a,V.Φ_safety ≡ B ∧ (∃V.F) ≡ B ∧ Bad`。
若右式有满足赋值，第二式提供 V 的延伸，取 a=true 即得到真实查询的满足赋值，
与可靠 UNSAT 矛盾。□

注意该引理是**公式级**的；它不从语法证明 B 编码所有 Q 错误前缀。
这一步仍是原 Γ_encode 的 ENC−。任务绑定与语义编码正确性必须分开。

第二次 bound 查询检查为 `B ∧ J ∧ Bound`，安全 assumption 的临时作用域已经弹出。
D₀-P0 下实际 bound 事件为空，并独立检查 Bound=false。
其 UNSAT 只完成固定求解协议，不参与上面安全矛盾证明。
安全 SAT 时后端不会执行 bound 查询；证书只给 `SAFETY_QUERY_SAT_NO_SAFE_TRANSFER`，
不会假装存在第二次查询或释放 SAFE。

实际固定 ProverWithTracker 在该路径不写 `(exit)`，完整流可以以 EOF 结束。
允许 EOF 的条件是栈已闭合、末命令为查询或其 pop、没有悬挂状态，
并且实际审计 completed、阶段/调用数量/返回值全部匹配。不是把截断流当完成。

## 5. 条件式程序级结论及完整推导

**命题 P0-SAFE。** 设 S 属于 D₀-P0，生产入口接受全部来源、局部、宿主、
实例、实际查询义务，并返回 `CONDITIONAL_SAFE`。在原八项 Γ 全成立时，
`Safe_T,D(S)`；`Obs_T,D(S) ⊆ Obs_T,D(Q)`。这是原 E2E-SAFE 的实例。

**证明。**
身份/哈希/同次对象和固定 frame 检查给 C0；
既有独立局部解释与全部 worker 区域义务给 C1；
H-P0 给 C2 的实现条件，并在原 Γ_runtime 下满足协议部分；
完整分区、创建与实际激活清单及全线程顺序给 C3。
对任意源合法错误前缀 g，按原引理 1–2 的有限秩归纳用同一组读响应延伸到 Q。
用户和初始化端点上的映射穷尽且保持种类、对象、值、宽度、po、A、rmw；
不进行共享端点的合并、删除或重排。把 **g 的同一套全局 rf/co**
沿此映射运输，原引理 3 保持 fr、TSO 环条件及原子性；运行时扩充由原 Γ_runtime 提供。
所有源监视器已核对，故 g 的错误仍是 Q 的错误。
Q-P0 使实际属性/assumption/错误查询与完整 Assert 清单相符；
完成性和 bound 检查满足 C4 的执行条件。
原 Γ_encode 的 ENC− 给实际 `Φ_safety` 可满足；
实际 safety UNSAT 与原 Γ_solve 矛盾。故不存在 g。
同一构造对非错误前缀保持观察，给包含式。□

没有先假定 S 安全；没有从 PASS 推出 Γ、H 或源行为；
没有把不同区域的可满足模型独立拼接；没有声称一般非双射对应创新。
若任意自动条件缺失/UNKNOWN/超时/范围外，则门禁关闭。
若不接受 Γ_runtime 或 Γ_encode 等原外部语义前提，则只能使用局部证据，**不能使用本 SAFE 推论**。

## 6. 外部可信清单：没有被这轮证明消除

| 原 Γ | 本轮自动证据 | 仍被信任的语义 |
|---|---|---|
| front | 同次编译身份、来源/类型/绑定、main 和 worker 支持表达式比对 | Clang 前端与优化后普通宿主的开放契约、AST/metadata 保真 |
| ISA | 独立小型参考语义与逐字段义务 | 接受的 x86 指令及 GNU 接口语义、ISA 到固定 TSO 的桥接 |
| capture | 文件摘要、固定构建/模型、Program 身份、上下文/Task 同一、同次返回值、完整性标志 | observer、序列化器、审计 hook、OS/构建记录忠实且只读 |
| runtime | 精确 create/join/参数/协议对象/分支/更新/配对/监视器形状 | 协议对所有相关共享环境和错误前缀的实现及排序契约 |
| encode | 实际属性和公式、完整 monitor、两个查询各自绑定、无截断事件 | 编码器、静态分析、对称性、变量界限、CAT 解释的 ENC− |
| check | 实现审阅、开放义务、隔离故障、摘要化代码 | Python/C++/Java 对判据的实现精化、本地 SMT 可靠性 |
| solve | 实际返回值和实际 SMT 查询重放 | UNSAT 可靠性；没有检查求解器证明对象 |
| domain | 支持语法、ABI、对象/初值/对齐事实、常量输入 | 普通 WB、有效环境、成功线程库操作等环境条件适用于本主张 |

这是一条可审阅的条件式认证链，不是完整 Clang/Dat3M/求解器形式化验证。

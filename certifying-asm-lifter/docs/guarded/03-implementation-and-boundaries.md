# 实现、证书接口与可信边界

## 1. 相对历史路径的隔离

新增 `guarded/` 不接入旧 L1–L4、ACTC 或 PD-SAFE 的授权出口。
原 `certification/`、`diagnostics/`、`frontend/`、`semantics/`、`checker/`、
`lifter/`、后端 Java、八项 Γ、历史证书和定理均不修改。
本轮增加可信检查实现代码，不增加语义 Γ。**TCB 的代码表面变大**，不能称为
“已经机器证明的小核”，也没有以复用旧 Γ_check 隐藏新增实现风险。

| 模块 | 独立读取/检查的事实 | 不能据此声称的结论 |
|---|---|---|
| `source.py` | 同次 Clang 的真实源/AST/observer/LLVM 散列；完整 main；直接定义/调用；类型化 C 表达式、全部分支、GNU 原始操作数顺序、FAA 的读写接口、输入对象有效性和隔离 | 任意 GNU C/C++、宏、多翻译单元、任意函数语义 |
| `llvm.py` | 完整 worker CFG、全部边、无环、实际 SSA 定义、phi 前驱、select、参数属性和有限整数语义 | 任意 LLVM poison/undef、优化 pass 正确性 |
| `actual.py` | 同次实际 Q 的完整表达式/字段/读依赖，actual jumps/successors，参数及协议边界，所有 worker 路径、配对和标签 | 编码器完整性或实际 SMT 的语义正确性 |
| `model.py` | 完整路径积、活跃映射、源域非空、路径覆盖、全部目标替代路径排除；生成器的 product 表不被信任 | 一般事件合并、活跃事件重排、无条件程序等价 |
| `pipeline.py` | 每激活四层比较；重新打开源/LLVM/Q，重建所有事实；实际 main/init/生命周期/监视器门禁保持 | 不调用安全查询时的 L4/SAFE |
| `closed.py` | D_C0 源图、统一 rf/co/fr/CAT、具体图独立核验；可达/不可达方向分离 | 普遍分支反例具体化、任意错误前缀、原生操作系统运行 |
| `target_queries.py` | 原 P0 查询绑定的目标侧用途；实际 assumption、安全/bound、全部监视器、SMT 栈/结果 | 无 Γ_encode 的 SMT 编码正确性证明 |

候选生成器输出可丢弃；独立检查器从原始文件再次提取并自行生成必须验证的
完整路径积。提取器和公式核在生成/验证两边共享，属于明确的检查 TCB；不是
两个无公共代码的多样化实现。源具体图核验用集合关系和 DFS，无需信任生成器
选择的 co/topological 秩。求解器 UNSAT 仍未提供外部 proof checker。

## 2. 实际接受语法与拒绝条件

源域：单个直接 GNU FAA 定义可在不同源调用上下文、不同线程激活和分支调用；
每 helper 两个类型一致的形参，原接口 `+r`/`+q` 与 `+m`，明确 memory clobber。
只接受 32 位 `lock xaddl register,memory`，从源字节/AST 实际顺序恢复，
不是只看 opcode 然后猜操作数。全局对象 unsigned、自然对齐、不混合宽度，
普通输入读的对象与全部汇编写对象分离，执行期不被其他线程修改。

C 宿主允许有限顺序、unsigned 局部赋值、已定义比较及模算术、if/else、
单层 helper 调用、用户监视器、终止空指针返回。不指定 C 原本未规定的运算
求值顺序：若二元表达式两侧均产生公共效果，拒绝。任一语法路径的未知语句、
未定义变量、未知指针、循环、早退后语句、递归均拒绝，即使看似不可行。
显式 `(void*)0` 仅在 AST 证明其为 64 位指针的零值 NullToPointer 转换时，
可按旧 main 中的等价零指针规则解释；原捕获文件不改写。

LLVM worker 只接纳明确列出的头/参数属性和完整 CFG，load 自然对齐，
FAA `atomicrmw add` 的单个返回值，i1/i32/i64 的有限操作，真实 phi/select。
无 undef/poison/溢出标记/未知属性/未知调用的默认解释。readnone/readonly
实参访问约束与实际指令检查；所有 module ABI/属性组、main、globals/declarations
继续经旧 `llvm_main` 检查。这里的 LLVM 事件解释是原固定 x86/后端桥下的
解释，不能将 LLVM 的 monotonic 宣称为任意体系结构上的 seq_cst。

Q worker 接纳完整 Local、Label、CondJump、Load、Store、RMWStore、Assert，
运行时边界必须逐项检查。每个条件跳转的两条实际边都遍历，包括常量假边；
未执行分支的未定义表达式不被随意填值。每条路径有自己的定义环境。
未知表达式、不完整 ITE、未覆盖节点、循环、错误读依赖、未知事件或用户 Fence
均拒绝。本轮证明中 Fence 的组合条件是条件性引理，不是新实现支持。

路径数上限 128，全局具体化内存端点上限 64。超过上限拒绝，不能截断后输出
等价或差异。路径积的最坏成本为指数路径数之积，内部字段/关系比较为有限多项式；
SMT/量词消融可能 UNKNOWN。没有成本优势或多项式复杂度结论。

所有对象均进入源域，不仅是当前激活用到的对象。目标条件或值中的独立自由
非确定量若不能消去/对应到源变量，返回 UNKNOWN，不能将其一次任意赋值当作
“所有目标执行都失败”。当前实际域的自由目标读取均由活跃读对应消去。

## 3. 算法与证书

```text
producer(C,L,I,Q):
  authenticate actual files, compiler/backend pins and same-run Q
  independently extract all C, L, I, Q finite paths per source activation
  retain full original/target main, globals, lifecycle and monitor checks
  for (C,L), (C,I), (I,Q), (C,Q):
    for source path s:
      products := all target paths t, with active endpoint sort/width/order map
      F(s,t) := target guard + field + pair + label + public-order equality
      refuse target-only free nondeterminism; never restrict source domain
      solve D & guard(s) & not OR_t F(s,t)
      UNSAT: this source path is covered
      SAT: store one source assignment and all blocking target alternatives
      UNKNOWN: no verdict
  optionally solve exists uniform static injection forall source state

checker(raw objects, claim):
  reopen hashes, reconstruct all paths, bindings and frame independently
  disregard candidate products/maps/counts and reconstruct full candidate space
  inclusion: regenerate every obligation and require UNSAT
  difference: validate source assignment, exclude every legal target path
  never infer SAFE; invoke optional closed module only in its own domain
```

核心量词为 `forall source state/path, exists target path/active map`。
统一静态消融则为 `exists static partial injection, forall source state/path,
exists matching target path consistent with that injection`，用布尔边变量、
源/目标节点各至多一条边及 ForAll 的 SMT 式精确检查。仅计算“所有可能映射
边的并集存在冲突”不能证明消融不成立，本实现没有使用该捷径。

证书保存：输入散列/run、每激活路径数与潜在事件数量、实际节点身份/访问顺序、
guard、typed expressions、每对路径 F、每个源路径的 Bad SMT、SAT 赋值、
每个目标替代路径的阻断类别、独立核验文件。C 身份是实际 AST 字节范围与
调用上下文，LLVM 身份为真实模块行，Q 为真实线程/事件 ID；它们只用于定位，
不作为语义相等的依据。原文件与摘要配合即可定位最早**已证实**的失败层。
该层定位不保证唯一根因；前层未知时不会猜测后层负责。

具体图证书增加 init、实际激活/生命周期链接、源图的每个值、rf/co/fr/po/rmw/A。
独立核验器忽略生产者给出的图定义，重新从原文件构造图再核验其值/关系。
目标排除材料同时保存实际 query audit、原始 solver transcript、绑定义务、
源补全 SMT、去 symmetry 的目标错误排除 SMT。原始对象 hash 不是正确性证明。

公共旧 binder 的 `binding.baseline` 仍记录其实现引入时的 `3c67f7b`，未修改旧
代码。当前研究基线由本轮 frozen/manifest 的 `ebbe828` 标识；两者均不能替代
实际文件散列与 run_id。闭合结论依赖独立检查的源图及全部目标错误排除；即使
开放证书只绑定部分读取，剩余读取也必须在全局源图中合法补全。

## 4. Γ 对照及已知剩余问题

八项 Γ 的逐字内容保存在每份 closed certificate，来源仍是原 `certify_p0.GAMMA`。
Γ_front/capture 仍信任同次 Clang AST/observer 的忠实性；Γ_ISA/domain 仍承认
受限 GNU 扩展和普通 WB x86 模型，绝不宣称任意 ISO C 并发程序定义良好。
Γ_runtime 仍是成功源生命周期与固定私有协议的桥；Γ_encode/solve 仍承诺
实际完整 Q 错误查询和求解结果可靠。Γ_check 的新增实现文件如上，数量及散列
由 final-02 implementation 清单明确给出。候选生成正确性不在 Γ 中。

历史 E2E-SAFE 禁止后续任意 LLVM 优化的范围没有修改。本轮实际 Clang O2
只是产生另一个要独立检查的 I；G1 的新开放包含结果不把该 I 冒充旧 L2
未修改框架证书。即使新 target main 检查通过，也不自动启用旧 L4。

尚未闭合：任意宏/第三方客户端提取、间接调用、循环摘要、可变别名、合法的
活跃事件删除/重排、C/LLVM 的完整 UB、一般分支源图具体化、更多观察的目标
排除、求解 proof checking、独立实现精化。没有把这些问题移入新 HCC。

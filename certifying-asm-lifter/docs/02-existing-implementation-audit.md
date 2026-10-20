# 阶段 1：源码审计

固定版本：Dat3M `b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8`；
Deagle `980fe9e6757e967d12454c7d16e2ec4de1a1cae4`。
局部文件在 `../../research/sources/dat3m_*`，本轮补读文件在
`../../research/sources/dat3m-audit/`，全部为固定 commit 的原始源码。

## Dat3M 的四个层次

|部分|可解析|生成事件|语义审计|已有端到端认证|
|---|---|---|---|---|
|LLVM inline asm 分派|提取 inlineAsmBody，依次尝试 ARM/RISCV/PPC/x86|成功则追加 visitor 的事件|没有按目标 ISA 先隔离分派；有忽略副作用 FIXME|未发现|
|x86 GNU metadata|语法含输出、输入、数字 tied、clobber|visitor 构造函数不使用 operands/resultRegister|接受语法不等于验证接口约束|未发现|
|x86 asm 指令|只有 fence production，lexer 仅接受 mfence|X86.newMemoryFence(type)|sfence/lfence 也未被这个 lexer 支持；不支持 mov/xchg/xadd/cmpxchg 的此条解析路径|未发现|
|核心 Event IR|Load、Store、RMWStore、GenericVisibleEvent 等|可复用|RMW 是 load/store 配对，和论文单节点不相同|须另证 adapter|
|x86 litmus parser|另有读写和 exchange 路径|不是 LLVM inline asm parser|不能把 litmus 的覆盖当成 GNU asm 覆盖|未发现|

## 不支持时的具体行为

`VisitorLlvm.visitCallInst`，约 381–420 行：

* 全部 parser 失败：无返回值则忽略 call；有返回值则追加 NonDetChoice。
* UnsupportedOperationException 分支建立了 `events=Optional.of(...)`，但该 catch 分支
  **没有把它追加到 block.events**；又用 unsupportedEncountered 抑制后续失败处理。
  因此连警告所说的 nondet 结果是否实际产生也不能仅凭日志判断。
* 这些路径均没有对未知共享写、栅栏或原子性建立保守事件摘要。

这是一项可定位的源码风险；在完成可运行重现前不声称发现了实际 wrong TRUE。

## 事件和后续处理

`EventFactory`：
普通 Load/Store；newRMWLoad 给读端 RMW 标记，RMWStore 保存对应 Load；
LLVM/C atomic 节点与核心节点分层；X86.newMemoryFence 仅为 mfence 构造事件，
对 sfence/lfence 明确抛出 UnsupportedOperationException。
`RMWStore` 与 `Load` 的数据、地址和配对可以复用。

`ProcessingManager` 的流水线实际包含：
intrinsics、GEPToAddition、Inlining、Simplifier、Compilation、MemToReg、常量传播、
循环展开、ThreadCreation、SROA、RemoveUnusedMemory、MemoryAllocation、可选 Tearing、
NonterminationDetection 和 CoreCodeVerification。证书在前端生成后不自动覆盖这些变换。

`DeadAssignmentElimination.isSideEffectFree` 仅允许非 VISIBLE 的 Local/Alloc；
没有依据声称该 pass 会删任意共享 Load。但其他 pass 仍需要逐个契约，NOOPT 也不能代替证明。

`cat/tso.cat` 使用 `co/fr/rf/rmw`、A 原子事件标签和 MFENCE 派生关系：
`empty rmw & (fre;coe)`；`ghb-tso` 包含原子端点引出的 Store→Load 顺序。
它不是 RC11Ex86 B.8 的直接实现；`cat/rc11.cat` 也不自动识别 tso/sf 混合语义。
失败 CAS 只有读端时 A 标记是否保留是必须检查的适配点。
`WmmEncoder` 消费的是处理后的程序和关系编码，不能只校验源 .ll 文本。

后续运行补充核查：`AsmX86Lexer.g4:29` 只定义 `'mfence'`。
sfence 的 LLVM asm 输入被警告后忽略；因此“支持 Fence 类事件”不能概括成三个 x86 Fence
在此解析路径都能工作。LitmusX86 是另一套 grammar，能解析 SFENCE，
但事件工厂仍会拒绝它；不能将语法支持计为事件生成支持。两条入口必须区分。

## Deagle

`goto_asm.cpp:20–22` 无条件打印错误并 exit(1)；
后续 `remove_asm` 不会挽救前端已退出的输入。
先前 Huawei 数据审计可复用：52 个性质任务、19 个不同 .i；
只出现空 memory asm（预处理头文件中的文本计数不代表可达执行次数）。
它适合检验空 asm 工程修复，不适合支持 RMW/弱内存的贡献主张。

## 复用决定

1. 直接复用 RC11Ex86 公理、Dat3M 核心事件/求解基础与成熟 SMT 位向量库。
2. 本轮原型只写受限单条 GNU asm 声明解析器，不重做 GNU C parser。
3. 先实现独立块检查；与 Dat3M 的事件拆分是后续单独契约。
4. 后端未通过契约检查之前，状态为 BLOCK_EXACT/BACKEND_UNVERIFIED，
   不对整 C 程序作 TRUE/FALSE 承诺。

阶段 1 完成：模型、版本、范围、拒绝条件与适配缺口明确。
下一阶段：定义开放响应语义与上下文观察，给出能够击穿端点等价和错误排序映射的解析反例。

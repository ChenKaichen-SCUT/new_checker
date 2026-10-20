# 修订阶段 1：真实接口、研究对象与信任边界

本文件的“未运行”指首次交付时状态。后续限定验收见[报告](../13-minimal-acceptance.md)；
本文范围和外部可信边界未因验收 PASS 而取消。

状态：设计与源码论证交付；新增实现未运行验证。用户要求在审阅第 1–4 阶段后再开展实验。

## 1. 本次要认证的命题

不是“JSON 被接受，所以 C 程序安全”，而是三个分别有检查对象的命题：

1. `INTERFACE_MATCH`：原 GNU asm、Clang 类型信息和实际 LLVM asm 调用的操作数接口一致。
2. `LOWERING_EXACT`：在该接口下，实际替换片段实现相同开放事件及出口值。
3. `REGION_EXACT`：实际 Dat3M 核心 IR 中的闭合区域实现相同端点语义。

只有接口、替换、后端区域覆盖及宿主语义条件全部满足，才能另行讨论程序 verdict 的转移。
三张局部证书不能靠连接文件名自动变成整程序证书。

新的最小目标固定为 **Clang 21、x86-64 Linux LP64、Dat3M
`b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8`、TSO target 和其实际 `tso.cat`**。
这里不声称该 CAT 与此前 RC11Ex86/Ex86 单节点模型已经等价。

## 2. 接受范围

首版真实接口读取器只接受一个翻译单元中一个直接书写的 volatile extended asm，
一个 32/64 位 unsigned 标量输出、同宽操作数、简单标识符/解引用表达式，
显式 `memory` clobber，以及旧参考语义已支持的指令。
使用 Clang AST 的规范类型，禁止调用者用 `--width` 为这个新入口指定语义。

源表达式中的全局标量和局部标量不能仅凭名称区分：

```c
asm volatile("..." : "=r"(g) : "r"(input) : "memory");
```

若 `g` 是共享对象，其输出回写属于 Clang 生成的宿主 store；
`input` 若需要宿主 load，该 load 也在调用前。新转换仅替换 LLVM asm 调用，
保持调用外所有字节与结果 SSA 定义接口，不能把这两项宿主访问当作纯局部步骤。
AST 的声明引用和原表达式保存在接口记录中；实际输入值来自 LLVM 调用实参，
不能用 C 变量名推测或重新求值。

以下直接拒绝：宏位置不明确、多个/遗漏的 asm、基本 asm、asm goto/callbr/invoke、
隐式寄存器拼接、向量/混合宽度、flag outputs、未支持的修饰符、
多标量返回值、带副作用的表达式、非法或未知编译目标。
此范围允许保守拒绝合法程序；它不支持完整性或真实项目覆盖率主张。

自动后端实例覆盖首版更窄：包含该 asm 的 LLVM worker 除此调用外只返回 null；
标量实参为常量、内存实参为静态全局地址、标量结果不被使用，
worker 只由无分支 main 中的直接 pthread_create 引用。
这个子类覆盖一类实际共享 RMW worker，避免以不可信映射猜测优化后的活跃寄存器。
它不支持返回值被使用、普通函数内联或循环产生的实例；一般局部 API 的能力
不能冒充此自动流程的支持范围。

## 3. 真实源位置与类型证据

输入包包含原文件**字节**、同一次受控构建的 Clang AST、未修改 LLVM、编译命令、
编译器二进制/版本、目标三元组和依赖文件摘要。
AST offset 按字节解释，不能按 Python Unicode 字符索引切片。

接口读取器检查：

- AST `GCCAsmStmt` 的直接范围落在原文件内；不默默采用宏展开偏移。
- 源约束列表与 AST 操作数数量、顺序、表达式范围一致。
- 各操作数 canonical type 在固定 ABI 下给出同一数据宽度。
- 规范化只替换“已经求值的操作数槽位名”，保留模板、约束、输出顺序和 clobber。
- 每个输入槽代表一次实际宿主求值；不能把两个同名全局输入擅自合并为一个值。
- GNU 模板 `%n` 与 LLVM 模板 `$n`、GNU literal `$` 与 LLVM `$$` 分别对应。
- LLVM 每个约束消耗哪一个实参、产生哪一个返回值，由约束规则重建。

同一个源文件的哈希只证明字节相同；不能证明随附 AST 确实由 Clang 生成。
因此“构建包产生器运行指定编译器并原子保存其输出”属于小型受信入口。
从外部读入任意 JSON、接受其中自报的 `trusted=true` 不满足此条件。

## 4. LLVM 实参消费规则

设约束列表为 `c0,...,cn`，调用实参为 `a0,...,ak`。
扫描约束时维护实参游标，不按“第 n 个约束就是第 n 个实参”匹配：

|约束|消耗调用实参|产生返回分量|参考接口|
|---|---|---|---|
|`=r` / `=&r` / `={ax}`|否|是|标量输出|
|`=*m`|是，带 `elementtype(iw)` 的 pointer|否|内存地址|
|`r` / `{ax}`|是，`iw`|否|入口值|
|数字 tie|是，`iw`|否|初始化指定输出槽|
|`*m`|是，带 elementtype 的 pointer|否|只读/读写内存地址|
|clobber|否|否|元数据及寄存器约束|

Clang 将 `+` 输出的隐含输入附在显式输入之后。
读写内存的输出地址和隐含输入地址必须是同一个实际 LLVM operand；
第一版不尝试证明两个不同 pointer SSA 值相等。
寄存器 tie 的类型必须与对应输出相同。任何额外、缺少或错序实参都拒绝。

上述规则依据固定 Clang 的
[EmitAsmStmt / EmitAsmStores](https://github.com/llvm/llvm-project/blob/llvmorg-21.1.8/clang/lib/CodeGen/CGStmt.cpp)
和 [LLVM 21 Inline Asm](https://releases.llvm.org/21.1.0/docs/LangRef.html#inline-assembler-expressions)。
`memory` clobber 是编译约束，不是硬件 fence；
参见 [GNU extended asm](https://gcc.gnu.org/onlinedocs/gcc-15.2.0/gcc/Extended-Asm.html)。

## 5. 实际目标对象

认证对象是 `AssumeSolver` 在完成 preprocessing/analysis 后、调用
`ProgramEncoder.encodeFullProgram()` 所使用的 **同一个 Program 对象**。
不是 README 中的伪码，也不是格式化 printer 输出，更不是另跑一次预处理的近似副本。

必须记录：线程/事件 ID、successor、jump target/guard、具体 Java 事件类、
完整 tags、有类型表达式树、所有寄存器读写、RMWStore.getLoadEvent()、
源位置与 provenance 元数据、模型及配置摘要。
表达式或事件不能识别时保留其类别并拒绝认证，不能把它忽略。

导出前后对象摘要不一致，或 solver 使用的模型/config 与包内记录不一致，拒绝。
当前新增导出器是这个接入点的实现文件；尚未接入并运行，不声称已有真实输出证书。

## 6. 信任边界不能含糊

|部分|角色|本轮处理|
|---|---|---|
|Clang 对 GNU 宿主求值/输出回写/不透明 asm 接口的实现|明确外部可信组件|固定版本、保存真实输入输出；不证明整个 Clang|
|受限 ISA 指令规范、有效/对齐/WB 内存域|外部语义前提|明确列出；不从实验归纳|
|源码/AST/LLVM 接口读取器|新增 TCB|逐规则推导，代码可审阅；未运行验证|
|候选 lifter 与 LLVM emitter|不可信候选产生器|需要独立检查实际产物；不能因默认模板安全而豁免|
|Dat3M 普通宿主代码的语义/编码/求解|外部可信后端|不能借此假定新增 asm 适配正确|
|快照导出器与实际区域解释器|新增 TCB|对象级导出、字段级重建及闭合边界检查|
|Z3 UNSAT|可信求解结论|保留查询；不声称已有小核 proof checking|

## 7. 研究立项状态

本轮技术贡献候选是“真实 typed interface → 实际拆分端点的可检查证据链”，
不是把标准图同构证明重新命名为新算法。Hetrify/Hetrify+ 等最接近方法的覆盖排除
仍未完成，故不声明新颖性、论文级系统贡献或投稿 Go。
用户本次先审阅第 1–4 阶段，已有工作算法比较及实验扩展不在此处伪报为完成。

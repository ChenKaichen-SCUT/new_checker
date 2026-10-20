# 修订阶段 2：对象、语义与可检查义务

本文件定义理论算法的接受条件；实现覆盖情况逐项列在阶段 4。
没有实现的条件不能靠“假设检查通过”产生程序级证书。

## 1. 四个不可混同的对象

- `S`：原 GNU C 文件字节及其中 asm 语句。
- `L`：Clang 实际生成、尚未替换 asm 的完整 LLVM 模块。
- `L'`：在 L 的对应调用处原位替换后得到的完整模块。
- `Q`：固定 Dat3M 对 L' 实际处理并交给编码器的核心 Program。

`J` 是可选候选 Event IR，不是最终认证对象。
`I` 是从 S、AST、L 重建的接口，不是候选生成器提供的任意绑定表。
`B` 是模型/config/build bundle；哈希将证书绑定到这些具体对象，但哈希本身不证明等价。

## 2. 两种局部状态与 RMW 时点

入口状态 `σ⁻` 为操作数槽到位向量的映射。一次 RMW：

```
a = eval(addr, σ⁻)
u = fresh response
σ⁺ = σ⁻[old := u]
h = eval(has_write, σ⁺)
v = eval(value, σ⁺)
```

地址必须在读前求值；条件与新值必须在 old 绑定之后求值。
以另一临时槽保存的旧 old 值不随重绑定变化。
`old` 的字符串相同和“表达式依赖当前响应”不是一般语言中的同一概念；
本直线 IR 的赋值立即求值，因而 AST 中出现当前 old 恰好是需要审慎处理的依赖来源。

旧适配器错误：其缺省 xchg 使用 `eval(value,σ⁻)`。
当 `value=0+old` 且入口 old=0 时，它写 0；定义要求写 u。
存在 u≠0 已经逻辑否定全称等价，不需要枚举或执行程序。

## 3. 端点展开 E

源块先按参考开放语义产生宏事件。用于固定 TSO 目标的展开是：

|宏事件|端点及存在条件|原生关系/标签|
|---|---|---|
|普通读|`r(a,u,w)`，true|R,M；无 A|
|普通写|`s(a,v,w)`，true|W,M；无 A|
|locked RMW|`r(a,u,w)`，true；`s(a,v,w)`，h|r、s 都有 A；h 时存在 rmw(r,s)|
|mfence|f，true|F,mfence|

失败 CAS 仍保留具有 A 的读取端点，写端点不执行，rmw 对也不存在。
这与“失败时改成无 A 的普通读”不同。
展开定义与架构语义接合的范围是固定 TSO 端点模型；
不能据此自动宣称与 RC11Ex86 B.8 或旧 Ex86 单节点模型等价。

为避免循环论证，不能把“目标输出是什么”反过来定义为 E。
E 由上述固定规则、源指令、源接口独立构造；
目标端点由 Q 的事件类、tags、表达式和控制流独立解释。

## 4. 闭合区域和实际控制流

候选映射可以提出 Q 中的一个有限区域 V；检查器必须验证：

1. V 属于一个线程，事件 ID 不重复，包含入口至出口间的所有核心节点。
2. 所有外部 CFG 边只能进入入口；区域边只能流向区域内或共同出口。
3. V 的 CFG 无环；不存在未建模调用、异常、提前 return、assume/assert 或不可识别事件。
4. 所有共享事件都参与匹配；纯节点只有已定义的 Local、Label、CondJump 等。
5. 所有被上下文使用的区域写寄存器都在出口义务中；其余上下文 live-in 寄存器保持。
6. 每个 RMWStore 的真实 `getLoadEvent()` 在对应区域内；目标不能自报一个虚构配对。
7. 源位置只用于发现候选，不足以证明上述任何一项。

在有界实际程序中，源点可因内联/线程创建/展开产生多个实例。
全部实例覆盖检查是单独义务；“找到了一个好区域”不等于“全部实例都好”。
若优化删除/合并了实例而无法给出新的覆盖证明，拒绝；不可静默忽略。

## 5. 符号 DAG 解释，而非路径枚举

对区域 CFG 作拓扑排序。入口 guard=true。条件跳转对边分别传递
`g∧cond` 和 `g∧¬cond`，普通边传递 g。
节点 guard 为所有入边 guard 的析取。
寄存器入口值按入边 guard 用 ite 合并；证明入边互斥后，取值次序不影响有定义部分。
对每个读端点分配一个新 `u_i`，不按地址缓存。

解释得到每个端点的 `(guard,kind,tags,width,address,value)`，
实际 rmw 端点关系和出口状态。
候选循环、相交的非互斥合并、未知操作导致拒绝。
检查器只证明一个全称位向量公式族；不会把对有限输入/路径的枚举当作证明。

## 6. 检查义务

对全部入口 X 与全部独立读响应 U：

```
I(X) ⇒ (g_source = g_target)
I(X) ∧ g_source ⇒ (address_source = address_target)
I(X) ∧ g_source ⇒ (value_source = value_target)
I(X) ⇒ (outputs_source = outputs_target)
```

还必须静态/逻辑检查：

- 端点类型、宽度、A/mfence 标签精确一致，不以“更强排序”替代相等；
- 每条源 rmw 对与目标真实配对同构，执行 guard 一致；
- 线程顺序 po，包括区域与前缀/后缀的边界顺序一致；
- 不存在未配对目标共享事件，也不存在漏掉的源共享事件；
- 接口实参消费、宿主字节框架、所有实例覆盖、build/model/config 身份一致。

义务不允许由候选提供任意 I 来排除反例。
I 只能来自接口绑定（例如实际实参常量）、明确 ABI 与域条件；
“假定原程序安全”或“假定 backend 正确转换本 asm”都不是允许的 I。

## 7. 实际 CAT 对象

固定版本 `tso.cat` 的相关定义为：

```
com = co | fr | rf
acyclic(po-loc | com)
empty(rmw & (fre ; coe))
implied = po & (W × R) & ((M × A) | (A × M))
po-tso = (po & ((R × M) | (W × W))) | mfence
acyclic(po-tso | co | fr | rfe | implied)
mfence = po ; [mfence-events] ; po
```

实际解析还会使用标准关系/框架语义，故应固定整个 CAT 依赖闭包及 parser/encoder。
只散列顶层 `tso.cat` 而不含 include 文件和标准解释并不足够。
A 在此处表示 TSO 原子端点标签，不可误读为任意模型中的 acquire 集合。

## 8. 证书层级及禁止越级

`BLOCK_EXACT`、`INTERFACE_MATCH`、`LLVM_PATCH_EXACT`、`REGION_EXACT`、
`PROGRAM_TRANSFER_ELIGIBLE` 是不同判断。

前三者不蕴含第四；若覆盖/出口 live-out 未检查，第四也不蕴含第五。
模型、编译器、SMT、内存有效域、循环界限和宿主可信前提须随第五项一起列出。
任何 unsupported、unknown、timeout、证据缺项都不能转成程序 PASS。

阶段 4 的实现尚未覆盖全部义务，所以当前发布路径禁止生成
`PROGRAM_TRANSFER_ELIGIBLE=true`。这是一条真实门禁，不是报告中的脚注。

# 阶段 1：范围与语义基线

日期：2026-10-20。状态：语义基线固定；不是已验证的完整 GNU C 编译器。

## 1. 所采用的原始定义

主要依据为 de Vilhena 等 OOPSLA 2024 技术附录 A、B、D：
[原文](https://doi.org/10.5281/zenodo.13625916)，本地 `../../research/sources/inline2024_appendix.pdf`。
以下公式是该模型的定义性转述，不是从其编译定理反推的结论。

程序是线程标识到命令的有限映射；线程包含局部寄存器状态、事件计数器和剩余命令。
候选执行由 pool reduction 生成。读规则可以选择任意数值，是否可行随后由全局内存一致性决定。
初始事件 I(l) 对每个位置写 0。事件标识为 I(l) 或 (thread,index)。

标签为 R^m(l,v)、W^m(l,v)、RMW^m(l,old,new?)、F^m。
R、W、RMW、F 是不同种类的集合；成功 RMW 属于 RMW-s，失败者属于 RMW-f，
失败写值为 ⊥。需要读取/写入的定义域时分别使用 R∪RMW、W∪RMW-s，不能把失败 CAS 当普通读。

* po：同线程事件序号的严格顺序，并包含初始化事件到非初始化事件的边。
* rf：从 W∪RMW-s 到 R∪RMW；每个读取端恰有一个同地址、值匹配的写入源。
* mo：每个地址的 W∪RMW-s 上的严格全序的并。
* rb=(rf^-1;mo)\[E]。此处不是具有独立读写端点的 rmw 关系。
* R_i、R_e：同线程/跨线程限制；初始事件约定必须在实现中一致。
* [S]：集合 S 的恒等关系；R?、R+、R* 分别为自反、传递、自反传递闭包。

普通 C 访问保留 na/rlx/acq/rel/acqrel/sc 模式。x86 普通访问和 locked RMW
使用 tso；NT store 使用 nt；sfence 使用 sf；mfence 使用 sc。
模式偏序包含 na<rlx<acq,rel<acqrel；acqrel<tso、acqrel<sf<sc，
但 **tso 与 sc 不可比较**；nt 在论文图中单独处理。不能按一个整数强弱等级实现。

附录 B.8 的完整一致性判定由下列关系给出：

```
rb       = (rf^-1 ; mo) \ [E]
sw       = [E>=rel] ; ([F];po)? ; [W>=rlx] ;
           rf+ ; [R>=rlx] ; (po;[F])? ; [E>=acq]
poRC11   = [E\Wnt];po | po;[RMWtso | F>=sf] | po|loc;[W]
hb       = (poRC11 | sw)+
eco      = (rf_e | mo | rb)+
ppoasm   = po;[RMWtso | F>=sf]
         | [Rtso | RMWtso | Fsc];po
         | [F>=sf];po;[E\R]
         | [Wtso];po;[E\R\Wnt]
         | [E\R\Wnt];po;[Wtso]
scb      = po | po|!=loc;hb;po|!=loc | hb|loc | mo | rb
pscbase  = ([Esc] | [Fsc];hb?);scb;([Esc] | hb?;[Fsc])
pscfence = [Fsc];(hb | hb;eco;hb);[Fsc]
psc      = pscbase | pscfence
```

同时满足：

1. irreflexive(hb;eco?)；
2. acyclic(ppoasm | eco)；
3. irreflexive([Wnt];po;(rb|mo))；
4. irreflexive(rb;mo)；
5. acyclic(psc)；
6. acyclic(po|rf)。

本项目不重新设计以上公理。受限实现排除 nt，因此第 3 项空真，其他关系不擅自简化。
使用位向量替代原文自然数局部算术是本项目的参数化实例，不能宣称由原文证明了机器算术。
地址为固定宽度符号值；排除未对齐、部分重叠和混合宽度访问；相同宽度地址可以相等。

## 2. Mixed Execution Graph 的准确用途

附录 D.3 的节点是一对源事件集合和目标事件集合；允许节点由编译规则限定。
例如 SC store 对应普通 store 加 MF；较弱 C fence 可对应空集。
投影规则分别得到 RC11Ex86 和 Ex86 图。D.7 证明各投影与各自混合图一致性判定等价。
D.9、D.10 是：

    Beh_Ex86(compile(p)) ⊆ Beh_RC11Ex86(p)。

它不提供等号，不提供反向提升，也不检查 GNU 约束、具体 x86 算术或验证器优化。
我们可以复用标签、公理、关系代数；必须另证局部符号检查可靠性、开放执行匹配、
上下文图扩展、接口有效性以及后端适配。第一版同一模型下保留事件，不使用上述跨模型编译方向。

## 3. 确定的研究子集

理论：有限、无内部循环的开放事件转换器；第一版实现仅直线指令序列，CAS 内部使用 ite。
固定 x86-64 System V 的整数寄存器接口。支持单一 32 位或 64 位数据宽度（每块固定），64 位地址，普通 WB 内存、自然对齐、
对象有效且存活。输入输出为无副作用标量/内存操作数表达式。

候选指令：空 memory compiler barrier、movl/movq、寄存器 addl/addq、
mfence、内存 xchg、lock xadd、lock cmpxchg；sfence 作为精确标签及负例使用。
cmpxchg 的成功/失败均保留 RMW.tso 身份；不把失败路径改成普通 load。
指令对标志的影响限于显式建模的 ZF 或完整 clobber 且后续不读取；其他情况拒绝。

排除：asm goto、任意跳转/循环、调用、栈操作、隐式系统状态、MMIO、NT、异常/信号、
自修改代码、重叠子寄存器、未知指令、未初始化输出读取、表达式副作用、GNU 多候选约束、
任意寻址模式和内存合法性证明。排除项由前端拒绝，不给零事件或 nondet-output 替代。

GNU 层与 ISA 层分开：只接受可证明分配无关的约束子集；不能以一次寄存器分配代表全部分配。
如果做不到则只给“给定绑定的抽象块认证”，并在证书中标记，不能输出原始 GNU C 程序正确。

## 4. 假设及证据边界

Γ 必须包含：指令参考语义版本、ABI、值/地址宽度、有效地址域、接口规则、内存模型、
错误/UB 观察方式、宿主语言翻译契约、后端与优化契约。前置条件不能由候选 Lifter 偷加。
以“条件于 Γ 的抽象模型定理”作为可证明目标；实际 CPU、C 编译器、SMT 实现是另列可信边界。
认证可独立于 Deagle 存在。没有证明后端契约时只报告块级 EXACT，不能据此报告整程序 TRUE。

## 5. 实质空缺与停止条件

共享事件同构的关系代数引理本身不足以构成论文新意。待验证贡献是具体接口、数据/地址
语义、开放读、失败 CAS 与可复查证书的一体化检查及实际错误发现。Stellite 已有
更一般的上下文方法，Kater 已自动证明关系包含。Hetrify/Hetrify+ 全文覆盖仍未排除。
若系统只剩直接组合、没有实际非空 asm 收益，阶段 7 必须给 No-Go。

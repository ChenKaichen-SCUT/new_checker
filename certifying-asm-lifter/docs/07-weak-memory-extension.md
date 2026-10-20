# 阶段 5：弱内存扩展与适配边界

## 1. 为什么核心证明不依赖 SC

06 的开放候选执行在每次读取处选择任意 u，而非执行 store-buffer 模拟。
其构造不预设 po、rf、mo 能组成一个 SC 交错。全局一致性在候选图产生后过滤。
因此弱内存允许更多响应组合并不破坏引理3；每个新增组合仍在全称量化范围内。
不允许丢弃事件或改变标签则是必要的充分条件，不是所有合法优化的必要条件。

编译器屏障是控制编译变换的约束。在固定候选事件图中不发出 Fence。
IR 保留 `compiler_barrier` 元数据；它约束后续适配/编译，绝不能变成 Fsc。
若目标经过重排而未复查，本文定理不适用。这一限定同时适用于 asm volatile。

## 2. 失败 CAS 是完整事件

参考 CAS 对每个响应 u 发出：

    RMW.tso(a,u, ite(u=expected,desired,⊥))。

成功、失败的区别只影响写端是否存在以及返回值，不改变 tso/RMW 标签。
因此失败事件仍进入 ppoasm 的两个 RMWtso 子式。04-C6 的环证明说明该信息必须保留。
GNU accumulator 返回 old=u；成功时 u=expected，失败时执行规定的 accumulator 覆写。
第一版不导出 ZF；cc 必须 clobber 且内部不使用 flags。支持 `sete` 需另加输出检查。

## 3. C 与 asm 的混合

上下文 C 的访问保留原 na/rlx/acq/rel/acqrel/sc 模式。
只把受支持汇编访问标 tso。M 始终是同一 RC11Ex86 实例，不能一边 RC11 一边 TSO
再用图同构宣称两模型一致。部分 tso 访问与 C-SC 访问相邻时，标签决定不同 psc/ppo。
保持标签和跨块 po 才能输送相应关系。tso 不能由 sc “近似替代”获得 EXACT。

若整程序只有 tso 的普通访问、RMW，以及 sc/sf 硬件 fence，模型可按论文 C.14
与 Ex86 对应。使用该结果须满足其语法范围。不能用该特例把任意 C atomics 直接当机器指令。
本研究的图不变性证明独立于 C.14，也不借用原文 DRF 定理（其附录证明另有 RMW 简化条件）。

## 4. Dat3M 的实际拆分

固定版本 `VisitorTso` 的读取发现：

* LLVM atomicrmw/xchg 降为 RMW Load、RMWStore 配对；
* LLVM cmpxchg 降为 RMW Load、比较、条件跳过 Store、RMWStore；
* `tagList` 给所有 MemoryEvent 加 Tag.TSO.ATOM，包括失败路径留下的 Load；
* 故不能声称现有 LLVM CAS 降低已经丢失失败排序。问题是 GNU asm 解析入口缺覆盖。

论文单节点图到这种读写端点图不是双射。06 的定理不能直接用于该 adapter。
只有在以下契约成立时才能收缩端点为一个事件：

1. 成功 pair 的同址同宽、读值/写值/成功条件正确；
2. rmw 原子性保证 mo 前驱为该读的 rf 源；
3. pair 内无其他共享事件，所有外部 po 入/出边与单节点对应；
4. 成功/失败端点均保留所需 A 排序；
5. 处理后的数据、控制与地址不变；对应 CAT 公理与单节点模型等价；
6. 所有 Bad/UB/最终观察在投影下相同。

第5项的两个模型等价不能由单个或多个 litmus 一致推出。
本轮可做 TSO 后端探索性实验，但此端点适配的普遍等价仍不标成已证明。
对 RC11Ex86，更不能直接使用现成 rc11.cat/tso.cat 替代其混合模式判定。

## 5. 严格区分完成状态

可完成并证明的核心：03 的固定事件结构转换器在 RC11Ex86/Ex86 下的上下文等价。
未完成的独立环节：整个 GNU C 宿主翻译、完整 ISA 桥接、Dat3M 全流水线 adapter 等价、
SMT 小核 proof checking、独立第三方证明审阅。
后续实验不改变这些状态。

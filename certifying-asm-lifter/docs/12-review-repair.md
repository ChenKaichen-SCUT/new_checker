# 严格审查后的第 1–4 阶段交付

审查基线：`9c51fcbac7cff2b4d0e0906e27c9f43c9b22c05a`。
用户提供的 `strict-review.md` 被作为审查证据与修补需求分析材料；
本文没有把其中所有建议视为独立于用户指令的执行授权。
最新用户指令是先交付第 1–4 阶段，批准后再做实验。

阅读顺序：

1. [真实接口、范围和 TCB](revision/01-interface-and-scope.md)
2. [实际对象、端点语义与检查义务](revision/02-objects-and-obligations.md)
3. [算法与逻辑证明](revision/03-algorithm-and-proofs.md)
4. [实现对应、未完成项与实验门禁](revision/04-implementation-and-review.md)

本次修补移除了不可靠 RMW fallback，增加了真实 typed interface、实际 LLVM
字节检查和实际核心端点检查的实现。证明使用结构归纳、反证、guard 耦合和
端点图关系输送，不以枚举或 native 运行代替。

当前仍不声称整程序链认证完成：受控编译封存与后端接入尚未执行，
最小 worker 子类的自动实例覆盖已有算法、证明和代码，但尚未运行；
通用实例覆盖没有声称解决。旧 `EXACT` 仍然只属于块级；新局部 API 也关闭程序 verdict。
第 5 阶段在此处仅处理认证方法必须的固定 TSO 配对/失败 CAS 理论，
没有开展新实验或宣称完整 RC11Ex86→实际 CAT 的跨模型等价。

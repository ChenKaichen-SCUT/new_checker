# 实际对象导出接入点

已在独立固定源码树中构建并完成单个真实输入验收。
结果、适用范围和外部可信前提见[独立验收报告](../../docs/13-minimal-acceptance.md)。
原 vendor 树没有改动；最终独立构建和运行摘要在
`experiments/minimal-acceptance/build-03/`。

上游提交：`b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8`。
`instrument.py` 校验原 `AssumeSolver.java` 哈希，只增加两个读取原 Task 的接点：

1. `context = EncodingContext.of(...)` 之前导出 `before-encoding`。
2. `prover.addConstraint(assumedSpec)` 之后、首次 solver.check 之前导出 `after-encoding`。

使用 `-Dcert.snapshot.dir=<唯一目录>` 和 `-Dcert.run.id=<唯一ID>`。
导出器检查两个接点收到同一 Task/Program 对象，拒绝重复接点、文件覆盖和未知 target；
驱动进一步核对前后快照、实际输入、runtime、全部 CAT、配置及同次查询。
它不重跑 preprocessing，不创建替代 Program，不从 printer 文本重建语义。

`Snapshot.java` 导出此次出现的类型、表达式、位截取范围、所有事件及 tags、
successor/jump、寄存器读写、真实 RMW 指针、来源、线程创建/连接/参数/返回、
Assume/Assert 条件和全局内存。未知表达式/事件标为不完整，驱动拒绝。
这个字段完整性标记不是整个 exporter 的正确性证明；exporter 仍属于 TCB。
源码注释字符串只作说明，不参与语义解释。

`build_acceptance.py` 从固定 Git blob 核验构建输入后复制到新目录，安装声明的接点，
跳过上游测试并构建，保存原始命令日志、源码前后摘要与运行依赖摘要。
发行包还提供签名 commit 原始字节与祖先树成员证据，可静态核对构建输入属于固定提交。

`check_region` 认证局部闭合区域；`coverage.py` 为窄 worker 子类自动重建全部实例；
`host_contracts.py` 检查实际全局初始化、大小/对齐和线程边界。
这些不代替普通宿主语义、pthread 模型、CAT encoder 和求解器的外部可信条件。
所有程序级 verdict 转移开关保持关闭。

验收已结束，等待用户审阅后再决定下一步；不要自动启动更多源程序或批量实验。

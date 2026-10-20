# 实际对象导出接入点（未执行）

`Snapshot.java` 是新导出器源码。按用户要求，本轮没有编译、安装或执行它，
也没有修改本地 vendor。不要把此文件存在解释为已有实际后端认证结果。

固定上游提交：`b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8`。
待获准验证时，在独立构建目录中把此类加入 `certifying` package，
对 `verification/solving/AssumeSolver.java` 作两个只读插入：

1. `context = EncodingContext.of(...)` **之前**：
   `certifying.Snapshot.write(task, "before-encoding");`
2. `prover.addConstraint(assumedSpec);` **之后**、第一次 solver.check **之前**：
   `certifying.Snapshot.write(task, "after-encoding");`

通过 JVM 参数 `-Dcert.snapshot.dir=<本次唯一输出目录>` 启用。
这两个调用读取原 `task.getProgram()`，不重跑 ProcessingManager，不创建替代 Program。
两份 JSON 的结构内容必须相等；配置、实际输入 LLVM、CAT 依赖闭包和构建摘要
必须一同封存。应启用 `--smtlib2=true` 留下同一次求解的实际查询。

`instrument.py` 按 `pins.json` 核对原 `AssumeSolver.java` 字节后安装上述两处接点，
拒绝重复安装或未知源码。应对独立构建树使用它。本轮没有调用该脚本。
获准后的完整执行驱动为 `certification/run_pipeline.py`；其执行开关默认关闭。

这不是对整个 exporter 的机械化证明。Exporter、JSON 解码器和区域解释器在 TCB。
未知 Java 表达式/事件类别保留为 unsupported，Python checker 将拒绝，
不能使用 `defaultString()` 作为可信语义。

当前 `check_region` 是低层局部接口：它检查闭合 CFG、实际 load/store 配对、
guard、宽度、原子标签和保守 live-out。调用方仍须完成真实实例 census、
接口绑定认证及快照与 solver 的封存。最小 worker 的覆盖算法和同次执行驱动
已另行实现，但尚未执行验证；程序判定门禁保持关闭。

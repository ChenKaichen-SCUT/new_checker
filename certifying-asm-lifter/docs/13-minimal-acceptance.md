# 最小真实源程序转换认证验收报告

日期：2026-10-20（America/Chicago）。
审阅起点：`51321dcc3e5f30663e93120335baa9b4cb081d7e`。
唯一源程序：[benchmarks/backend-source.c](../benchmarks/backend-source.c)。
最终证据入口：[minimal-acceptance/README.md](../experiments/minimal-acceptance/README.md)。

**结论：在明确限定的程序子类、固定 TSO 解释和所列外部 TCB 条件下，
已经自动完成一次真实 GNU C 接口 → 实际 LLVM 替换 → 同次 Dat3M 核心区域
及全部两个 worker 实例的转换检查。它不是整个 GNU C 程序形式化正确的证明。**
最终结果名为 `SCOPED_CHAIN_CHECKS_PASSED_UNDER_DECLARED_TCB`；
`program_verdict_eligible` 始终为 `false`。

没有运行全量 SV-COMP、批量性能评测、第三方库或新指令覆盖实验。
本次仅有一个正向源输入和四种受控错误转换。修补接线错误所需的重复运行
全部保留，不能把它们计算成多个独立程序或覆盖率样本。

## 1. 是否自动认证了一次真实转换？

**限定意义下是；无条件的整程序认证不是。** 此次没有使用手写 LLVM 正例、
人工事件 JSON 或另跑预处理所得的替代 Program。

真实流程为：

1. 固定 Clang 21.1.8 对原文件分别生成 AST 和完整 LLVM。两次调用由同一驱动管理，
   命令及原始 stdout/stderr 保存；源码/依赖摘要在前后核对。
2. 从原文件字节范围、AST 类型和实际 asm 调用的约束/实参消费重建接口。
   此程序得到 32 位 `+r`、`+m`，标量输入为实际 LLVM 常量 `1`，地址为 `@x`。
3. 候选 lifter 产生 J；独立块检查器与固定源参考语义比较。
   emitter 只替换实际 asm 调用，保留其余模块字节及原 SSA 输出定义。
4. 独立 LLVM 解释器检查替换后的实际字节。相同 Clang 另做全模块解析/验证，
   禁用 LLVM passes；生成的验证用 bitcode 不作为 Dat3M 输入。
5. 固定 Dat3M 对这个实际 `candidate.ll` 求解。只读插桩从原 solver Task 的
   同一 Program 导出编码前、编码后快照；检查 JVM 内对象身份、运行 ID、内容、
   输入、模型、构建依赖、实际配置和同次 SMT 查询。
6. 从原 LLVM 的两次直接 pthread_create 和实际 ThreadCreate 链接重建实例集合，
   对两个实际区域分别检查，再检查全局初始化、大小/对齐和线程边界对象。

最终证据来自 `final/`，运行 ID 为
`3f0756c455df4a6f8e59c18de7a30cf3`。

|层级|实际结果|证据|
|---|---|---|
|INTERFACE_MATCH|通过；无调用者手填位宽/绑定|[接口](../experiments/minimal-acceptance/final/translation/interface.json)|
|BLOCK_EXACT|5 项义务 UNSAT；旧 checker 原始结果名为 EXACT|[块证书](../experiments/minimal-acceptance/final/translation/block/certificate.json)|
|LLVM_FRAGMENT_EXACT|5 项义务 UNSAT；原始输出 SSA 也比较|[实际片段证书](../experiments/minimal-acceptance/final/translation/llvm-fragment/certificate.json)|
|宿主字节框架|替换外字节不变；新 SSA 无捕获|[框架记录](../experiments/minimal-acceptance/final/translation/host-frame.json)|
|REGION_EXACT，worker 1|7 项义务 UNSAT；端点 43、44，真实配对 43→44|[区域 1](../experiments/minimal-acceptance/final/regions/thread-1/certificate.json)|
|REGION_EXACT，worker 2|7 项义务 UNSAT；端点 53、54，真实配对 53→54|[区域 2](../experiments/minimal-acceptance/final/regions/thread-2/certificate.json)|
|全部限定实例覆盖|源创建 2 次，实际 worker 2 个；创建事件 3→线程1、7→线程2|[覆盖证据](../experiments/minimal-acceptance/final/regions/coverage.json)|
|必要宿主结构|x 初始值 0；LLVM 对齐 4、核心对齐 8；两个 worker 返回 null|[宿主检查](../experiments/minimal-acceptance/final/host-contracts.json)|
|同次实际后端记录|前后快照相同；原始查询含属性和边界两次 check-sat|[后端收据](../experiments/minimal-acceptance/final/backend/backend-receipt.json)|

局部共 **24 项 SMT 义务 UNSAT**，原始查询逐项保存。静态结构条件单独记录，
没有伪造 SMT 文件来充数。Dat3M 对候选程序的观察结果是 PASS，
它既不代替这些转换检查，也不能反向证明原始 GNU C 程序安全。

原块证书保留历史模型标签 `RC11Ex86-B8-restricted-v1`；此次只使用它的开放块字段
等价检查。实际模型保持论证使用修订阶段 2/3 定义的固定 TSO 端点模型，
没有把这个历史字符串当作 RC11Ex86 与实际 CAT 等价的证据。

## 2. 哪些前提实际检查，哪些仍可信？

|前提|此次实际保证|仍未证明的部分|
|---|---|---|
|源码/AST/LLVM 来源|受控调用、原始字节、依赖前后摘要、命令和输出|OS/构建驱动真实执行；哈希不证明编译器正确|
|GNU asm 接口|AST 规范类型、源操作数顺序、模板、约束、tie、clobber、实参消费|Clang 对 GNU C 宿主求值和 asm 接口的正确实现|
|源指令语义|固定参考语义未更改；此例仅 locked xadd|完整 ISA、异常、非 WB、混合大小以及普遍 ISA→CAT 桥接|
|J 和实际 LLVM|独立解释、类型/SSA 检查、全称位向量义务、实际模块解析|检查器实现和 Z3 UNSAT；没有机械化实现精化/小核证明重放|
|实际核心对象|原 Task/Program 的双接点导出、全线程事件和所遇宿主表达式字段、同次 ID|Java exporter 与序列化实现正确性；双快照不独立证明整个 encoder 正确|
|区域语义|完整 successor 链、闭合 DAG、端点存在/地址/值、A 标签、真实配对、活跃输出|解释器实现正确性；一般 CFG/指令不在本次支持范围|
|全部实例|受限 worker 的源调用 census、实际父线程/来源/创建/入口对应、逐区域检查|固定 pthread 模型、区域外普通宿主处理正确性|
|内存域|实际静态全局大小、对齐、初始值和初始化事件|WB 域、机器/ABI 解释及完整 C 内存有效性语义|
|宿主与属性|LLVM 外框架不变；核心全局与线程边界结构核对|普通代码优化、调度、join、Assume/Assert 和安全属性编码|
|内存模型/求解|固定上游提交、669 项构建输入、声明插桩、runtime 摘要、全部 27 个 CAT 文件、配置和查询|CAT parser/encoder、Java SMT/Z3，以及固定 TSO 与真实机器的适用条件|

实例覆盖的含义是：在声明的直接 pthread 创建模型下，所有可能激活的源 worker
实例均有对应检查。不是只“在某次调度中看到了两个线程”，也不是证明所有操作系统
上的 pthread_create 都成功。该原程序已显式采用验证器中的成功创建模型。

四份修订文档的 H/L/V/D/R/T/C 仍是**带前提的算法证明**。此次执行只建立这个具体对象包
满足已实现接受条件的证据；没有从“代码已写出”或“测试通过”推出实现精化定理。
预先审阅记录见[05-preflight-audit.md](revision/05-preflight-audit.md)。

## 3. 发现并修补了什么？

运行前修补：BLOCK 查询未落盘；区域拒绝丢失已生成的义务；构建来源核验不足；
快照缺少显式同次身份；创建对应及唯一性检查不足；successor 链和赋值类型条件不够显式。
没有发现需要依赖目标结果来定义源语义的循环链，且没有把不满足的 asm 适配条件移入 TCB。

实际接入又发现：

1. **构建封存漏 `compilation.yml`。** 第一次真实后端运行 ERROR，未产生快照。
   已从固定上游 Git blob 核对并纳入构建输入、运行时摘要；失败记录保留在 `attempt-01/`。
2. **导出器的宿主字段不完整。** `attempt-02/` 的局部结果通过，但快照缺少
   Assume/Assert 条件、线程创建参数/连接/返回字段及 BV_EXTRACT 位范围。
   不能把该旧快照称为完整核心对象。已补齐此次出现的字段，未知类别显式标记不完整并拒绝，
   在第三个独立构建中重新生成真实快照。`attempt-02/` 已被最终验收替代。
3. **非 ASCII 来源路径不兼容风险。** 源码审阅发现固定 Dat3M 按字节解码 LLVM 转义，
   而工作区路径含中文。使用 Clang 的显式 debug-prefix-map 生成 ASCII 调试路径，
   保留原源字节、映射参数和路径核对。未声称复现了一个新的语义转换错误。
4. **驱动误判 FAIL 退出码。** 首轮四个负例后端均返回断言 FAIL/退出码 10，
   驱动错误地要求退出码 0。按固定 `ExitCode.java` 核对 PASS=0、断言 FAIL=10 后修复；
   UNKNOWN、超时、ERROR 仍拒绝。旧记录 `negatives/` 没有删除或改写。
5. **异常路径加固。** 失败路径强制写 REJECT；实际检查器文件、Python/Z3 版本在最终运行
   中封存并检查执行前后未变。文件摘要是完整性证据，不是代码无错误证明。

本轮没有改变 `semantics/reference.py`，没有新增 asm 指令语义。
完整 GNU asm、活跃输出的一般后端映射、宏/循环/内联实例、一般库调用、
失败 CAS 的此次实测以及完整 ISA/CAT 桥接都没有通过本例得到解决。

## 4. 少量负面检查

四种变异都由真实候选模块机械生成，完整差异保存在各目录的 `mutation.diff`。
每个实际变异模块都通过 Clang 解析验证，再由固定后端实际求解并导出同次 Program。
早期拒绝后的后端运行仅用于诊断，永远不能覆盖先前的拒绝。

|变异|实际错误|检查器拒绝依据|
|---|---|---|
|lost-shared-write|atomicrmw 被换成 atomic load，丢写|LLVM 事件种类不等；实际区域缺写端点|
|wrong-rmw-update|add 1 被换成 xchg 1|LLVM 写值义务 SAT；实际区域写值义务 SAT|
|lost-atomic-order-and-pair|RMW 被拆成独立 load/add/store|两个端点均缺 A；实际 rmw 配对为空|
|uncovered-instance|第二次创建转向删除 RMW 的机械克隆 worker|宿主框架不等；原源期待 2 个 worker 实例，实际可匹配仅 1 个|

证据：[最终负例汇总](../experiments/minimal-acceptance/final-negatives/negative-summary.json)。
四例的后端观察结果均为 FAIL，但拒绝不是依据 FAIL：拒绝来自各层结构/语义条件。
错误更新的开放响应反例为 `u0=4294967295`：原操作写 0，错误操作写 1。
这个开放响应反例不是本程序的一条具体执行 witness，不应混同。

第三例同时破坏 A 标签和 rmw 配对，分别报告两项错误。没有声称已经独立测试
“仅删 A、保留真实 rmw 指针”的后端缺陷；此次未为该目的修改后端语义。
四例是实现查错证据，不能证明拒绝完备性或检查器正确性。

## 5. 是否可以扩展到真实第三方并发库？

**尚不具备直接扩展或开展大规模评测的条件。** 此次证明与实现只接受一个直接 asm、
同宽 unsigned 操作数、常量标量输入、静态全局地址、死标量结果、
只有 asm 加 null return 的 worker，以及 main 中直接创建实例。
第三方库中的宏、优化内联、循环、混合约束、活跃返回值和多调用上下文超出该覆盖证明。

现在具备的是：一个实际对象链能自动检查并拒绝四类受控故障的最小集成基线。
下一次若获准选择一个独立真实程序，应先说明其接口与实例结构是否属于已证范围；
不属于时先建立新接受条件和证明，再实现、再验收。不能直接把库文件数或 PASS 数当作进展。

论文新颖性排除、第三方覆盖与完整系统贡献仍未完成，投稿判断仍非 Go。
本次最小验收到此停止，等待用户审阅；没有授权继续扩大输入或实验规模。

## 6. 复核与复现

核心哈希（完整列表在各收据和 manifest）：

分发核对还重建了上游签名 Git commit 的原始字节，其 Git 对象 SHA 恰为固定提交；
用祖先 tree 对象哈希核对 669 项构建输入的成员身份，避免只信任缓存 JSON 自报的提交名。
见 `upstream-signed-commit.txt`、`upstream-tree-membership.json` 和静态核对脚本
`experiments/verify_minimal_evidence.py`。这证明源码字节属于该 Git 对象，
不证明上游代码正确，也不是对签名身份另作信任认证。

旧 BLOCK 证书的 `smt_sha256` 记录求解器导出的 LF 文本摘要，Windows 写文件后为 CRLF；
静态核对明确区分两者。分发文件的原始字节摘要由 manifest 单独保存。
新 LLVM/区域层同时保存原始查询文本和对应字节摘要。没有修改已经求解的义务。

|对象|SHA-256|
|---|---|
|原始 C|`d0c1dc0e612172e6a304b2cb7e4b11e8849d7a2685106452e88e8dd85bf77541`|
|原始 LLVM|`de3860f940bc203a9a9aa8bbf2e5d0de53dc6a86b63d5408736ad15660c4c759`|
|实际转换 LLVM|`97c9c00f7969a5518117b0851deae84c8881a34d171fed89e76301d82c46e418`|
|同次前/后核心快照|`f486325251e5fda7c1ed90cc7f959eebc10c031755807e1837ed773d5c47cd2f`|
|插桩后 Dat3M jar|`2cff74ed089a3f28a434a9446331755c3a738ebb99c1d080195e53d84d70126e`|

Clang 为 21.1.8；Dat3M 上游提交为 `b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8`，
只增加已声明的只读导出接点；Python 3.13.12/Z3 5.0.0，后端 Java SMT 所带 Z3 4.14.0。
Windows/WSL 路径驱动目前尚未移植。真实工具链二进制和 validation bitcode 保留本地，
不提交 Git；构建输入 Git blob/SHA、工具链版本、runtime 摘要及全部源/输出证据已提交。

在已准备固定依赖的项目目录运行，必须使用全新的输出目录：

```powershell
python certification/run_pipeline.py `
  --source benchmarks/backend-source.c `
  --dat3m vendor/Dat3M-minimal-acceptance-v3 `
  --build-receipt experiments/minimal-acceptance/build-03/build-receipt.json `
  --out experiments/review-replay `
  --run-after-user-approval
```

这条命令是复现说明，不表示当前允许新的扩展实验。
构建脚本及确切 Maven/JVM 命令分别见 `backend/dat3m/build_acceptance.py`
和 `experiments/minimal-acceptance/build-03/commands/commands.json`。
重建时 `--tree-index` 可使用包内的 `upstream-build-tree.json`；
它是经过上述成员核对的构建输入子集，不需要被忽略的大型文献/源码缓存。
源 AST 的内部地址 ID、运行 ID、构建时间可能变化；不能要求其摘要跨运行完全相同。
每次证书必须重新绑定该次实际产物。

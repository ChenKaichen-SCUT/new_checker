# 原始 Concurrency Kit `ck_pr_faa_32`：独立验收报告

日期：2026-10-20。**本次里程碑在明确受限范围和外部可信前提下完成。**
原始 CK 的宏来源、GNU 接口、真实内联调用、活跃输出，以及同次 Dat3M 最终
Program 的两个潜在 worker 实例，已有自动生成、逐层可复核的证据链。
这不是整程序形式化正确性结论；`program_verdict_eligible=false`。

论文方面的结论不同：**尚未建立独立方法贡献**，详见[贡献复核](16-method-contribution-review.md)。
本轮停止扩展，未运行 SV-COMP、批量性能测试或增加汇编指令族。

## 1. 原始输入与实际处理对象

唯一正例是既有 [ck-live.c](../benchmarks/ck-live.c)，调用原始上游
`ck_pr_faa_32(&x, 1)`，将返回旧值用于 `__VERIFIER_assert(old != 2)`。
两个 worker 分别调用一次；main 创建、join 后检查 x。它是本项目编写的调用
宿主，**不是 CK 项目的完整测试程序或数据结构**；所调用的 CK 例程与接口未改。

| 对象 | 固定版本 / 身份 |
|---|---|
| CK | `8f0847cfe57b1479d8e63b89028831d94d0e4d26`；514 个原始文件逐个核对，包含本次实际依赖；configure 生成配置单独记录 |
| Clang | 21.1.8，Ubuntu `1:21.1.8-6ubuntu1`；编译器 SHA-256 `412bbe8c60571a1eb06f48fde89635033621caeb01a9b4ee76d46711bae8e932` |
| Dat3M | 上游 `b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8`；沿用已审计只读导出构建 `build-03` |
| 实际宿主 C | SHA-256 `1b3ee8f16fc72cc5336e2e68db20adc6d69c23410c818a819a3fe6e76079856e` |
| 同次原始 LLVM | SHA-256 `727ac67b9126365eafbff78c4a12148c255595b7ca9ce59d4235c7793a61db18` |
| 实际提交 Dat3M 的 LLVM | SHA-256 `f045375056ee046e30e72ed21d0041650586d49644fec0d651d2bc148f5bf711` |

观察器作为 read-only `AddBeforeMainAction`，在**发出 LLVM 的同一次 Clang
调用**中导出 AST/SourceManager。不是拿另一次 `-ast-dump` 的地址或位置编码
冒充同次对象。共捕获 39 个依赖，完整原始 AST、全部 188 个 GCCAsmStmt、
包含虚拟 buffer 在内的来源内容及宏位置链均保留。

正例使用未经故障插桩的既有 Dat3M 构建。导出的 before/after-encoding 对象
来自同一 JVM、同一 Program、同一求解运行；完整核心事件和实际 SMT 都保存。
最终复核只重读这些原始对象，没有重新处理近似快照或重新运行后端。

## 2. 自动证据链及对应结果

1. **来源。** 从实际 LLVM asm 读取 `!srcloc !17`，元组为 `[2147751627]`。
   对全部 188 个源 asm 作精确连接，恰有一个匹配。匹配后才得到函数名
   `ck_pr_faa_32`；函数名、文件名和相似模板都不是选择条件。
2. **宏与原文。** 宏展开位置为原始 header 第 309 行；asm 的 spelling 位于
   第 293 行。字符串 token 的 spelling 分别来自 lock 前缀、宏实参和模板：
   `"lock "`、`"xaddl"`、`" %1, %0"`。从原始 buffer 重读后拼接为原模板，
   与实际 LLVM 模板精确对应。没有把源码展开后手工改写成直接 asm。
3. **接口与宿主表达式。** 保留原 `uint32_t` / `uint32_t *`；canonical
   `unsigned int` 为 32 位。对 `*(uint32_t *)target` 检查恒等指针转换；
   `+m`、`+q`、`memory`、`cc` 和实际 LLVM 隐含输入逐项核对。
   C 形实参替换独立恢复 `p0=@x, o1=1`，再与实际 LLVM 操作数比较。
4. **内联与活跃输出。** 从真实 CallExpr 的声明 ID 恢复调用；函数体必须只有
   asm 与返回更新后的 d。实际 `inlinedAt` 指向 worker 第 9 行第 20 列。
   原 LLVM 的结果 `%2` 进入 icmp/zext/assert；新增 C→LLVM 断言条件义务，
   检查原始 `old != 2`，没有只检查编译后的后继。
5. **实际转换。** 原位自动替换真实 asm，替换外 LLVM 字节保持相同；独立块
   检查和实际 LLVM 片段解释通过。自动内部槽重命名保留原操作数次序与模板，
   不改变上游 GNU 接口。实际候选送入 Dat3M，未使用手写替代 LLVM。
6. **最终核心对象。** 两个 worker 的真实读取和 RMWStore 均有 A 标签且真实
   配对正确；写值对任意读响应 u 为 `u+1 mod 2^32`，返回值为 u。
   从实际区域写寄存器与区域外读寄存器求交恢复唯一输出，再检查实际断言条件。
7. **覆盖。** 源 C/LLVM 创建清单与真实 ThreadCreate→ThreadStart 链接形成
   双射。逐一认证两个潜在激活；所有 worker 用户共享事件与后继事件被消费。

| 层级 | 最终复核结果 |
|---|---|
| 来源及类型化内联绑定 | `PROVENANCE_AND_INLINE_BINDING_CHECKED` |
| GNU / 实际 LLVM 接口 | `INTERFACE_MATCH` |
| 独立块 / 实际替换片段 | `BLOCK_EXACT` / `LLVM_FRAGMENT_EXACT` |
| 原始 C 活跃观察 / 原始 LLVM | `C_INLINE_CONTINUATION_EXACT` |
| 每个真实核心区域 / 后继 | `REGION_EXACT` / `CONTINUATION_EXACT` |
| 完整潜在实例 / 宿主结构 | `SUPPORTED_WORKERS_EXACT` / `STRUCTURAL_HOST_CONTRACTS_CHECKED` |

线程 1 区域 E43–E44，后继断言 E46；线程 2 区域 E56–E57，断言 E59。
两者自动恢复的输出名均为 `rcert_1b3ee8f16fc7_0`，属于不同线程的真实寄存器。
没有接受手填寄存器名。精确对象字段见原始快照，结果见
[最终复核 summary](../experiments/ck-provenance/reviewed/summary.json)。

最终正例局部义务为 33 项 UNSAT、2 项活跃性 SAT、0 项 unknown。
其中新增 1 项是源 C 与 LLVM 断言条件等价。数目是执行记录，**充分性来自
[条件性证明及前提对应](revision/09-ck-composition-proof.md)**，不是来自计数。
后端的实际 verdict 为 PASS；认证逻辑不把它作为接受前提。

## 3. 前提审查与修补

先行[算法设计](revision/08-provenance-design.md)在实现前写出 P/I/N 及组合条件。
最终审计没有发现“生成器保证自身正确”或“PASS 推出映射正确”的循环：
来源先于接口选择，C 参数求值独立于 LLVM 约束消费，实际片段解释独立于 emitter，
实际核心区域从本次求解对象读取，后继检查独立于区域值发现。

本轮修补和明确的边界：

- **观察器实现错误。** 最初对 Clang 的 builtin/placeholder 类型查询存储位宽，
  导致编译进程崩溃；改为仅对整数/指针查询。失败编译及调试构建均保留。
  另一次构建失败是 Clang 21 API 返回 `std::string` 而代码误用 `.str()`。
- **宿主路径混用。** 旧覆盖逻辑把创建语句和 asm 当作来自同一文件；对内联
  header 不成立。现使用经来源检查的 asm 路径与宿主路径，语义检查不放宽。
- **源码与 LLVM 断言接口。** 旧 C-live 只连接 LLVM 与核心后继；本轮添加
  原始包装函数 return 与 worker C 条件的解释，避免“返回到 C 后的用途”缺一层。
- **拒绝边界。** 不支持一般转换、隐藏调用、额外函数入口、未知属性、
  多层内联、多 surviving 静态 asm、转义/多行选中模板或一般控制流。
  即使它们本来可能语义正确，当前也拒绝，不默默套用本定理。
- **最终前提审阅。** 无初始化式的声明仍可能通过 VLA 长度求值执行隐藏调用。
  因此 main 声明进一步要求无子表达式且为受支持无符号标量；调用位置也补做
  原始字节坐标检查。收紧前的局部复核保存在 `reviewed-before-final-audit`，
  当前 `reviewed` 用最终代码检查相同原始对象；未额外运行编译器或后端。

没有发现新的上游 CK 或 Dat3M 转换错误。本轮实际后端错误是明确注入的负例，
不能当作新发现的上游缺陷。新增观察器、Python 检查器、Java 导出器仍在实现
可信边界内；没有证明助手验证其精化正确性。

## 4. 少量负面检查：区分实现检测能力与证明

六个组件负例从真实捕获对象的副本做显式局部破坏。它们**不是实际编译或后端
产物**，均标为 `SYNTHETIC_COMPONENT_CORRUPTION_ONLY`；只用于检查局部拒绝
逻辑，从未代替正例对象或实际后端对象。

| 单一语义破坏 | 实际拒绝位置 |
|---|---|
| 删除 `!srcloc` | 无唯一来源元数据 |
| 增加同 cookie 的候选源节点 | 来源连接歧义 |
| LLVM 实参 1→2 | 与独立 C 参数替换不一致 |
| 恒等指针转换→不支持的 BitCast | C 表达式解释拒绝 |
| 改变 inlinedAt 的行号 | 与实际 CallExpr 位置不一致 |
| C 断言 `!=`→`==` | C/LLVM 条件反例公式 SAT，保存模型和 SMT |

两项负例作用于**真实 Dat3M Program，在静态分析和编码之前**：

| 真实对象单因素注入 | 隔离检查与结果 |
|---|---|
| 仅取反一个实际 Assert 条件 | 区域仍通过，后继条件检查拒绝 |
| 仅删去第二个 xadd 的 Load/RMWStore 及必要链指针连接 | 宿主 LLVM、线程数、创建链接均不变；第二实例缺失，覆盖检查拒绝 |

每次都保存 pre-fault、post-fault、before/after-encoding；逐字段差异确认隔离，
原始同次 pre-fault 对照对象仍被接受。两次后端观察均为 FAIL，但 checker
依据上述独立条件拒绝。原始运行在
[negative-01](../experiments/ck-provenance/negative-01/actual/summary.json)，
最终实现对相同对象的复核在 reviewed。没有用改写的事件 JSON 冒充真实故障运行。

## 5. 哪些由检查器保证，哪些仍在外部？

| 实际检查得到 | 未机械验证的外部可信前提 |
|---|---|
| 输入/依赖/原始 CK 字节与构建产物核对、同次来源唯一性、宏位置/原始字符串一致 | 编译进程、观察器、SourceManager 与 Clang 元数据保真性 |
| 原始类型、恒等指针转换、参数替换、GNU 与 LLVM 参数消费、原始 C 活跃条件 | 普通 C 宿主编译、Clang 类型真实性及所声明 GNU 语义 |
| 实际 LLVM 区间语义、框架字节、实际核心 guard/地址/值/输出/A/rmw、闭合区域 | 局部 ISA 与真实硬件/固定 CAT 的对应、有效对齐 WB 对象域 |
| 两个潜在实例完整覆盖、创建/线程结构、局部后继断言及运行时框架 | Dat3M 完整 pthread/join/调度、普通宿主语义、断言和 CAT 编码 |
| 所有本轮局部 SMT 保存且按预期 SAT/UNSAT，unknown 拒绝 | Z3、Python/C++/Java 实现正确性；无独立小核 UNSAT 证明 |

因此“真实 GNU C→LLVM→实际 Dat3M 核心事件认证了一次”的回答是：
**是，已自动检查这一个原始例程调用的受限证据链，条件与 TCB 如上；不是完成
通用 GNU C 编译器或整程序形式化正确性的证明。**

现在具备脱离手工规范化样例、接入一个原始第三方内联例程的证据，但仍不足以
直接扩展到任意真实并发库。多个 surviving 调用、循环、指针计算、复杂后继、
优化导致来源/事件结构变化等仍无接受算法；不能同时放宽这些条件求 PASS。

## 6. 材料与复核入口

- [capture-04](../experiments/ck-provenance/capture-04/compiler-receipt.json)：
  单次 Clang 命令、完整依赖与原始 buffer、实际 AST/LLVM、观察器源码/构建、
  CK 来源与配置记录。
- [acceptance-01](../experiments/ck-provenance/acceptance-01/acceptance.json)：
  实际转换、同次正例核心 Program、完整后端查询和日志。
- [reviewed](../experiments/ck-provenance/reviewed/summary.json)：
  最终冻结实现源码、相同对象重放的全部局部查询、接口与覆盖证书。
- [manifest](../experiments/ck-provenance/manifest.json) 和
  [静态核验](../experiments/ck-provenance/static-audit.json)：
  原始字节分发完整性；不替代语义证明。
- [共享路径回归](../experiments/ck-provenance/compatibility/summary.json)：
  只重读旧捕获；旧最小例、活跃输出、成功/失败 CAS 的候选字节不变且仍接受，
  旧分支后继仍拒绝；旧直接源码 API 不能绕过新来源门禁。
- capture-01/02 是观察器崩溃记录；capture-03 是未包含完整 buffer 内容的中间
  观察器捕获，未送后端；capture-04 才是本次验收输入。所有失败尝试保留。

已有本地固定工具链时，可在新的输出目录重建/重跑（以下命令会执行受控验收，
不是单纯检查已有材料）：

```powershell
python -m experiments.build_clang_observer --out experiments/ck-provenance/observer-build-new
python -m experiments.capture_ck --out experiments/ck-provenance/capture-new --build experiments/ck-provenance/observer-build-new
python -m experiments.certify_ck --capture experiments/ck-provenance/capture-new --out experiments/ck-provenance/acceptance-new
```

仅核对已有材料：

```powershell
python -m experiments.verify_ck_evidence
python -m experiments.verify_controlled_evidence
python -m experiments.verify_minimal_evidence
```

完整工具链下载物不放入 Git；本轮 SDK 的官方 URL、版本与 SHA-256 在
[sdk-setup](../experiments/ck-provenance/sdk-setup/receipt.json)，只在 vendor 解包，
没有安装或替换系统包。Dat3M 构建复用上一轮已记录版本。

旧块检查器在 Windows 写 SMT 时保留了“LF 文本摘要 / CRLF 文件”的历史差异。
静态核验仅对 block 证书识别此差异并计数；新分发 manifest 对所有实际原始
文件字节另做 SHA-256，未改写旧查询或用换行归一化冒充原始字节完整性。

最终状态：工程里程碑完成于受限契约；独立方法贡献未建立；整程序 gate 关闭；
停止扩展并交付审阅。

# Certifying Inline Assembly Lifting for Concurrent Verification

面向并发验证的可验证 asm 转换研究。这里保存截至 **2026-10-21** 的理论设计、
受限范围数学证明、检查器原型、证书、实验数据和源码审计。

**当前状态：受限研究原型，尚未完成通用 GNU C → Dat3M 的整程序认证，
也尚未达到论文投稿完成状态。** 完整范围、证明假设和待解决问题见下列文档。

最新交付：[自动组合式转换认证：受限原型与审阅](certifying-asm-lifter/docs/composition/00-delivery.md)。
基线 `f5498b6`。完成固定公共效果顺序域的组合证明、候选计划与独立边界/覆盖核验；
不再省略 FAA 值等式。三次真实 Clang/Dat3M 正常运行：两项条件式安全、一项性质 SAT；
八项历史实际故障拒绝，17 项针对性测试通过。原八项 Γ、旧定理/代码/证据保持不变。
源语言接受域未扩大，完整 CK 客户端仍 0/1；独立算法创新及 ISSTA 完整实验 No-Go。
提交推送后停止，等待审阅。

历史交付：[多动态写者 FAA 值修复与创新性审计](certifying-asm-lifter/docs/property-multiwriter/00-delivery.md)。
基线 `5e744ab`。已给出多线程、跨对象（允许对象依赖成环）的受限值重建解析证明，
完整全局图和实际 Q/查询保持不变；边界闭包、所有实例及原八项 Γ 仍不可省略。
交付义务选择/独立证书设计及反例；未改认证器、未运行新实验，旧接受范围不变。
更强充分条件成立；独立算法创新及当前 ISSTA Research 方法路线 No-Go。发布后停止等待审阅。

历史交付：[性质驱动组合认证的受限定理与验收](certifying-asm-lifter/docs/property/00-delivery.md)。
基线 `51d8c63`。完整实际 Q/查询不变，只允许省略经单动态 owner 和双侧依赖闭包
证明无干扰的 FAA 写值等式；其余事件/原子性/宿主/实例/查询检查保留。完成解析证明、
纯局部 C 分支检查及 16 项真实验收、16 项原始对象重放、144 项测试；旧 D2=L4、分支=L3。
新标签是性质专用 `PROPERTY_CONDITIONAL_SAFE`，不重标 L3/L4；原八项 Γ 不变，可信代码增加。
独立算法创新和当前 ISSTA Research Paper 方法基础 No-Go；无大规模/性能实验。停止等待审阅。

历史交付：[四级认证与真实客户端逐位置审阅](certifying-asm-lifter/docs/levels/00-delivery.md)。
基线 `795e2a9ee95ba7446d4964430f7bda78bf6ddf76`。冻结原始 CK 完整客户端的 113 个
存活 asm 位置，6 个达到 L1/L2，完整客户端 L3/L4 仍为 0/1。修复实际 ITE 导出，
受控分支的 4 个实例达到 L3，宿主契约不足而拒绝 L4；D2 正例保持条件式 L4。
129 项测试、16 项受控验收及 2 项 LLVM 故障完成。原 Γ、定理与历史证据不变。
独立算法创新和当前投稿准备度 No-Go；工具系统进展有限且可复核。发布后停止，等待审阅。

历史交付：[方案 A：局部证书复用与显式 HCC](certifying-asm-lifter/docs/hcc/00-delivery.md)。
基线 `8412b600293161e173ed7f7b94bb3c316d46f796`。已实现模板证明复用、逐实例核对、
HCC 声明/来源绑定和无可信 provider 时的严格拒绝。22 个受控 case、120 项单元测试通过。
**当前方案 A 整程序扩展 No-Go**：只有 D2 能提供宿主依据，完整 CK 客户端仍为 0/1，
配对运行未显示耗时收益。局部分支例子成功不等于程序 SAFE；原八项 Γ、原定理和历史证据保留。
交付后停止，等待审阅。

历史交付：[源语义风险修补与不同 worker 认证](certifying-asm-lifter/docs/p2/00-delivery.md)。
基线 `884c06a8d2076c8f9443bfbfc30637151d89c73d`。旧普通 C/asm 并发冲突输入现已
关闭程序授权；独立只读输入、双调用活跃依赖及两个不同 worker 经实际对象得到受限
`CONDITIONAL_SAFE`，保持原八项 Γ。111 项单元测试、P0/P1 回归及隔离故障完成。
固定完整 CK 事件计数器客户端编译成功但范围拒绝，外部客户端为 0/1 接受。
本轮并未证明通用 GNU/Clang 混合语义或可移植 C11；停止扩展，等待审阅。
历史 [P1a/P1b 交付](certifying-asm-lifter/docs/p1/00-delivery.md)及全部证据保留，
其混合访问样例的当前适用性已由本轮收缩。
前次实现：[P0 程序级门禁](certifying-asm-lifter/docs/p0/00-delivery.md)。

历史交付：[工具／系统论文可行性审阅](certifying-asm-lifter/docs/system-review/00-delivery.md)。
基线 `25e67f8cf379c74857dd78bdf6e83f334555a269`。完成受限端到端安全转移的
条件定理与解析证明、真实链实现缺口、三库源码障碍排序及严格评测设计。
main/生命周期与实际错误查询绑定仍缺完整检查，程序级 gate 保持关闭。
通用非双射新算法路线暂停；受控系统开发为条件性 Go，当前投稿成熟度仍为 No-Go。
本轮仅静态审阅和文档，未改认证器、未执行实验；完成后停止等待批准。

前次交付：[已有方法组合可行性审查](certifying-asm-lifter/docs/combination-review/00-delivery.md)。
基线 `58dccfad29c9285f4280b90e6372fd202d1d2483`；固定有限无环、有限线程的
x86/TSO，审查 PAA/JTFG、VALID、Stellite、SEQ、Kater/KATI 及补充方法。
结论为 **No-Go（本轮候选的独立算法创新）**：完整执行包含有已知证书路线，
窄的跨区域排序引理也与已有方法重合；未建立成本优势。组合尚未实现，
工具/系统贡献仍需论证。本轮仅文献与解析推导，未改认证器、未运行实验；
交付后停止，等待审阅。

前一批：[自动对应关系合成：第一批审计与问题设计](certifying-asm-lifter/docs/correspondence/00-delivery.md)。
以 `b7b3b2e3aa25fbd2746bd602caae68003e490026` 为基线，完成算法级文献比较、
精确定义、候选证书/搜索设计和解析反例。自动匹配、SMT 与覆盖检查本身不构成
新贡献；开放历史与覆盖的组合仍待证明，论文创新性未建立。Hetrify 系列全文
仍有获取缺口，未据此排除其能力。本批未改认证器、未新增实验，等待用户审阅。

上一里程碑：[原始 CK 来源与活跃输出验收](certifying-asm-lifter/docs/15-ck-acceptance.md)。
从同次 Clang 的 188 个 GCCAsmStmt 自动连接原始 `ck_pr_faa_32`，
核对宏来源、原始类型/约束、内联实参与返回值，并认证同次实际 Dat3M 的两个
worker 区域及后继。六个组件负例与两个真实后端故障均被拒绝。
这是明确 TCB 下的一条受限证据链；整程序判定转移仍关闭。
[独立方法贡献复核](certifying-asm-lifter/docs/16-method-contribution-review.md)
认为当时工程成果尚不足以建立独立方法创新；原始证据保持不变。
历史记录：[第二轮](certifying-asm-lifter/docs/14-controlled-acceptance.md)、
[最小验收](certifying-asm-lifter/docs/13-minimal-acceptance.md)。
前置理论材料见[第 1–4 阶段修订](certifying-asm-lifter/docs/12-review-repair.md)。

## 阅读入口

- [原型说明与运行命令](certifying-asm-lifter/README.md)
- [各阶段成果与状态](certifying-asm-lifter/docs/00-progress.md)
- [正确性证明](certifying-asm-lifter/docs/06-correctness-proof.md)
- [弱内存扩展](certifying-asm-lifter/docs/07-weak-memory-extension.md)
- [模型实例证明及缺口](certifying-asm-lifter/docs/08-complete-proofs.md)
- [实验报告](certifying-asm-lifter/docs/09-experimental-evaluation.md)
- [对抗性审阅与当前 No-Go 判断](certifying-asm-lifter/docs/10-adversarial-review.md)
- [Dat3M 真实 GNU C 复现](certifying-asm-lifter/docs/11-dartagnan-reproducer.md)

## 目录

| 目录 | 内容 |
| --- | --- |
| `certifying-asm-lifter/frontend`, `semantics`, `lifter`, `checker`, `backend` | 受限前端、参考语义、候选转换器、独立检查器和探索性后端 |
| `certifying-asm-lifter/docs` | 形式定义、逻辑证明、源码审计和研究边界 |
| `certifying-asm-lifter/benchmarks` | 自建样例、固定版本上游接口和提取片段 |
| `certifying-asm-lifter/certificates` | EXACT / REJECT 证书与 SMT-LIB 查询 |
| `certifying-asm-lifter/experiments` | 实验脚本、原始日志、结果、图表及比赛任务清单 |
| `research` | 前期研究的来源哈希清单、审计脚本与汇总 |
| `third-party-notices` | 随仓库分发的上游代码许可证及声明 |

## 最小复现

```sh
cd certifying-asm-lifter
python -m pip install -r requirements.txt
python -m pytest -q
python cli.py benchmarks/cmpxchg.asm --out certificates/example
```

已保存的初版测试结果是 64 项通过，不代表新增代码已测试。证书中的 `backend=UNVERIFIED` 表示块认证
不能直接解释为整个并发程序验证通过；理论证明与实验结论分别陈述在上述文档中。

## 下载依赖与资料范围

Git 中不包含本地 `vendor` 工具链、构建产物、论文全文下载缓存及原始比赛输入缓存。
它们仍保留在原工作目录。原型 README 中的 `vendor` 路径指本地安装位置，
克隆本仓库后运行后端实验需要单独准备：

- [Dat3M 固定版本源码](https://github.com/hernanponcedeleon/Dat3M/tree/b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8)，
  解压为 `certifying-asm-lifter/vendor/Dat3M-b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8`。
- Java 21、Maven 3.9.9、WSL Ubuntu；构建命令见原型 README。
- `compile_native.py` 还使用 GCC 和本地解包的 Clang 21.1.8；其路径布局见脚本。
  当前后端脚本保留实际实验使用的 Windows / WSL 路径封装。

`research/source_manifest.json` 是前期本地资料缓存清单，不是本仓库完整文件清单；
`research/audit_svcomp.py` 需要按原始来源恢复缓存后才能重算。
`research/svcomp/summary.json` 等审计结果已随仓库保存，供当前实验脚本读取。
`research/litmus_audit.py` 是早期有限模型探索，不作为数学证明。

`certifying-asm-lifter/artifact-manifest.json` 记录本次原型交付文件的字节哈希；
初版 206 项清单保存在 Git 的初始发布提交中。`.gitattributes` 禁用自动换行转换，
避免克隆时改变证书相关字节。哈希核对不替代语义证明或执行测试。

上游来源及许可证见 [第三方声明](third-party-notices/README.md)。本次发布未为整个
混合来源目录另行指定统一许可证。后续经授权的研究更新将继续提交并推送到本仓库。

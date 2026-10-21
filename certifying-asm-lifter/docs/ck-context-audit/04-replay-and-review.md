# 静态复核、边界与交付记录

## 重放

本轮不需要 vendor 二进制、Z3、Clang、Dat3M、上游 checkout 或 Linux 服务器。需要 Python 3.10+ 标准库及仓库中原有公开证据包。所有路径均从脚本位置解析，可在干净 checkout 中运行：

```sh
python certifying-asm-lifter/experiments/ck-context-audit/reconstruct.py --verify
python certifying-asm-lifter/experiments/ck-context-audit/render_table.py --verify
```

第一条重新读取冻结 CAS 与现有源码，核对散列、receipt artifact、注册源、buffer、GNU 声明/约束及 LLVM 位点，重建全部 37 个输出文件并逐字比较；第二条检查人工审查表与冻结全部 15 个 L2 身份完全相等并重建 Markdown/JSON/CSV。没有 SMT、编译或后端执行。`reconstruct.py` 不带 `--verify` 仅用于首次生成，目标目录已存在即拒绝覆盖。

`evidence/inputs.json` 逐项记录原文件 SHA-256 与存储位置。对于存储于 CAS 的引用 `name`：读取 `published/index.json["files"][name]`，按 SHA 定位对应 `.gz`，解压后验证字节数和 SHA，即可读取完整原始 AST、observer、接口、SMT、日志。无需水合其余 37 任务的数据。`evidence/raw` 中的副本仅为审阅方便，不是重新编译的输入。

## 重建器不是接入层

两个脚本位于独立实验目录，生产代码没有 import 它们。它们不生成 SOURCE_INTERFACE/ACTUAL_Q/SAFE，不改写 native receipt，不调用 guarded，不为不支持操作建立语义，不求解路径，也不假造函数或线程。`assessments.json` 是明确标注的人工审查结论；机器可复核的是原始证据和表格一致性，不是声称新建了证明核。

静态 CFG 清单提供实际块、边和含环块，便于交叉检查报告中的回边。轻量文本解析不替代完整 LLVM 解释器；核心排除证据同时可直接在完整 C 和 LLVM 中阅读。源码语法 CallExpr 清单保留 ancestor kinds，包括 assert 宏中的 `sizeof` 未求值子表达式：不将这些条目算作重复实际调用，更不以清单行数声称动态实例覆盖。原始 AST definition 通过 `previousDecl` 链连接 canonical declaration ID，避免将同名函数直接当作相同定义。

首次开发静态重建器时有两次失败：其一，系统头 vprintf 的 observer 使用 canonical declaration，而 raw AST 的实际定义位于 previousDecl 链末端；其二，ForStmt children 含空槽。随后仅修正审计索引脚本的声明链索引及空槽遍历；失败时未生成 evidence 目录。另修正静态直接调用清单避免把 asm 约束 `@cc` 文本误当成函数名。这些是**新审计辅助脚本的开发问题**，不是历史认证器或 CK/Clang/Dat3M 新缺陷；未运行任何语义实验。

## 对拒绝证据的对抗复核

| 可能的错误推断 | 本轮核查与处理 |
|---|---|
| 所有位点都在循环里 | 否。F97/F109、E553/E782 的位点/所在函数无环；已分别保留此正面事实 |
| 553 因客户端其他 wait 函数有循环而拒绝 | 否。同函数对同 ec 的 movl/incl 等操作、对象及观察条件已足够排除，不借用无关循环 |
| 782 的 wait 循环属于无关函数 | 否。真实 create→waiter→wait_slow 链与 FAA 共用 `%2`/ec，完整客户端源码和两个真实 TU 相互印证 |
| 32 位 elementtype 证明对象就是32位 | 否。F97/F109 的 alloca/store/load 均为64位；L2有效端口前提不证明宿主对象模型 |
| 返回值未使用便可忽略其影响 | 否。E782 的外层弃值，但 `%17` 仍控制 wake；F97/F109虽无返回SSA用户，内存观察仍活跃 |
| 真正 unsigned FAA 可独立截出循环一轮 | 否。这将改变原始调用上下文、动态出现和错误观察；未做 harness 或源变换 |
| 单线程初始化显然使 wake 不可达 | 未作为证明使用。当前开放读取环境允许的响应不能随意按一次闭合初值收缩；非FAA同路径证据已足够 |
| 将 schema 状态改名即可进入 guarded | 否。native 捕获哈希与固定 Clang 相符是事实，仍不能填补宿主对象/操作/循环/监视器语义 |
| 函数名或 debug metadata 足够建立语义映射 | 否。它们仅用于定位；本轮另核对原 L2 的 origin cookies、声明、GNU类型/约束与原始模块行，未生成跨层语义新结论 |
| 出现 unsupported 表示源程序有真实错误 | 否。No-Go 是适用域判定；未声称 UB、转换差异、真实可执行缺陷或软件不安全 |

## 可信边界及后续停止

新旧八项 Γ、E2E-SAFE、L1–L4、ACTC、guarded 定理及生产实现不变。原 L2 作为历史局部证据保留，不升级为开放包含或程序级 SAFE。已有 Q 捕获结果与未完整 Alloc 导出也只按历史状态引用，不重新解释为新的失败实验。

没有满足全部前提的候选，因此没有适配器代码、适配器独立检查结果或新的程序证书；这是执行预先约定停止分支的结果，不是遗漏交付。没有新 ISA、C 语法白名单、CK 特例、并行后台任务或性能实验。完成提交、推送、远端 SHA 与工作区核对后停止，等待审阅。

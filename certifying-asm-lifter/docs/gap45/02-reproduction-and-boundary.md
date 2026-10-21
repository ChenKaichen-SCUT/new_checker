# Linux 复现、证据布局与可信边界

本轮冻结 `b0a788edafbd6c1251c93f49c52e8c4d111c96cb`；实验分支为
`codex/gap4-gap5-linux-evaluation`。最终统计见 `experiments/gap45/summary-02/`。
原始结果并未因压缩而重写：`published/index.json` 将每个原文件路径、长度、SHA-256
映射到 gzip 内容对象。相同字节只存一次，包括失败运行、完整 AST、LLVM、实际 Q、
查询、SMT、证书、日志、依赖头文件和执行时实现快照。

## 无工具链的原始对象独立重放

在一个干净 Linux checkout 中执行：

```sh
cd certifying-asm-lifter
bash experiments/gap45/replay.sh
```

只需要 Python 3.10+、venv/pip 和固定 `z3-solver==5.0.0.0`；不需要 Clang、Java、
Dat3M 或 vendor 二进制。脚本解压并检查 pilot 原始对象，重新提取路径、生成义务、
独立核验，并验证三类具体化结果。输出目录已存在时应另选新目录，不删除历史输出。
本轮实际在没有 vendor 的独立基线 checkout 中，清空环境变量后完成这六项重放；
使用同一服务器上的固定 Python/Z3 运行时，并非另一个操作系统虚拟机。

完整解压：

```sh
python -m experiments.gap45.publish
```

解压器拒绝路径越界、损坏对象和不同内容的覆盖。注册表、原始日志中的服务器绝对路径
是历史事实，不应全局替换。重放器使用当前 checkout 的真实文件、原始散列和已记录的
debug-prefix 映射。压缩对象不是合成的事件文件。

## 原生重新捕获／求解

原实验布局为 `/opt/actc-gap45/repo/certifying-asm-lifter`。完整重新捕获还需要自行取得
固定工具链；仓库不分发工具二进制。`environment/transferred-toolchain.json` 包含
4,311 个文件的散列，`environment-final` 包含包版本、配置、许可证和构建日志。
Clang 为 21.1.8，二进制 SHA-256 为
`412bbe8c60571a1eb06f48fde89635033621caeb01a9b4ee76d46711bae8e932`；observer 为
`8f3fefd8cd34cf389e0446e5a43898f543d323d7d35812388d13074d4166422a`。
原 observer 构建命令在 `experiments/ck-provenance/observer-build-05/receipt.json`。

当前公开材料足够独立重放关键证据，但**不提供一条无条件联网即可逐字节重建全部旧
工具链的承诺**。原始 Clang/observer 被原样迁移；部分旧动态库此前没有历史散列。
Ubuntu 22.04 的 Java 构建及 libc 头文件也不同于旧 WSL 发行版，所有差异显式记录。
重建 observer/工具时必须保存新命令、版本和散列，不能改旧 receipt 冒充原二进制。

固定 Dat3M 为 `b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8`。使用 Maven 3.9.9、
Java 21.0.12.1 和原依赖缓存离线构建；669 个输入 Git blob 经检查。原始无插桩、只读
捕获和受控故障三种构建分离。正例构建命令的参数形式为：

```sh
MAVEN_ARGS=-o python -m backend.dat3m.build_acceptance \
  --upstream /opt/actc-gap45/upstreams/Dat3M-archive \
  --tree-index experiments/minimal-acceptance/upstream-build-tree.json \
  --destination vendor/Dat3M-linux-positive-02 \
  --evidence experiments/gap45/build-positive-02 --p0-query-audit
```

在新输出目录运行，不覆盖交付目录。故障构建另用 `--controlled-fault-build
--levels-query-audit`。完整命令以原始 `build-*/` 日志为准。实际 LLVM 链接器同为
21.1.8，包散列、四个上游 SHA、源码完整性和原始 Make/CMake 参数均已保存。

实验入口依次为 `freeze.py`、`capture.py`、`analyze.py`、`programs.py`、
`controlled.py`、`performance.py`、`regression.py`、`audit.py`、`summarize.py`。
每个模块提供 `--help`。先配置未修改上游并审阅注册表，再捕获完整母集和封存位置清单，
最后才运行认证。不能使用新的结果修改本轮注册表或预算。

## 实现与保证边界

旧文件只改了 `certification/evidence.py` 和 `experiments/run_dat3m.py` 的进程／路径
启动接口，并新增 `platform_launch.py`。Linux 移除 WSL 包装，必要时调用私有 ELF
loader；Windows 路径保持原行为。私有 loader 不替换系统 libc。编译子进程 wrapper
显式保留 argv0、资源目录和 `-cc1` 参数，不改 AST、LLVM、Q 或表达式语义。

`analyze.py` 是通用捕获对象的来源／散列适配器，调用旧 `abstract_port`、GNU 接口、
L1 与 LLVM 片段检查器。它从原对象重建接口并复核候选，不由 opcode 猜测等价。
这增加了要审阅的**实现代码表面**，没有增加语义 Γ，也不是独立新算法。L2 只覆盖
对应局部转换位置，不能为复杂宿主、宏展开全部调用、完整激活或整程序背书。

ACTC/diagnostics/guarded 的完整程序入口不接受新的通用 receipt。实验没有把它伪装成
旧受限捕获格式。其拒绝首先是接入限制；另外，完整原始程序中的循环、复杂调用、
大量 asm 定义、动态内存及环境行为超出已证明域。对这些障碍分别列账，不能由入口
拒绝断言算法本身不可能扩展，也不能由一份实际 Q 断言完整动态覆盖。

原 E2E-SAFE、L1–L4、ACTC、guarded 语义、八项 Γ 和历史证据保持不变。新输出中的
后端 PASS、有限展开 Q、局部包含和开放 SAT 均不会自动提升为程序 SAFE 或真实缺陷。

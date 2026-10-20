# P0 最小真实程序验收报告

本报告独立于后端日志的 PASS/FAIL，验收对象为原 CK harness 及一个性质变体。
推导和外部前提见 [01](01-proof-and-checks.md)。
最终证据目录是 `experiments/p0/final-reviewed/`；其他尝试均保留，见第 6 节。

## 1. 实际对象与版本

- 项目基线：`7309c4e48521f2b2baed6f9fb418dce5bb8f8fa5`。
- Clang 21.1.8，x86-64 Linux；二进制 SHA-256
  `412bbe8c60571a1eb06f48fde89635033621caeb01a9b4ee76d46711bae8e932`。
- CK 原始提交 `8f0847cfe57b1479d8e63b89028831d94d0e4d26`，
  `ck_pr_faa_32` 接口、宏、`+m/+q`、类型转换和 clobber 均不修改。
- Dat3M `b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8`，
  target=tso、method=eager、property=program_spec、solver=z3；
  CAT 与构建依赖由原 pins 和 build receipt 固定。
- 后端 JavaSMT 的 Z3 工件版本 4.14.0；本地义务/查询重放使用 Z3 Python 5.0.0。
  两者均在原求解器信任边界内；不是独立小内核 UNSAT 证明检查。
- 正例构建只安装 `Snapshot` 和 `P0Audit`。负例构建另安装 `P0Faults`，
  该类不在正例构建中。构建从同一固定源树的 669 个输入开始。

两次源捕获分别在 `capture-safe-01/`、`capture-unsafe-01/`。
每次真正的 CodeGen invocation 同时获得 observer、完整 raw AST 和原 LLVM；
依赖和原 CK 字节检查保持。不存在手写替代 LLVM。
candidate 仅由现有 lifter 修改经过认证的实际 asm 位置；其余宿主字节不变。
无 passes 的 Clang IR 验证只产生检查副产物，Dat3M 仍读取完整保存的 candidate.ll。

后端前后快照与查询审计来自**同一个 Task、同一个 Program、同一次求解运行**。
`query-audit.json` 保存同次实际条件公式、参数及返回值。
最终每例还保存执行时全部 checker 源码副本和摘要，便于复核代码版本。

## 2. 正例的完整链

实际程序有一个静态零初始化的 unsigned32 对象 x；main 创建并 join 两个 worker，
每个执行原 CK FAA(1)、断言返回旧值不为 2；main 最后断言 x=2。

自动恢复和检查：

- C 声明身份、handle 的 LLVM alloca/实际 load、实际 ThreadCreate/ThreadJoin；
  无人工填写线程或寄存器映射。
- x 的 C 零初始化、LLVM i32 global、实际 MemoryObject 和唯一 Init。
- main 读 x 的实际 Load writer，由自由符号 `p0-main-read-0` 贯穿 C/LLVM/Q 比较，
  **检查期间不预设此符号等于 2**。
- 三个用户 Assert、两个内部 join Assert 的完整分类和实际 Task monitor 清单。
- Q 共 74 个事件：main 39、两个 worker 共 26、三个初始化线程共 9。
  所有事件都被完整消费；协议对象与用户对象的身份互异。
- 两个动态 worker 实例分别完成原 REGION、活跃输出及宿主接续检查。
- 实际安全属性是 PROGRAM_SPEC/SAFETY/ASSERT。
  第一查询在临时 assumption 下为 UNSAT；第二查询在弹出该 assumption 后为 UNSAT。
  无实际 bound 事件，bound 公式为 false；第二个结果没有被拿来证明第一个结果。

最终 SAFE 的局部记录含：translation 11 项、regions/continuations 24 项、
新增 host 12 项、新增 queries 6 项义务。
其中两项既有活跃输出“确实影响断言”的义务预期 **SAT**，其余上述等价义务为 UNSAT。
这说明“所有 SMT 都 UNSAT”甚至不是本系统的接受定义。
query 目录另保存两条实际完整求解查询及重放结果。

输出为：

```
result = CONDITIONAL_SAFE
program_verdict_eligible = true
unconditional_safe = false
external_semantic_assumptions_proved = false
```

这些字段合起来解释：在证书明列的原 Γ 和输入域下，允许安全结果转移；
绝不允许删掉假设清单，单独发布无条件 SAFE。
原局部 API 和旧 CK 验收入口的 `program_verdict_eligible=false` 没有被修改。

## 3. 不安全性质变体与源反例

`benchmarks/ck-live-unsafe.c` 与原文件只有一处字节级修改：
main 的 `__VERIFIER_assert(x == 2);` 改为 `__VERIFIER_assert(x != 2);`。
没有改 CK 头文件、worker、接口、LLVM 或目标事件。

所有来源、区域、宿主和实例检查仍接受。真正的第一次安全查询返回 SAT，
审计记录 FAIL；后端按正常控制流不执行 bound 查询。
门禁结果 `SAFETY_QUERY_SAT_NO_SAFE_TRANSFER`，不是 SAFE，也不是一般化的源 FALSE 认证。

同次模型的实际事件值如下；表由 Q 事件和实际 model evaluate 自动投影，不作为输入映射：

| 实际事件 | 值 |
|---|---|
| Init x，事件 66 | 0 |
| worker 1 的 FAA load/store，43/44 | 读 0，写 1 |
| worker 1 用户断言，46 | executed=true，condition=true |
| worker 2 的 FAA load/store，56/57 | 读 1，写 2 |
| worker 2 用户断言，59 | executed=true，condition=true |
| main 共享 load，33 | 2 |
| main 用户断言，35 | executed=true，condition=false |

**独立的源反例推导。** 两次创建成功后，调度第一个 worker 完成 FAA 和返回，
再调度第二个 worker 完成，最后让 main 的两次 join 返回。源 x 初值为 0；
按已声明 x86 FAA 语义，第一操作返回 0 并写 1，第二操作返回 1 并写 2，
两个 `old!=2` 成立。main 随后读 2，`2!=2` 为假。
地址有效、线程关联和 unsigned 模运算均符合 D₀-P0 输入域。

这个见证在源图中取：
`rf={(Init, r1), (w1, r2), (w2, rmain)}`，
`co=Init<w1<w2`，`rmw={(r1,w1),(r2,w2)}`，
并按上述实际顺序保留创建/结束/join。每个读取其之前最近的对应写，
RMW 读写间没有第三者写；po-loc/rf/co/fr 和 TSO 的 K/co/fr/rfe
均沿该顺序前进，故没有禁止环或原子性破坏。main 断言即有限错误前缀。
这是**直接从源语义构造并检查的一个顺序可实现 TSO 反例**，
不从目标 SAT 单独推导全体源/目标反向包含。
当前门禁不提供通用 `VALIDATED_SOURCE_COUNTEREXAMPLE` 算法。

## 4. 三项单因素实际故障

故障发生在真正的 Dat3M 对象/实际调用上，原始 C、AST、LLVM 和 lifter 不改变。
`pre-fault.json` / `post-fault.json` 记录实际修改前后对象；
[隔离性复核](../../experiments/p0/evidence-review/fault-isolation.json)
比较完整结构，不只是检查指定字段。

| 故障 | 隔离证据 | 后端 | 门禁 |
|---|---|---|---|
| 删除不安全变体 main Assert | 仅删除实际事件 35，并把前驱 34 的 successor 从 35 接到 36；其余对象、字段、实例相同 | PASS | C2/C3：期待 Assert 时完整消费失败 |
| 第一 join 指向第二 worker | 仅 `/threads/0/events/14/joined_thread` 从 1 变 2；其余字段完全相同 | PASS | C2/C3：实际 join 与源 handle 不符 |
| 安全查询使用 false assumption | Program 前后完全相同；实际第一调用的参数为 false，名义 literal 仍为 DAT3M_spec_assumption | 两次 UNSAT，PASS | C4：actual-safety-assumption-binding 的差异为 SAT |

三个负例的两个 worker 区域与激活检查仍通过，说明不是依靠无关区域失败拒绝。
前两例在宿主层停止，不再尝试授权查询层；
第三例 C0–C3 通过后，才在独立的查询绑定条件拒绝。
故障构建本身还有最后一道“不可发布 SAFE”的防线，但**本次检测成功不以该防线计数**：
三例都先触发各自的语义/覆盖拒绝条件。

这些检测结果证明本次实现对这三个具体错误有区分能力，
不证明穷尽所有错误转换，也不替代 H-P0、Q-P0 或原 E2E-SAFE 的逻辑证明。

## 5. 复现和材料布局

所有命令在项目目录运行，所需固定工具链依旧位于本地 vendor。
复制目录名称必须用全新路径；工具拒绝覆盖。

```
python -m backend.dat3m.build_acceptance --upstream vendor/Dat3M-b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8 --tree-index ../research/sources/dat3m_tree.json --destination vendor/Dat3M-p0-positive-v1 --evidence experiments/p0/build-positive-01 --p0-query-audit
python -m backend.dat3m.build_acceptance --upstream vendor/Dat3M-b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8 --tree-index ../research/sources/dat3m_tree.json --destination vendor/Dat3M-p0-fault-v1 --evidence experiments/p0/build-fault-01 --p0-query-audit --controlled-fault-build
python -m experiments.capture_ck --out experiments/p0/capture-safe-01 --build experiments/ck-provenance/observer-build-05 --source benchmarks/ck-live.c
python -m experiments.capture_ck --out experiments/p0/capture-unsafe-01 --build experiments/ck-provenance/observer-build-05 --source benchmarks/ck-live-unsafe.c
python -m experiments.run_p0_acceptance --out experiments/p0/final-reviewed
python -m experiments.review_p0_evidence
python -m pytest -q tests/test_p0_gate.py tests/test_review_repairs.py
```

最后两类检查是证据/解析器审阅及针对性回归，没有扩展程序集合；
测试结果 **33 passed**，完整 stdout/stderr/命令在 `experiments/p0/targeted-tests/`。

每个最终运行子目录包括：

- implementation 摘要及执行时源码副本；
- translation 的原来源/接口、candidate LLVM、开放块与 LLVM 义务；
- backend 的实际命令、stdout/stderr、模型文件、构建身份、前后 Program、query-audit、
  未改写的完整 SMT transcript；
- 每个 worker 的区域与接续义务；
- host 的 C/LLVM/Q 条件、实际关联、全部初始化和 monitor 清单；
- queries 的属性/assumption/栈等价义务、实际单查询文本、重放结果；
- 独立程序级证书及全部 Γ。

失败时保存已生成的全部材料；在宿主层拒绝的例子没有伪造后续成功证书。
大体积下载工具链和临时 `.bc` 不纳入 Git；实际输入 LLVM、Program、SMT、源文件、
构建/工件摘要、日志和最终 checker 字节均保留。

## 6. 未隐藏的开发记录

- `safe-01`：原检查已通过宿主，查询解析器因未知 license 元信息拒绝。
- `review-safe-01`：独立重查实际对象；查询解析器因强制 `(exit)` 拒绝。
- `review-safe-02`：按固定后端的完整 EOF 格式重查，两次查询分别绑定。
- `safe-02` / `unsafe-01`：早期完整正负运行。
- `final-run`：首次五例均符合预期。随后解析证明发现需显式检查 assumption
  不出现在 monitor 自由变量中，同时补强实际文件摘要复核。
- `final-reviewed`：最终代码重新执行同样五例；本报告以此为最终验收。

没有覆盖上述失败、修改原参考语义或重写既有实验文件来制造通过。
这些重复是同一最小对象的开发修复确认，不是性能数据、统计评测或扩大支持范围。

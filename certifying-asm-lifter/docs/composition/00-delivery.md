# 自动组合式转换认证：受限原型与独立审阅

2026-10-21。冻结基线 `f5498b6213e0a4e2b5f51f57477cad271035c200`。

**完成受限理论、自动计划/独立核验原型与真实对象验收；独立算法创新和进入
ISSTA 完整实验阶段仍为 No-Go。** 本轮不继续 PD-SAFE 值修复，也不新增指令族。
它带来了显式、可攻击的区域边界证书；没有扩大源语言接受域或解除完整 CK
客户端的关键前提，不能称为通用自动组合认证已经完成。

## 1. 交付与阶段结果

| 阶段 | 独立材料 | 结果 |
|---|---|---|
| 现有链审计、问题定义与证明 | [形式化域、充分条件及完整解析证明](01-model-proof.md)；[现有能力与障碍表](02-algorithm-check-map.md) | 闭合有限、固定公共效果顺序域的 ACTC-TRANSFER；未改变原 E2E-SAFE |
| 自动计划与独立核验 | [算法、证书格式及实现对应](02-algorithm-check-map.md)；[实现](../../certification/composition.py)；[独立重建 driver](../../experiments/certify_composition.py) | 源/LLVM 适配复用；Q 独立摘要、实际 pair、边界、完整覆盖和全部等式检查 |
| 真实对象正负验收 | [完整记录与解释](03-client-and-evidence.md)；[结果](../../experiments/composition/final-01/results.json)；[独立证据审阅](../../experiments/composition/evidence-review.json) | 两个条件式安全正例、一个不安全查询 SAT、八个历史实际故障拒绝、17 项针对性测试通过 |
| 完整第三方对象与创新性 | [客户端未闭合前提](03-client-and-evidence.md#4-冻结完整-ck-客户端哪些障碍真的解除了)；[逐项文献比较](04-novelty.md) | 完整 CK 仍 0/1；算法机制可归纳为已有原理的组合，No-Go |
| 历史完整性 | [封存记录](../../experiments/composition/integrity.json) | 原定理、八项 Γ、生产旧代码、旧证书及原始实验逐字节保留 |

## 2. 新机制能做什么，不能做什么

从真实原始 C/AST、原始和转换后 LLVM、同次完整 Q 自动恢复有限激活和效果
序列，按完整读/FAA/断言单位划分区域，沿实际定义—使用链生成两侧跨区域端口。
验证器重新打开原始输入、重新解释，并检查有序双射、所有区域/节点覆盖、输入
输出依赖及全部普遍等式。错误或缺失的候选证书不能成为证明依据。

实际分支例子保留原 CK `ck_pr_faa_32`、非固定 SSA 输入、两次调用及第一次
返回值对后续输入/断言的影响。纯 C if、LLVM select 和 Q ITE 由语义义务连接。
所有读响应开放量化，不按一次后端安全模型选输入。完整实际 Q、共享事件和
安全查询保留，跨线程只输送同一全局 rf/co/fr，RMW/A/顺序不能省略。

但前端仍限于原有限宿主语法、唯一可核验来源及直接声明初始化调用；完整 main
与固定 pthread 协议仍用原强检查器。这里没有一般控制流/跨过程对应算法，
效果顺序固定后匹配由序号确定。新证书接口没有自动解决循环、间接调用、未知
别名或未支持 C 的语义。用户 fence/条件 CAS 不在新程序级接受域，不能从证明
讨论了这些关系就声称已实现它们。

## 3. 结论和可信边界

`COMPOSITIONAL_TRANSFER_EXACT` 表示完整适用域内的源错误→实际 Q 错误转移。
只有所有宿主/覆盖条件、原 C0–C4 和同次可靠安全/bound UNSAT 成立，正常构建
才释放 `ACTC_CONDITIONAL_SAFE`。这不是原 L3/L4 的自动升级，更不是无条件 C11
正确性。旧 L1/L2 等可独立保留；本轮不修改任何历史等级结论。

以下三类严格分开：

- **解析证明**：有限总表达式摘要、双侧边界完整性、逐区域组合、实例覆盖和
  全局固定 TSO 图输送。证明不依赖测试、PASS、源安全或候选生成器正确性。
- **实际检查**：三个重新捕获的 Clang/Dat3M 输入；独立 SMT/查询、完整 Q
  分区；八个明确标记的历史受控故障；候选与对象攻击。开放 SMT 模型不自动
  证明全局合法源反例。没有新发现真实上游缺陷。
- **仍被信任**：原 `Gamma_front/ISA/capture/runtime/encode/check/solve/domain`。
  [原文](../system-review/01-end-to-end-guarantee.md#3-明列外部可信假设-γ)不变，
  所有最终证书列出同一八项；未验证编译器/后端/求解器，也没有新 HCC provider。
  新实现增加 Gamma_check 所覆盖的代码表面，没有声称缩小 TCB。

针对性测试的正向非默认分区说明核验器不等于“重复 producer 并比较字符串”；
直接将实际错误 Q 提交核验器的负例说明拒绝不只发生在候选构造阶段。但这些
实现事实不等于发现新的分解、对齐或摘要算法。

## 4. Go/No-Go

**受限工程目标完成**：可导出并独立核验组合证明计划，在原始真实对象上连接
已有局部保证、跨调用依赖、完整 Q 和实际安全查询。

**实质方法创新未建立，当前 No-Go。** 核心是既有开放符号执行、完全覆盖、
有序事件对应、自由变量边界及关系组合。与 PAA、VALID、Stellite、DESTIVA
逐项比较后，没有证明一个它们合理组合无法直接覆盖的算法障碍或成本优势。

**完整真实客户端突破未建立。** 固定 CK 客户端仍为原 6/113 L1/L2，0/1
完整 L3/L4/ACTC；没有靠删循环、删 callback 或手写 Q 制造新接受。
不据此开始大规模覆盖、性能或完整 ISSTA 论文实验，不继续无目标地加解析特例。

## 5. 复核入口

从项目目录运行，必须使用新的输出目录，保留固定工具链：

```text
python -m experiments.run_composition_acceptance --out <new-directory>
python -m experiments.certify_composition --capture <actual-capture> --out <new-directory>
python -m experiments.certify_composition --capture <actual-capture> --replay <recorded-case> --out <new-directory> --merged
python -m pytest -q tests/test_composition.py --basetemp <new-directory>
python -m experiments.review_composition
python -m experiments.seal_composition
```

重放不会改实际 Q 或签发新的 SAFE；正式新运行由原固定后端产生 Q。
静态封存脚本只验证字节/哈希/清单/链接，不证明数学定理或 Checker 实现。
完成提交、推送和远端核验后停止，等待下一轮审阅。

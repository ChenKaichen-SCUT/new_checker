# 方案 A 独立审阅报告

基线：`8412b600293161e173ed7f7b94bb3c316d46f796`。
结论：**局部证明复用和显式 HCC 门禁已实现；“不依赖完整宿主检查器、扩大
整程序认证覆盖且保持原保证”的目标，本轮 No-Go。** 没有为获得通过而扩大
语义 TCB，已有 D2 的原始证据及 E2E-SAFE 定理保持原字节。

## 已交付内容及证明地位

1. [HCC 定义、充分条件与完整解析证明](01-contract-and-proof.md)：明确开放宿主
   的所有合法输入、端口返回、环境、对象、调用、错误前缀和两个编译桥接；
   使用统一全局 rf/co，证明源错误前缀到目标错误前缀的包含。
   这是一条**条件式充分性定理**，不是 Clang/Dat3M 已验证结论。
   循环需要归纳 phase/状态关系和充分 query bound；本实现没有该 provider。
2. [TCB 与前提—实现对应](02-trust-and-implementation.md)：三类依据分别记录。
   当前经验证的外部宿主组件数量为 **0**；接受路径仍用 D2 完整检查器和原八项 Γ。
   没有新增语义假设，但新增 Python 代码仍属于 Gamma_check，不能声称全局 TCB 缩小。
3. 最小原型：`TemplatePool` 在一次运行中独立证明每个语义模板一次；每个真实
   LLVM fragment、实际 Q 实例和活跃输出仍单独检查。无持久化 EXACT 导入捷径。
   `local_ports` 在不解释整个宿主的情况下提供局部证书；HCC 缺失时 SAFE 关闭。
4. [已有方法对照](03-related-work.md)：TInA、VALID、Stellite、CompCertTSO、DESTIVA。
   复用标准局部验证、模拟组合和全称实例化；**未建立独立算法创新**。
5. [未修改完整 CK 客户端](04-external-client.md)：仍为 0/1，缺失项逐条公开。

## 真实验收结果

[固定验收与日志入口](../../experiments/hcc/final-01/results.json)，
[独立证据审计](../../experiments/hcc/evidence-review.json)。本轮 22 个 case：

| 对象 | Scheme A | D2 对照 | 可作出的结论 |
|---|---|---|---|
| 两个不同 worker，各一次原始 CK FAA | CONDITIONAL_SAFE | CONDITIONAL_SAFE | 原保证保持；两实际实例独立认证 |
| 同 worker 连续两次 FAA、第一次返回参与第二次输入 | CONDITIONAL_SAFE | CONDITIONAL_SAFE | 一模板、两 LLVM site、四实际实例 |
| 双 worker 的不安全 main 性质变体 | 实际安全查询 SAT，无 SAFE | 同样 SAT | 不把“转换认证”混同“程序安全” |
| 条件分支产生第二次增量的受控宿主 | 两局部端口 EXACT，HCC 拒绝 | 宿主语句拒绝，未到局部转换 | 增加局部结果可用性，未增加程序 SAFE 覆盖 |
| HCC 不可用、错误来源哈希、自行声明宿主可信 | 三例均拒绝 SAFE，局部结果保留 | 不适用 | 声明不是证明，不能绕过宿主检查 |

另外 11 个实际后端错误转换全部拒绝：错误入口、线程实参、输入对象、活跃输出、
遗漏 worker 调用、丢 A 标签、错误安全查询、交换两次返回、遗漏第二次调用、
错误第二操作数、丢跨区域普通读取。**其中 10 个后端仍 PASS**。
A-only 故障保留 RMW 配对；query-only 故障不改 Program；原始前后对象及差分均保存。
测试只验证实现检测能力，不替代上面的普遍证明。

120 项单元测试通过（原 111 项 + 9 项 HCC/复用攻击），日志在
[unit-final-01](../../experiments/hcc/unit-final-01/commands.json)。旧历史验收不重写；
本轮对相同真实捕获重跑 D2 正/负及拒绝对照。未声称重新执行所有历史编译运行。

分支样例额外运行实际后端：原始日志 PASS，但 `ITEExpr` 不完整导出使捕获层
拒绝；未得到完整 Q 认证或 C4 查询认证。这个实现障碍与 HCC 缺失分别报告，
没有补写手工事件、跳过完整性门禁或把结果计入正例。

## 成本与覆盖：不夸大收益

两组配对输入的 transformed LLVM 字节相同；工具版本、后端和查询路径相同。
以下为**各一次**运行的描述性数值，不是统计性能结论，不进行重复调参选快结果。

| 相同输入 | block 证明次数 D2→A | D2 总耗时 | A 总耗时 |
|---|---:|---:|---:|
| 双 worker | 2→1 | 12.788 s | 13.670 s |
| 双调用 | 2→1 | 35.421 s | 35.840 s |

D2 两 block 检查合计约 8.2 ms；新模板路径含证据写入/校验，分别约 17.7/31.2 ms。
计时边界不完全相同，不能拿这一数字声称核心 SMT 变慢或变快；整个配对运行也
没有显示收益。模板数量下降是真实结构收益；当前 tiny FAA 证明过于便宜，缓存
和证据管理开销可超过省下的求解成本。每个 LLVM/Q 实例的检查从未省略。

程序级支持域没有扩大。局部支持域增加了一个真实 Clang 分支/select 例子，但
它是自建受控 harness，不是第三方完整应用；SAFE 未授权。固定完整客户端仍 0/1。

## Go / No-Go

- **Go（已完成的工程能力）**：可复用局部证据 API、可追踪的实例化、明确 HCC
  声明与拒绝、局部成功不再被全宿主拒绝完全掩盖。
- **No-Go（当前方案 A 的主要系统主张）**：没有可信外部 host provider，程序 SAFE
  仍依赖完整 D2 宿主解释器；未扩大真实整程序覆盖，也未显示检查耗时收益。
- **No-Go（独立新算法与投稿成熟度）**：当前证明是标准充分条件组合，尚不能
  仅凭缓存、接口分层和一个局部新例子支撑 FSE/CAV/ISSTA 系统论文。

这不否定以后开发可独立核查的开放宿主模拟证书的价值；但那是尚未实现、需要
另行评估的工作。本轮没有把它隐藏成新 TCB，也不继续扩展以追求更多 PASS。

## 重放入口

在 `certifying-asm-lifter` 目录，使用已固定工具及原依赖（输出目录必须不存在）：

```text
python -m pytest tests -q
python -m experiments.certify_hcc --capture experiments/p2/capture-workers --out experiments/hcc/new-run --dat3m vendor/Dat3M-p0-positive-v1 --build-receipt experiments/p0/build-positive-01/build-receipt.json
python -m experiments.run_hcc_acceptance --out experiments/hcc/new-suite
python -m experiments.review_hcc_client
python -m experiments.review_hcc
```

`review_hcc` 审计冻结的 `final-01`；不是可输入任意 PASS JSON 的认证器。
全部实际对象、SMT、查询、日志、失败模型、代码快照和哈希清单随交付保存。
完整性记录见 [历史字节核查](../../experiments/hcc/integrity.json) 和
[本轮证据清单](../../experiments/hcc/manifest.json)。
9 项 HCC 单元攻击的原始义务另保存在 `experiments/hcc/unit-hcc-raw-01`，其中
包含明确标记的故意篡改缓存证书；这些负例不是可接受证书。
完成发布后停止，等待下一阶段审阅。

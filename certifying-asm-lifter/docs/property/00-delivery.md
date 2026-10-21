# 性质驱动组合认证：受限交付与独立审阅

冻结基线：`51d8c63c796877f7fa6fcb9d4d1195ac3cce68d2`。日期：2026-10-21。

**结论：闭合了一条很窄的条件式充分规则，并完成真实对象上的原型验收；
没有建立通用性质驱动组合认证，也没有建立独立算法创新。** 保留完整实际 Q
及安全查询，只允许省去单个动态 worker 独占对象上、经双侧依赖闭包证明不影响
全部用户断言的 FAA 写值等价义务。所有事件、原子标签、配对、顺序、生命周期、
宿主语义与查询检查仍然必须完成。

这次不是第三方覆盖实验，也没有性能比较。上轮完整 CK 客户端的 L1/L2/L3/L4
结论不变；没有重跑或删减客户端来制造新的程序 SAFE。

## 1. 理论与算法成果

[模型与完整解析证明](01-model-and-proof.md)首先区分原 E2E-SAFE 的全值观察对应
与本轮的性质专用关系。原定理、四级定义、八项 Γ 均保持原字节。

新定理 PD-SAFE 的方向是：对每一条合法源程序的 phi 错误前缀，构造完整实际
Q 中的一条同性质错误前缀。因此，在原编码/求解器等 Γ 与真实安全/bound UNSAT
成立时，可给出 `PROPERTY_CONDITIONAL_SAFE(phi)`。这个方向不授权把目标 SAT
直接解释为真实源 bug，也不把性质专用结果重标为 L3/L4。

证明包含四个关键步骤：类型化总表达式及纯 if 的依赖引理；两侧依赖闭包可靠性；
单动态 owner 的 TSO 最新写引理；在**同一张**全局 rf/co/fr 图上重建目标私有值。
不删除事件，不分别选择各片段的环境，不假设源程序已经安全。全局关系端点及
A/RMW/po/fence 约束保留，只有获准对象的值标签可重算。

[算法与证书格式](02-algorithm.md)给出候选生成、闭包核验、边界证书、全义务覆盖、
复杂度与拒绝规则；[条件—实现—TCB 对照](04-check-map.md)逐项说明哪些是实际
检查，哪些仍被原 Γ 信任。未知别名或语义不能变成“无关”；owner 不成立时保留
完整值检查，无法重建语义时拒绝。

新范围严格为 D_PD0：有限无环、直接 create、完整枚举的动态激活、完整常地址
对象、只读普通输入与 asm 写对象分离、无条件 FAA、明确的所有用户断言。
新增 source C `if` 仅允许纯局部无符号赋值；经 Clang 优化后必须落入已支持的
直线 LLVM/select 表达式。循环、条件共享事件、任意 phi 子集、一般别名和未支持
宿主语句继续拒绝。源码仍需逐句检查，本轮没有绕过一般宿主编译的困难。

## 2. 实现与实际证据

核心代码是 `certification/property_source.py`、`property_obligations.py`，以及
现有 `p1_entry.py` 的显式 PD0/collect-only 分支和 `p0_queries.py` 的 PD0 查询入口。
原默认路径仍执行全检查。求解前义务状态为 PENDING，不能授权 EXACT。

生产入口为 `experiments.certify_property`，独立重建重放入口为
`experiments.replay_property`。后者从真实 capture 和**原来同次运行的 Q**重新
建立接口/宿主/依赖事实，不以旧 facts 或 EXACT 状态作为语义依据，也不生成
新的安全授权。正例均使用固定 Clang 21.1.8、原 CK 接口及固定 Dat3M 实际对象，
优化 LLVM 的输入仍为 `%` SSA 值。无人工寄存器映射、手写 LLVM 或正例事件 JSON。

| 最终 case | 实际 FAA 实例 | 所选/省略 worker 等式 | 结论 |
|---|---:|---:|---|
| owned：独占 side，不影响用户断言 | 2 | 19 / 1 | PROPERTY_CONDITIONAL_SAFE |
| unsafe：只把 main 性质改成 x==0 | 2 | 19 / 1 | 实际 safety SAT；不释放 SAFE |
| relevant：side 旧值进入用户断言 | 2 | 20 / 0 | PROPERTY_CONDITIONAL_SAFE；扩大检查 |
| dependent：side 旧值成为后续 x FAA 的输入 | 3 | 26 / 0 | PROPERTY_CONDITIONAL_SAFE；跨调用/对象闭包保留全部 |
| branch：旧真实纯局部分支、两调用×两实例 | 4 | 36 / 0 | 新 C→LLVM 检查闭合；性质专用条件式安全 |
| d2：旧不同 worker 正例 | 2 | 20 / 0 | 性质专用条件式安全；原路径另验 L4 |

这里的等式数只计 worker 收集器，**不包括**始终完成的 L1/L2、C→LLVM、main、
运行时和查询义务。省去 1 个等式不等于整体开销下降，未作性能结论。
上述程序是受控宿主加未修改的 CK 例程，不是新增完整第三方客户端覆盖。

[最终 16 项结果](../../experiments/property/final-02/results.json)、
[独立证据审计](../../experiments/property/evidence-review.json)、
[16 项原始对象重放](../../experiments/property/replay-01/results.json)、
[144 项单元回归日志](../../experiments/property/unit-commands-02/000.stdout.log)
均保存。审计核对 2,811 个 SMT 文件引用，包括所选、PENDING、拒绝与模板引用；
这个数量不代表 2,811 个不同的成功证明。

## 3. 有区分性的反例与故障

- 把独占 side 的实际 Q 写值从原增量改为 `old+1`：性质对应检查通过，完整等价
  检查给出 SAT 反例。全部结构不变。这精确展示“性质充分”与“全值等价”的差别；
  故障构建只输出 `PROPERTY_TRANSFER_TEST_ONLY`，不能宣称该构建满足 Γ_encode。
- 修改被观察 x 的写值：通用等式 SAT，拒绝。删除**无关 side** 的 A 标签仍拒绝，
  原配对保留；不会把死值误当成可删的原子排序。
- 省去 side RMW、线程完成同步 RMW、或某个 worker 中一个调用实例：完整事件/
  运行时分区拒绝。省去一次跨调用读取、交换返回值在断言中的使用、交换 ITE
  分支：分别由访问/类型或语义等式拒绝。
- 仅改实际安全查询的 assumption literal：Q 不变，独立查询绑定拒绝。
  九项有害故障全部拒绝，其中八项后端文本仍为 PASS。
- 八类候选证书篡改、被省公式哈希漂移及受控 UNKNOWN/timeout 回答均拒绝；
  不通过弱化哈希或把未知公式当常量恢复接受。

故障均是测试注入，不计作真实上游缺陷。共享写/同步/实例遗漏的删除类故障会
把配对读取替为 Local 以得到可执行实际对象，因而有多个结构字段变化；它们测试
完整效果拒绝，不声称单独识别每一种缺失关系。A-only 和 query-only 的隔离性
另经逐字段差分核对。

不安全例的实际模型中 main 读 x=2、x==0 监视器为 false；原始求解器数据、
重放模型和查询均在 [unsafe 包](../../experiments/property/final-02/unsafe)。
完整等价的反例在 [private-value/full-control](../../experiments/property/final-02/private-value/full-control)。
这些具体见证辅助实现验收，不替代 PD-SAFE 的普遍证明。

开发中发现测试重放直接解析 Z3 的 `to_smt2()` 文本会增加等价的 `and ... true`，
造成原式 AST 哈希漂移。修正仅在测试读取器：从 SMT 取声明、解析另存的原始式，
仍核对完整未简化 AST 哈希。最终测试逐项核对拒绝原因，避免所有负例误因同一
重放错误而“通过”。生产语义绑定未放宽。开发尝试及 `final-01` 全保留；
最终证据指定为 `final-02`、`replay-01`、`unit-commands-02`、`legacy-01`。

## 4. 保证、风险和创新性决定

**已证明**的是 D_PD0 下的解析充分定理，不是一般并发切片或任意上下文精化。
**条件性 SAFE** 仍依赖全部原八项 Γ，尤其真实编译/采集、pthread 协议、ENC-minus、
检查器实现与求解器可靠性。没有新增外部语义假设，但新增可信实现代码，不能
据此声称 TCB 减小。**实验支持**限于这 16 项、144 项测试和原路径的两个实际回归。

[原框架回归](../../experiments/property/legacy-01/results.json)保持 D2=L4、分支=L3。
新路径即便成功也不改写历史 L3/L4 的含义。冻结定理及所有既有原始证据由
[完整性审计](../../experiments/property/integrity.json)核对，版本清单见
[本轮 manifest](../../experiments/property/manifest.json)。

[创新性审计](03-prior-work-audit.md)比较了 property-directed equivalence、并发
切片、property-directed self composition、DESTIVA、Stellite、VALID、TInA。
性质相关的模拟、闭包、独占性和组合均是已有原理。本轮新增的是具体真实链中的
受限证书及其可靠性论证，尚未发现合理组合已有方法无法处理的独立算法障碍，
也没有成本优势证据。

**独立算法创新与当前 ISSTA Research Paper 方法基础：No-Go / 未建立。**
受限实现可行性为正，但不能据此批准大规模覆盖或论文实验。继续研究若要提出
新方法，必须先找到超出这条单 owner 规则、且已有方法不能直接解决的明确技术
障碍；若转向工具贡献，也需另行论证实际收益。本轮交付后停止扩展，等待审阅。

## 5. 复核入口

在项目目录、已安装冻结依赖的原工作环境中，可选择新的输出目录执行：

```text
python -m experiments.certify_property --capture experiments/property/capture-owned --out <new-directory> --full-control
python -m experiments.replay_property --suite experiments/property/final-02 --out <new-replay-directory>
python -m pytest tests -q --basetemp <new-test-directory>
python -m experiments.review_property
python -m experiments.seal_property
```

工具链/Java 依赖未收入 Git；构建来源与哈希、原始 AST/LLVM、候选、实际事件、
所有已生成 SMT、结果和日志均在证据包中。重放仍依赖记录中所列工具/采集 TCB，
不是跨平台、零依赖的机械化证明检查包。

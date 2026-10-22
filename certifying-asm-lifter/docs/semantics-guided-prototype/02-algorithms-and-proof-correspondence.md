# 算法、实现充分条件与证明对应

本轮基于 `8926dab258760d36ce77334362738cfe53b6a3f7` 的理论；不改写该理论。
以下是规范与实现的审阅证明，不是经证明助手核验的 Python 程序精化证明。
新模块完全不导入历史 Lifter、认证器或 Dat3M 编码器。

## 1. 可执行语言与两个接受边界

JSON `finite-tso-1` 含精确字段 `version/inputs/domain/objects/threads/observe`。
对象是已初始化、相互不重叠的完整 bv32 单元。线程向量就是全部固定激活。
线程是有限序列，节点为 `set/load/store/faa/fence/if`；if 有完整 then/else 序列，
序列结束隐含正常返回。全部节点拥有全局唯一标识。局部变量允许同类型赋值，
分支出口可用定义取两臂的交集。空臂合法，但未初始化结果不能越过合流点使用。
输入只读，输入域、初始化与表达式由冻结的总运算组成；ite 两臂均须定义。
操作数在 FAA 返回值覆盖局部变量之前求值。移位计数取模32，无 C/LLVM UB 解释。

**B 候选域**接收 bool/bv32 输入、依赖先前读值的总表达式和条件控制；只要有限路径
及有限图枚举在预算内结束，可产生求解器支撑的 COMPLETE 候选。完整 bv32 输入
没有被自动限制为小常数。一个被观察的全域 bv32 输入通常使显式结果数极大，
本原型届时返回 UNKNOWN，而非擅自采样。

**本次独立认证域 A₀**进一步要求输入均为 bool，Store 和 FAA 的值表达式只含输入，
不含任何局部引用。分支条件、终态局部、纯计算可以依赖完整读取值。共享初值可依赖
输入。A₀ 包含本次全部100候选及正负变换实例。它是为了提供可运行的独立穷尽复核
而明确收缩的域，不是对更一般理论的否定。`exact_guard` 必须重新执行 A、双向比对
完整图集合及终态并集；未完成时拒绝独立 SAFE/等价/完整特征结论。候选的
`status=COMPLETE` 字符串不足以授权。

没有输入范围推导、指针猜测、外部环境写、pthread、循环、回调、提前错误前缀，
也没有新增 Γ。此处的 `DSL_EXPECTED_SAFE` 不属于 L4。

## 2. 路径与符号判定 B

```text
validate every field/type/definition on BOTH arms
paths := Cartesian product of all complete structured thread paths
for each tuple π:
  symbolically evaluate total expressions and chosen branch guards
  emit every active R/W/F; FAA emits adjacent A-marked R/W and fixed pair
  add one init per object
  encode exact-one same-object/same-value rf
  encode distinct bounded co ranks, init=0
  derive fr := rf^-1;co; fixed po/rmw/A/F
  encode U acyclic, forbidden fre;coe pairs, TSO acyclic
  repeat SAT:
    reconstruct concrete inputs/reads/rf/co
    independent checker reexecutes RAW DSL and validates the whole graph
    compare symbolic and reconstructed observations
    block inputs + all active reads + rf choices + co ranks
  until UNSAT; timeout/unknown/limit => UNKNOWN
return COMPLETE only after every structural path has terminated UNSAT
```

每路径公式与理论02 §4逐项一致：U=`po-loc|rf|co|fr`；
K 保留 R→M、W→W、涉及 A 的 W→R 和跨 Fence 的 M→M；
T=`K|co|fr|rfe`；RMW 排除 `rmw & (fre;coe)`。
co 秩使用足够位数的 BV 并无符号比较，初始写为0，其余写互异且小于写数。
U/T 拓扑秩各自小于完整节点数；不要求互异，不限制为小于该节点数的经验常数。

**实现规则 B1（阻断完整性）。** 固定路径中，输入、全部实际读值、全部 rf 布尔值
及 co 秩唯一决定有语义意义的图和观察。纯局部/写值由 DSL 决定；co 的有限互异秩
正好编号全部写。拓扑秩只证明无环，其不同赋值不构成不同执行。因此仅阻断这个键
恰好排除一个图，而不会排除另一个有不同关系或值的图。枚举到 UNSAT 给出该路径
的全部图，所有路径并集精确。证明依赖理论02的路径引理、有限秩编码双向证明；
按每次阻断集合归纳即可。不会把同终态、不同 co/rf 的图合并。

**终止性。** 无限预算下，固定32位、有限输入/路径/关系使不同键有限，每次 SAT
删去一个，故终止；实际超时或图数上限只终止为 UNKNOWN。路径提取上限先于大规模
笛卡尔积构造检查。不能由前几个结果产生全称结论。

## 3. 从原始 DSL 独立重建见证

见证最小核心只有 `inputs/reads/rf/co`，没有可被信任的事件数量、值表达式、标签、
线程划分或模型秩。核验器采用具体 Python 求值器，实际执行分支，并记录完整路径；
只有活跃读位点允许出现在 reads 中，缺失与多余均拒绝。初始化、每次访问、FAA 两端、
返回值、A、pair、po、Fence 全部从原始程序产生。候选附带的 events/paths/observation/
relations 与重建结果必须逐字段一致，JSON 的 bool 与整数也区分。

随后检查每读唯一供值、地址和值；co 恰含每个对象全部写且 init 首位；重算 fr；
使用 Kahn 拓扑算法直接判断全图 U/T 无环，直接关系复合检查 RMW。不使用 Z3、不使用
候选拓扑秩、不先为每线程分配不同的关系世界。

**W-SOUND。** 如果此数学核验过程接受，则存在同输入的完整 DSL 合法图，且附带观察
正是该图的终态。证明：对具体结构化执行作归纳得到唯一开放路径和所有端点；字段
相等保证不存在未消费/伪造端点；rf/co/fr 的逐项检查和全图 CAT 正是理论01的合法性
定义；co 最大值与完整局部终态给观察。检查器代码实现此规则，但其 Python 解释器、
解析与算术实现仍属于本原型实现可信表面；不是新增原八项 Γ。

单个合法见证只证明存在。对完整集合，另需下一节。

## 4. 结构不同的显式 A₀ 算法及完备性

A₀ 不调用 SMT、不调用 B 的路径摘要、表达式翻译、秩编码或模型构造。
独立递归展开结构路径；枚举全部布尔输入及其 D；每对象枚举 init 首位的写排列。
沿该 co 顺序计算写值：Store 从输入计算；FAA 从直接前驱写值加输入增量，模32。
每个 FAA 的 rf 固定为该直接前驱；普通 Load 枚举全部同址写作为 rf，读值取对应写值。
调用具体核验器，要求实际路径等于候选路径。保存每个通过核心的规范编码和观察，
其余候选记拒绝原因。所有线程、全部对象在最后一次全图检查中汇合。

**A₀-SOUND。** 每个保留图经过 W-SOUND，故合法；前驱计算本身从来不能越过核验器。

**A₀-COMPLETE。** 取任意 A₀ 合法图 G。完整布尔枚举包含其输入，独立路径枚举包含
其路径，co 排列包含其各对象 co。理论02引理3保证每个 FAA 的 rf 来自其 co 直接前驱。
对每对象 co 序归纳：init 一致；普通 Store 的值只由相同输入决定；FAA 的增量只由
输入决定且前驱值由归纳假设一致，故写值一致。由此得到全部 FAA 读取值与 rf；
每个普通读的真实来源在枚举写集合中，其值随之恢复。具体执行选择 G 的相同路径，
G 本来合法，核验不拒绝。因此 G 在穷尽集合中。反方向由 SOUND。□

此证明没有枚举小整数读值：如初值 `2^32−1`，FAA 溢出到0仍按完整模32处理。
也没有仅枚举 SC 调度，因此 SB 双零并不遗漏。独立 A 的图集按 canonical(core)
与 B **双向相等**，观察也双向相等；漏删一个同终态图仍会被拒绝。

该交叉检查的结构独立性是 **有限 co/rf 枚举+直接图检查 vs 符号关系+SMT**。
两者共享 DSL 校验与具体见证检查，数学上都使用同一 CAT；不是 FIFO 操作机对 CAT
的独立语义证明。A 所需 FAA 前驱引理已经在旧理论中解析证明，本轮不额外假设。

令 I≤2^b、L路径元组数、W_a各对象写数、R_o普通读数，A 候选数上界
`I L ∏(W_a−1)! W^R_o`；每候选工作 `poly(S+N)`，包括全图环检测。对 A₀ 的公式值
没有 `2^(32R)` 枚举项，代价是明确拒绝局部依赖的写值。A 有时间与候选上限，耗尽
后不支持 COMPLETE。一般 B 的指数最坏界沿用理论02。

## 5. 变换证书与关系预期

生成器与 `verify_rule` 分开。最小菱形子规则要求两臂各恰一个 FAA、同对象、同出口
变量，目标值恰为 `ite(g,eT,eF)`，目标验证保证两臂操作数在共同前状态已定义。两侧
把该位置置为洞后，整个程序（含输入、对象、线程、观察、前后上下文）须相等。
不支持额外臂内临时量/出口恢复；拒绝而不是猜测它们无关。复制由逆规则核验。

**T-IMPLEMENTED。** 满足上述子规则蕴含理论03 T3全部侧条件：结构if给互斥穷尽；
单FAA臂给无额外共享/同步；前状态定义门禁给总操作数；共同变量给完整出口；其余
上下文精确相等。故 T3 的每执行活跃图双射同时运输全局 rf/co/fr、po、A/pair/Fence，
给双向观察相等。该证明不要求统一静态一一映射，也不只证明某个返回值或最终计数。

纯改写实现通用总 bv32 恒等式 `e -> e+0`，在任意适用值位置核验完整上下文；
类型门禁排除布尔或无定义表达式。模加恒等式给理论T2。变量重命名检查新鲜性、
定义/全部使用/观察的逆替换相等，原名定义不得残留，给T1。
这些规则是既有定理的窄实现，不申报新的变换理论。

所有验收同时计算两侧完整观察集合，包含输入和全部声明的活跃结果，A 独立核验
两侧完整性。错误 guard、同时活跃的 FAA 融合、错误返回等不适用规则时，不能只凭
规则拒绝宣称不等价；要给某观察属于一侧且被另一侧全部图排除。`relation` 正是此
集合差判据。`reachable` 只以合法图报告 REACHABLE，以完整 A 交叉检查的排除报告
UNREACHABLE；不完整时 UNKNOWN。

## 6. 特征、选择与证书

特征从完整合法图的活跃内存端点子集提取。每个模式保留 R/W/init/A、线程和对象
等价分区，以及 po/rf/co/fr/rmw/mfence/K 的全部有无边；≤h! 重命名中取最小编码。
每模式保存全图索引和端点嵌入，独立核验后重算。Fence 节点不进入子集，但其完整
存在和产生的关系由全图保留。没有按终态代表抽样，也没有给尚未穷尽池填空特征。

预算贪心只使用1–2端点模式，三端点和行为探针仅作评价；固定种子仅决定并列项。
固定数量预算填满零收益后缀不降低标准最大覆盖保证，但不会创造边际收益。
候选构造是固定有限笛卡尔语法，**没有实现理论04的 R 反向合成，也没有实时工具
反馈**。实现的是 S 的最小版本；不存在新近似比或缺陷发现定理。

选择证书核验重建固定池哈希、每步候选/边际最值/并列次序、全部45条记录及实际
覆盖。特征需要 A 的完整图门禁；选择本身只产生集合并。可靠性、终止性和1−1/e
限定保证仍为理论04 S1–S3，模式提取成本 `O(J Σ C(N,i)i! i²)`。不能把预算优势
推广为等时间优势：语义选择有额外全池 Oracle 和特征代价。

## 7. 实现与证明对照

| 义务 | 实现入口 | 独立检查/拒绝 | 理论 |
|---|---|---|---|
| 类型、全路径定义、对象与观察 | dsl.validate / etype | witness.rebuild重新读原 DSL | 01良构；02引理1 |
| 结构路径完整性 | dsl.structural_paths/path_products | A 的独立 choices；全图集合比对 | 02引理1 |
| bv32开放表达式/FAA前状态 | symbolic.expression/Encoding | dsl.evaluate + witness.rebuild | 01/02路径归纳 |
| init、全局 rf/co/fr | Encoding | witness.inspect；A全排列 | 02 §2/引理5 |
| U/T无环、RMW、Fence | Encoding有限秩 | witness.acyclic/关系复合 | 02引理2/3/5 |
| 全部图而非每观察代表 | decide.keys/block | A双向图集、audit逐图阻断绑定 | B1；理论B=A |
| 完整性不能由COMPLETE授权 | expectations.exact_guard | 从DSL重新运行A；UNKNOWN拒绝 | A₀-SOUND/COMPLETE |
| 活跃输出/复制合并 | transforms.verify_rule | 侧条件/不变上下文+两侧完整图 | T1/T2/T3 |
| SAFE/UNSAFE、差异与不可达 | expectations | 合法见证+独立完整集合 | 理论O1/O2/O3 |
| 模式合法及完整 | features.extract | audit完整特征重建+嵌入 | 理论F_h、S1 |
| 固定池/预算选择 | features.select | audit.check_selection | S2/S3 |
| SMT证据绑定 | raw_smt/所有blocks/final | audit原DSL重编码、精确断言比较、最终求解 | 证据格式，不另加语义定理 |

## 8. 可信边界与未闭合项

自动核验的事实：原DSL字段/定义、所有激活/路径、实际事件与读写、全局图关系、
合法见证、A₀域完整集合、变换侧条件、特征/选择记录、SMT与原输入的绑定。
实现仍需信任：Python运行时/JSON/位运算、校验器和A枚举实现；B还需Z3前端/求解器。
A重算使本次精确预期不必只相信Z3的UNSAT口头状态，但不是形式化验证的机器码证明。
原八项Γ、C/LLVM/Q链及历史证书均未变化。

未闭合：A₀之外的大输入/依赖写值完整性证书、FIFO/CAT一般等价、图商约简、早期
错误前缀、真实线程库/语言桥、真实工具价值与算法创新。这些条件不被加入新的HCC
或外部编译假设。本轮通过只能是有限DSL原型的受限通过。

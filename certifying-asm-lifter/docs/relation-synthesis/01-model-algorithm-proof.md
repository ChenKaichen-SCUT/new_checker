# 关系驱动反向合成：有限范围、算法与解析证明

冻结基线 `4ffe20639ea376485e04a7d545e84776233e80d1`。本轮新增模块不改动
semantic_testing、旧认证器、历史证明或八项 Γ。全部结论仅关于 finite-tso-1 DSL。
以下为数学编码和核验规则的证明，不是 Python/Z3 机器代码的形式化验证。

## 1. 审阅结论与精确搜索域

已审阅 theory 00–07、prototype 00–02 及 semantic_testing 全部模块。直接复用：
完整路径解释、固定 CAT、B 的有限秩编码、A₀ 的 FAA 直接 co 前驱引理与完备性、
菱形 FAA 图运输、完整图特征和标准覆盖贪心。不能直接复用为实现保证：旧 R1
要求穷尽所有模式且每个查询完整判定；本轮只请求有限目标并允许超时。没有 FIFO
操作机等价、C/LLVM 桥或实际验证器错误结论。A₀/B 结构不同但共享具体图检查器。

固定域 G(t,s,m)：t∈{2,3}，1≤s≤3，m∈{1,2}，对象 x/y 初值0、互不重叠，
一个布尔输入 b，完整输入域 true。每线程有 s 个槽，每槽先将专属 bv32 局部
v_j 置0，再执行一个可选操作。选择为 nop/Load/Store/FAA32/Fence；地址从 m
对象选择，写值/增量从 {0,1,2,ite(b,1,2)} 选择。所有 v_j 和对象终值均观察，
输入身份也观察。没有读值依赖写值，未削减读响应的 bv32 域。

只有前两个线程的末槽可以是 if：guard 为 b、not b、或 v_(j−1)==0（j>0）；
两臂各选零或一个上述操作。无 if 时两臂编码必须相同，避免无效隐含语法自由度。
所以至多两个分支、每路径每线程≤s 个操作（Fence 也占槽）。这只是公开的固定
骨架，不覆盖任意 A₀ DAG；不能把该域 UNSAT 推广为整个 DSL 不可实现。初值、
观察和表达式表也是范围限制，四种实验策略完全相同。

## 2. 模式、量词和算法 R_slot

一个模式 f 有 k≤6 个互异内存端点。每节点指定 R/W，并可指定 init/A；每条约束
是 (关系名,i,j,真/假)。关系含 po/rf/co/fr/rmw/mfence/K、同线程、同对象。
未列出的是通配，不等于假；明确 false 必须证实无边。完整诱导模式是对此格式
全部边均指定的特例。嵌入必须单射并选择实际活跃端点。

多个目标的查询为：

    ∃P∈G. ∧_f ∃u_f,G_f,X_f. G_f∈Exec_T(P,u_f) ∧ embeds(f,G_f,X_f)

不同目标允许不同输入/执行，语法选择共享。带输入要求时约束该见证的 b；不修改
P 的完整输入域。此式不是 ∃G.∀f，也不是 ∀执行满足 f。额外通用语法条件仅用于
分支边界验收：存在同对象双 FAA 臂，以及存在真正读取的前槽+读值 guard。

```
build finite syntax variables for every slot and both arms
for each target create its own execution symbols, sharing syntax
  symbolically choose active arm from total input/previous-return guard
  create conditional R/W endpoints per slot, full bv32 values
  create complete global rf/co/fr, fixed rmw/A and Fence order
  impose fixed U/T acyclicity and RMW atomicity
  impose injective active endpoint pattern embedding
solve once (no program enumeration before solve)
if SAT: decode raw DSL and minimal {inputs,reads,rf,co} witnesses
        concrete independent checker rebuilds every event and relation
        old B enumerates all graphs, independent A₀ recomputes whole set
        re-extract every requested pattern from independently checked graphs
        only then CONFIRMED_SYNTHESIS
if UNSAT: retain bounded domain, request-bound formula and replay result
if limit/unknown/incomplete oracle: retain partial evidence, no confirmed success
```

相同模板不包含任何“模式→程序”表。模式约束只约束求解变量。槽位位置由语法域
决定，目标到槽的单射也由 SMT 求解；程序可含与目标无关的其他事件，必须全部
通过全图检查。不存在只检查局部模式的接受路径。

## 3. 编码双向性

**引理 1（语法/路径）。** 每个语法赋值解码为域内良构程序；给定 b 与完整读响应，
条件端点与该程序唯一实际路径的内存事件一一对应，保值、A、pair、线程、地址、
po、Fence 关系及局部终态。反过来每个 G 中程序至少有一个语法赋值表示。

证明：按线程槽号归纳。v_j 先置0，所以 nop/Store/Fence/跳过的臂也有完整出口。
读取操作覆盖为该槽 bv32 响应。唯一 guard 只用输入或更早已定义出口，两臂互补；
用 ite 选择 kind/address/operand 等于实际那一臂。FAA 先求输入增量再产生相邻
R/W、返回旧值；纯赋值不产生内存事件。无分支时两臂相同，可选恒真臂；逆向由
程序每个槽的构造参数赋值。对每个活跃槽，R 在 W 前；不同槽按槽号，正是 po。
Fence 在两个活跃端点之间当且仅当中间槽选 Fence，给 mfence。□

同一潜在 R/W 对只作为一个执行中的互斥两臂共同坐标。不同执行/不同臂的实际
静态 id 不会被混同：输出见证按照实际 arm 恢复 sid，完整 Oracle 仍遍历两臂。

**引理 2（全局图）。** 固定语法和路径，编码的 rf/co/fr/U/T/atomic 约束恰等价
旧模型的合法图。证明：每个活跃 R 恰选一个活跃同址同值 W；非活跃读选0个。
同址活跃 W 的有限整数秩互异，init=0，其他>0，按小于定义严格全序；秩允许空洞
不产生额外 co。反向对合法 co 选连续秩即可。fr 定义为 rf⁻¹;co，无自由选择。
U/T 各以 N 个端点为上界的拓扑秩编码；无环有限图存在0..N−1拓扑排序，严格增秩
不可能沿环，得到双向性。不可活跃端点无约束边，加入孤点不影响无环性。
RMW 对由 kind=FAA 唯一决定；对全部外线程写排除 fre;coe，正是原约束。
K 的 R→M、W→W、涉及 A 的 W→R 和 mfence 全部保留。全程序只有一个 rf/co 世界，
没有先独立验证线程再拼接。Fence 不作为矩阵节点，使用旧 Fence 投影引理。□

**引理 3（模式）。** 单射变量在活跃、颜色匹配端点中选择；对每对所选端点逐项
约束关系真/假，当且仅当存在要求的嵌入。证明：将模型选择代入全部蕴含；反向把
已有嵌入的端点编号赋值。未指定项不添加限制，两方向都保留。□

**定理 R_slot。** 无限资源下，公式可满足当且仅当所声明有限域中存在满足全部
目标的程序；SAT 解码的每个完整执行见证合法。证明：正向依次应用引理1/2/3；
反向选合法程序的语法赋值，每目标各自选择已存在的执行、rf/co和拓扑秩与嵌入，
所有语法共享约束一致。多执行只共享程序、不强迫不同环境共用 rf/co。□

整数变量全部有有限界；bool/bv32有限。穷尽有限赋值可判定，数学算法终止。实际
Z3 超时/内存/中断只返回 UNKNOWN/TIMEOUT，不借用理论有限性声称实际穷尽。
BOUNDED_UNSAT 依赖公式正确性及 SMT 判定；独立重建公式+重放并不是独立证明格式
核验，报告中明确此 TCB。负例另外给解析不可实现证明。资源不足不作 UNSAT。

## 4. 独立接受与覆盖

合成器不在成功结论的可信基础中。见证只有输入、读值、rf供者和co列表被提交。
旧 checker 从原 DSL 执行所有实际语句并重建事件，检查完整全局关系。旧 B 与 A₀
从原 DSL 分别求完整图集，必须双向相等；目标嵌入由另一个回溯枚举器重新搜索。
检查每个原始合成见证属于完整集合。完整性超限则保留局部合法见证但不计确认成功。
对未纳入合成目标的模式也从完整集合提取，不能只复用合成图的特征。

因此 CONFIRMED_SYNTHESIS 蕴含 ∃合法程序/执行实现每请求；其余覆盖统计来自
完整图集合，不声称 ∀执行或实际软件性质。完整观察集合依旧能产生旧 DSL 安全/
不安全预期。反向模型没有授权任何新的 E2E-SAFE/L3/L4 结论。

## 5. 优化、复杂度与不作的主张

实现可开关的优化只有：FAA 供者必须为 co 直接前驱的冗余约束传播。旧引理已证明
对每个合法图成立；因此加或删此约束不改变可满足性/程序域。它可能增加编码成本，
不预设加速。常量化简、静态类型候选删去不匹配的 R/W/init 是精确规则。
无分支臂相同是消除不可执行编码自由度，不删任何解码程序。没有按观察相等删图，
也没有未经证明的对象/线程对称剪枝。多目标共享语法是精确合取，不是最佳覆盖求解。
按目标顺序尝试未覆盖项属于启发式；不保证全域最优、覆盖全部模式或找到最小程序。

N≤m+2ts，k为模式节点数，q为目标数。直接矩阵及 fr 构造、冗余前驱约束为
O(qN³)，嵌入 O(qk²N²)，语法 O(ts)。求解最坏仍可指数；B/A₀完整核验及三端点
规范化可比合成更昂贵。直接联合编码改变了候选构造机制，不是给标准 SMT 或
最大覆盖取新名；然而机制差异本身也不是独立算法创新证明。

## 6. 反例攻击与边界

* rf两供者违背功能性；co双向违背严格全序；用户写co在init前违背最小性。
* RMW读→fr外写→co对应RMW写，直接违反 atomic；同对象身份同时真/假不可能。
* 双Fence SB00 的 mfence/fr 四环违反T；不能让各线程分别选择关系。
* 两个互斥臂事件不可在同一实际图同时出现，必须由 raw DSL 全路径重建确认。
* 两目标可分别由 b=true/false 见证，不代表存在一次执行同时走两臂。
* 已证明 FAA 菱形运输保留活跃图关系（无静态id观察的模式）；仅终值等价不够。
  删除一个未观察的 Load 可保终值而失去 rf 模式；融合两次 FAA 还可失中间写。
* 历史100池每线程最多两个活跃共享操作、最多两个线程。因此三个同线程FAA写的
  po/co链、三个不同线程FAA写的co链、三线程两对象rf中继不可能出现。前两项由
  同对象三次FAA顺序/三个线程各一次FAA的SC全图给建设性可实现证明；中继由
  T0 W(x,1)、T1 R(x);W(y,1)、T2 R(y)的顺序执行给证明。新域可表达它们且四种
  方法相同。其价值需要新实验，不能把“旧池不存在”当成基线算法不能生成。

未证明/不实现：任意 A₀ CFG 的反向完备性、全局最优覆盖、通用同构商、不完整
图集的精确特征、目标特征预测真实错误、任何实际验证工具桥或独立方法创新。

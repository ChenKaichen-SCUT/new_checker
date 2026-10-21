# 义务选择与独立证书规则（未实现的新范围）

这里给出可执行到有限数据结构层面的设计及其证明，不修改冻结 Checker。
算法名仅是文档引用，不是独立创新主张。输入是实际 P/AST/L/L'/Q、绑定 phi
及查询记录；**不是一个已知安全执行或一份人工 rf/co 表**。

## 1. 重建的事实

继续完成原 source/LLVM、L1/L2、完整 Q/main/runtime/activation 检查，暂存
所有写值等式为 PENDING。每个实例记录：动态线程/调用身份、配对端点、对象/
宽度、A/顺序/guard、源与目标写值表达式、实际读寄存器定义—使用链、返回用途。
构造有限潜在事件清单；基本实现域仍是无条件 FAA 和有限直接创建。未知语句/
表达式/对象/来源/实例或不受支持的 CFG 在此拒绝，不能由候选生成器省掉。

对象 x 是 eligible 当且仅当：

1. 两侧完整访问清单中，除相同的有效初始化外，x 的访问全部由已认证形状的
   FAA/对应 FAA 形状端点构成；此处不预先要求目标写式等于源加法，否则省略会
   变成循环条件。不要求同一个 owner。包括 main 和其他全部可达激活，不按函数名合并。
2. 每个实际写/读的类型、地址、真实配对、A 及同线程无插入写条件已核对；
   字段相同但遗漏一次动态调用仍不合格。
3. 每个目标写式是已支持的总表达式，其所有读依赖均来自该线程先前实际定义，
   可独立证明 `d_Q⊆po∩(R×M)`。参数/线程实参中不能藏修复值的未核验传递。
4. 用户/运行时边界不会被默默排除。协议对象及外部不透明访问不作为修复候选。

如果某对象只是未满足 eligible 而其完整语义仍可检查，则保留其全部等价义务。
若连完整语义/覆盖也无法建立，拒绝该输入。没有“把条件加入新 Γ 后继续”的分支。

## 2. 图、候选与边界

节点分为读变量 R、写值义务 W、观察/结构义务 B，另有完整对象分组。边方向为
consumer→provider：

- 对每个源/目标写值和 B 表达式，向其所有实际读自由变量连边；纯 ITE 同时
  收集条件和两支。返回值的真实用途展开入图，不因返回变量存在而单独作为根。
- 从每读连向两侧同对象的全部潜在供值写，不按一次实际运行挑选 rf。
- 为实施整对象修复，把一个对象的全部 R/W 作为同一闭包分组：一旦有一个
  进入 K，就把该组全部加入。可以用分组节点实现，无须显式平方条组内边。

B 中包括完整 phi 和全部 guard、地址、生命周期/assume/错误前缀限制；这些
结构条件始终认证。根再加所有非 eligible 对象的写。初始化始终完整认证。
开放的 reference-return 恒等式仍验证，其实际使用由依赖边处理，与旧规则一致。

```text
GENERATE(P,L,L',Q,phi):
  facts := reconstruct_complete_typed_frame_and_pending_equations(...)
  eligible := objects satisfying all four finite criteria above
  G := two-sided dependency graph + all same-object providers + object groups
  roots := all B nodes + every write of a non-eligible object
  K := worklist least fixed point from roots through G and groups
  D := { x in eligible | group(x) does not meet K }
  selected := every obligation except write-value equality for writes to D
  emit (bindings, K, D, selected IDs, omitted IDs, access/causality witnesses)
```

跨对象依赖 SCC 不直接排除 D。候选使用固定 CAT 已证明的引理 3/4，保证
**每个合法执行**中的实际值依赖图无环；不把保守 may-rf 图自身的环当成实际
H 环，也不提交某次求解器挑选的 co/rf 作为普遍性证据。

## 3. 独立检查器

验证器必须从真实对象重新建立上述 facts；producer 给出的 eligibility、边、
清单或 EXACT 不是可信输入。允许 producer 给更保守的 K/D，但不能扩大范围。

```text
CHECK(raw artifacts, proposal):
  verify source/tool/LLVM/Q/run/property/CAT hashes and complete provenance
  rederive all typed frame, coverage, access and expression facts
  check schema, unique occurrence IDs, disjoint paired endpoints
  check D is a subset of freshly derived eligible objects
  rederive B and all dependency/provider/group edges
  require B and every write NOT omitted to be in K
  require K contains every provider of each K node, and whole object groups
  require no read/write of D is in K
  require selected ∪ omitted = ALL obligations, disjoint, exact names/hashes
  require omitted = exactly write-value equalities of complete D objects
  independently prove every selected semantic equality
  check finite total-expression grammar, every d_Q edge has a real po witness
  check pinned model authorizes the rf/A and R→W rules of Lemmas 3/4
  retain complete actual Q and bind the unchanged actual safety/bound queries
  if any condition missing, SAT, UNKNOWN, timeout or unhandled: reject/fallback
```

独立核验不能只检查 producer 的闭包“自洽”：必须重建缺边、缺对象、缺实例。
更不能把所有候选对象的 may-rf 图强制无环，因为同对象的保守 provider 图本来
就常有环；定理用的是**合法图上的实际 rf**，其因果性由 CAT 普遍保证。

## 4. 证书结构

证书应含下列字段，而不是一个 `MULTIWRITER=true` 开关：

| 字段 | 独立验证内容 |
|---|---|
| artifact binding | P/依赖/AST/L/L'/完整 Q、实际 run/query、模型三个文件及定理版本哈希 |
| scope and property | 有限激活/路径域、phi 及全部实际监视器清单；没有无限域暗示 |
| complete_accesses | 两侧包括 main/全部线程的对象、宽度、每个访问身份及来源；初始化单列 |
| region_instances | 每次调用的真实 pair、A、无内部写、跨区域 po、边界接口；不复用实例证据 |
| value_functions | 实际两侧总表达式、所有读变量绑定、类型、原式哈希及因果性见证 |
| order_rule_witnesses | 外部 rf 用 rfe；内部 rf 用 uniproc 排除逆 po，再用带 A 的 J；读→写用 K |
| boundary | 完整 roots/重建图/分组/K/D；反例若导致边界外流需扩大 K |
| obligation_partition | 全部义务、selected/omitted、所选 SMT 与结果；省略式不标 UNSAT |
| trust and status | 原八项 Γ 原文、未实现义务、无 full-L3/L4 宣称；无新外部前提 |

`order_rule_witnesses` 是可核查的**规则实例模式**，不是预选的一组全局 co。
它只在哈希固定 CAT、完整初始化、真实 A/rmw 和因果性条件下可用。若后端模型
变更或不认识的标签出现，不能继续引用这张证书。

本轮只交付这一格式设计，没有生成或签发上述新范围的程序证书。旧
`property_obligations.reconstruct` 仍把非 owner 写设为根，旧 `verify` 仍要求
owner，因此不能靠手填新 proposal 绕过旧限制。

## 5. 算法可靠性、终止性与组合证明

**闭包可靠性。** 对根到某节点的路径长度归纳，验证器的根包含及逐边闭合使
所有路径 provider 都在 K；对象分组保证没有只修复半个对象的情况。若 D 的
读影响 B 或任何保留写，就有这样的路径，矛盾。因此得到证明文件的引理 6。
双侧自由变量收集和完整 access census 使目标新依赖/其他线程供值也在图中。

**选择充分性。** 任何省略义务都恰为 D 的写值式，D 的 shape/totality/causality
通过独立检查，故可以应用 M3 重建目标值。所有未省略式都已经独立求证；边界
闭包使它们在重建赋值上保持。由 PD-SAFE-M 得到所需错误包含。不得以 producer
正确性或 solver 最后的 PASS 代替其中任一步。

**终止。** 有限输入域给有限对象、节点、式子和激活。每次工作队列新增一个
以前不在 K 的节点，最多 n 次；有限类型检查和表达式遍历终止。SMT 采用明确
超时并将 UNKNOWN/timeout 视为拒绝，故实现可保证终止而不保证完备。

**组合。** 多个修复簇可一起取并集 D，前提是并集重新通过完整边界闭包。
在一张任意源图上统一应用引理 5，所有簇共同使用同一 rf/co/fr 和 H。
不能把每个簇已有的“局部成功”直接合并，因为它们可能分别把另一簇输入固定
为互相不相容的源值，C5 已反驳该做法。纯值循环的对象 SCC 可整个纳入并集；
一旦影响保留对象/观察则闭包回传到整个必要部分。

**成本界。** 设 n 是已枚举潜在端点/义务节点数，s 是展开后表达式总大小。
常地址的朴素 may-provider 构图 O(s+n²)，工作队列 O(n+e)，存储 O(s+n+e)。
使用按对象的索引/分组可压缩一些边，不在本轮声称最优。完整 CFG 版本的路径
表达式展开可能指数增长，n/s 必须按实际展开后的大小计。值修复的数学构造
对单张图可拓扑求值，但算法无需枚举所有 co，也没有因此消除其余 SMT 的
最坏成本。没有性能比较、复杂度分离或实际速度优势证据。

## 6. 实现前仍需独立检查的新增事项

在现有直线 FAA 域，完整访问、实际 pair/A、表达式解释与位点/激活绑定已有
基础，但新资格判据、上述因果性规则实例、对象整体闭包和独立核验**尚未实现**。
在 CFG 域，还缺一般路径 guard 的源/LLVM/Q 对应及完整条件激活核验。
这些都属于要实现/证明的检查义务，不应放入 Γ。未来若获批准实施，只能在
相应义务全部落实后释放新的性质专用结论；本轮无此授权结果。

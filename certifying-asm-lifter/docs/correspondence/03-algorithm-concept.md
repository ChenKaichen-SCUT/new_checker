# 算法构想：联合搜索与独立证书

状态：**候选设计，尚非第二批的完整算法或正确性证明**。
本文件具体化搜索对象与检查义务，避免用技术名词清单代替设计；
其中开放历史判据仍有未闭合部分，见第 7 节。
定义使用 [02](02-problem-definition.md)，已知机制归属使用 [01](01-literature-audit.md)。

## 1. 要合成的不是一个行号映射

建议的有限证书包包含下列字段：

```text
Certificate {
  inputs: hashes(S, dependencies, actual AST, L, L', actual Q, options, M),
  scope: language/ABI, observation, guarantee_direction, bounds, TCB,
  census: source call/asm/thread graph, target graph and closed interpretation,
  relation_nodes: [(source_frontier, llvm_frontier, lowered_frontier,
                    target_frontier, state_relation, call/thread_parameters)],
  tiles: [(entry_node, exit_node,
           source_paths, llvm_paths, lowered_paths, target_paths,
           guards, typed_bindings, effect_witness, rule_id)],
  coverage: entry/exit, alternatives, ownership, recursion-or-progress evidence,
  history: model-specific summary instances and compatibility evidence,
  obligations: independently reconstructible formulas and result/proof references
}
```

四个 frontier 不必步步锁定：路径允许不同长度以及空路径。函数调用/创建返回的
身份为关系参数，不是人工给出的源寄存器→目标寄存器表。
验证器从实际表达式重建这些绑定并检查约束，证书只给候选。
实际产物链 L/L′ 不可因为直接 S/Q 等价而在报告中假称已检查；若某模式只认证
S/Q，必须明确与“每层转换均认证”是不同承诺。

`tile` 是一段有明确入口/出口的关系步骤，可包含多条互斥路径；不是一个随意圈定
的事件 JSON 区域。共享效果见证允许：

- 条件化的源操作→目标端点集合；
- 多个互斥源路径→一个目标路径；
- 使用已证明规则的隐藏、合并或移动；
- 零共享效果的局部停顿。

证书不能自定义新“合法规则”并让检查器直接信任。规则 ID 必须属于固定、声明
语义与方向、已有可靠性证明的规则库，实例前提全部由检查器重建。
一般的非双射规则库**尚未提供**。

## 2. 不依赖提示正确性的候选生成

1. 两侧独立建立类型化控制流、数据流、共享效果与错误操作清单；源侧不能从 Q
   填入预期值或预期操作数。宏展开用于恢复实际 GNU 接口，不承担唯一目标身份。
2. 从入口、出口、调用/线程边界、错误节点、共享作用邻域形成候选 frontier。
   在有限 DAG 中枚举长度至 k 的复合路径。每侧都可贡献切点；必要时逐步增大 k。
3. 用已证明必要条件过滤：类型/位宽、外部接口、可达 guard、可允许的效果规则。
   地址和值初始保持符号形式；不同名字不证明不别名，未知也不意味着相等。
4. 来源 cookie、debug 内联栈、文本近似只作候选排序或加速索引。
   若候选域完备性是目标，索引失败必须回退搜索，不能默认为不存在。
5. 同时生成局部状态关系候选：SSA 定义链、操作数约束、调用实参替换和实际后端
   表达式提供关系模板。有限谓词语法可配合回溯/反例细化；不宣称可发现任意不变量。

这复用了 PAA/JTFG/VALID 的方法族。算法候选的新内容若成立，只能来自并发历史
边条件与联合搜索/覆盖之间的新分解，而不是以上五步本身。

## 3. 联合选择、歧义和覆盖

为 tile 选择、状态关系候选、规则实例和线程/调用实例关系建立联合约束：

- 入口关系包含全部合法初态；出口保留所声明观察。
- 选择的 tile 在 frontier 上连接；guard 之间的相容性由语义检查。
- 对同一执行中的每个相关源动作和目标动作，责任恰当且完整。
  多条互斥路径可引用同一个静态节点，不能用全局静态 exact-cover 排除这种情况。
- 若多个源共享动作同时执行后映到一组目标动作，必须选择允许这种合并的规则；
  “候选冲突消解器选中了它”不构成证明。
- 源创建/调用结构与目标实际实例结构的关系和局部路径一起求解。
  不能先由目标线程数决定源侧应有多少次出现。
- 单边空步不能形成隐藏错误或必要动作的无限停顿。DAG 可用拓扑秩；循环需要
  适用于所声明有限坏前缀保证的进展/归纳论证。

**覆盖义务形状。** 在某个已检查的关系状态 R，给定被包含一侧的一条可行路径 π，
必须存在某个选中 tile、另一侧路径和合法见证，使其 guard 与 R 成立并到达后继
关系。没有 tile 的剩余条件必须不可满足。再由入口、保持和进展连接到完整执行。
这仍需与并发环境一致性共同检查，不能单靠顺序路径可达性证明开放覆盖。

语义上多个对应均成立时，无需硬选“正确历史”。可任选一个有完整证书的对应，
报告剩余歧义；不同活跃输出或上下文效应会通过语义义务区分它们。
若无法消歧但存在性也证明不了，返回 `NOT_CERTIFIED`。

## 4. 义务生成

| 类别 | 验证器独立产生的义务 | 典型拒绝 |
|---|---|---|
| 真实输入与接口 | 文件/编译选项/对象身份；全部约束、类型、表达式、clobber 与绑定 | 未解释 cast、未知 asm、副作用被略去 |
| 关系入口 | 所有合法初态属于关系，而非只存在一个好初态 | 把分支条件强设为 true |
| 局部数据 | 路径 guard、读响应参数、输出、地址/宽度/值/错误和关系保持 | 活跃返回值绑定错误 |
| 执行覆盖 | 每个可行分支、调用和创建；隐藏动作的规则理由；目标效果责任 | 遗漏某次调用但已有区域全通过 |
| 原子与排序 | 条件写、真实 rmw、A/其他标签、Fence、相关依赖 | 失败 CAS 读失去 locked 排序 |
| 历史充分性 | 在相同允许环境中构造声明方向的合法执行见证 | 仅证明局部末态相同 |
| 组合与观察 | 相邻 tile 和并发线程共享一个相容的环境见证；错误转移 | 局部见证要求互相矛盾的 co |

局部位向量公式可以使用现有 SMT 编码，但不能让每块私自挑选另一个环境响应；
多个读之间的耦合只有在模型/历史证据支持时才能加入。
“所有 SMT 返回 UNSAT”必须同时说明公式确实表达了这些全称/存在量词和范围。
SMT 返回 unknown、超时、未支持对象或义务缺失均不得接受。

## 5. 两种实现路线必须分开评价

### 5.1 有限整程序基线：没有隐藏的历史 oracle

对 D0，分别编码完整的合法执行 `F_S(z_S)`、`F_Q(z_Q)`，其中 z 包含输入、路径、
值和 rf/co 等全部有限选择，初态接口通过公共参数 i 关联。
以安全方向为例，所需有效式为：

```
forall i, z_S.
    LegalInput(i) and F_S(i,z_S)
    implies exists z_Q. F_Q(i,z_Q) and ObsEq(z_S,z_Q)
```

检查其否定的不可满足性需要正确处理交替量词；把 z_Q 随便改成自由常量，
或只检查一个逐事件相等公式，都不是这个问题。双向等价另检查反向。
位宽、节点和对象有限使公式可有效判定；现实成本可能很高。

μ 可提供见证模板、切块和搜索约束来加速；最终若仍完整检查上述公式，
其保证是封闭任务的有限包含，不自动扩展至任意上下文。
这条路线可以实现需求的一部分，属于现有符号精化/执行图技术基线，**不主张创新**。

### 5.2 开放片段路线：真正尚待解决的部分

候选将每个 tile 的共享历史投影到边界摘要，证明替换对全部允许环境有效，再
组合成整条执行。摘要不能只记录出口值和内部 po；需足以约束外部 rf、co、
传播/屏障与原子关系，以及跨边界的读写和错误观察。

应先尝试现有 Stellite、SEQ、CompCertTSO 或模型关系规则能否直接提供这样的
判据。若可以，必须明确算法是组合/系统工作。若不可以，给出一个语义区分例，
指出旧摘要具体丢失哪项信息，再研究最小扩充及其充分性。
尚未找到这个区分并完成证明之前，不声称出现新历史理论。

## 6. 概念流程、拒绝与成本

```text
SynthesizeAndCheck(actual_objects, Γ, mode, finite_search_limits):
    independently interpret and validate the declared input domain
    reject unsupported or unauthenticated required objects
    build complete source and target structures; keep hints nonbinding
    for candidates in a finite, declared path/predicate/rule search domain:
        jointly choose relations, tiles, call/thread witnesses and rule instances
        reconstruct interface, initiation, path, coverage and data obligations
        check whole-program graph inclusion (D0)
          OR check proved history rules plus their composition conditions (D1)
        if every required check succeeds: emit certificate and exact scope
        otherwise refine/backtrack using the failing obligation
    return NOT_CERTIFIED with unsupported / counterexample / exhausted / unknown
```

上面 D1 的“已证明历史规则及组合条件”目前未交付，**不是可调用的可靠 oracle**。
这一行不能用已有 `REGION_EXACT` 返回值代替。D0 的可判定基线也尚未实现。
`NOT_CERTIFIED` 不总是发现错误：搜索界不足和对象不支持与有反例必须分开报告。

令各侧图规模为 `n_S,n_L,n_L′,n_Q`，朴素 frontier 产品有乘积数量的节点；
最大分支数 d、路径长度 k 的单侧路径候选可达 `O(d^k)`。
若有 H 个复合候选，盲目选择子集有 `2^H` 种；不同调用上下文还会放大图。
有限关系谓词库的组合、位向量求解、rf 选取和每位置 co 排序继续增加成本。
一个含 w 次同位置写的执行仅 co 候选就可达 `w!`；不应预许线性检查。

将固定大小的 D0 执行编码为布尔公式后，单向包含具有一层 `∀∃` 的形状；
这说明普通等价 SMT 查询未覆盖全部量化，不是对本算法复杂度的完整紧界证明。
模型 KATI 的特定 PSPACE 结论也不能转移到整个数据/线程搜索问题。
可能的压缩包括对称性商、SSA 切片、共享摘要和反例细化，均需证明不丢失行为。

## 7. 第二批必须闭合的义务，而非本批假设

| 编号 | 尚缺内容 | 若失败怎么办 |
|---|---|---|
| G1 | A(S) 对新宿主范围的忠实解释，含全部调用/分支/创建/错误 | 缩小并公开输入域，不能沿用“主函数无关” |
| G2 | 固定 M 下非双射历史规则与明确保证方向 | 先保留有限整程序基线；不发布开放认证结论 |
| G3 | tile 覆盖与全局历史见证相容的组合引理 | 不能由每块存在见证推出全程序存在 |
| G4 | 多静态调用到动态出现的归纳实例化与进展 | DAG/有限线程先闭合；有界结论不外推 |
| G5 | 证书检查器充分性；未知/缺失义务不能绕过 | 保持 fail-closed；实现后另审计实现精化 |
| G6 | 相对 PAA/JTFG + Stellite/SEQ/VALID 的实质区别 | 简单组合能完成就 No-Go 独立算法创新 |

第一批的新增成果是把这些义务变成可审查的具体问题。
它不是一份把 G1–G6 当公理后宣称已成功的“条件性新定理”。

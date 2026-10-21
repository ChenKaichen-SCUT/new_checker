# 前提—实现—证据对应表

基线 `884c06a8d2076c8f9443bfbfc30637151d89c73d`。
理论文本先于实现与本轮新编译；证明不由测试结果倒推。
原始 E2E-SAFE 文件保持原字节，新适用域见 [语义审计](01-source-semantics-audit.md)
与 [完整受限证明](02-restricted-proof.md)。

| 必要条件 | 独立执行的检查 | 实际证据与拒绝条件 |
|---|---|---|
| C0 同次真实源/AST/LLVM | `authenticate_capture`、未修改 CK 依赖哈希、固定编译器/observer、完整来源/调用清单 | `capture-*/compiler-receipt.json`；缺字段、配置、哈希、来源冲突均拒绝 |
| S1 全局混合访问排除 | `prepare_entry` 在解释每个 create 的完整 worker 后，对所有普通读对象与所有 asm 写对象取全局交集 | `preparation/entry/certificate.json:source_conflict_check`；同 worker 或跨 worker 的冲突均拒绝 |
| S1 对象有效性/类型 | `source_main` 检查全部完整全局定义/初值；`source_worker` 精确规范类型和 void* 往返；实际 LLVM/Q 宽度、对齐、对象及初始化 | 只接受静态生命周期、无地址算术的完整对象；不把相异 SMT 符号当作对象不重叠的证明；ABI/WB 等仍属原 Γ_domain |
| S2 多定义/多来源上下文 | 每个实际 LLVM asm 与整个 AST 来源连接；对候选 worker/call 分别验证宏/inline lineage；唯一且全覆盖 | `interfaces[].worker_definition/worker_name/call_context/llvm_line_index`；不是按文件名或相似文本选择 |
| S3 每个源 create 的入口 | 按源 create 次序建立 activation：目标声明、实参对象、完整 source ops 与实际 LLVM def-use；每激活新鲜 U | entry 中每条 activation 独立列出，非固定输入必须为实际 SSA，非 literal；未知定义/别名/表达式拒绝 |
| C1 原 GNU/块/片段 | 原 `wrapper_interface`、BLOCK_EXACT、LLVM_FRAGMENT_EXACT；逐调用替换，原 LLVM 宿主帧不动 | 每个 call 的真实 fragment、SMT、证书；`+m/+q`、类型、clobber 和原 CK 字节未改变 |
| S3/S5 SSA 作用域 | 替换定义以 `(worker_name,SSA)` 检查；生成命名空间全局新鲜；原 `%3` 在两个函数中允许重名 | 同名不作为对应证据；各自 LLVM 输入与输出由解释器恢复 |
| S4 实际线程入口 | Q main 的真实 ThreadCreate 次序与 source create 对齐；ThreadStart.creator、spawned_thread、target、ThreadArgument.creator/index/type、实际 argument 全查 | `regions/certificate.json`；再由原 main checker 按 handle/target/argument 独立复核；未知/重复/遗漏创建拒绝 |
| C1/C2 每个实际 worker | 消费全部真实事件；根据实际 writer/operand 表达式建立环境；开放比较地址/宽度/值、A、真实 rmw_load、live-out、所有断言 | 每个区域独立 SMT 与 (create,definition,call,LLVM,Q-thread) 身份；没有 `%name → rname` 规则 |
| S5/C3 完整覆盖 | 期望集合是每个 create 的目标函数所含 calls 的依赖并集；与实际证书键完全相等，端点互斥；全部普通事件/监视器也必须消耗 | 单个动态调用遗漏即拒绝，即使实际线程数量不变；不会重用另一 worker 的证书 |
| C2/C3 main/runtime | 原初始化、普通访问、全部断言、create/join、完成位、私有对象分离与完整程序分区 | P0 五项实际回归；不同 worker 的完整 main 也经过同一 checker |
| C4 同次实际查询 | 原 `check_queries`，仅增加 D2 已查 host profile token；实际属性、用户监视器、assumption、stack、bad/bound 与 SAT/UNSAT 绑定不变 | 实际 query audit/SMT/transcript 与重放；UNKNOWN/超时/缺失/不匹配拒绝；不按末尾 UNSAT/PASS 授权 |
| Γ 不漂移 | driver 比较字典与原 P0 八项 Γ，核对原 theorem hash，记录实现源快照 | 每份 program certificate 的 `external_assumptions` 完整保留；从不声称这些契约已被证明 |

程序授权入口仍是 `experiments.certify_p1.run`，它不接受用户提供的准备对象或寄存器映射。
组件 API 的单独调用、测试中篡改组件参数、`EXACT` 或某个局部证书都不授权 SAFE。
正向后端继续使用原 `Dat3M-p0-positive-v1`，没有修改求解逻辑或添加约束。
`P2Faults` 仅在独立负例构建中变更实际 Program/求解 assumption；负例构建永不释放 SAFE。

## 理论、检查事实、可信边界

**解析证明：**全局 R/W 排除普通 C 并发冲突；类型化 create 入口；完整有限顺序组合；
依赖于目标定义的激活覆盖；将同一个源 rf/co 整体运输到 Q；原 ENC-minus 的反证转移。
这些是明确充分条件下的推导，不是通用 GNU C++ 或一般非双射优化的定理。

**实际检查：**当前源与依赖字节、实际 AST/LLVM/Q 中能导出的所有条件、局部普遍等式、
实例集合、属性与查询绑定。这些不证明观察器、Python/Java/C++ 实现或求解器本身。

**仍受信任：**Γ_front（Clang 预处理/声明/元数据和域内宿主契约）、Γ_ISA（GNU/x86/CAT
解释桥接）、Γ_capture（忠实实际对象导出）、Γ_runtime（成功 pthread 协议的前缀投影）、
Γ_encode（所有 Q 错误前缀进入实际查询）、Γ_check（检查器实现与 SMT soundness）、
Γ_solve（后端 UNSAT soundness）、Γ_domain（原 ABI/WB/有效域等）。没有新增第九项。
消除普通访问冲突并不把其余八项变成已证明，也不把 GNU 扩展程序变成可移植 ISO C11。

## 本轮额外发现的证据缺陷

`checker/check.py` 原来对 UTF-8 LF 字符串计算哈希，再经 Windows 文本写入转成 CRLF。
这导致原 block 证书的 `smt_sha256` 不等于实际文件字节哈希。公式语义相同不是证据
完整性的替代品。修复为 UTF-8 `write_bytes`，新增精确磁盘字节回归测试。
旧证据与首轮新证据均保留；最终授权材料以 `*-02` 重跑目录为准，不回填或“修正”旧哈希。
这修补的是证据序列化，不改变参考指令语义、SMT 条件、目标程序或八项 Γ。

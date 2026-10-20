# 最小验收证据包

唯一真实源输入：`benchmarks/backend-source.c`。
报告：[13-minimal-acceptance.md](../../docs/13-minimal-acceptance.md)。
本包包含全部接线失败记录；只有下面明确列出的最终目录支持最终结论。

|目录|用途与状态|
|---|---|
|`build/`|首个固定源码构建；运行目录漏 compilation.yml，后续替代|
|`build-02/`|补齐运行配置；导出器宿主字段仍不完整，后续替代|
|`build-03/`|最终构建，669 项上游输入及只读插桩；完整构建日志和 runtime 摘要|
|`attempt-01/`|真实 Clang/转换成功，Dat3M 配置缺失而 REJECT|
|`attempt-02/`|局部层级通过；复核发现宿主快照字段缺失，不能作为最终完整对象包|
|`attempt-03/`|补齐导出和宿主结构检查后的通过记录|
|`negatives/`|首次四例，驱动误解 FAIL=10 而标为未完成；原始证据保留|
|`negatives-02/`|修正退出码后四例全部拒绝|
|`final/`|最终正例，绑定执行代码摘要、模型文件和完整实际对象|
|`final-negatives/`|同一最终正例派生的四种变异，均被独立检查拒绝|

优先阅读：

- [最终逐层结果](final/acceptance.json)
- [真实原始 C](final/source.c)、[AST](final/source.ast.json)、[原始 LLVM](final/source.ll)
- [实际转换 LLVM](final/translation/candidate.ll)
- [实际编码前 Program](final/backend/snapshots/before-encoding.json)
- [同次编码后 Program](final/backend/snapshots/after-encoding.json)
- [全部 worker 覆盖](final/regions/coverage.json)
- [宿主结构检查](final/host-contracts.json)
- [同次后端原始 SMT](final/backend/solver-output/candidate.ll.smt2)
- [负例汇总](final-negatives/negative-summary.json)
- [执行的检查器摘要与版本](final/implementation.json)
- [固定 Git 提交的构建输入成员证据](upstream-tree-membership.json)
- [可供重新构建使用的输入目录子集](upstream-build-tree.json)

每层 `certificate.json` 保留生成的 SMT 义务；独立 `.smt2` 文件可逐项复核。
所有外部命令保存 argv、退出码及原始 stdout/stderr。快照均由真实 solver Task 导出，
没有在 Python 中构造或修改事件 JSON。负例的实际 LLVM 变更见各 `mutation.diff`。

`manifest.json` 对本证据包的分发文件逐字节散列（不包括自身）。
`.bc` 是相同 Clang 验证模块时生成的本地副产品，未用于 Dat3M 求解且不进入 Git。
旧 BLOCK 查询的证书摘要按 LF 文本计算，Windows 分发文件是 CRLF；
原始分发字节由 manifest 另行散列。静态核对脚本显式识别这一区别。
快照 schema 的完整性标记只覆盖此次支持的表达式/事件字段，不是 exporter 的形式证明。
所有结果均不授权转移整程序 PASS/FAIL。

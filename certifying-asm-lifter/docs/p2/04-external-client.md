# 一个固定原始客户端的外部适用性审查

样本在首次外部编译前固定于
[external-selection.json](../../experiments/p2/external-selection.json)，分母 **1**，不换样。
项目为 Concurrency Kit，commit `8f0847cfe57b1479d8e63b89028831d94d0e4d26`，
完整原始调用方为 `regressions/ck_ec/validate/ck_ec_smoke_test.c`，链接所需另一翻译单元
为 `src/ck_ec.c`。它是上游事件计数器的完整 smoke-test 客户端，含真实线程/等待/唤醒，
不是生产应用，也不是我们新写的 harness。

该客户端的 `test_threaded_add_32` 通过 `ck_ec_add` 进入既有审计中的事件计数器路径；
`ck_ec32_add_mp` 使用原始 `ck_pr_faa_32`，返回值再进入 epilogue/wake 行为。
但完整测试还包含其他模式和操作，不能只选 FAA 调用并忽略完整客户端。

## 实际完成的检查

`make -n` 取得原上游规则，保留全部编译选项，包括 `-O2 -fstrict-aliasing -pthread`
及 `-D_GNU_SOURCE`；固定 Clang 21.1.8 按原两源文件规则编译链接成功。
没有运行该客户端，也未削去任何等待、回调、系统调用或共享操作。
用于观察的两次 TU 编译各自同时产生 AST 与 LLVM，只添加行表/路径映射和只读 observer，
保留原优化配置。完整源码、headers、生成配置、依赖、原 Makefile、实际命令与输出均保存。
原始上游 manifest 中所有文件的哈希在前后均核对不变。

实际 TU-0/TU-1 各有 192 个 AST asm 位置，优化后 LLVM 分别含 **80/33** 个 asm 调用。
这些数是实际 census，不是提升率或认证成功数；大量头文件定义的 AST asm 不存活。
实际 main 为 `int(int,char**)`；独立读取两份真实对象确认完整构建需要两个翻译单元。
[独立分析](../../experiments/p2/external-client/independent-scope-analysis.json)没有用手写 LLVM
或人工事件替代任何对象。

## 拒绝及阻塞归因

**OUTSIDE_D2_REJECT，程序级证书 0/1。** 单 TU 完整性与 `main(void)` 两个必要前提
已经分别不满足，足以保守拒绝。它们是当前实现/接受域限制，不是发现了一个新的不可能性定理。
更深的真实障碍是结构体/字段指针、完整宿主 store、活跃分支、多层调用/间接回调、
`syscall`/futex/clock/usleep、等待控制流和运行时错误路径。仅放宽 main 签名仍不能接受。

因此没有将孤立 TU 送入后端冒充完整客户端，也没有产生伪造的 Dat3M Q/查询。
本样本缺少的 Q/SMT 明确记为 **因范围拒绝而未生成**，不能计为端到端验收或 PASS。
生成的原始 executable 留在忽略的 vendor 目录，不提交二进制。

完整材料见 [scope-certificate](../../experiments/p2/external-client/scope-certificate.json)、
[TU-0 receipt](../../experiments/p2/external-client/tu-0/receipt.json)、
[TU-1 receipt](../../experiments/p2/external-client/tu-1/receipt.json) 与
[完整命令日志](../../experiments/p2/external-client/commands/commands.json)。

## 不混合统计母集

| 分类 | 本轮单位 | 结论 |
|---|---:|---|
| 完整上游客户端 | 固定 CK event-counter smoke test，1 | 0 接受、1 范围拒绝 |
| 上游例程 + 自建并发 harness | 原 CK FAA + 三种受控宿主形状 | 条件式正负验收；不是完整上游客户端成功 |
| 隔离错误转换/源域攻击 | 预先列出的实际对象与源变体 | 检验检测能力；不是正确性证明或真实缺陷发现 |
| 整个 CK/URCU/AO 母集 | 未开展 | 不报告覆盖率，不增加样本或删减客户端求成功 |

本结果说明不同 worker 和非固定输入绑定已扩大受控自动化能力，但完整第三方客户端
覆盖仍未取得成功。后续优先级应由完整宿主/生命周期建模成本决定，不能由增加 asm 数量
掩盖这些障碍。本轮在此停止外部扩展。

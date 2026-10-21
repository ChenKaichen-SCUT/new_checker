# 六个 FAA32 候选：完整上下文与逐条件证据

记号：**S** = 该项限定事实有直接证据；**V** = 当前 guarded 必要条件明确违反；**U** = 没有充分证明，不能当作满足。S 不是整个执行的认证。
本文件的 C 行号指完整原始 TU，L 行号指真实原始 LLVM。`line97` 等名称始终是 LLVM 身份，不是 C 行号。

原始文件快捷入口（均为逐字复制，散列见 `evidence/inputs.json`）：

- F：[ck_pr_faa.c](../../experiments/ck-context-audit/evidence/raw/ck-ck_pr_faa/tu-0/source.c)、[F.ll](../../experiments/ck-context-audit/evidence/raw/ck-ck_pr_faa/tu-0/source.ll)。上游 `regressions/ck_pr/validate/ck_pr_faa.c`。
- X：[ck_pr_fax.c](../../experiments/ck-context-audit/evidence/raw/ck-ck_pr_fax/tu-0/source.c)、[X.ll](../../experiments/ck-context-audit/evidence/raw/ck-ck_pr_fax/tu-0/source.ll)。上游 `regressions/ck_pr/validate/ck_pr_fax.c`。
- E：[ck_ec_smoke_test.c](../../experiments/ck-context-audit/evidence/raw/ck-ec-complete/tu-1/source.c)、[E.ll](../../experiments/ck-context-audit/evidence/raw/ck-ec-complete/tu-1/source.ll)。上游 `regressions/ck_ec/validate/ck_ec_smoke_test.c`。
- H：[ck_ec.h](../../experiments/ck-context-audit/evidence/raw/ck-ec-complete/tu-1/buffers/5-ck_ec.h)，原 observer buffer `/buffers/5`。
- A：[x86_64/ck_pr.h](../../experiments/ck-context-audit/evidence/raw/ck-ec-complete/tu-1/buffers/11-ck_pr.h)，原 `/buffers/11`。FAA 宏正文 A289–299，`CK_PR_FAA_S` A303，uint A306、uint32_t A309。
- I：[src/ck_ec.c](../../experiments/ck-context-audit/evidence/raw/ck-ec-complete/tu-0/source.c)、[I.ll](../../experiments/ck-context-audit/evidence/raw/ck-ec-complete/tu-0/source.ll)。客户端第二个实际编译单元，不是人工补充的模型。

所有六项的 L2 接口都明确写着 `host_evaluation: NOT_PROVED; all defined valid typed port inputs`。完整证书路径的公共前缀为 `experiments/gap45/sites-02/<task>/tu-<n>/<line>/`；每项的 `site/interface.json`、`site/block/certificate.json`、`site/llvm-fragment/certificate.json`、`independent/` 与原 validation 日志已逐字读取，位置及散列在重建清单中。下列审计不会将该局部有效端口域反向假定为真实宿主总能建立它。

## A. ck-ck_pr_faa / TU0 / line97

**真实调用链与路径。** F129 main → F135 `CK_PR_FAA_B(64)` → 宏 F60–64 的 200000 次随机 FAA64 校验（失败则打印并 exit）→ 宏 F65 `rg_width(64)` → F97 `CK_PR_FAA_W(64,32)` → 宏 F72 `ck_pr_faa_32((uint32_t *)(void *)&t,1)` → A293 asm。原始 main 随后还会运行其他宽度测试；不能把此位置抽成新 main。

这里的目标操作不在 `rg_width` 自身循环中，L97 所在块 `%32` 不在 CFG 环上。到达该块之前的循环保留在 L61–92，但最小排除依据无需依赖这个循环：F71 的 `t` 是 uint64_t，而操作只更新其低 32 位。L51 `%2 = alloca i64`、L96 `store i64 -1`、L97 `elementtype(i32) %2`、L98 `load i64 %2`、L99 比较 `-4294967296`，直接确认了跨宽度对象效果。

| 条件 | 状态与证据 |
|---|---|
| FAA32 原接口 | S：A293–297，`+m/+q`, memory/cc；L97 `%33`, p0=`%2`, o1=`1`；`observer /sites/50` |
| 来源/真实调用 | S：原 observer `rg_width /functions/293`、raw AST `/inner/1098`；main `/functions/294`、raw `/inner/1099`。L `!dbg !50`→`!52`→`!49` 与 F97/F135 相互核对；不只依赖 debug 名字 |
| 无环完整上下文 | V：原 main 的相关前缀含真实循环；位点自身无环这一正面事实保留 |
| 完整同宽全局对象 | V：64 位栈对象上的 32 位访问及 64 位观察；不属于 `source.py:88,121` 的对象域 |
| 32 位有定义表达式 | V：完整宽度测试包含 64 位计算/转换；GNU 别名及 C 有效类型的全域保证 U，不据此报告 UB |
| 完整调用/语句消费 | V：多层 rg_width、printf/exit、局部地址及其他宽度 asm；不是只含 FAA helper 的 worker |
| main/create/join/观察 | V：原 main 无 pthread worker；错误通过打印+退出表示，非当前 join 后监视器 |
| 返回值/效果 | S：`%33` 无后续 SSA 使用；内存效果通过 L98–105 观察。不能因此删除内存写 |
| 全路径/Q/运行时 | U：没有通过完整源提取、激活覆盖及相应 Q 比较；历史原始 Q 捕获不提供这些保证 |

结论：**语义范围外**（源对象/宿主，LLVM 同宽对象证据）。无适配器。

## B. ck-ck_pr_faa / TU0 / line109

真实调用链与 A 相同，但位置是宏 F78 的第二次 `ck_pr_faa_32`。它只在第一项内存检查成功后到达：F77 将同一个 uint64_t `t` 置零；F78 的 -1 转换为 uint32_t；F79–82 要求完整 t 等于 `0xffffffff`，失败打印并 exit。L108 store i64 0；L109 `%39 = ... i32 -1`；L110 load i64；L111 比较 4294967295。L109 所在 `%38` 无环。

| 条件 | 状态与证据 |
|---|---|
| FAA32 接口/绑定 | S：A293–297；p0=`%2`, o1=`-1`, 输出 `%39`；原始端口为 uint32_t，不将 LLVM 文本 -1 误认成 signed FAA |
| 宏/调用身份 | S：同一个 `/sites/50` 原始定义，但独立 LLVM 静态位置和证书；`!dbg !54`→`!55`→`!49`；不可复用 line97 证书冒充本次调用 |
| 无环完整上下文 | V：相同 main 前缀循环；本次所在块与 rg_width 本身无环 |
| 完整对象/别名 | V：与 A 相同的 64 位 t/32 位 asm/64 位读取；源 cast 关系没有被 L2 提升为完整对象证明 |
| 表达式/全部语句 | V：64 位赋值、比较与 printf/exit，以及原 main 其他操作；不是已有总 unsigned32 宿主 |
| main/线程/观察 | V：没有原协议中的有限 worker creates/joins、post-join assert；不能伪造线程实例 |
| 活跃输出 | S：`%39` 无 SSA 用户；L110–117 的内存检查仍活跃 |
| 完整路径与实际 Q | U：相关静态路径已定位，尚无 accepted extraction/全局覆盖证书；本轮不尝试求解 |

结论：**语义范围外**。与 A 共用源定义不影响逐位置排除与保留各自 L2 身份。

## C. ck-ck_pr_faa / TU0 / line135

**真实调用链。** F129 main → F139 `CK_PR_FAA_B(32)` → F60 for → F61/F62 两次 `common_rand()` → F63 `CK_PR_FAA_T` → F44 `ck_pr_faa_32(&t,b)`。`common_srand(getpid())` 在 F132，原 `common.h` 的 Linux 分支调用 srandom/random；未把它替换为固定输入。

局部 uint32_t a,b,t,r 在每轮创建/使用。F45 比较 t 是否等于 a+b、r 是否等于 a；失败 F46–50 打印并 exit，正常完成后调用 rg_width(32)，再进行其他原始测试。真正非固定 SSA 为 L132 `%54 = urem i32 %53,2147483647`，来自 L130 `random()`；L135 将 `%54` 传给 FAA，返回 `%55` 在 L139/L146 使用。

| 条件 | 状态与证据 |
|---|---|
| FAA32/来源 | S：A309 实例、`/sites/50`；F139 的宏展开；L `!dbg !63`→`!64`；独立 line135 L2 |
| 非固定真实输入 | S：L127–135 的两次 random/trunc/urem；没有固定 b；具体 libc 全域语义 U |
| 无环 CFG | V：L125 `%47` → L150 `%65` → L154 返回 `%47`（条件计数终止）；包含目标 L135。固定 200000 的循环仍不是 DAG |
| 全路径输入/表达式 | V：urem、库调用、循环计数及 LLVM 标志超出提取语法；`llvm_entry_conditions` 保存区间 `[-1,2147483647)`，不能直接假定宿主所有入口满足 |
| 有效对象/普通访问 | S：L53 alloca i32 `%4`, align4；V：栈对象及初始化/后续普通读取不是当前全局对象协议。这里只有 main，不虚构并发数据竞争 |
| 全语句/直接调用 | V：完整 for、printf/exit、common_rand 和 rg_width；均有真实外部或宿主效果 |
| 输出/观察 | S：L136–148 包含内存和旧值的联合条件及失败退出；V：并非当前 `__VERIFIER_assert` 观察接口 |
| 激活与 Q | V：原 main 不满足 worker 创建协议；U：循环所有执行出现没有完整 Q 对应证明，不能以已导出的有界实例代替 |

结论：**语义范围外**，主阻碍为真实循环/外部输入及宿主对象，不是 schema。

## D. ck-ck_pr_fax / TU0 / line109

**真实调用链。** X113 main → X115 `run_test_faa()` → GENERATE_TEST(faa) X106 展开 X102/103，先 int 后 uint → `run_test_faa_uint` → TEST_FAX X70 for → X71 common_rand → X72 `test_faa_uint(&x,r)` → X73 `ck_pr_faa_uint(&y,r)` → A306/A293。`ck_pr_faa_uint` 的 canonical unsigned int 为 32 位；这里不是函数名恰为 `ck_pr_faa_32` 的调用。

每次 test 开始 y=x=0，按原 seed 调用 common_srand(getpid())。参考 helper X39–42 返回 x 旧值并执行普通 x+=delta。X75 比较两个返回值，不同则打印并从当前 test 返回；循环正常结束时 X85–90 打印 x/y 及 SUCCESS/FAILURE，main 继续 FAS 测试后返回 0。这些可观察文本和早退不能删除。

| 条件 | 状态与证据 |
|---|---|
| FAA32/接口 | S：unsigned int 32，`+m/+q`, memory/cc；L109 p0=`%3`, o1=`%36`, return=`%37`；`observer /sites/47` |
| 调用与宏身份 | S：`run_test_faa_uint /functions/298` raw `/inner/1094`，`run_test_faa /functions/299` raw `/inner/1095`，main `/functions/303` raw `/inner/1099`；完整 debug 四层链存于 sites.json |
| 真正非固定输入 | S：L107 random、L108 trunc 得 `%36`；U：完整外部环境语义；未固定随机值 |
| 无环/完整路径 | V：L104 块 `%32` 含 L109，成功经 `%41` 回 `%32`，L122–123 比较 2000000；原 X70 循环与 LLVM 一致 |
| 定义良好的32位表达式 | S：uint 参考加法模算术；V：完整调用还含 int 局部、循环、函数调用和其他测试；前面的 int 版本是否所有环境输入均无 signed overflow 为 U，不把未知 UB 当成缺陷 |
| 对象与副作用 | V：x/y 是两个局部对象，参考 helper 向 x 普通写，asm 向 y 写；不是“未知调用无副作用”，也不是 immutable 全局输入模型 |
| 活跃输出/错误观察 | S：L110 `%34 == %37`、L114 打印返回值；V：printf/return/puts 观察和早退，不满足原监视器协议 |
| 生命周期/Q | V：单 main，实际调用不是 pthread worker；U：完整循环和观察的源→Q 认证未建立 |

结论：**语义范围外**。不能把 unsigned FAA 单次迭代剪出来作为新 harness 成功。

## E. ck-ec-complete / TU1 / line553

**完整原始上下文。** E395 main 先检查平台 ops，再 E407 `test_update_counter_32(&sp)`，E413 `...(&mp)`，之间及之后保留 64 位测试、deadline/wait/predicate/threaded 测试和 printf。目标静态函数为 E115–128。其内部在栈上建立 ec.counter=0 → 读取并 assert 0 → inc → 读取并 assert 1 → add(42) → assert old==1 → 读取并 assert 43 → return。

add 的真实宏/函数链为 E124 `ck_ec_add`（H514–517 宏选型）→ H738 `ck_ec32_add` → H748 `ck_ec32_add_mp` → H708 fence → H709 `ck_pr_faa_32` → A293 → H710/H686 epilogue。`mode->single_producer` 为 true 时走 H714 的 **非 lock xaddl** SP 路径；原 main 的 mp 调用使目标 lock 路径适用，不能将 SP 路径伪装成缺失分支。返回值被高位屏蔽；old 高位存在时还有 ck_ec32_wake → I38 and_32 → I39 ops->wake32 → E75–81 futex syscall。

| 条件 | 状态与证据 |
|---|---|
| FAA32 局部接口 | S：line553 p0=`%2`, o1=`42`, 输出 `%32`；`/sites/50`、原接口 range `[4,43)`；该常量在区间内不代表整个宿主已证明 |
| 来源/真实两调用上下文 | S：E407/E413、H709、A309；`test_update_counter_32 /functions/293` raw `/inner/1091`；add `/functions/261`、add_mp `/functions/259`、epilogue `/functions/258`；L `!340/342/344/330` 的原 debug 链另存 |
| 当前函数无环 | S：E115–128 及 E.ll491–588 的 CFG 无回边；**不以全客户端其他函数有循环否定此项** |
| 仅支持的完整事件/调用 | V：同一函数且同一对象上 L495/531/574 movl、L513/517 incl/setle、L497/509/533/544/576 空 memory barrier；这些都不是已支持 FAA。mp 路径也不能避开 movl/lock incl |
| 条件路径与宿主语句 | V：结构成员、bool/i8读取、Generic/Choose 宏选型、栈初始化、assert 宏、潜在 wake 调用超出既有语法。S：SP/MP 和 old 高位分支都保存在真实 LLVM 中 |
| 全对象/别名 | S：L492 alloca struct.ck_ec32 align4，L494 store i32 0，目标地址是同一个 `%2`；V：结构成员栈对象与 mode/ops 指针不是全局标量对象域；任意新对象模型的充分性 U |
| 返回值与观察 | S：L554 用 `%32` 决定 wake；L558/564 phi→L565 mask→L566 assert old==1；L574–581 再读计数器。V：当前仅 eq/ne 的解释与 `__VERIFIER_assert` 协议不能直接解释整条链 |
| 线程/完整 main | V：这是 main 同线程中的 void 测试函数，不是 `void *worker(void*)`；main 带 argc/argv；其他客户端测试未删除 |
| 全路径/Q/运行时 | U：没有 accepted extraction、全路径对应或完整最终 Q；原 Q 的 Alloc 导出不完整是独立后端障碍 |

`old` 高位分支对闭合单线程初值是否不可达，不能只从初始化直觉或 L2 推出。开放语义读取响应没有被限制为真实一次运行值。本轮不声称 wake 分支一定可达，也不需要该断言：同路径 movl/incl 及对象/观察限制已经排除此上下文。

结论：**语义范围外**。这是六项中最接近有限分支结构的真实对象，但仍不是“完整域内、仅 schema 不兼容”。

## F. ck-ec-complete / TU1 / line782

**完整主线程链。** E435 `test_threaded_add_32(&sp)` 与 E443 `...(&mp)` → E330–346：栈 ec=0、pthread handle → ck_pr_store_int(woken,0) → E337 create(waiter,&ec) → usleep(10000) → assert woken==0 → add(&ec,mode,4) → join → assert woken==1。FAA 的 add_mp 链与 E 相同，常量增量4；该操作发生在创建线程的调用方，不在 waiter 中。

**共享对象上的 waiter 链。** E303–310 `test_threaded_32_waiter(data)` 将实参恢复为同一个 ec，调用 ck_ec_wait(ec,&sp,0,NULL)，返回后 asm 写 woken=1。H768–777 的 wait 在计数未变化时调用 `ck_ec32_wait_slow`；I44–50 转调 `ck_ec32_wait_pred_slow`；I395/399 进入完整 WAIT_SLOW_BODY I315–381，包含 I334 的重试循环、wait_easy、CAS upgrade、fence 及 exponential_backoff。后者 I149 起循环，依赖 gettime/sleep/pred 回调；wait_slow_once I281 间接调用 wait32，最终 E47–49 futex。NULL deadline 不提供固定无环完成条件。I.ll27–169 保留该 slow 函数的真实回边。

这不是因为“同 TU 的其他函数有 loop”而拒绝：E.ll759 的 create 直接指向 `test_threaded_32_waiter` 且实参 `%2` 就是 L782 的地址；E.ll1100–1115 的 waiter 明确调用 wait_slow；两 TU 的定义、调用和原配置都在证据中。可能执行的等待路径直接影响计数器与最终 woken 观察。

| 条件 | 状态与证据 |
|---|---|
| FAA32 接口/来源 | S：L782 `%17`, p0=`%2`, o1=`4`, `[4,43)`；A309 `/sites/50`；E341→H748→H709。独立于 line553 的接口/证书 |
| 当前调用方 CFG | S：E330–346 / L752–806 自身无环；V：完整相关线程及 slow 调用存在循环，故整体不在有限无环域 |
| 线程实参关联 | S：L753 alloca ec `%2`、L759 create(waiter,%2)、L782同址FAA、L792/793 join handle；V：原协议仅支持 main 顶层 creates 与完整全局实参，不能把本函数或 &ec 改写成新 main/global |
| 全路径/直接调用 | V：waiter→wait_slow→wait_pred_slow→WAIT_SLOW_BODY→backoff/wait callbacks，非单层FAA helper；原控制可能等待、不保证有界终止 |
| 对象/共享副作用 | S：计数器、woken、handle 和 mode/ops 来源可定位；V：结构/栈对象、woken 多处 asm load/store、CAS/and/stall/fence 不能删除。create 失败后的行为与 OS 契约 U |
| 类型/完整表达式 | V：mode bool/i8、结构成员、timespec 与64位时间运算、系统调用等超出现有unsigned32语义；全路径UB/别名保证 U |
| 活跃返回值/观察 | S：源 E341 丢弃 ck_ec_add 返回值，但 L783 的 `%17` 仍控制 wake，是活跃内部输出；woken 在L761/794检查，错误到 __assert_fail。V：不能仅因外层无 return 使用而省略 epilogue |
| 完整 Q/激活/rf-co | U：历史完整 Q 因 Alloc 不完整拒绝，未生成可用的全路径证书；有限 create 调用点不意味着等待循环已被完整展开 |

结论：**语义范围外**，主要来自源并发上下文、对象和运行时，另有 Q 导出障碍；不是 generic capture adapter 能单独修复的问题。

## 六项共同的证据边界

每项 GNU/LLVM 接口身份均有原始 L2 证据和本轮静态散列/行/AST声明复核；宏/内联恢复记录用于定位，不以文件名或相似文本替代来源证书。主表的 15 个结果未被本轮重新命名。新重建脚本不会调用 source.load、不会改变 receipt 状态、不会产生或解释人工 Q，也不声称解决无法闭合的运行时条件。

原始代码的所有可见循环、分支、早退、外部调用和线程行为均保留在完整副本/原 AST 中；对于域外操作，本轮做到列明必要行为和拒绝理由，不声称完成这些操作的普遍语义解释。因此不存在隐含的“未分析调用无副作用”或“不可达分支自动省略”前提。

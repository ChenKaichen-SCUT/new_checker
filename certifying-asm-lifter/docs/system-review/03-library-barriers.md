# 真实库的覆盖障碍：静态证据、优先级和边界

本轮只读取固定版本源文件及配置规则，没有预处理、编译、提升或认证这些新对象。
所以本文件提供**可追踪的障碍排序**，不报告解析率、认证率或“新增支持例程数”。
“头文件有四个 asm 分支”不等于“某次 LLVM 有四个存活调用”。
下面均以实际配置和完整宿主为后续验收对象，不能剪掉困难语句。

## 1. 来源与选择规则

| 项目 | 固定提交 | 这次选择的部分及原因 |
|---|---|---|
| Concurrency Kit | `8f0847cfe57b1479d8e63b89028831d94d0e4d26` | 沿用历史 pin；x86-64 原子接口、event counter、ticket lock，直接检查已验收 FAA 的实际使用上下文 |
| Userspace RCU | `645fdc9b720606440a3b1ed74ad394e8eaad796b` | x86 原子接口、配置、队列 append/splice 和 stack push；检查返回旧指针的真实用途 |
| libatomic_ops | `c7901207f871e80c973bfeae71f04f7b59c69636` | x86 原子接口、stack 与上游测试模板；检查 tied input、volatile、flags 输出和重复调用 |

URCU/AO 提交经公开仓库 API 固定；原始文件 URL、SHA-256、大小、取得时间、
所读行区间见 [source-records.json](evidence/source-records.json)；
人工判断见 [library-audit.json](evidence/library-audit.json)。
本次是目的性选择：优先既有 `xadd/xchg/cmpxchg` 的 32/64 位使用及其真实调用方，
不是随机抽样或完整母集普查。URCU 的该头文件注明借鉴 AO，
所以不能把两者相似模板当作两份独立创新/覆盖证据。
源码缓存不入 Git；只发布定位、哈希与分析，不篡改上游文件。

**配置是实验单位的一部分：**

- [URCU configure.ac](https://github.com/urcu/userspace-rcu/blob/645fdc9b720606440a3b1ed74ad394e8eaad796b/configure.ac#L237)
  将 compiler-atomic-builtins 选项设为默认关闭；
  [uatomic.h](https://github.com/urcu/userspace-rcu/blob/645fdc9b720606440a3b1ed74ad394e8eaad796b/include/urcu/uatomic.h#L74)
  根据该宏选择内建或架构实现。x86 legacy 是此 pin 的实际默认选择之一，
  不是为 Checker 人工重写出的接口。
- [AO x86.h](https://github.com/bdwgc/libatomic_ops/blob/c7901207f871e80c973bfeae71f04f7b59c69636/src/atomic_ops/sysdeps/gcc/x86.h#L23)
  在现代 Clang/GCC 且未禁用 GCC atomics 时走内建分支。
  Clang 21 下 legacy asm 必须单列明确的 `AO_DISABLE_GCC_ATOMICS` 配置。
  不能把默认内建配置计为 GNU asm 被认证，也不能隐去配置切换成本。
- CK native x86-64、memory-model 配置及 `__GCC_ASM_FLAG_OUTPUTS__` 会影响
  Fence/CAS 的实际接口。静态看到的备选分支不能一概算作同一存活 LLVM。

## 2. 具体障碍矩阵

下表中的“不能接受”是依据当前白名单/代码前提的静态判断，不是运行结果。
源码链接固定提交；一组同族宽度只算一个观察，不按生成宏数量膨胀。

| 对象及定位 | 真实接口/宿主特点 | 相对现有 CK 验收新增的障碍 |
|---|---|---|
| [CK FAA32/64 宏](https://github.com/concurrencykit/ck/blob/8f0847cfe57b1479d8e63b89028831d94d0e4d26/include/gcc/x86_64/ck_pr.h#L289) | 原始指针和增量参数；`+m/+q`；返回旧值 | 已通过的只是 `&x,1` 调用；一般参数绑定、多次调用/调用链仍受限，不能把原函数签名可解析当成通用调用支持 |
| [CK bool/value CAS](https://github.com/concurrencykit/ck/blob/8f0847cfe57b1479d8e63b89028831d94d0e4d26/include/gcc/x86_64/ck_pr.h#L414) | flag-output 分支有 `=@ccz`、读写 accumulator；value 版本额外写 `*v` | 多标量输出、flag 语义、额外宿主共享写/返回 bool；自建 CAS 的成功失败验收不覆盖这一接口 |
| [CK ec32_add_mp/epilogue](https://github.com/concurrencykit/ck/blob/8f0847cfe57b1479d8e63b89028831d94d0e4d26/include/ck_ec.h#L685) | `&ec->counter`、自由 delta；旧值经 mask/分支决定 wake；先调用 fence wrapper | 结构体/参数、多个调用层、活跃控制、外部回调。不能假定 wake 不发生；SP 版本的 unlocked 更新也不能改成 locked 来通过 |
| [CK ticket_trylock](https://github.com/concurrencykit/ck/blob/8f0847cfe57b1479d8e63b89028831d94d0e4d26/include/spinlock/ticket.h#L147) | load→mask/shift→条件 CAS→fence；返回 bool；函数局部 CFG 无环 | 多 asm/普通操作混合、CAS 的 expected/desired 来自先前值、多个出口；原始 CAS flags 接口另需支持 |
| [URCU add_return](https://github.com/urcu/userspace-rcu/blob/645fdc9b720606440a3b1ed74ad394e8eaad796b/include/urcu/uatomic/x86.h#L189) | 长度 switch；32/64 分支 `lock;xadd`、`+m/+r`；返回旧值加原 val | 保存原输入与被更新寄存器的区别；`void*`/`__hp_4/8` 内存包装、sizeof、无显式 cc 列表；不能改成返回旧值 |
| [URCU cmpxchg](https://github.com/urcu/userspace-rcu/blob/645fdc9b720606440a3b1ed74ad394e8eaad796b/include/urcu/uatomic/x86.h#L60) | expected/desired 自由参数，`+a/+m`；返回实际旧值；statement-expression/typeof 包装 | 类型擦除后内存 footprint、多个参数、宽度选择和接口差异；1/2 字节分支继续拒绝 |
| [URCU exchange](https://github.com/urcu/userspace-rcu/blob/645fdc9b720606440a3b1ed74ad394e8eaad796b/include/urcu/uatomic/x86.h#L126) | 隐式 locked xchg，输出与 `"0"` 输入相系；可返回指针 | tied 输入、指针位表示/有效性、参数绑定；不能用普通 load/store 代替 |
| [URCU wfcq append](https://github.com/urcu/userspace-rcu/blob/645fdc9b720606440a3b1ed74ad394e8eaad796b/include/urcu/static/wfcqueue.h#L168) | xchg 返回 old_tail，再向 `old_tail->next` store，返回与 head 地址的比较 | 活跃输出成为**下一次共享写地址**，同时保留 release 宿主 store；函数本体无循环，是有价值但尚未可接受的真实目标 |
| [URCU wfs_push](https://github.com/urcu/userspace-rcu/blob/645fdc9b720606440a3b1ed74ad394e8eaad796b/include/urcu/static/wfstack.h#L126) | barrier、xchg、基于旧指针的链接更新/返回，struct/container_of | 宿主地址/类型/alias 与 live-out；本函数无循环不代表所含 helper/完整客户端已被证明符合 D₀ |
| [URCU splice](https://github.com/urcu/userspace-rcu/blob/645fdc9b720606440a3b1ed74ad394e8eaad796b/include/urcu/static/wfcqueue.h#L514) | 同一 xchg 接口用于不同字段，后续再 append；存在循环/等待 | 是多上下文需求的直接证据，但完整例程超出有限无环域；不截去循环冒充完整接受 |
| [AO int_fetch_and_add_full](https://github.com/bdwgc/libatomic_ops/blob/c7901207f871e80c973bfeae71f04f7b59c69636/src/atomic_ops/sysdeps/gcc/x86.h#L389) | volatile unsigned 指针、`=r/+m/"0"`、xaddl、仅 memory clobber | 同一指令、不同合法接口形态；需恢复原值/输出绑定与限定符。词法放宽 cc 不是语义证明 |
| [AO fetch_compare_and_swap_full](https://github.com/bdwgc/libatomic_ops/blob/c7901207f871e80c973bfeae71f04f7b59c69636/src/atomic_ops/sysdeps/gcc/x86.h#L309) | volatile AO_t、accumulator 输入/输出、非固定 old/new | 参数与 ABI 宽度、没有 l/q 文本后缀的类型确定；无需为通过而改上游模板 |
| [AO bool CAS](https://github.com/bdwgc/libatomic_ops/blob/c7901207f871e80c973bfeae71f04f7b59c69636/src/atomic_ops/sysdeps/gcc/x86.h#L279) | flag-output 分支多个输出；另一分支含 setz | 前者是已知 CAS 的接口/flags 扩展，后者还要新指令语义；应分开，不同时放宽 |
| [AO 上游测试模板](https://github.com/bdwgc/libatomic_ops/blob/c7901207f871e80c973bfeae71f04f7b59c69636/tests/test_atomic_include.template#L127) | 同函数两次 FAA、旧值断言；CAS 成败调用分别使用 | 直接体现重复静态调用与活跃返回，能作来源覆盖目标；它是上游测试，不是完整并发数据结构的外部有效性证据 |

额外范围边界：CK ticket_lock 的等待循环、URCU pop/splice 的重试、
AO stack 的 CAS retry/辅助结构均真实存在。有限无环方案即使完成以下扩展，
也不能宣布验证了这些完整 lock-free 算法、进展性质或内存回收。

## 3. 按工程收益排序，而非按指令数量排序

**P0：先补全程序结论所需的宿主/属性门禁。**
它不提高解析率，但不做它，后续所有“整程序验证正确率”都没有定义基础。
具体任务见 [02](02-chain-gap-audit.md)；先在现有 D₀ 关闭 main/查询缺口。

**P1a：非固定入口 + 有类型的有限宿主数据流 + 活跃输出接续。**
三个项目的 API/调用方都要求这种能力，而且 `xadd/xchg/cmpxchg` 大多已在参考族中。
从“只能 &global 和常量”转到有检查的参数/SSA 关系，收益预计大于新增十条指令。
先限 unsigned 位向量、命名对象加已验证常量字段偏移、明确别名约束，
以及有限的 arithmetic/compare/branch。逐项接入，不一次开放任意指针运算。
输出先接算术/分支，再接共享地址；后者需独立证明对象有效性/别名与宿主 store。
每一步都保留原类型/约束，且关闭 [02 G3](02-chain-gap-audit.md) 的命名猜测路径。

**P1b：多个存活 asm 和多个实际调用上下文。**
真实调用方混合 load/CAS/barrier，测试和 splice 展示同一接口重复使用。
可以复用有限调用展开、现有开放等价和完整清单覆盖，先要求可信来源提示，
拒绝歧义，不再追求本轮已暂停的一般无提示合成。
每位置需要新鲜 SSA、精确区间、跨区顺序、全域检查、各调用实参/输出和实例身份；
不能简单删除 `len==1` 检查或把一个区域证明复用到不同参数调用。
P1a/P1b 常常**共同阻塞**同一客户端，单独放宽一项不保证立即新增接受。

**P2：同指令族的接口变体，以及已需排序的真实接入。**
优先 volatile/tie/多输出 CAS、sizeof/类型化内存 footprint 和明确的宏嵌套；
按真实 LLVM 消费规则核对。没有显式 cc 的上游列表需结合固定 Clang 的隐含
flags clobber 行为审查，不能仅因当前参考强制 cc 就断言上游错误，也不能删要求
当作已经证明。空 compiler barrier 与真实 MFENCE 分开；后者需要实际后端端点/
排序导出。当前无实际 Fence 支持是系统缺口，加入 LFENCE/SFENCE/新 ISA 则另审。

**暂缓：一般循环、任意对象/heap、任意来源纠错、新指令族。**
它们可能决定长期覆盖上限，却不是在当前 D₀ 下成本最小的论文可行性验证。
不要用手工展开/删除 retry 或替换内建把范围外对象计入成功。

## 4. 排序的可信程度与下一次最小目标

这里的“收益大”是基于跨项目重复出现、已具备指令语义和调用方依赖的判断，
**不是测得的覆盖率最大化结果**。目前缺配置后的完整 TU/调用母集；
无法给出“将覆盖提升到 80%”一类数字。
未来 census 要记录每对象的**全部阻塞集合**，计算增量扩展关闭了多少集合，
不能只数第一条错误或把重叠瓶颈收益相加。

批准后的建议次序：

1. 现有 CK harness 的 D₀ main/任务绑定先完成，仍使用原始上游 FAA。
2. 同指令 FAA 的非固定实参与两处真实调用分别验收；测试接口变体时一次只改
   接受能力，不改第三方源码。上游 AO 重复调用测试可检验上下文覆盖，
   但需单列 legacy 配置且不计作并发库客户端成功。
3. 真实客户端优先考虑 URCU append 的返回指针→共享 store，或 CK trylock 的
   有限分支→CAS→Fence。**二者都不在当前支持域，不能预先保证成功**：
   前者需要指针/宿主 store 语义，后者还需要 flags 和 Fence；按新增契约选一个，
   固定其未修改源与调用输入域，再决定是否值得投入。

这份清单用于选择受控开发，不是授权自动执行下一阶段。

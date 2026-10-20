# Dat3M LLVM inline asm 副作用丢失复现

状态：本地可重现，未发送外部报告，未宣称首次发现。
版本：`b81ec6c55503e824bb0ddc4ebac6c6f0a63d56d8`，Java源码未修改。
输入：`../benchmarks/backend-source.c`，Clang21实际生成的LLVM。

两个线程各对初值0的x执行locked xadd(+1)，join后调用已知intrinsic
`__VERIFIER_assert(x == EXPECT)`。源码中的内存操作数为 `+m`，存在memory/cc clobber。
Clang输出包含合法的indirect memory operands及flags clobbers。

## 复现

在项目根运行：

```
python experiments/compile_native.py
python experiments/run_dat3m.py benchmarks/backend/clang-raw-safe.ll benchmarks/backend/clang-raw-unsafe.ll --print-ir
```

注意指定部分文件会重写 `backend-results.json`；完整实验用无文件参数重跑。
源码EXPECT=2是安全断言，EXPECT=0是不安全断言。运行参数保存在结果JSON中，
模型为TSO，属性为program_spec，求解为eager/Z3。

实际结果：安全版本FAIL、不安全版本PASS。GCC本机分别返回0、42。
论证在成功创建/join、自然对齐、同宽度WB访问的契约内；
两个成功原子RMW在mo上全序，每次读其前驱写，因此最终x=2。
这个解析论证才是预期结果的依据；本机运行只是交叉核验。

## 定位

`VisitorLlvm.visitCallInst` 未找到支持的asm parser时，仅为返回值建立NonDetChoice。
没有建立对x的写事件。输出值在C里未使用，之后局部死赋值删除。
日志的警告和最终程序均保留在：

* `experiments/backend-logs/clang-raw-safe.log`
* `experiments/backend-logs/clang-raw-unsafe.log`

最终worker没有x的RMW；不是求解器找不到某个复杂交错。
`semantics/reference.py` 和 `checker/check.py` 能拒绝对应“删除共享事件”的候选变异，
但本项目还没有自动导入这份Dat3M打印IR后生成反向认证的接口。

## 可能的修复方向与结论边界

未知asm应令验证流程明确拒绝/UNKNOWN，或使用被证明保守的全副作用抽象。
只有nondet返回值无法过近似共享写、原子性和栅栏。
本研究不擅自改变上游源代码，也没有把这一简单修复当作主要论文创新。
结论仅针对固定版本与固定输入，不推及其他版本/架构/所有前端路径。

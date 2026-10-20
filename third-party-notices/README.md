# Third-party material

The original headers in `certifying-asm-lifter/benchmarks/upstream/` retain
their copyright notices. Exact repository revisions and original URLs are
recorded in that directory's `sources.json`.

| Material | Origin and revision | Applicable notice |
| --- | --- | --- |
| `ck.h`, `raw-extracted/ck-*.asm` | concurrencykit/ck, `8f0847cfe57b1479d8e63b89028831d94d0e4d26` | [CK header notice](ck.txt) |
| `atomic_ops.h`, `raw-extracted/atomic_ops-*.asm` | bdwgc/libatomic_ops, `c7901207f871e80c973bfeae71f04f7b59c69636` | [libatomic_ops header notice](atomic_ops.txt) |
| `urcu.h`, `raw-extracted/urcu-*.asm` | urcu/userspace-rcu, `645fdc9b720606440a3b1ed74ad394e8eaad796b` | Copyright notices in `urcu.h`; [Boehm-GC license](urcu-Boehm-GC.txt) |
| `libvsync.h`, `raw-extracted/libvsync-*.asm` | open-s4c/libvsync, `dd93f802704c9c941eb7397fa101039bf21118ff` | [vatomic MIT license](libvsync-vatomic.txt) |

`raw-extracted` contains excerpts extracted from these headers. Filenames
identify the source and starting line. These excerpts do not change ownership
or licensing; the corresponding full headers and notices accompany them.
`benchmarks/normalized.json` records the manual normalization of selected
upstream interfaces and their origins.

The official SV-COMP result table, task inventory, and extracted result rows
are preserved as research evidence, with source links in the research reports.
They describe upstream competition results, not new executions by this project.
Published papers and downloaded toolchain binaries are not redistributed here.

The `experiments/controlled-round` and `experiments/ck-provenance` source captures
also preserve the actual included CK, Clang resource and system C headers, with
their original notices, plus generated configuration and Clang AST/buffer views.
CK's original LICENSE/configure and exact file hashes accompany each successful
capture. Clang SDK package URLs/hashes are recorded in `ck-provenance/sdk-setup`;
the SDK packages and binary tools themselves remain excluded under `vendor`.
No captured header has been assigned the research prototype's licensing.
The corresponding [LGPL 2.1](LGPL-2.1.txt), [GPL 2](GPL-2.txt) texts and
[LLVM 21 package copyright/licenses](llvm21-package-copyright.txt) are included
for these captured headers; per-file notices determine which terms apply.

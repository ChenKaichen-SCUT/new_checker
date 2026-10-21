# Premise/check/TCB correspondence

| Level or condition | Independent evidence path | What it does not prove |
|---|---|---|
| Frozen denominator | `frozen-sites.json`: every actual inline-asm call in both original LLVM TUs, exact line/module digest, origin tuple, predeclared family predicate | Not 113 supported FAA calls |
| Original source capture | `third_party_ports.load_unit`: actual invocation receipt, compiler pin, all dependencies, whole raw AST asm census, SourceManager buffers, original upstream bytes | Compiler/observer semantic correctness remains Gamma_front/capture |
| Relative source paths | Resolve observer paths against the exact `wsl --cd` of the matching compiler command, then require captured dependency byte equality | No basename/text-similarity source selection |
| L1 | Original typed abstract port + independent block checker, saved universal SMT; optional in-run template proof reuse | No host expression evaluation, actual Q, or safety |
| L2 | Actual LLVM argument/tie/clobber/range parser, per-site actual fragment checker, fresh result/frame; pinned Clang syntax validation of the full candidate TU | No source-to-LLVM whole-host correctness; LLVM range/validity preconditions remain explicit |
| ITE export | Actual getCondition/getTrueCase/getFalseCase/getRegs and exact type/class; pure observer code | Exporter fidelity is still Gamma_capture, not mechanically proved Java |
| ITE interpretation | Recursive type/value/dependency checks, exact z3.If; all arms retained | Well-typed swapped branches need semantic comparison, not just serialization validity |
| L3 activation | `llvm_activation`: complete restricted main create/argument census, all worker definitions, all admitted LLVM effects and def-use; `program_workers`: actual creator/start/arg and every applicable call/endpoint/continuation | No arbitrary loops, recursion, callback instance induction or full worker C semantics |
| L3 global relation | Ordered exhaustive worker consumption; real RMW pair/A/RMW labels and separate response variables; dependent create/call union | Not independent rf/co choices for separate blocks; not a general nonbijective algorithm |
| L3 complete Q partition | Existing `program_main` checks all main/init/runtime/worker threads and lifecycle links before releasing L3; unexpected extra threads reject | This reuses the restricted main checker; it does not interpret the general worker C branch or provide full-client HCC |
| L4 | Recomputed original D2 source/LLVM host provider, actual main/worker checks, original C0–C4/query checker | Cannot be inferred from L3 or PASS |

L1/L2 support below the full-client host is intentionally conditional on defined
valid typed port entries. The artifacts retain original unused functions,
loops, syscalls and callbacks; we do not infer their correctness from local
results. A source compiler bug in host control/data flow remains outside L2.
L3 certificates name the actual finite LLVM activation domain and preserve
all required shared effects within it; this is not a claim about unverified
dynamic executions of arbitrary C host code.

The original eight Gamma strings are copied unchanged into controlled program
certificates. The new semantic code (ITE serialization/interpreter, range
parsing, site capture adapter and finite LLVM activation provider) increases
the implementation surface within the existing Gamma_check/capture boundary.
No new external semantic premise or verified host provider is added. Counting
fewer template SMT calls does not imply a smaller whole trusted implementation.

Old jars, snapshots, proofs and raw logs remain intact. A new positive jar and
a separate new negative jar use the same pinned upstream commit; 669 original
build input files are Git-blob checked. Positive hooks only observe. Negative
ITE branch faults mutate actual expressions before encoding; missing dependency,
wrong type and truncated-arm faults mutate only the test exporter serialization.
These categories are reported separately, and neither is called a real CK bug.

No persistent external `EXACT` JSON is trusted. The runner recomputes evidence;
certificates and hashes make the result reviewable, not magically self-proving.
Unknown/timeout and unsupported constructs reject their level. L4 always
requires the actual same-run safety/bound query, rather than a replay from a
different Program or the last UNSAT line.

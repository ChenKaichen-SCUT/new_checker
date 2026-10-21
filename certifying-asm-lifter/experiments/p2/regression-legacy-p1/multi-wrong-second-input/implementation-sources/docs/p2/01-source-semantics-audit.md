# Mixed ordinary-C / asm audit and explicit contraction

Baseline: `884c06a8d2076c8f9443bfbfc30637151d89c73d`. This audit precedes
implementation and new compiler/backend runs. Historical captures and theorem
files remain immutable. The new admission condition below supersedes their
use as evidence of source-program eligibility; it does not rewrite history.

## Five distinct semantic layers

1. ISO C11 N1570 5.1.2.4p25 makes unordered conflicting actions, at least one
   non-atomic, a data race with undefined behavior. GNU asm and pthread are
   extensions, so the whole CK program is not an ISO-only program. Replacing
   the asm by an imaginary C atomic operation still does not make a concurrent
   plain read atomic or establish happens-before. We cannot infer either an
   ISO C guarantee or a precise GNU mixed-memory guarantee from machine syntax.
   [WG14 draft](https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf)
   ([unaltered draft mirror](https://web.cs.dal.ca/~vlado/pl/C_Standard_2011-n1570.pdf)).
2. GNU `+m`, `+q`, volatile asm and `memory` describe operand effects and compiler
   constraints. A memory clobber is a compiler memory barrier, not a definition
   of C atomic objects or interthread synchronization. GCC documentation is
   evidence for the GNU interface, not a proof about Clang implementation.
   [Extended asm](https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html).
3. Pinned Clang 21.1.8 emits an ordinary `load i32` for `*p`, not `load atomic`.
   The LLVM concurrency guide distinguishes NotAtomic from atomic orderings;
   racing loads may yield undef. It also distinguishes volatile from atomic.
   The concrete preserved load in old captures establishes what this invocation
   emitted, not a compiler theorem that arbitrary mixed C/asm races are defined.
   [Exact version guide](https://github.com/llvm/llvm-project/blob/llvmorg-21.1.8/llvm/docs/Atomics.rst).
4. An aligned x86 locked XADD has hardware atomicity/ordering; this fact alone
   cannot repair a missing source-language contract. The existing reference
   interpreter and its bridge to TSO remain precisely Gamma_ISA.
5. Dat3M's pinned TSO CAT permits explicit ordinary read endpoints and locked
   pairs. It is a model of the extracted graph, not the definition of ISO C.
   A successful safety query says nothing about a source semantic premise that
   was never discharged. Gamma_encode is only an encoding inclusion contract.

The hybrid-model literature itself supplies nontrivial extra definitions and
compilation/optimization results. It cannot be silently substituted for the
semantics of our pinned Clang: no theorem connecting that implementation and
our GNU-interface interpretation to the paper's complete model has been proved.
[de Vilhena et al., extended C/C++ model](https://arxiv.org/html/2408.17208v1).

## Concrete failure of the former premise

In both old `ck-input.c` and `ck-multi.c`, main passes `&x` to both activations.
Their ordinary dereferences therefore read the same complete object that each
worker modifies by CK FAA. Main's later joins do not order the two workers'
earlier conflicting actions. The extra middle read in ck-multi has the same
problem. The source open-event proofs are valid **for their stipulated hardware
event extension**, but do not establish that actual GNU C mixed-race semantics
has that interpretation. Gamma_front and Gamma_domain explicitly demand defined
host operations/open compilation; the old checks did not establish applicability.

Consequently the old CONDITIONAL_SAFE files are retained as historical conditional
claims, not current C11-correctness evidence. Current admission must reject these
inputs with `MIXED_C_ASM_CONFLICT`. We neither assume them safe nor enlarge Gamma
to say that all racing ordinary C operations behave as TSO loads.

Analytic attack: place two plain reads of x in a worker while another increments
x. A hardware interpretation may distinguish the reads; a language/compiler
interpretation that does not promise racing ordinary loads can coalesce them or
give an undefined value. Seeing two loads on one compilation does not establish
the missing universal source contract. Adding volatile or choosing O0 cannot
prove that contract. An asm memory clobber in a different thread is not a source
happens-before edge. This is a counterexample to the *inference*, not a claimed
reproduction of a specific Clang miscompilation.

## Restricted repair, with no ninth Gamma

Check a global object-effect partition. R is the set of complete user objects
ordinarily read by any worker, W the set written by any admitted asm in any
worker. Require R intersect W empty. There are no worker ordinary writes, unknown
calls, pointer arithmetic, heap objects, callbacks, volatile accesses, atomics
outside the admitted interface, or unconsumed statements. Main initializes before
creation and reads only after joining every handle. All pointers are direct
complete-object addresses passed through checked void* round trips to the exact
canonical unsigned type. Check all object definitions, widths and all activations.

Distinct named global definitions establish distinct complete-object provenance;
they do not acquire distinctness merely because SMT object symbols differ.
Actual LLVM globals and Q objects/initialization are exhaustively related to
these definitions by retained C2. Static storage establishes lifetime; actual
alignment/width checks and existing ABI/domain Gamma establish valid accesses.
No runtime write to an input object is admitted anywhere. Read-only here denotes
an effect property of the whole execution, not the C `const` qualifier.

Create/join synchronization is the existing successful POSIX/runtime contract,
not a newly assumed fence or assertion.
[POSIX memory synchronization 4.15.2](https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/V1_chap04.html).
All new positives remain conditional GNU/x86 extension results under the eight
original Gamma contracts. They are not portable ISO C11 proofs, nor a proof of
Clang's complete mixed-language semantics. This restriction removes the specific
ordinary-C concurrent-conflict obstacle without pretending to solve that theory.

## Planned discriminating inputs

New files use x only for FAA during worker execution, and separate input_a/input_b
globals (initially 1 and 2) only for ordinary reads. The compiler receives original
CK and O1 as before. The worker parameter load and asm input must remain actual
nonliteral SSA. The closed harness has finite fixed initialization, whereas the
open equivalence proof quantifies over every typed entry/read response; we do not
claim an unbounded external-input harness. Distinct values across activations
exercise actual parameter binding rather than repeated copies of one constant.

Adversaries: pass &x instead; change input width; let another worker write the input;
silently omit that worker; bind Q's ThreadArgument to the wrong input; mix up the
two returns. A per-worker disjointness check alone is insufficient: cross-worker
union R/W and exhaustive source/target coverage are mandatory. No input-value
constraint inferred from backend safety is allowed.

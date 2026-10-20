# P1a: typed open entry binding

Baseline: `274a5a58c27637ab8d45a988c3be393aa981b913`.
Status: **sufficient-condition theorem; implementation conformance pending**.
This document neither changes D0 nor certifies an implementation by definition.
The original E2E-SAFE document and its eight Gamma contracts remain frozen.

## Restricted extension D1a

Keep x86-64 LP64, the pinned Clang and Dat3M TSO configuration, finite threads,
acyclic control, successful create/join, ordinary valid aligned unsigned WB
objects, and the original safety observations. Extend the checked host grammar
only by representable unsigned constant initializers, a thread argument equal
to a known global object's address (possibly through `void *`), and straight-line
worker declarations containing typed pointer copies, ordinary shared reads,
one call of the unchanged admitted CK wrapper, and equality/inequality monitors.
No pointer arithmetic, unknown alias, integer-pointer conversion, truncation,
uninitialized local, signed arithmetic, conditional source effect, recursion,
additional call, or unconsumed instruction is admitted. A pointer cast is admitted
only as the round trip of a known complete object's address, to its exact type.
All admitted objects and initializer definitions are checked, including objects
not occurring in the selected asm. Numeric addresses are not used to identify
objects; distinct complete objects have distinct provenance identities.

The increment must be an actual nonconstant LLVM SSA operand defined by an
ordinary shared read, not a fixed literal hidden behind a local name. This is
an acceptance-case requirement, not an assumption that the read is unconstrained
in a closed program. The open proof quantifies over all width-correct responses;
the closed execution later supplies the responses allowed by its one global
rf/co graph. No observed final value is an entry premise.

## Representation and independent obligations

For each thread activation, form a typed source effect word by interpreting
every source statement, not by selecting the asm-containing statement alone.
Values are constants, object identities, and typed expressions in fresh response
variables U_i. A read contributes R(object,width,U_i). An asm hole contributes
its interface inputs, then the reference interpreter's open event word and
outputs; a monitor contributes its Boolean predicate. Declaration identities,
not spellings, identify source locals. Calls substitute typed actual values into
the unchanged wrapper's formal declarations and check its complete body.

Interpret the actual LLVM body independently, consuming every instruction.
LLVM values are keyed by actual definitions and uses, not debug names. Each
ordinary read must match the next source effect and receives the same U_i;
the asm's actual operands must equal the independently evaluated C actuals.
The result SSA is assigned the reference result. Every monitor must agree
universally. Require unique definitions, definition before use, complete source
and LLVM effect consumption, and exhaustive calls to the wrapper. Source
locations authenticate origin and call context, but cannot justify a value
equality. Replacement still requires the existing independent block and LLVM
fragment checks and an unchanged host frame.

Interpret the complete actual worker Program separately. Bind the real
ThreadArgument's index and creator to the real ThreadCreate argument and to
the checked C/LLVM create, using the original runtime contract. For every
ordinary read, check the real address, width, tags and read result register.
Assign U_i to its actual writer. Pure events read this environment using their
exported expression trees. A RMW region consumes the reference event word:
execution condition, address, width, read/write value, A/RMW labels and the
actual paired-load identity must all agree. Record actual result definitions
and compare all subsequent monitor predicates. No `%x -> rx` rule is allowed.
All real user memory events and monitors must be consumed exactly once.

The entry relation R_i is the conjunction of (1) source/LLVM type and value
equalities, (2) actual Program register definitions interpreted from the prefix,
and (3) exact object provenance and thread-argument identity. It is a derived
relation, not a caller-supplied register map. Missing definitions, incompatible
types, ambiguous objects, extra effects, unconsumed uses and unsupported
expressions reject. SMT proves negated universal equalities UNSAT; SAT, UNKNOWN,
timeouts and missing obligations reject. Local certificates cannot release SAFE.

## Lemma 1: typed prefix relation

Assume the complete source, LLVM and Program prefix checks above hold and their
initial argument and object relations hold. For every typed response vector U,
all corresponding live values at the next hole/monitor agree and their shared
effect prefixes agree in order, addresses, widths, labels and values.

Proof by induction on the consumed source effect word, with finite stuttering
steps for pure target computations. Initially the checked create argument is
the identical object identity and type; constants have the checked widths.
For a pure definition, its operands already satisfy the induction relation;
the checked operator's deterministic semantics therefore gives the recorded
result. Definition-before-use and fresh definitions prevent reuse of an
unrelated entry value. An allowed pointer round trip preserves the originating
complete object and exact pointee type, so cannot introduce a new alias.
For a read, address/type/label checks identify the same effect and the common
fresh U_i gives equal results without assuming any closed-program read value.
A monitor has a universally equal predicate and adds no shared effect.
Complete consumption excludes an omitted source effect and an extra target
effect. Each case preserves the induction invariant. No induction step uses a
solver result about program safety. QED.

## Lemma 2: open hole substitution

Assume Lemma 1, checked original GNU operand constraints/clobbers, BLOCK_EXACT,
LLVM_FRAGMENT_EXACT and actual-region effect/output equalities for every typed
entry and open read response. Substitution of this hole preserves the prefix
relation and extends it to every live continuation value.

Proof. Instantiate the universally quantified block relation with the related
entry values obtained by Lemma 1. Instantiate its read variables with the next
fresh source responses, retaining the same variables in LLVM and Program.
Equality of the event fields gives an order-preserving endpoint bijection;
the checked actual RMW pair and A labels preserve indivisibility. Equality of
the returned scalar reestablishes the live-value relation. All other live values
are preserved by the unchanged frame and the exhaustive pure-definition check.
Thus Lemma 1 applies to the continuation. This is sequential substitution of
universal open relations, not independent existential choices of environments.
QED.

## Conditional D1a safety transfer

Let all original C0-C4 checks hold, replacing the old constant-only worker check
by the obligations above, and retaining exhaustive main, initialization,
lifecycle, runtime, monitor and query checks. Let the original eight Gamma
contracts hold with their original semantic content. If the actual same-run
safety and bound queries satisfy the original C4 authorization conditions, no
source user-assertion error prefix in D1a exists.

Proof. Suppose a legal source error prefix exists. Fix its entire graph,
including ordinary reads, locked reads/writes, initialization, lifecycle and
one common rf/co relation. Apply Lemmas 1 and 2 in every activation, using this
graph's responses, to obtain all actual user endpoints and monitor values.
Complete source/target effect partitions and lifecycle associations identify
every activation exactly once. Preserve per-thread endpoint order and the
actual RMW pair. Transport the single rf/co relation through this bijection;
same object, value and width checks preserve rf/co typing, and fr derived from
them is preserved. The pinned TSO relations and locked-operation constraints
are unchanged, so the transported graph is legal. Apply Gamma_runtime to add
the already checked private protocol. The identical failed monitor is an
actual Q error prefix. Gamma_encode makes the bound actual error query
satisfiable, contradicting its C4 UNSAT under Gamma_solve. The other original
Gamma contracts justify the capture, host/ISA interpretation and checker
implementation boundaries exactly as in E2E-SAFE. QED.

The theorem is conditional and does not prove Clang, Dat3M, the checker or the
solver. SAFE needs the source-to-Q error inclusion direction. A SAT query alone
does not establish a real source counterexample without the converse direction.

## Adversarial obligations and limits

Wrong entry SSA or wrong read writer violates prefix equality; a wrong increment
violates write equality; a lost read/write violates complete effect consumption;
a bad live result or assertion violates monitor equality; missing activations
violate lifecycle/coverage; a mismatched query violates unchanged C4. Equal
predicates on only the observed safe execution are insufficient: equations are
over all typed U. Prefix comparisons must not independently constrain reads to
make an erroneous conversion agree. An unsupported expression is a rejection,
not an additional Gamma assumption. Multi-call composition is outside D1a until
a separate proof and acceptance stage is completed.

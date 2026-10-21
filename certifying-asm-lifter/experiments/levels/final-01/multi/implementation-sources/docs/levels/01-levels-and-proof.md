# Four levels: claims, sufficient conditions and analytic proofs

Baseline 795e2a9ee95ba7446d4964430f7bda78bf6ddf76. This definition precedes
implementation. The original E2E-SAFE and eight Gamma are unchanged. Levels
are conjunctions of obligations, not scores inferred from solver PASS.

## L1: BLOCK_EXACT

An original GNU asm port A is abstracted by typed entry bitvectors X, valid
aligned WB addresses, and fresh open read responses U. L1 binds original AST
template/constraints/types to this abstraction and proves, for every legal X,U,
equality of the candidate Event IR's ordered effects, guards, widths, addresses,
values, RMW/fence footprint, clobber/frame and result vector. No compiler site
or host evaluation theorem follows. Unsupported flag-output interfaces, mixed
widths and unsupported instruction modes reject; a supported mnemonic alone
does not discharge the GNU interface. A template certificate can be reused
only under identical typed semantics and independently checked instantiation.

Proof: the independent reference/target symbolic interpreters produce exact
finite expressions in X,U in the admitted instruction domain. Each structural
field is checked directly and each value/guard equality is proved universally
by unsatisfiability of its negation under Gamma_check. Substitution of any
legal X,U preserves the equations. This is the existing open-block theorem,
not new ISA semantics or a new algorithm. Atomic response feasibility remains
the pinned ISA/TSO bridge; no independent local rf/co choices are introduced.

## L2: LLVM_SITE_EXACT

L1 plus an authenticated source/AST/actual LLVM capture; exact origin tuple
join to a unique original GCCAsmStmt; checked original operand types, ties,
clobbers and actual LLVM argument consumption; real replacement interval;
fresh definitions, same result SSA, actual fragment equality and exact
unchanged module frame. Scope is a named static LLVM port with its original
GNU origin. Macro/inlining duplication is allowed at this level: each actual
site has its own certificate, even when origin/template coincide.

L2 quantifies over **defined typed port inputs**, not all executions of the
C caller. Host C expression evaluation, pointer validity, C race freedom,
caller control flow and compiler metadata fidelity are not proved by L2.
The original Gamma_front/capture/ISA assumptions are recorded. LLVM range
attributes restrict the defined input domain; their literal widths/bounds
must be parsed exactly and recorded, never erased as if all inputs were
defined. The block theorem is universal and hence holds on this subdomain.
No claim is made about LLVM poison outside that domain.

Proof: origin/constraint checks identify the original port formal interface;
typed argument consumption supplies a substitution into L1. Independent
interpretation of the actual replacement proves the same effects/results for
that substitution. SSA freshness and the exact frame prevent capture or
alteration outside the interval, and the original result identifier preserves
all uses. Thus replacement is open-port exact at that site. This is not proof
that Clang computed the right input from arbitrary C host code. A malformed
LLVM operand binding, result copy or frame fails an independent obligation.

## L3: ACTUAL_Q_EXACT

L2 plus a declared activation domain recovered from actual inputs (not supplied
event maps), the same-run complete final Q, and universal per-activation checks
of typed entries, all associated effects and live continuations. The expected
domain must be enumerated or inductively characterized independently of the
regions found in Q. All selected static sites and applicable activations must
be covered, with injective event identities and no unexplained public effects
in the checked regions/connecting slices. Check cross-region order, shared
effects, conditional values/guards, actual RMW pairing, A and fence labels,
all returned values used by later calls/assertions and lifecycle argument ties.
Single-region success or incomplete coverage is NOT L3.

Implemented sufficient subclass: finite direct main create list, known typed
complete-object arguments, straight-line optimized LLVM workers, pure ADD,
icmp, zext and select, existing FAA sites and assertions; source asm calls
are unconditional direct statement initializers (no loop or nested asm call).
The select can originate from a C branch. The LLVM dependency slice is checked;
the whole worker's C branch semantics is not newly interpreted. The existing
restricted main checker may establish the finite create/argument census; this
does not certify the remainder of C. Declare the entire dependent union
`{(create, target worker, surviving LLVM site in target)}` in the certificate.
Reject loops, indirect activation, unconsumed LLVM instructions, missing or
extra Q events, unknown expression forms and incomplete serialization. Public
effects outside the declared scope are not silently included in the theorem.

Proof: induct over each finite LLVM worker's definition-use order with actual
entry objects and fresh read variables. Each ordinary read extends the paired
state with the same fresh variable. Pure steps preserve the paired relation
by expression induction; each asm uses the L2 universal certificate; actual
Q endpoints independently satisfy its labels, values, guards and result.
Continue through later calls and all uses, retaining all intervening effects.
Coverage over the independently derived create/call union ensures every
applicable activation is checked, rather than only discovered matches.
Disjoint endpoint IDs and ordered exhaustive consumption combine the maps.
For any single legal global environment graph, transport its rf/co through
this public-event map, retaining environment events. Equality of labels, po,
rmw, A and fence edges transports rf/co/fr and every pinned TSO relation;
a target forbidden cycle/pair violation pulls back to a source violation.
This establishes open correspondence for the stated LLVM/Q scope, under the
original applicable runtime/ISA/capture assumptions. It does NOT establish a
source C host simulation, all main properties, or error-query adequacy.

## L4: CONDITIONAL_SAFE

L1–L3 plus the unchanged C0–C4, full supported source/LLVM/Q host contract,
all actual monitors/lifecycle/initialization, same-run safety/property/
assumption/bound queries and sound UNSAT, under exactly the original eight
Gamma. UNKNOWN, timeout, a bound failure, missing query or unsupported source
semantics closes L4 while preserving completed lower levels.

Proof: apply the frozen E2E-SAFE theorem, whose proof constructs a target error
prefix for every source error prefix using full host and local correspondence
and a single rf/co. Gamma_encode then makes that actual query satisfiable,
contradicting sound bound UNSAT. The direction is source errors ⊆ target errors.
L3 lacks the host/error/query premises, so there is no L3⇒L4 rule. SAT binds a
target query; it does not by itself certify a source counterexample.

## ITE serialization/interpreter lemma

Pinned Dat3M ITEExpr has condition c, trueCase t, falseCase f; c is Boolean,
t/f have identical type, and its type is their type. Its encoder calls
`ifThenElse(encode(c), encode(t), encode(f))`. The exporter reads these exact
objects in this order and records their recursively complete types/operands
and the independently obtained register dependency set. The checker requires
exactly three operands, Boolean c, same result/branch sort, the actual Java
class/opcode and complete marker, and exact recursively reconstructed free
register dependencies. Missing/extra fields affecting this form reject.

Proof by structural induction: literals/registers are exact under the entry
environment; recursive operands preserve type and value. Split on the Boolean
value of c. For true, both semantics return t; for false, both return f.
Both arms remain serialized and dependency-checked even when one is unselected.
Thus the independent z3.If interpretation is exact for every well-typed state.
Dependencies are the union of the three recursive dependency sets. A swapped
arm can still be well-typed, so serialization alone cannot detect it: universal
LLVM→Q obligations must reject the changed expression. A missing dependency,
wrong type or truncated arm fails structural checks. Tests exercise these
conditions but do not replace this inductive proof or verify Java/Python code.

## Attacks and limits

Equal final memory cannot justify a missing shared write or fence. A-only and
pair-only faults must be distinguishable. Correct local blocks can be used
with wrong input/return or in an omitted activation; those are L2/L3 failures.
Correct L3 with a false assumption literal is an L4 failure. An incomplete Q
export blocks L3 regardless of PASS. A client containing loops/callbacks cannot
inherit fixed harness activation counts. All counts refer to the frozen site
denominator, including empty and unsupported asm; certified local sites never
count as certified complete clients. No new general HCC provider is assumed.

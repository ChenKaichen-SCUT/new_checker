# Property-directed certification: restricted model and closed conditional proof

Baseline `51d8c63c796877f7fa6fcb9d4d1195ac3cce68d2`, 2026-10-21.
This design and proof precede implementation. Original E2E-SAFE, L1–L4 and
the eight Gamma are not edited. No new semantic TCB premise is introduced.

## 1. Reuse, obstruction, and precise claim

Reuse the original authenticated P/AST/L/L'/same-run-Q chain, universal L1/L2,
typed source/LLVM expressions, actual Q expression interpretation, complete
event/activation/main/init/runtime partition, and exact query/bound binding.
The original E2E-SAFE transports **all** observed values through a bijection
preserving value labels. It cannot simply be invoked after skipping a write
value comparison. Ordinary backward slicing says nothing by itself about
extension to a single legal TSO graph. Unchecked source host code remains an
obstruction; property dependence does not make its compilation trustworthy.

We prove a different, explicitly property-indexed conclusion:

    for every legal finite source error prefix for phi,
    there exists a legal prefix of the actual full Q violating its bound property.

The prototype phi is exactly the conjunction of **all source user assertions**,
including each dynamic occurrence. Arbitrary external predicates or a chosen
subset are unsupported and reject. Q's property may additionally contain its
checked runtime monitors. Neither Q nor the solver query is sliced/replaced.
The assertion identities and actual query must be bound, not guessed by name.

The certificate is PROPERTY_OBSERVATION_TRANSFER; with the actual sound UNSAT
results it yields PROPERTY_CONDITIONAL_SAFE(phi). It does **not** assert full
L3 ACTUAL_Q_EXACT or original L4 CONDITIONAL_SAFE if a value equivalence was
omitted. A separate full check can establish those original levels.

## 2. Domain D_PD0 and mandatory frame F

Fixed original x86/TSO/LP64/domain contracts. Finite direct successful creates,
finite worker bodies, no loops/recursion/indirect activation, valid complete
nonaliasing unsigned 32/64-bit objects, immutable ordinary-C worker inputs,
no ordinary-C/asm conflict. Same unchanged CK FAA interfaces. All asm calls
are unconditional direct declaration initializers. Main has the existing
complete create/join/post-join observation grammar. No unmodeled calls, traps,
exceptions, poison flags, pointer arithmetic or mixed-width access.

The only new host syntax is unsigned modular addition and a pure conditional:
an eq/ne test on local values/literals, followed by finite assignments to
existing unsigned locals in either arm. No memory access, call, declaration,
assertion, activation or exit may occur in the arms or condition. Every source
statement is consumed. Optimized LLVM must have the complete admitted straight-
line load/FAA/add/icmp/zext/select/monitor sequence; a surviving CFG branch
rejects in this implementation. A symbolic merged environment z3.If(c,t,f)
is compared to the actual LLVM for all entries and open responses. Thus this
extension has a source/LLVM host proof, unlike the previous LLVM-only branch.

F is mandatory for **every** region, even one called irrelevant below:

- complete source and LLVM static sites and all create/site activations;
- same initialized objects, validity/width/interface, and exhaustive Q partition;
- same executed memory endpoint set, addresses, widths, read/write kinds,
  guards, A/RMW labels, actual pairs, fences and required full po/lifecycle;
- complete type/def-use interpretation, no hidden assume or filtering branch;
- all source/LLVM host equations, including asm operands and user conditions;
- actual source/Q monitor identity/condition equations and query binding.

In this initial implementation user memory operations are unconditional FAA
and immutable reads; explicit user Fence and conditional CAS reject rather
than being erased. Their structural necessity remains in the general F
definition. Runtime synchronization is always fully checked. A conditional
value is supported, a conditional memory event is not.

## 3. Omittable obligation and single-owner condition

Only source/LLVM-to-Q **FAA write-value equality obligations** may be omitted.
L1/L2 remain complete. The reference-return equation is still checked, but
does not by itself require a dead return to be property-relevant. Every actual
use of the return participates in dependency closure. No address, presence,
monitor, ordering, activation, runtime or query obligation can be omitted.

For an object o, Own(o,t) means: excluding its one initialization write, all
source and actual Q accesses to o belong to the **same dynamic worker t**;
main does not access o, no other activation accesses it, and all these accesses
are the admitted unconditional, fully paired FAAs. This is independently
checked against both complete access censuses. A static function name is not
ownership. A repeated worker using the same object destroys Own.

The object's address is a checked complete-object constant. Unknown alias,
unsupported expression or unresolved access never proves Own. Failed Own
causes all its write-value obligations to remain mandatory (or the enclosing
domain check rejects). The object can be globally declared; this rule proves
single-activation access, not C storage-class thread locality.

## 4. Dependency graph, roots, and checked boundary

After exhaustive symbolic source/LLVM/Q reconstruction, associate each ordinary
or RMW read response with a distinct typed variable R_i, and each FAA update
with W_j. Use both source and actual Q expressions, not just the generated IR.
Build edges in the direction consumer → required provider:

1. W_j → R_i for every free read variable in either update expression.
2. R_i → every W_j possibly accessing the same object. With checked constant
   object identities this is exact object equality; no assumed rf choice is used.
3. O_k → R_i for every free read variable in either side of an observable
   monitor or mandatory address/presence/lifecycle/control expression.
4. Source/LLVM and Q def-use are expanded through all typed pure expressions;
   ITE dependencies include condition and both arms. Unknown terms reject.

Seed all O_k and all W_j whose object fails Own. Close backwards to a finite
fixed point K. A single-owner object is eligible for omission only if **none**
of its read or write nodes is in K. The checker reconstructs edges and roots
and verifies root inclusion, closure, the full obligation census and every
proposed omission. A producer's graph/mapping is never trusted. Conservative
supersets are permitted; missing closure expands or rejects.

The boundary certificate identifies: all actual sites/activations/endpoints;
the relevant value nodes; the single-owner omitted-object access lists; every
selected equality and every replacement noninterference obligation. All
ordinary inputs entering either side are universally quantified, not fixed by
backend safety. Omitted values can depend on retained values; the reverse
flow is prohibited. All objects share one global rf/co graph throughout.

## 5. Proofs

### Lemma A: expression and pure-branch dependence

For the admitted total typed expressions, agreement on all free read variables
implies equal evaluation. Structural induction: constants/objects/variables
are immediate; modular ADD, casts and comparisons preserve equality; an ITE
has equal conditions, hence selects equal arms. No memory read or partial
operation is hidden inside these expression constructors. Pure source if
assignment is equivalent to merging each existing binding by ITE: take the
true/false source step and inspect the same arm; unchanged bindings use the
old value in both arms. Induct on finite arm assignments and then subsequent
statements. This establishes exact source/LLVM obligations without assuming
the source program safe or reclassifying Clang compilation as a new guarantee.

### Lemma B: closure soundness and noninterference

Every dependency path from a root belongs to K. Induct on path length: roots
are in K, and the checked edge-closure condition adds every next provider.
Termination of producer iteration follows because each increase adds a node
to a finite set. It is the least closed root superset by induction on iteration
against any closed superset; the checker need only require a closed superset.

Consequently no omitted-object response variable occurs in a retained update
or root expression: if it did, edge 1 or 3 would put its read in K, and edge 2
would put all that object's writes in K, contradicting eligibility. Lemma A
then proves that arbitrary changes of omitted-object values leave all boundary
expressions invariant. This is a proved boundary fact, not an assumption that
unmatched regions are harmless. A dependency introduced only by the target
also induces the edge and prevents omission.

### Lemma C: single-owner latest-write property

Fix a legal source TSO graph g and an owned object o. Its co is forced to agree
with owner-thread write po, following the fixed initialization: reversed writes
give a cycle in po-loc ∪ co. A read cannot read from a future own-thread write,
since that rf edge closes a cycle with po-loc. If it reads an older write w
while a later write v precedes the read in po, then co(w,v) gives fr(read,v),
which closes a cycle with po-loc(v,read). Thus each read gets the immediately
preceding write, or the initialization. For FAA, its own write follows its
read; source prefixes stop only at instruction boundaries. The result holds
independently of other threads and any TSO store-buffer interleaving.

This lemma fails for a multiwriter object: another thread can supply its read.
It also cannot justify deleting a locked operation: its ordering with accesses
to other objects persists even if its value is dead.

### Lemma D: value repair on the unchanged global graph

Take an arbitrary legal source graph/error prefix g. F gives the complete
endpoint map h, with kinds/addresses/widths/presence/order/atomicity/lifecycle
preserved. For retained/read-only objects keep source read/write values and
transport rf/co once through h. For every omitted single-owner object, keep
the very same rf/co endpoint edges and recompute target values in the finite
owner-thread order: initial value is unchanged, each read receives the latest
preceding recomputed write (Lemma C), and each write evaluates the actual
total Q expression. Interleaved omitted objects in one thread cause no cycle,
because their reads and local dependencies refer to earlier steps. Shared
retained inputs remain those chosen by g. This gives a well-defined valuation
for all Q locals and omitted endpoints, satisfying their actual expressions.

By Lemma B, retained update/monitor/structural expressions do not depend on
the repaired responses. Their independently checked universal equations hold
under this valuation. Source/LLVM exactness supplies the original P relation;
only the Q value equality of eligible writes was replaced by this construction.
No hypothetical erased target program is constructed or verified.

All rf edges now have matching values: on retained objects by equal source
values, on omitted objects by the repair. co and rf endpoint relations did not
change, hence neither did fr = rf^-1 ; co or their external restrictions. F
preserves po-loc, K, A, rmw and fences of the original fixed TSO axioms. A
forbidden cycle or atomicity pair after transport would therefore be the same
forbidden cycle/pair in g. Value labels are not tested by those relational
axioms except rf well-formedness already established. The actual Q graph is
legal. The original Gamma_runtime extends the user graph with the checked
private protocol; its full-environment premise is unchanged.

Roots include every user monitor and every path/activation restriction in the
admitted domain, so the same phi failure survives. Finite error prefixes are
handled by restricting this construction to the prefix and repairing completed
FAAs; there is no fairness, termination or future-success requirement. No
new invariant of a private object is assumed, and phi safety was never used.

### Theorem PD-SAFE and relation to E2E-SAFE

Under D_PD0 and the original applicable eight Gamma, if F, complete source/LLVM
host checking, the checked dependency/boundary certificate, all selected
equalities and same-run property/bound binding hold, every legal P error
prefix for phi has a legal error prefix of the full actual Q. Lemma D proves
the inclusion. If the actual bound safety query and required bound query are
sound UNSAT, Gamma_encode and Gamma_solve contradict such a Q error prefix.
Therefore P satisfies phi conditionally on those original Gamma.

If no equivalence obligation is omitted and the original domain/full host
conditions hold, the original E2E-SAFE proof can be applied unchanged. If an
omitted value is changed in Q, full observation equality may fail and the
original L3/L4 labels are not issued. This property-specific theorem is the
only new conclusion. It does not certify a target SAT as a source bug.

## 6. Analytic attacks and repairs

| Tempting omission | Minimal failure | Required repair |
|---|---|---|
| Dead FAA has no assertion/data successor, so erase it | In a store-buffering pattern `W(x); lock FAA(z); R(y)` paired with `W(y); lock FAA(w); R(x)`, A creates W→R order even when z/w values are unused | Retain all endpoints, A, po, pairs and fences; only values can be repaired |
| Independently choose each region's rf/co | Two fragments select mutually inconsistent read sources/orders; their union forms a forbidden cycle | Start with one legal source g and transport its full relations once |
| A private static variable in a worker is owned | Creating that worker twice gives two dynamic writers | Ownership is checked per dynamic activation on both sides |
| Inspect only source dependencies | Target mistakenly uses the dead RMW result in a live increment or monitor | Build dependence from both source and actual Q expressions |
| Ignore indirect/unknown addresses | A supposedly private write aliases observed x | Only checked complete objects; unknown expands/rejects |
| Ignore write presence or CAS outcome because value is dead | Conditional endpoint/pair and failed-CAS A ordering can change | Those obligations always remain; this prototype rejects conditional writes |
| Treat branch test as pure without inspecting it | Test reads a conflicting shared object or calls a callback | Recursively check the pure grammar and full C/LLVM effect census |
| Keep only matched instances | A missing worker erases the source's error-producing write | Independent create/site union and full Q partition are mandatory |
| Use backend PASS to justify a boundary | An unrelated UNSAT bound or false assumption literal hides a real error | Original exact property/safety/bound query binding remains mandatory |

These are logical counterexamples/derivations, not experiments. The proof is
closed for this narrow value-repair rule. General slicing of shared values,
event removal, loops, conditional activations and arbitrary host compilation
remain unproved and unsupported. This is not claimed as a new general method.

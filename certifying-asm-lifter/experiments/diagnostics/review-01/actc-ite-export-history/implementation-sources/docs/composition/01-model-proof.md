# Automatic compositional translation certification: restricted proof

Baseline `f5498b6213e0a4e2b5f51f57477cad271035c200`. This specification is
written before implementation. No PD-SAFE value repair is used. All write
values, public endpoints and user monitors must be preserved. Original
E2E-SAFE, L1–L4, historical proofs and the eight Gamma are unchanged.

## 1. Algorithm problem and admitted domain

Input: authenticated original P/dependencies/Clang AST, actual original L,
actual substituted L', complete same-run Dat3M Q and its actual safety query,
and phi = conjunction of all user assertions. Output: a proposed finite
correspondence/region/boundary certificate, or rejection. The independent
verifier must recover facts from these artifacts, not trust a producer's
summary, result, enumeration or supplied event graph.

D_AC0 has finite direct thread creation, successful create/join under the
original domain contract, no recursive/indirect calls, finite worker bodies,
constant complete nonaliasing valid objects, unsigned modular scalar values,
immutable ordinary-C inputs disjoint from asm-written objects, existing FAA
interfaces, and a completely consumed main/worker grammar. Pure source
branches may merge unsigned assignments; L may use select and Q may use ITE.
No source or target memory operation occurs conditionally in this initial
domain. No unknown LLVM operation, poison, partial function, extra assumption,
user fence, unsupported interface or omitted source statement is admitted.

This is a semantic correspondence engine over typed effect sequences, not
general C parsing. Reuse the existing strict source/LLVM/interface adapters;
their restrictions remain visible. Source provenance still requires checked
Clang origin tuples: missing/ambiguous origins reject. Direct source calls
are declaration initializers; arbitrary helper inlining is not solved here.
These are limitations, not new trusted assumptions or claims of coverage.

Each dynamic activation a has a source-derived identity (create occurrence,
worker definition, typed argument), independent of discovered Q instances.
Actual ThreadCreate/ThreadStart/ThreadArgument relationships establish its Q
identity. Static asm origin, LLVM site and activation are different objects.

## 2. Open effect summaries and complete region partition

Independently interpret each thread into an ordered finite sequence of units:
ordinary read; complete FAA read/write pair; user assertion. Runtime entry/
exit and main/init are separately checked, never silently discarded. A unit
has an identity, typed address/value/condition expressions and ordered public
endpoints. Each read introduces a fresh response variable U_(activation,unit).
Pure total calculations are substituted through the actual definition-use
chain. Q register definitions are versioned by event, so repeated names do
not merge definitions. Register names are never guessed from LLVM names.

Source/LLVM port results are represented by the corresponding read response;
the independent reference semantics must establish that result equation.
Thus a later call/assertion using a wrong backend return has a different
expression and cannot be hidden by relabelling an output register.

A candidate maps all source units bijectively onto all Q public units of the
same activation. It preserves unit order, kind, width, address and endpoint
shape. Actual RMW pairs/A tags are independently checked before mapping.
In this event-preserving straight-line subclass, a total order-preserving
bijection is rank-determined. Do not advertise this as general matching search.
The challenge implemented here is complete independent fact recovery and
proof-carrying boundaries, not an invented ambiguous graph-alignment solver.

A region is a nonempty contiguous interval of units plus its intervening pure
Q nodes. No pair may cross a cut; all nodes, including trailing pure nodes,
belong to exactly one region. A plan may merge adjacent regions. For each
region derive input ports from the union of BOTH sides' free read responses
defined before the region and used inside it. Output ports are its responses
used by any later region on either side. Include all such crossing dependency
edges in the certificate. Object symbols are fixed typed identities, not
arbitrary aliases. A later region cannot assume an unproved output from a
future region; every dependency must be earlier or its own RMW response.

Boundary relation I_k equates paired response histories still needed after
cut k and their actual pure expressions. It need not equate dead pure local
variables or use the same register vocabulary. These response relations are
established by matched reads, not assumed because they make a formula UNSAT.

## 3. Independent obligations

F0: current P/AST/L/L'/Q/config/model/query identity; exhaustive original sites,
source/LLVM function/activation census, and actual source argument semantics.
F1: L1/L2 at every static site; complete unchanged L' module frame and fresh
SSA; exact pure branch/selection semantics under all open responses.
F2: independently enumerate Q nodes, dependencies and real pairs; all explicit
input bindings and thread creator links checked. Partition entire Q into
disjoint main, worker and initialization sets; runtime objects do not alias
user objects. Unknown nodes/tags/fields reject.
F3: total injective ordered unit mapping; complete contiguous region coverage;
exact crossing port/dependency census, types and prior-definition causality.
F4: for each region, universally equal addresses, writes, read/result interface,
conditions/monitors and frame under its paired typed input ports and fresh
internal read responses. These are independent obligations, not obtained from
the backend's safety model. No value equality may be omitted.
F5: full po, RMW/A/fence/lifecycle/guard preservation and correct observation
identity; actual C0–C4 query/bound binding and the unchanged applicable Gamma.

All memory effects remain explicit even when no assertion depends on them.
No region chooses rf/co or uses a local safety result to restrict its inputs.
F2's complete runtime protocol shape is checked by existing machinery; its
semantic prefix adequacy is still Gamma_runtime, not proved by this theorem.

## 4. Lemmas and proofs

**Typed summary lemma.** The summary of a consumed finite sequence is its open
semantics for every typed entry and read-response assignment. Proof by finite
instruction induction. Constants/objects/variables use their independently
typed definitions. A pure total constructor preserves the meaning of its
subexpressions by structural induction. An ITE evaluates its Boolean condition
and exactly the corresponding arm; both arms/types/dependencies are inspected.
Source pure if assignments have the same merged environment by splitting on
the condition and inducting over assignments. A read creates one fresh variable
of its actual width and updates only its actual destination version. A write
or assertion emits the evaluated expression. No unmatched/unknown instruction
is consumed as silent. This proves the summary, including intermediate effects,
not just final return equality. The existing ISA and source-adapter premises
are explicit; this does not prove all Clang transformations.

**Boundary completeness lemma.** Every cross-region value dependency occurs in
the reconstructed ports. For any expression at a use, unfold its finite def-use
chain. Every leaf is a constant/object, a prior response, or that unit's RMW
response; unknown leaves reject. Structural induction finds every response
leaf. Checking both sides includes a target-introduced dependency. Classify
the producer relative to the partition: same region is internal; earlier is
an input port, and the producer region exports it; future is forbidden.
Therefore equal paired input responses imply equality of all corresponding
pure values needed by a proved region. Missing a proposal edge cannot change
this classification because the verifier reconstructs it independently. QED.

**Open regional composition lemma.** F1–F4 give equal ordered public histories
and all assertion observations for any finite open thread path. Induct over
the region order. At entry, typed arguments/objects match. Supply the source
region's arbitrary read responses to its mapped Q reads; F4 gives equal
effects/observations and paired exports. Boundary completeness makes exactly
these exports available to every consumer. Hence I_(k+1) holds. No circular
assumption is used: the region dependency graph is ordered by its index, and
fresh reads are supplied by the same global environment only in the next
lemma. Merging adjacent regions is sound by this induction. Keeping distinct
regions does not license reuse of one activation's endpoint identities. QED.

**Coverage lemma.** The independently source-enumerated create×call dependent
union, actual bidirectional creator/start checks, total unit maps and disjoint
full Q partition account for every applicable operation exactly once. Proof:
finite induction on source creation order establishes one distinct actual
thread per create; source/LLVM full statement consumption enumerates every
unit per activation. A bijection covers all units on both sides. Their disjoint
endpoint ownership and exhaustive main/runtime/init partition cover the Q
event domain. This proves more than equality of counts. Source control branches
in D_AC0 are pure and introduce no path-dependent occurrence. QED.

**Global TSO lemma.** Take one arbitrary legal source execution/error prefix;
fix its rf/co once. The previous lemmas give a total public endpoint map h
preserving address, value, width, po, RMW pairs, A/fence and lifecycle. Transport
rf/co through h. Unique supply and per-object write order remain valid, and
fr = rf^-1;co transports because inverse/composition commute with a bijection.
So do po-loc and external restrictions. A prohibited cycle or atomicity edge
in the target fixed CAT pulls back to the identical source violation. All
regions and threads use this one transported graph, not pairwise compatible
but globally inconsistent choices. Actual private protocol realization still
uses the original Gamma_runtime prefix contract; no equality of node counts
between an unexpanded source graph and complete runtime Q is asserted. QED.

**ACTC-TRANSFER.** In D_AC0, if F0–F5's structural/semantic checks hold under
the original applicable Gamma, every legal finite source error prefix has a
legal error prefix of the complete actual Q with the same user error:

    forall input i, g in Exec_T(P,i):
      Bad_phi(g) implies exists g' in Exec_T(Q,i): same_error(g,g').

Proof: instantiate the open composition lemma on the source prefix, apply
coverage and the global TSO lemma. Retain every intermediate user assertion;
no future successful join/assume/termination is required to excuse an earlier
error. The original runtime/encoding prefix clauses apply unchanged. The
source is not assumed safe. With correctly bound sound UNSAT safety/bound
queries, ENC-minus yields a contradiction if such a source error exists.
The certificate label is `COMPOSITIONAL_TRANSFER_EXACT`; a separate
`ACTC_CONDITIONAL_SAFE` consumes C4 and lists all eight Gamma. These labels do
not automatically issue original L3/L4, though a separate complete check may.
Backend SAT alone remains an unconfirmed source counterexample. QED.

## 5. Termination, limits and attacks

Finite AST/LLVM/Q and fixed expression grammar make fact recovery terminate.
Finite effect sequences, region intervals and dependency edges make plan
generation/checking terminate. SMT is bounded by timeout; UNKNOWN/timeout
reject. This is sound but incomplete. Expanded expression size may be
exponential; use DAG sharing where possible, and state costs in expanded size
without claiming measured speedup. Mapping/order/partition checks are linear
after indexing; dependency construction is polynomial in expanded input.

Loops need an inductive phase/response/object relation covering every finite
error prefix. Indirect calls need a complete target set and summary per target.
Conditional events need guard-equivalent exhaustive path covers and partial
endpoint maps. Unknown aliases need validity/separation proofs or complete
may-alias reasoning. None is inferred from observed Q counts. This prototype
rejects them; bounded unrolling is not that missing proof.

Minimal attacks: swapping return uses changes a later write/monitor formula;
omitting a shared write violates the effect census; deleting A or pair metadata
violates shape; mapping two calls to one pair violates injectivity; omitting
an activation violates the independent source census; hiding an ITE condition
violates ports or semantic equality; missing an unused pure node violates the
partition; false query assumptions fail C4. Removing synchronization can
change equivalence even if one safety-inclusion direction survives; this
fixed-structure rule rejects either change, without claiming every weakening
necessarily causes unsound SAFE. These arguments precede experiments.

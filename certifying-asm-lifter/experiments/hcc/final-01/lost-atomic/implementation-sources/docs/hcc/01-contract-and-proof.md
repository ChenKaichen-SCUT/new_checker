# Scheme A: open host contracts and a restricted composition proof

Baseline: `8412b600293161e173ed7f7b94bb3c316d46f796`.
Status: analytic conditional theorem; not a verified Clang/Dat3M theorem.
Written before the prototype. The frozen E2E-SAFE theorem is not amended.

## 1. Objects, domain and direction

Fix the original x86-64 LP64, aligned valid ordinary WB object domain and
the pinned TSO CAT interpretation. Source semantics is the restricted defined
GNU/x86 extension of D2, **not** arbitrary ISO C with race undefined behavior.
The ordinary/asm conflict exclusion remains a necessary applicability premise.
Let `P=C[A_i]` be a typed host with finitely many *static* ports i, and
`P'=C[B_i]` its conceptual replacement. In the implementation B is LLVM,
so P' is a semantic construction, not a claim that emitted C exists.
Let L be the actual Clang module and Q the same-run final Dat3M Program.
There are separate source-to-L and transformed-L-to-Q host bridges.

A port signature contains input/output bit widths, complete-object identities,
validity/alignment/alias predicates, clobber/frame obligations, public read/write
and RMW/fence capabilities, and permitted entry/return control locations.
An activation is `(thread genealogy, static port, occurrence ordinal)`; this
is not a source line, LLVM SSA name, or backend event ID. Each occurrence has
fresh local response variables. Two occurrences may share a template proof,
but never their entry values, event identities or instantiation obligations.

The observable trace consists of public memory events with address, width,
value, presence, RMW partner, A label and order, port calls/returns with typed
values, lifecycle actions, and user assertion/error labels. Internal pure
calculations may stutter. Runtime private events require the unchanged
Gamma_runtime projection; they cannot simply be deleted by a new HCC.
Observations include **every finite error prefix**, even if a later assumption
fails or a join does not complete. We prove source-error inclusion in Q-error,
the direction needed to infer source safety from target safety. Conventional
target-in-source compiler refinement alone is insufficient.

## 2. HCC is an open transition contract, not a safety premise

Erase each asm body, retaining typed call/return ports and declared effects.
For each host bridge X→Y, provide a relation I on host states and a monotonically
extended identity map for allocated objects, threads and port occurrences.
States include locals, control location, live objects and pending port phases.
Open transitions emit host effects or port requests and accept arbitrary typed
memory responses and port returns. They do not ask whether the filled program
is safe. External choices are indexed by event identity, not by one globally
chosen scalar response reused at every load.

**Quantifiers:** for every legal initial input/heap, every related pair of
initial states, every finite source host path, every sequence of well-typed port
returns/effect histories satisfying the port signature, and every concurrent
environment compatible with the object and lifecycle domain, the following
step conditions hold. The relation and its evidence are fixed before choosing
that execution. No premise may mention backend PASS, UNSAT, source safety, or
the semantic correctness of A→B. Supply two such contracts, for the actual
source/L and L/Q artifacts, with the following clauses:

H1. **Initialization and objects.** Initial states are related; object maps are
injective on simultaneously live distinct objects, preserve width/alignment,
initial values and lifetime, and preserve required alias and race exclusions.

H2. **Host steps.** From any related states, each source host transition has
a finite target path with the same public host effect, assertion/error and
lifecycle label, or only silent steps if source silent. Its terminal states
are related. All intermediate target steps are silent except the matched
label. Response and object maps agree. No target assume may prevent a source
step. This is a *local transition simulation obligation*, not a requirement
to solve a filled program. For exact public coverage, unmatched target public
steps on the covered paths are forbidden; extra target behaviors elsewhere
are immaterial for the one-way safety result but not claimed equivalent.

H3. **Ports and frame.** Each reachable source call has exactly one corresponding
target call with the same typed inputs and object relation. For **every**
permitted output/effect history the continuations satisfy I, including values
used in branches, later asm inputs and assertions. No capture of private
locals or unlisted effect is allowed. Calls may not be silently dropped.
Every replacement site in the actual module has a port certificate or rejects.

H4. **Order and shared environment.** The host simulation preserves thread
order between public events and port boundaries, including events of two
different ports; also conditional presence, fence edges, A labels and complete
RMW partners. No pair crosses a boundary unless explicitly included in the
signature and checked; this prototype forbids such pairs. Host steps cannot
move across a port merely because its final memory value agrees. All host and
port events use **one** execution-wide rf/co witness, never per-port witnesses.

H5. **Coverage.** State I includes pending-call phase and a monotone occurrence
counter per thread/port. The step clauses match creates, starts, calls, returns
and errors for every reachable branch. Occurrences map injectively; all
source public effects on the witnessed execution and all target effects on
its corresponding paths are accounted for by host or port, disjointly. Static
census is exhaustive, not a list of sites supplied by a user. Counts alone do
not imply coverage. Finite D2 has an exhaustively checked dependent union of
creates and calls; a looping provider would need an inductive phase invariant.

H6. **Prefixes.** The relation is established at the beginning and preserved
after each transition, not only normal function return. A finite source error
can be matched by a finite target path without requiring future returns,
termination, fairness or successful completion of another thread. Matching
paths have finite witnesses; target silent divergence is not an alternative.

H7. **Evidence applicability.** Artifacts, compiler configuration, source
dependencies, replacement intervals, model, actual Q and runtime are bound to
the evidence. A different compilation cannot inherit a provider's result.
Each H1–H6 clause needs checker evidence, a named verified provider with matching
theorem/domain/direction, or an explicit unresolved status. A declaration or
hash is not such evidence. The original eight Gamma remain visibly assumed.

H8. **Query interface.** Export the complete assertion/error identity map and
bound applicability to C4. Then C4 independently checks the actual Task, property,
assumption literal, solver stack, error/bound queries and their results.
HCC does not include an UNSAT assertion. Missing/unknown/timeout rejects SAFE.

These are noncircular: the erased host can be checked with adversarial port
returns without ever interpreting the port implementation or knowing a safety
property outcome. They are nevertheless substantial obligations. Merely moving
them from an interpreter into a declaration would enlarge the unverified TCB.
No literature theorem is claimed to discharge them for actual Clang+Dat3M.

## 3. Local sufficient condition and proof reuse

L1: for every typed valid entry X and independently quantified sequence U of
open read responses, A and B emit the same ordered canonical public endpoint
history, guards, values and outputs, modulo fresh identities. Complete RMWs
are represented by read/write endpoints; conditional writes keep their guard,
and failed locked CAS keeps its required atomic/order semantics. Pure internal
steps are unobservable. Intermediate public cutpoints, not just final values,
are compared. Fence/order footprint must be identical. This is deliberately a
restricted event-preserving condition, not general nonbijective synthesis.

L2: each actual LLVM site and Q occurrence independently verifies typed entry
binding, actual fragment, event presence, address/value/width, A/pair/order,
return substitution and disjoint complete coverage. The prototype only admits
the already supported FAA template on the program-SAFE path. Mentioning CAS
in L1 does not implement or admit additional CAS hosts.

**Reuse lemma.** If a checked template satisfies L1 universally, capture-avoiding
typed substitution of any valid entry and fresh U into it satisfies the same
equalities. Proof: universal instantiation preserves each equality/guard
implication; renaming fresh bound variables preserves truth. In particular
the second call can receive the first output: substitute that expression for
its input, while keeping its own U fresh. No assertion about the distribution
of U or a previous solver outcome is introduced. Each concrete LLVM/Q binding
still requires L2; a cached template says nothing about those bindings. QED.

## 4. Composition theorem and complete analytic proof

**HCC-SAFE (restricted sufficient condition).** Suppose H1–H8 hold for both
bridges, L1–L2 hold for all ports/occurrences, C0 binds actual artifacts, C3's
global partition holds, and all original Gamma apply. Then
`BadPrefix_TSO(P) ⊆ BadPrefix_TSO(Q)` under the observation maps. If C4 binds
sound UNSAT of the actual safety and adequate bound queries, P has no user
assertion error prefix in that domain. This does not assert unconditional C11
safety, actual source validity from a SAT query, liveness, or compiler correctness.

Proof. Choose any source execution witnessing a finite error. Its finite
prefix contains finitely many transitions and port occurrences, even if the
program contains loops. Its objects, rf/co, guard outcomes and response values
are fixed *once*, globally. By H1 choose related initial host states. Induct
over this particular finite path: a host step is matched by the finite witness
of H2; a port entry by H3/H5; each public port cutpoint by L1 instantiated with
the actual entry and responses; and its return by L1 outputs and H3's universal
continuation condition. The induction does not assume a fixed bound, normal
termination or a favorable return. H6 preserves an error as soon as it occurs.
H5 gives fresh occurrence identities and accounts for every traversed branch;
H4 gives the cross-boundary order. A suspended port in another thread can be
represented up to its last public cutpoint; a locked atomic operation is a
single source transition and its endpoint representation is governed by
Gamma_ISA. No error is generated inside the accepted pure/FAA fragment.

Combine the host and port maps. They agree on boundaries and objects, and
are disjoint on internal event identities by H3/H5 and L2. Thus their union f
is a bijection on public endpoints of the two witnessed paths (after canonical
RMW expansion, not necessarily on raw AST/LLVM/Q instructions). It preserves
labels, po, A, fence edges and rmw. Transport the *one chosen* rf and co through
f, including initialization and cross-thread/host-to-port edges. Types, values
and addresses agree by H1/L1/H2; co remains a strict per-location order and
rf remains a same-address/value source for every read. No independent local
rf/co choices are combined. By elementary relational algebra, f commutes
with inverse, composition, union, intersection and restriction by preserved
labels/thread identities. Therefore fr, po-loc, rfe/fre/coe and the original
TSO K relation are transported exactly. A cycle in any target TSO acyclicity
constraint would pull back to a source cycle; a forbidden rmw∩(fre;coe)
edge would pull back to a source violation. The target graph is legal.
The runtime projection and prefix realizability are supplied only by the
unchanged applicable Gamma_runtime/ISA, not inferred from graph labels alone.

Repeat this argument for the second open host bridge, composing the identity
and observation maps. The result is an actual Q error prefix. H8 and C4 together
with Gamma_encode imply satisfiability of the very safety query whose UNSAT
is bound. Gamma_solve (and Gamma_check for checks) excludes that conjunction.
Hence no chosen source error exists. Since the source prefix was arbitrary,
the inclusion and safety claim follow. QED.

**Loops.** The induction above is over arbitrary finite prefixes, and is sound
for loops only if a provider proves H1 initially and H2–H6 invariantly at all
loop headers, phase boundaries and backedges, plus adequate C4 bound treatment.
Finite witnesses for each step suffice; termination of the whole program is
not required for safety. This is a closed conditional theorem, **not an
implemented loop guarantee**. D2 has no loops; this prototype has no invariant
provider or unbounded query encoder proof. It rejects looping program SAFE.
An unroll bound, tests or a caller-supplied `inductive=true` cannot discharge H5.

## 5. Attacks on weakened conditions

- **Wrong direction:** source allows x=1 then x=2, target deletes the first
  write. A concurrent observer may detect 1 and fail only in source. Standard
  optimization refinement does not transfer target SAFE back to source.
- **Independent environments:** choosing a different rf witness for each
  fragment can make each local equality feasible while the combined co/fr
  constraints form a cycle. Our proof transports one source graph instead.
- **Dropped intermediate write / fence / A:** equal final values do not
  preserve histories or TSO K; store-buffering outcomes distinguish a lost
  fence, and intervening writes distinguish a split non-atomic RMW.
- **CAS failure:** removing a guarded successful store is not enough; the read,
  returned accumulator and locked ordering survive failure. L1 checks them.
- **Wrong cache key:** same assembly spelling with a different width, IR,
  semantics version or clobber/interface cannot inherit all its obligations.
  Template reuse covers block equality only; interface/frame remain per-site.
- **Swapped results / omitted second occurrence:** independent template proofs
  can both pass while H3/H5 and actual continuation/coverage fail.
- **End-state-only HCC:** `assert(false); assume(false);` can appear safe after
  completed-path pruning. H6 and Gamma_encode are essential and still external
  in their stated encoding/runtime scope.
- **Self-attestation:** a JSON HCC asserting H1–H8 with a source hash cannot
  establish them. No such provider is admitted by the prototype.

The proof uses standard universal instantiation, simulation induction and
event-preserving TSO transport. It is not an independent novel algorithm.

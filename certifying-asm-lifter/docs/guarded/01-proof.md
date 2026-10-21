# Finite path-product certification: specification before implementation

Baseline ebbe82856ea15e31b6ff5da352ee9ae51e0b08b9. Original theorems,
eight Gamma, L1-L4 and diagnostic paths are immutable. No SAFE API is added.

## Domain and semantic objects

D_G1 consists of finite acyclic direct workers, unsigned 32-bit total scalar
operations, complete disjoint aligned globals, immutable ordinary-read inputs,
unconditional FAA instructions possibly inside source/control branches, null
worker returns and user monitors. Main has finite creates, matching joins and
post-join monitors. No loops, indirect calls, UB, unknown aliases or fences are
silently abstracted. An unsupported construct on ANY syntactic path rejects.
The first controlled cases use the existing direct GNU FAA interface. This
does not enlarge the old GNU/CK acceptance path.

Each independently extracted finite transition tree has pure assignments,
two-way guarded branches, public R/W/O endpoints and terminal return. Shared
events are never silent. Inlining substitutes typed actuals into a checked
complete helper body. LLVM phi is evaluated on its actual predecessor, never
by picking an arbitrary incoming value. Q jumps follow actual jump/successor
edges. All CFG nodes and edges are checked for closed targets and acyclicity;
path enumeration visits both branch edges even when infeasible. No SAT-based
path pruning is necessary. Captures/expressions with incomplete fields reject.

A path summary is (guard, endpoints, definitions, original-node identities).
Each executed read has one fresh response. Only defined, correctly typed
values may be evaluated on that path. A branch is forked AFTER its condition
has been evaluated; phi and C assignments use path-local environments. Thus
no inactive read is filled with an arbitrary value. Static event identity is
separate from the path occurrence. Mutually exclusive copies may share an
active ordinal but are different potential events.

## Algorithm (no static permutation search)

For each source path s, construct the product with every target path t. Walk
their public histories synchronously. A type/width/count conflict contributes
false; otherwise align their next actually executed endpoints, substitute
paired read responses, and conjoin target guard, fields, labels, and both-way
RMW-pair/order checks. Pure instructions have already been interpreted on the
two paths, independently. The resulting relation is F_st. Its map is derived
from the product, not a supplied event list or a global static rank map.

    Bad_s = D_source AND guard_s AND NOT (OR_t F_st)

UNSAT for every s establishes forall source inputs/responses/path, exists a
target path and active correspondence. It does NOT establish one uniform
static map. SAT yields an open witness only after independent reconstruction
and proof that EVERY target path fails for that same source witness. All
target path variables remaining existential must be eliminated/checked; the
initial total deterministic subset has only paired reads. Count conflicts
cannot erase alternatives. Resource exhaustion is UNKNOWN, never difference.
Reverse inclusion is a separate run. Certificates contain raw hashes, paths,
guard formulas, product edges and SMT, but none is trusted by the checker.

## Analytic proofs

**Extraction lemma.** By structural induction on the accepted C statement
grammar, assignment evaluates its checked typed expression and updates only
its declaration; sequence composes the induction hypotheses; if evaluates a
defined condition and has exactly its true/false branches; a helper call uses
checked type substitution and its complete FAA/return body. Reads, FAA and
monitors append exactly their specified public effects. Return is terminal.
For LLVM/Q use induction on the DAG height and the same expression induction:
phi selects the unique actual predecessor, a conditional edge partitions all
states, unconditional edges are exhaustive, and no unsupported node is skipped.
Every finite legal run follows exactly one enumerated path; conversely each
satisfiable path summary realizes that open run. Undefined uses reject before
formulas are generated, so no inactive value can affect an active expression.
The proof is for the stated grammar; actual adapters must implement each case
and check raw-object completeness. It is not a compiler correctness axiom.

**Product completeness.** Fix a source and target active history. Their total
public orders force the next active endpoint correspondence, by induction on
history length. This does not constrain which static branch copy is active.
Complete path extraction includes the target history's path. The product with
that path therefore contains its only possible order-preserving history map.
The three structural pruning rules (sort, width, length) cannot remove an
isomorphism. No value/metadata heuristic prunes candidates.

**Formula adequacy.** Paired reads give a well-typed injective response
substitution. Induction through the two active sequences proves equality of
evaluated fields exactly when each corresponding conjunct holds. Checks in
both directions preserve actual pairs and labels, not just final arithmetic.
Target guard asserts that the selected target path is legal under those same
responses. Return and monitor conditions remain explicit observations.

**G1-INCLUSION/G1-DIFF.** If every Bad_s is UNSAT, arbitrary source execution
chooses a source path by extraction; the disjunction supplies a legal matching
target path by adequacy. Conversely a rechecked SAT witness satisfies source
guard and defeats every target path, contradicting any matching history by
product completeness. This is exact OPEN history inclusion/difference, not
contextual equivalence under every weaker compiler observation. Queries must
retain the SOURCE domain; target assumptions cannot discard source inputs.

**Termination.** Acyclic finite CFGs have finitely many paths. Finite product
construction terminates; paths can be exponential. Declared node/path limits
and solver timeout return UNKNOWN/UNSUPPORTED. This is not a polynomial-cost
claim and not an invention of symbolic product verification.

## Global compatibility and optional concretization

A matching family can transport ONE global source rf/co; fr is derived, not
chosen per path. Preserved addresses/values/order/pair/A/fences and complete
activation/host boundaries preserve each base relation used by the fixed CAT,
then union/composition/transitive closure preserve the CAT predicates. This
conditional transport needs all original host/runtime assumptions; the local
detector does not claim them automatically.

For a claimed CLOSED counterexample independently construct a legal finite
source execution satisfying initialization, all source paths, activation and
the SAME global rf/co/fr and fixed TSO axioms. Bind its open witness values,
or explicitly record that a different reachable open witness was searched.
UNSAT means that particular open witness is unreachable, not that all possible
differences are unreachable. SAT alone gives reachable source behavior, not a
translation error. Additionally prove UNSAT for all legal target executions
with the SAME declared observation. Target UNSAT must use a complete bound
and a checked query/monitor binding; a single unequal source-target pair is
insufficient. The initial implemented observation may be the Boolean user
error observation, explicitly narrower than full final-state equivalence.

**Concretization theorem.** A checked source graph supplies an execution by
faithful finite source extraction and exact CAT validation. A complete target
encoding whose observation-match formula is UNSAT excludes all target runs
with that observation under the ORIGINAL applicable capture/encode/solver and
runtime contracts. Thus source-observation is absent in target. If target
coverage/encoding binding is missing return REACHABLE_SOURCE_ONLY or UNKNOWN.
This is conditional on existing Gamma, not unqualified C/ISA correctness.
No source safety is assumed. A source error is a separate observation predicate.

Implementation must either discharge these source/global/target obligations
or keep CLOSED_DIFFERENCE unavailable. No new HCC/encoder assumption is allowed.

## Attacks and novelty gate

Two source exclusive FAA calls merged to one target call require different
static maps across inputs; one fixed map must fail. A missing branch must not
be hidden by assuming its guard false. A late/undefined phi input, duplicated
active read, wrong guard/operand/output/pair/A, target-only assumption, missing
worker and query mismatch each invalidate an explicit premise. An open read
of 7 with initial x=0 and one FAA can be unreachable. A source failure and one
target success do not exclude another target failure.

This path product can yield capability beyond the old fixed sequence adapter,
but ordinary symbolic products and relational path validation are established
techniques. Functional increment is not independent algorithm novelty. Go/No-Go
requires same-object ablation and an honest existing-method comparison.

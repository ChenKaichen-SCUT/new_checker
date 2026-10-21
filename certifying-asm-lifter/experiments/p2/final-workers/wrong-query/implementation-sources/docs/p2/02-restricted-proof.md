# Conflict-free inputs and distinct-worker composition

Status: analytic sufficient-condition proof, written before implementation.
This is an amendment of applicability and finite composition, not a new general
correspondence algorithm. Original E2E-SAFE, C0-C4 and all eight Gamma are unchanged.

## Domain and acceptance obligations

D2 retains the previous finite straight-line grammar: one main, one or two
worker definitions, at most two surviving static calls of the same original CK
FAA wrapper, any admitted finite create list, and no additional user functions.
Every worker definition has at least one call, is created at least once, and is
fully interpreted. Each source create is identified by its statement/handle,
target declaration and typed complete-object argument. Distinct creates may
have different arguments. No branches, loops, arithmetic extensions, new ISA,
unknown pointer, external mutation, or unconsumed operation are added.

Additional checks:

- **S1:** complete-object types/lifetimes/initializers, exact pointer round trips;
  global R/W disjointness as in the audit; main reads only after all joins.
- **S2:** exhaustive source calls and actual LLVM asm sites are joined by the
  existing independently checked macro/inline lineage, including the worker
  declaration. Require unique matching and a full bijection; metadata still
  uses the original Gamma_front/capture. Duplicate/missing matches reject.
- **S3:** instantiate the complete source and LLVM worker interpretation for
  every source create, using that create's own argument. Use fresh typed response
  symbols per activation. Compare all operands, reads, live results and monitors
  universally. No inference from register spelling or result value.
- **S4:** match actual Q ThreadCreate objects in checked main creation order to
  source creates; require the actual start's creator, target name, spawned thread,
  argument index/type/value and unique activation identity. Interpret each whole
  Q worker against its own source activation. Require all selected threads and
  source creates exhausted, plus the full retained main/runtime partition.
- **S5:** certificates are indexed by (source create, worker declaration,
  source call context, actual LLVM site, actual Q thread). The expected set is
  the dependent union over creates of the calls of that create's target, not a
  Cartesian product of all threads and all worker definitions. Endpoint IDs
  must be disjoint. Preserve the complete per-activation effect order.

SSA names are function-scoped: replacement freshness is checked per defining
function plus globally fresh generated namespaces; equal original `%3` in two
different functions is not a collision and does not identify their values.
All old block/fragment/frame/host/query checks remain mandatory. A legacy profile
name does not exempt an input from S1. No caller flag can disable these checks.

## Lemma A: absence of ordinary-C concurrent conflicts

Assume complete source interpretation, S1 and successful source lifecycle.
Every pair of potentially concurrent user accesses involving an ordinary C
access is nonconflicting; object round trips preserve effective type/lifetime.

Proof. All worker ordinary effects are reads of R. Two such reads do not
conflict. Every worker write is an admitted asm write to W; R and W are disjoint
complete objects, so a worker ordinary read cannot overlap a worker write.
There are no other worker effects by exhaustive interpretation. Initialization
precedes creation; main's ordinary reads follow all joins, hence neither can
overlap worker writes under the existing lifecycle contract. Only known complete
globals exist, remain alive throughout, have canonical checked types, and are
reached without arithmetic through exact void* round trips. Distinct declarations
cannot designate overlapping complete globals in this grammar. Thus there is
no hidden subobject/width alias. The argument does not classify asm as ISO C
atomic; it eliminates all concurrent conflicting pairs involving ordinary C.
The remaining asm/asm interactions use exactly the previous ISA/TSO extension.
QED.

This lemma establishes a syntactic sufficient condition for the ordinary-host
part of the domain; it does not discharge Gamma_front, Gamma_ISA or POSIX
implementation correctness. External code or callbacks would invalidate its
exhaustiveness premise and must reject.

## Lemma B: activation entry relation

For each checked source create c with target f and object argument o, S2-S4 and
the original runtime contract establish the same typed entry object in the
source invocation, actual LLVM formal and actual Q ThreadArgument result.

Proof. S3 substitutes o into f's unique typed parameter and checks all actual
LLVM uses by definition/use interpretation. S4 identifies the actual Q creator
from the checked main sequence, not by a guessed worker ID or register name.
The creator's actual spawned-thread reference equals the ThreadStart's thread,
and the ThreadArgument explicitly refers to that creator and index zero.
Its actual creator argument is universally equal to the object o. The retained
main checker also checks the source handle, target and argument against that
creator. Gamma_runtime supplies parameter transfer. S1 supplies validity and
canonical type. Therefore the three entries agree. Different c's are treated
independently even when f or o is equal. QED.

## Lemma C: complete per-activation open relation

Given Lemma B, S2-S5 and the unchanged block/fragment/region/host obligations,
every source activation's user effect word and safety observations have the
same complete ordered target word for every typed vector of read responses.

Proof by induction on the remaining finite source word. Initially the parameter
relation is Lemma B. Pure declarations/casts follow deterministic checked type
semantics and actual definition/use chains; finite pure target stuttering is
consumed. Each ordinary read has identical object/width and a new response
variable shared by this source/LLVM/Q triple only. Each asm is the uniquely
identified source call, with universally equal inputs. Instantiate BLOCK_EXACT
and LLVM_FRAGMENT_EXACT, then the independent actual-Q open relation. Read/write
address, value, presence, A labels and real pair agree, as does the returned
scalar. Store that scalar in the existing environment; subsequent calls and
monitors therefore use its actual value. Pure monitor predicates agree for all
responses. Return is checked null and all instructions/effects must be consumed.
Induction strictly decreases the finite word; leftovers on either side reject.
Fresh function/activation scopes preclude identifying coincidentally named SSA
results or independently selecting existential environments. QED.

## Lemma D: dependent coverage and one global environment

For every legal finite source error prefix, these per-activation relations give
a disjoint, complete endpoint bijection preserving cross-region po, objects,
widths, values, locked labels, rmw and observations into Q's user projection.

Proof. The finite source create census contains every potential activation;
each has exactly its own target's static calls. S4 injectively identifies its
actual created thread. S5 is equality with this dependent set, so no source call
or activation is missing and no unrelated worker's certificate can substitute.
Lemma C covers each entire effect word, including ordinary reads and continuations;
retained C2 covers main, initialization and actual private-runtime separation.
Distinct actual IDs and exhaustive partition prevent overlap or extra user
events. Each word is in full program order, preserving po between holes as well
as inside them. Truncate at corresponding source error boundaries; original
prefix runtime contract admits the matching target prefix. Now fix the source
graph's single rf/co and transport both through the endpoint bijection. Equal
objects/widths/values preserve rf typing and each object's co total order.
Derived fr transports identically. The exact TSO relations, including locked
W-to-R edges and rmw exclusion, are therefore preserved. No two local proofs
choose different rf/co; all use the responses of this one source graph. QED.

No user Fence is admitted by this grammar. Any added Fence must be consumed by
a future separately proved check; it cannot disappear as a pure event. This
proof does not claim a general nonbijective or weak-memory transformation rule.

## Conditional E2E-SAFE-D2

If S1-S5, all original C0-C4 and all eight original Gamma hold, and the actual
same-run bound safety query meets the unchanged UNSAT authorization protocol,
there is no source assertion-error prefix in this restricted GNU/x86 domain.

Proof by contradiction. Assume such a source error prefix. Lemma A validates
the strengthened ordinary-host restriction without race-UB vacuity. Lemmas B-D
give a legal Q prefix with the identical failed user assertion. Original
Gamma_runtime supplies the checked private protocol. Gamma_encode (ENC-minus)
then makes this exact bound safety query satisfiable, contrary to C4 and
Gamma_solve. The other original Gamma justify capture, source/ISA interpretation
and implementation refinement exactly as before. No premise assumes source
safety, backend PASS or the theorem being proved. QED.

SAT alone still does not prove a source bug: that direction needs a source
witness or reverse inclusion. Positive examples do not prove implementation
refinement. Gamma_check remains explicit.

## Attempts to falsify the sufficient conditions

- Per-worker R/W alone: worker A reads input, worker B writes it. Global union
  detects this; deleting B from the census cannot repair S2/S4/S5.
- Two worker functions both have `%3`: global textual SSA matching could swap
  outputs. Function/context indexing and actual def-use prevent the swap.
- Correct counts with swapped create arguments: counts pass, Lemma B fails
  because actual creator arguments are tied to source main positions/handles.
- One source cert reused twice: S5's distinct indexed keys and disjoint real
  endpoints reject; identical formulas do not confer instance identity.
- Keep updates but drop A: value equations pass but Lemma D loses TSO locked
  edges. Exact labels and actual paired-load identity are separate requirements.
- Two locally plausible rf graphs: no composition unless one common graph;
  Lemma D transports the source graph once, never solves rf per fragment.
- Change the bound/assumption/query or omit a monitor: retained C4 rejects even
  if another formula returns UNSAT. Wrong alias/width/unknown expression rejects
  before any safety authorization. The implementation must enforce each premise;
  this analytic proof does not establish that code already does so.

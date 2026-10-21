# Correspondence-aware semantic diagnostics: model and proof

Frozen baseline: `3c67f7b2116a3eb7f090f1807e4c2c41beeb01b6`.
Specification precedes implementation. Original E2E-SAFE, L1–L4, ACTC,
PD-SAFE, eight Gamma, code paths and evidence remain unchanged.

## 1. Target, domain and observation

Input is authenticated source/AST, actual original LLVM L, actual imported
LLVM I (either L or the lifter's L'), complete same-run Q and its capture
receipt. We compare an explicitly named open worker interface; this detector
never issues program SAFE. Unsupported host semantics cannot become a source
compiler defect merely because extraction failed.

D_DIAG0: finite direct worker activations; unsigned total 32/64-bit expressions;
known typed global objects; immutable ordinary-C inputs separate from asm
writes; existing unconditional FAA; pure local conditions/select/ITE; no user
conditional shared effects, loops, indirect calls, poison or unknown aliases.
The old source adapters establish this domain for CK harnesses. The direct-asm
adapter checks the original single-asm worker/LLVM scope, and makes only that
open-worker claim, not a new proof of the entire C host.

Each side is independently normalized to a finite endpoint graph G. Vertices
are public reads R, writes W and user monitors O. A logical FAA expands to a
read/write pair, not a single vertex. A Q RMWStore contributes its actual write
and actual pairing edge. Pure total calculations are substituted along actual
definitions; dead pure computations and different expression trees are not
public vertices. No shared event is hidden as pure. Every worker body node is
consumed, and prefix/suffix protocol and activation boundaries are inspected.
Unrecognized control, event, type, expression or incomplete export is UNKNOWN
or UNSUPPORTED, not an empty graph.

Each R introduces a fresh typed response. Endpoint fields contain addresses,
written values or monitor conditions. Relations include endpoint program order
and actual RMW pairing; node labels include A and RMW. Source locations and
LLVM/Q identifiers label evidence only, not matching choices. The prototype
does not support user fences or CAS guards; these require their own structural
relations/guard semantics, and must not be reported as checked.

Object symbols denote the same independently established objects. Domain D
requires their distinct aligned non-null addresses. Read responses otherwise
range freely. This is an OPEN environment: an assignment need not be possible
under the actual program's initialization, rf/co, lifecycle or host paths.

The observation is the complete labelled public endpoint history, up to a
type-compatible renaming preserving fields and relations. This is stronger
than safety refinement. A legal optimization may fail this observation (e.g.
removing a redundant ordinary read). Such a failure is a difference relative
to the declared exact-history contract, not automatically a compiler bug.

## 2. Candidate correspondence and quantifiers

Let B(G,H) be ALL bijections preserving endpoint sort R/W/O and bit width.
Candidates are constructed without ordinal or source-line matching. Field
values, A labels, RMW pairs and po are checked obligations, not trusted matching
hints. Reordered pure calculations need no vertex correspondence. Unequal sort
censuses make B empty. This proves structural history inequality, without
guessing which particular source event was dropped.

For m in B, replace each target read-response variable by the response of its
mapped source read. Let E_m(u) be the conjunction of: every paired field is
equal; labels are equal; po and pair relations agree in BOTH directions.
All formulas are total in the supported domain. Write and monitor comparisons
use actual symbolic definition-use expressions, so a wrong return can surface
at a later input or monitor. They do not need equal register spellings.

Uniform open equivalence:  exists m in B. forall u. D(u) => E_m(u).
Mapping-independent open witness: exists u. D(u) AND forall m in B. NOT E_m(u).

These are deliberately different quantifier orders. Failure of every uniform
candidate DOES NOT prove that one input defeats every candidate. If exhaustive
search rejects all uniform candidates, the detector asks the second formula.
If it is UNSAT, report NO_UNIFORM_MAP / INCONCLUSIVE, not semantic inequality.
A per-input history renaming may still exist. If search is capped, a solver
times out or returns UNKNOWN, there is no exhaustive negative conclusion.

## 3. Algorithm and diagnosis frontier

1. Authenticate actual objects and completely consume the supported scope.
   Reuse independently checked local GNU/LLVM/reference semantics; classify
   missing evidence before any semantic bug claim. Enumerate source activations
   independently of the target's observed count.
2. Normalize source and target independently. Expand semantic RMW endpoints;
   retain dependency-expanded expressions and actual pairs/order/labels.
3. Generate all sort/width-compatible bijections by finite backtracking, with
   a declared resource limit. For each candidate query D AND NOT E_m. UNSAT
   certifies that candidate. SAT refutes only it. Save formulas and models.
4. If all candidates fail, solve D AND conjunction_m NOT E_m. Only SAT with
   an independently rechecked assignment yields OPEN_HISTORY_DIFFERENCE.
   Empty B instead yields a structural census witness. Never treat an invalid
   partial map as an empty complete candidate space.
5. For diagnosis (not the inequality proof), compute for each candidate its
   deviation set F_m = {labelled field/relation equalities not universal under
   D}. Keep ALL sets with minimum cardinality. Their intersection is forced
   within this cost model; their union is the ambiguous diagnostic frontier.
   No single arbitrary closest matching is declared the true root cause.
   If no complete candidates exist, report sort deficits/excesses and ALL
   candidate source/target locations in those sorts; no fabricated deleted ID.
6. Verify separately: reconstruct raw inputs, candidate universe and formulas;
   check a positive mapping's totality and universal equalities, or evaluate
   every E_m at the proposed concrete assignment. An omitted candidate, wrong
   assignment, stale Q, incorrect census or incomplete enumeration rejects the
   witness certificate. Recompute any claimed minimal frontier.

The checker may share small expression/reference kernels with the detector,
but must not trust its normalization JSON, mapping list or verdict. A resource
cap can lose reports, never justify a positive equality or a negative witness.
The algorithm is a finite semantic matching/diagnosis construction, not a new
general graph-edit algorithm. Its novelty must be assessed independently.

## 4. Soundness proofs

**Lemma 1 (normalization).** For every supported worker and typed response
assignment, normalization produces its complete open endpoint history.
Induct over consumed instructions. Pure total operations preserve expression
meaning by structural induction; ITE chooses its condition's arm with all types
and dependencies checked. Reads introduce fresh responses; writes and monitors
emit actual evaluated expressions. FAA reference semantics yields its R/W and
returned read value, while Q endpoints are read independently. Actual register
redefinitions replace the current environment, so repeated names do not merge
definitions. No unknown or shared-effect instruction is silent. Induction over
the finite instruction list proves both values and endpoint census. Scope and
protocol boundaries remain separately checked, not inferred from the result.

**Lemma 2 (candidate completeness).** Any typed endpoint-history isomorphism
belongs to B. It is necessarily a bijection of vertices preserving R/W/O and
width. Backtracking selects each unused target in the appropriate sort for
each source vertex, so induction on the source prefix enumerates every such
bijection exactly once. A finite cap explicitly invalidates completeness.
No address, source hint, po rank, faulty label or value is used to prune B.

**Lemma 3 (formula adequacy).** For m in B and assignment u satisfying D,
E_m(u) iff m witnesses equality of the two open histories at u under the
paired read responses. Node fields and labels are exactly the node conditions;
both-direction pair/po equalities are exactly the edge conditions. Substitution
is well typed and injective on read responses. Lemma 1 supplies the expressions.
Conjoining precisely those conditions proves each implication. This is a
finite open-history claim, not a theorem about all compiler optimizations.

**Theorem EQ.** A verified candidate with UNSAT(D AND NOT E_m) establishes
uniform open endpoint-history equivalence in D_DIAG0. Sound UNSAT gives the
universal formula; Lemmas 1/3 give history equality for every valid open input.
If the complete original C0–C4 and applicable Gamma separately hold, its
endpoint preservation is usable in the original global TSO transport lemma:
transport ONE rf/co via the complete bijection, derive fr=rf^-1;co, and retain
po, A, pairs, lifecycle and any required fence relations. All CAT violations
pull back. This detector does not establish those remaining global premises
and therefore never releases L3, L4 or CONDITIONAL_SAFE by itself.

**Theorem DIFF.** A verified structural census witness, or an assignment u
with D(u) and NOT E_m(u) for every exhaustively recovered m, proves a difference
of the declared open endpoint-history observations. For unequal sort counts,
a bijection is impossible. Otherwise suppose equal observations existed;
their isomorphism lies in B by Lemma 2, and satisfies E_m(u) by Lemma 3,
contradicting the checked witness. Solver-produced assignment bytes alone are
insufficient: the independent checker evaluates the rebuilt formulas at them.
This proves neither closed-program reachability nor that a source assertion
can fail. The empty candidate case is valid only after full, supported census.

**Lemma 4 (diagnosis).** With complete B and decidable field checks, F_m is
exactly the set of universally invalid obligations for that m. Exhaustive
minimum-cardinality selection therefore includes every minimum-cost matching.
Intersection/union characterize forced/possible deviations among precisely
those matchings. This cost depends on the specified field granularity and does
not minimize source edits or identify a unique implementation fault. An input
binding error and a wrong arithmetic operation can induce identical summaries;
no algorithm using only these summaries can distinguish those causes.

**Lemma 5 (stage location).** If authenticated consecutive stages before k
have certified open equivalence and stage k has a verified DIFF witness in the
same interface/domain, k is the earliest PROVED bad interval among those
observed stages. Transitivity transports the interface; none of the earlier
intervals changes it. This does not identify a particular pass inside k. A
prior UNKNOWN invalidates 'earliest', and a later repairing error prevents
inferring intermediate correctness from final equality. On direct unlifted
asm import the comparison interval is LLVM asm semantics→actual Q; a separately
proved alternative L' is a control, not a preceding stage of that execution.

**Termination and incompleteness.** Finite programs normalize if in grammar.
With n_k vertices of each sort, |B| = product_k n_k!, with O(n^2) relation checks
per candidate and formula/SMT costs additional. DAG expansion may be exponential.
Limits/UNKNOWN terminate conservatively. These costs are not claimed superior
to existing semantic matching. Unhandled scope, aliases, events, loops or
ambiguous front-end origins produce UNSUPPORTED; they are not a zero-bug result.

## 5. Counterexample attacks and reachability boundary

* Quantifier trap: Boolean u, E_1(u)=u, E_2(u)=not u. Neither is universal, but
  every u has a matching and no common witness exists. Report INCONCLUSIVE.
* Accidental trace matching: x+1 and 2*x coincide at x=1. A test-derived match
  is not EQ; the universal field query refutes it elsewhere.
* False closed bug: isolated FAA on initial x=0 has an open witness r=7, but
  this response cannot come from any source rf in a one-RMW closed program.
* Missing middle event: sequence R1,W1,R2,W2 versus R1,W1 cannot be rescued by
  mapping the second source pair onto the first. Complete coverage forbids it.
  A finer unique deletion location requires extra distinguishing evidence.
* Local final values hide a deleted intermediate shared write; explicit public
  histories detect it. Conversely deleting a redundant read may preserve an
  intended weaker contextual observation: never call our stricter failure a
  universal compiler miscompilation without an applicable exact-history contract.
* Swapping two indistinguishable FAA sites may leave summaries identical. Do
  not invent source-site attribution; po/pairs or distinct downstream uses are
  needed. Full public po preservation may force the final map to be ordered,
  but the search/diagnosis does not assume that order or stop at its first fault.
* Dropped A/pair changes structural constraints even if final arithmetic agrees.
  A closed unsafe execution still needs one globally compatible rf/co/fr and
  the fixed TSO CAT. Independent per-region environments cannot provide it.
* Missing/truncated ITE serialization is an evidence defect, not a witness
  that the actual backend evaluated the wrong branch. Stop at CAPTURE_UNKNOWN.

To upgrade OPEN to an executable source/target discrepancy requires independent
legal-input, object validity, complete path/activation and global rf/co/CAT
witnesses, plus host/runtime/query correspondence. No such general reachability
solver is added here. Existing eight Gamma are not expanded to assume it.

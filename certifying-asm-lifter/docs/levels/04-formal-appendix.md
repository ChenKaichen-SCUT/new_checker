# Quantifiers and finite composition proof

This appendix spells out the restricted theorem in `01-levels-and-proof.md`.
It adds no semantic assumption to the eight original Gamma and does not certify
arbitrary C host evaluation. Implementation refinement remains Gamma_check.

## Objects and acceptance predicates

Let a port signature be sigma = (typed inputs, object/address domain, typed
results, clobbers). D_sigma contains defined, aligned, nonmixed WB entries in
the original scope. Let U be an arbitrary finite sequence of fresh read-value
bitvectors of the requested widths, **without an independent feasibility
assumption for each block**. Feasibility is imposed only on the complete graph.
Let H(A,x,U) be the ordered public endpoint history and result/frame vector
obtained by the existing exact symbolic interpreter. An RMW has the read/write
endpoint representation, presence guard and atomic pair supplied by the fixed
ISA bridge. That bridge is Gamma_ISA, not a new proof of the ISA or CAT model.

For each selected actual LLVM site s, let origin(s) be the checked original
GNU port, theta_s the checked typed actual-argument substitution, F_s the
actual replacement fragment, and frame_s the actual module outside its single
replacement interval. These are recovered objects, not caller-supplied maps.
An LLVM range attribute may further restrict D_s; the checker records it.

Define predicates:

- B(s): for every x in D_sigma and every correctly sized U,
  H(origin(s),x,U) = H(IR_s,x,U), including results and frame.
- V(s): authentic capture/origin and exact GNU/LLVM constraint consumption;
  for every defined entry eta in D_s and U,
  H(F_s,eta,U) = H(IR_s,theta_s(eta),U); freshness, output identity and unchanged
  frame_s all hold. No equation about arbitrary C caller evaluation is assumed.
- K(Sel,Q): an independently extracted activation domain D, exact actual Q
  capture, injective endpoint identities, exhaustive per-instance consumption,
  all cross-region value/order/effect checks and complete Q partition.
- E(P,Q): the **original** C0–C4, full host provider, query/bound binding and
  all necessary applicability checks for the frozen E2E-SAFE theorem.

L1 is B with original interface admission; L2 is B and V; L3 requires B and V
for every selected site and K; L4 requires these and E. These predicates are
not claims that the corresponding TCB components were mechanically verified.

For the implemented L3 subclass, if creates are the actual finite main list
and sites(w) all admitted surviving LLVM ports of worker w, then

    D = { (j, w_j, s) | j is an entry of creates, s is in sites(w_j) }.

Worker source call occurrence checks and complete optimized LLVM consumption
exclude conditional/loop/indirect asm activations in this subclass. The
semantics of a general C branch outside the ports remains outside L3. The
certificate records this distinction. No dynamic domain is inferred merely
from the Q endpoints that happened to be found. Every D element has its own
entry/endpoint/continuation check; all actual threads and shared events must
be consumed by workers or the checked main/init/runtime partition.

## Lemma 1: typed substitution and static replacement

Assume B(s), V(s), and eta in D_s. The typed interface check ensures
theta_s(eta) is in the formal domain whenever the declared validity conditions
hold. B instantiated at theta_s(eta) gives equal source/IR histories. V gives
equal IR/actual-fragment histories under exactly that entry. Transitivity
gives source-port/fragment equality for every U, including result and frame.
Fresh definitions cannot capture an existing SSA use; the unchanged result
identifier feeds the same uses; all other module text is identical. Therefore
this is a valid open replacement at this site. It does not prove that Clang's
surrounding instructions compute theta_s from the intended C expression.

In-run template reuse changes only how B is obtained. Identical typed
normalized semantics and implementation signatures give the same universal B;
V is still proved separately for every site. A reused B cannot discharge V
or K. No unverified imported EXACT certificate is an acceptance premise.

## Lemma 2: finite instance and continuation induction

Fix one D element's worker and a common legal typed entry. Order the admitted
LLVM operations by their finite def-use/control order. Initially the actual
ThreadCreate/ThreadStart argument link supplies the checked same object.
Induct on operations while maintaining equal values for all live definitions
and identical accumulated public histories:

1. A read consumes the next actual read endpoint with equal object/width and
   introduces the same fresh U component on both sides.
2. ADD, icmp, zext and select preserve equal live definitions by their exact
   typed expression semantics. For select/ITE, split on the Boolean condition;
   the same selected arm has equal value by the induction hypothesis. Both
   arm dependencies remain checked. Unsupported operations reject.
3. At an asm, Lemma 1 gives equal next public endpoints/results for all current
   entries/U. Independently checked actual Q labels, pair, guard, address,
   update and result extend the Q side with precisely those endpoints.
4. A continuation assertion consumes its actual monitor with equal condition;
   subsequent calls use the same live definitions, not an unconstrained reset.
5. Termination consumes the checked completion protocol.

Each step exhaustively consumes its expected actual effects; an extra or
missing effect prevents the invariant from reaching termination. There are
finitely many steps, so induction terminates. Repeating this proof for every
independently listed create/site pair proves coverage, including repeated
templates and distinct worker definitions. Disjoint identities forbid one
actual endpoint from witnessing two activations. Complete Q partition checks
exclude an unexamined extra thread or main/init/runtime effect. This proves
the stated finite LLVM/Q open history relation, not the full worker C theorem.

## Lemma 3: one global environment, rf/co and TSO

Let G be any complete legal graph over the checked finite histories and an
arbitrary allowed environment. Apply Lemma 2 with the **read values already
chosen by this single G**. It provides a public-endpoint bijection h on the
checked scope; extend h by identity on the environment. Local computations
are stuttering steps, not omitted public memory events. No new independent
choice of rf or co is made for a second region.

Set rf' = h(rf), co' = h(co). Equal address/width/value/presence labels imply
well-formed read sources and per-location write order in the transported
graph. Totality on each location and read-source uniqueness are invariant
under bijection. Since fr = rf^-1 ; co, h(fr) = rf'^-1 ; co'. The independently
preserved base labels, dependencies required by the fixed bridge, program
order, RMW pairs, A tags and fence relations have the same image.

For every relational expression built from these bases, union, intersection,
inverse, composition, difference and transitive/reflexive closure commute
with a bijection. Proof is structural: set operations follow pointwise;
composition's intermediate witness maps through h and h^-1; closure's finite
path witnesses map edge by edge; identities and label filters map because
their carrier/labels do. Hence each relation constrained by the **fixed** TSO
CAT bridge is transported. An irreflexivity/acyclicity violation maps to the
same self-edge/cycle; an RMW atomicity forbidden pair maps to the same pair.
Thus admissibility and the checked observations are preserved. In particular,
an environmental write between a paired RMW read/write cannot be introduced
by the replacement. Fence effects cannot be erased by merely matching values.

This argument applies only where all those base relations are preserved by
the admitted scope and original bridge. It is not a theorem about an arbitrary
CAT model, arbitrary event movement, races in the C language, or missing host
effects. An absent shared write, A tag, pair, fence or activation invalidates
the premises, even when final memory or a solver verdict happens to agree.

## Theorem: graded conclusions and safety direction

Under the applicable original Gamma, accepted L1/L2 satisfy the respective
universal open-port equalities by Lemma 1. Accepted L3 satisfies the declared
finite LLVM/Q open scope relation by Lemmas 2–3. Partial activation coverage
cannot satisfy K and yields no L3. Failure of E has no effect on already
proved B,V,K, but supplies no program-level conclusion.

If L4 accepts, E supplies all missing source/host/error-prefix premises of
the frozen E2E-SAFE theorem. Suppose the source had a legal error prefix.
That theorem and the local lemmas yield a legal corresponding target prefix
with the same safety observation. Gamma_encode entails satisfiability of the
**bound actual error query**. The checked safety and completeness/bound results
are sound UNSAT under the original solver assumptions, a contradiction.
Therefore no such source prefix exists, conditionally on the original Gamma.
The needed direction is source error behaviors included in target error
behaviors. A compiler theorem in the reverse direction alone is insufficient.

There is no unbounded-loop claim here: this L3 provider rejects those domains.
L1/L2 may certify a static port textually located inside a loop, because their
universal entry theorem does not assert an execution count or global coverage.
They cannot be promoted until an adequate activation/host proof is supplied.
No bounded unfolding is silently used to discharge an unbounded premise.

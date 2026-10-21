# P1b: finite ordered call contexts

Design-stage theorem, before implementation. This extends D1a by exactly two
live direct invocations of the same admitted unchanged CK wrapper in one
straight-line worker. The initial pointer/shared-read restrictions, full main
grammar, pinned x86/TSO, finite create/join and original eight Gamma remain.
The first scalar result can occur in the second input and in subsequent pure
monitors. All source effects remain in order. No shared endpoint elimination,
merging, reordering or instruction-family expansion is accepted.

## Source and LLVM census

Enumerate **all** surviving LLVM inline asm calls and **all** direct AST calls
of their source definitions. For each LLVM call, join its srcloc tuple against
the complete AST asm census, then independently check its definition and inline
debug chain against every candidate AST call of that definition. Accept only
one candidate and require the selected AST calls to form a bijection onto the
complete reachable AST call census. Metadata fidelity is still Gamma_front
and Gamma_capture; this restricted method does not claim metadata independence.

Then interpret the complete C and actual LLVM bodies in order as in D1a.
At each hole, require the consumed source call's identity to equal the checked
inline context, and universally compare its typed arguments with the real LLVM
operands. Give different holes different fresh read-response variables. The
first returned value remains in the environment for the second input. Complete
source/LLVM effect consumption rules out unmatched or hidden calls.

Emit each candidate fragment using a distinct fresh namespace, preserving the
original result SSA. Independently check every fragment's open semantics and
compare the complete resulting module with a reconstruction replacing exactly
the checked intervals. Check freshness against the full original body and every
other emitted fragment. No isolated local certificate authorizes the bundle.

## Actual event certificates

For every actual worker activation, independently interpret its complete user
event sequence. At each next source hole, consume the next real locked Load and
RMWStore, with only total pure calculations between them. Check each field and
real load/store pair against that hole's reference semantics under the current
entry relation. Ordinary source reads between holes also consume actual shared
events. Maintain the same actual-register environment between holes.

Record a separate certificate with `(activation, source-call-context, LLVM-site,
actual-load, actual-store)`. Require pairwise distinct source-call/activation
keys and actual endpoint IDs, exactly the Cartesian product of reachable
static calls with actual worker activations, with no remaining source or target
effects. A missing instance cannot be compensated for by reusing another
instance's certificate. Pure statements may stutter; memory endpoints may not.

## Lemma: finite sequential open substitution

For n=1 or n=2 admitted holes, suppose (a) the initial typed relation holds;
(b) each host segment preserves the open relation and complete effects;
(c) each hole independently preserves its reference effects and output for all
typed inputs and fresh responses; (d) all live values flow through the checked
definition-use environment; and (e) all segments and holes are completely
consumed in order. Then the concatenation preserves the open effect word and
all monitors for every common typed response vector.

Proof by induction on the number of holes. For zero holes, the typed prefix
lemma is the complete host proof. Assume the concatenation through hole k
establishes a relation on every live value. The next host segment uses only
these definitions or new fresh reads; its checked deterministic operations and
shared fields reestablish the entry relation for hole k+1. Its actual inputs
are expressions in the **same** earlier responses, not independent new entry
variables. Instantiate the universal hole relation with those expressions and
the next fresh responses. Equality of its returned value preserves every use
in the subsequent environment. Concatenating its exact ordered event word
preserves the complete prefix; disjoint endpoint identities prevent an overlap.
The final segment gives identical monitor predicates. This proves the induction
step and the finite claim. QED.

## Lemma: activation and global graph composition

Assume the finite substitution lemma holds in every activation, the lifecycle
checks give a bijection between source and actual activations, and the product
census/endpoint partitions above hold. Then a source graph has an actual user
graph with identical event fields, thread order and RMW pair, including order
between different holes.

Proof. Each local ordered word gives an order-preserving endpoint bijection.
The product census makes their union total and injective on all source
activations, and exhaustive target consumption makes it surjective onto all
actual user endpoints. Concatenation, not independent region ordering, preserves
cross-hole po. Initialization/main checks add the remaining corresponding user
endpoints. Transport the source's **one global** rf/co across this union; fr is
then determined by the transported relations. Endpoint fields and actual RMW
pairs preserve the pinned TSO predicates, including locked ordering across
ordinary events and between locked operations. No fresh independent rf choice
is made for a fragment. Apply original Gamma_runtime for private protocol.
QED.

## Conditional D1b safety theorem

Under the original eight Gamma, original C0-C4 with the explicitly checked D1b
extension above, and the original exact same-run safety/bound UNSAT conditions,
the source has no user-assertion error prefix in D1b.

Proof. A hypothetical source error graph is transported by the two lemmas into
an actual Q graph with the same failed monitor. The unchanged encoding premise
ENC-minus implies satisfiability of the bound actual error query. C4 and
Gamma_solve contradict it. All other original Gamma premises justify the same
interfaces and runtime/encoding boundaries as before. No additional compiler
or backend semantic assumption is introduced. QED.

## Attempts to refute the conditions

* Swapping two returned values: responses U_0 and U_1 are independent; using
  U_1 for the next increment, or U_0 for the second result, violates a universal
  input/monitor equation unless that change is observationally equivalent under
  the entire checked open trace. No executed-case constant specialization is used.
* One certificate twice: rejected by distinct keys/endpoints and product census.
* Removing the second call: source/LLVM census or actual effect consumption fails.
* Dropping an ordinary intervening read: actual operation kind/order fails even
  when the surrounding locked operations still exist.
* Reversing locked operations: the sequential value/effect checks and cross-hole
  order fail; no local proof is allowed to authorize the reordered graph alone.
* Separate environments per hole: violates the induction premise; existing
  registers must retain their previous expressions, and response indices cannot
  restart at zero within an activation.

This is a standard restricted compositional proof for a useful system extension,
not a claim of novel generic correspondence synthesis. Two different worker
definitions, nested inline stacks, ambiguity in metadata and branching
instances remain outside this theorem.

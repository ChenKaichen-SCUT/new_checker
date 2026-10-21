# Algorithm and independent certificate interface

Input: authenticated real P/AST/L capture, candidate L', same-run final Q and
actual query transcript, phi=`all-user-assertions`. Output: reject, preserved
L1/L2, PROPERTY_OBSERVATION_TRANSFER, or PROPERTY_CONDITIONAL_SAFE(phi).
No status supplied by the candidate producer is trusted.

```
prepare(P):
  authenticate all input/config/tool artifacts
  recover all source/LLVM sites; check universal L1/L2 and unchanged LLVM frame
  enumerate direct create/site activations independently of Q
  interpret every admitted C statement, including pure finite branches
  compare complete C/actual LLVM effects, entries, outputs and observations
  reject unresolved aliases, mixed accesses, unsupported syntax and missing sites

reconstruct(P,L',Q):
  consume all actual threads/events and full main/init/runtime partition
  check skeleton, labels, order, pairs, widths, types, guards and every activation
  collect universal equations, with actual source and Q read-variable provenance
  bind each monitor to the source assertion census defining phi
  keep every obligation; initially none is discarded

propose(facts):                     # untrusted search policy
  owners := single dynamic owners from complete source AND Q access lists
  graph := both-side value/condition dependencies and same-object interference
  roots := all boundary/observation nodes and all non-owner update nodes
  K := backwards least fixed point
  omit := updates of owned objects with no read/write node in K
  emit K, omitted-object boundaries, selected equation IDs, full coverage hashes

verify(P,L',Q,phi,proposal):         # independent acceptance, no trusted slice
  rederive facts from authenticated objects, not the proposal's edges/owners
  require proposal references exactly current artifacts/phi/all obligations
  require every root in K and every provider of a K-node in K
  require complete single-owner access lists for every omitted object
  require no omitted-object read/update belongs to K
  require selected equations are exactly all equations except permitted updates
  check all selected equations with independent SMT (UNKNOWN/timeout reject)
  record boundary obligations by structural closure + the value-repair theorem
  bind actual full Q/property/safety/bound results using the existing query checker
```

Production reconstruction always retains complete structural/source/LLVM
checks. A collected but unsolved equation is marked PENDING, never EXACT.
The query-binding API distinguishes a full open-host certificate from the new
property-host certificate; it cannot convert a property certificate to L4.
Optional full-check replay is a control, not a prerequisite used to justify
the property analysis. Q and query hashes are identical before/after analysis.

Certificate fields: baseline/theorem hashes; exact capture/L/L'/Q/run/property
identities; original eight Gamma; complete dynamic activation/endpoint census;
typed read nodes and provenance; owner access lists; roots/edges/closed set;
all equation IDs/hashes; selected SMT artifacts; omitted-update IDs with
boundary witnesses; complete monitor/runtime partition; actual query bindings;
explicit `full_L3_claim=false`, `legacy_L4_eligible=false` when values omitted.

For n read/update/observation nodes and expression size s, reconstruction costs
O(s+n^2) with a naive may-alias edge table, closure O(n+e), certificate checks
O(s+n+e); e can be O(n^2). Enumerating finite activations multiplies n by the
number of creates, not an unbounded execution domain. Bitvector SMT remains
potentially exponential. No polynomial solver bound or minimal slice is claimed.
Conservative closure may retain everything. Unsupported owner/domain facts
never cause an omitted obligation: check all instead, or reject if semantics
cannot even be reconstructed. No general HCC provider is added.

Targeted validation is fixed before backend runs: owned dead update, relevant
update/control dependency, repeated-worker ownership denial, existing branch
source/LLVM proof, unsafe property, actual lost write/A/activation/return/query
faults and tampered producer certificates. A changed dead private update may
pass the property theorem while failing full equivalence; it is explicitly
a harmless-to-phi difference, not a successful exact translation certificate.

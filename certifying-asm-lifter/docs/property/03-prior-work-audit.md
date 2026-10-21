# Prior work and novelty audit

Primary sources inspected on 2026-10-21. This is an algorithm-level comparison,
not a claim of novelty because other tools do not parse GNU asm or Dat3M.

| Work and primary source | Actual mechanism / prerequisite | Consequence for this proposal |
|---|---|---|
| [Property Directed Equivalence via Abstract Simulation, 2016](https://ssl.lu.usi.ch/entityws/Allegati/2003046_638785023690255962.pdf), Definitions 3–6, Theorem 1, §5 | Synthesizes/checks simulation and a safe abstraction relative to an existing inductive proof; property equivalence rather than complete functional equivalence | The high-level idea of property-indexed translation validation is already present. Its transition-system/invariant formulation does not by itself produce a faithful real GNU/LLVM/Q/TSO bridge. Our single-owner rule is a restricted sufficient construction, not a replacement for their more general simulation framework |
| [Incremental Verification of Compiler Optimizations, NFM 2014](https://verify.inf.usi.ch/sites/default/files/nfm2014.pdf), §§1–3 | Reuses and adapts a safety invariant of an already verified program across transformations | We cannot assume the source safe; our transformation relation is established before consulting Q's safety result. Nevertheless property-specific proof reuse is old, not an invention of this project |
| [Automated Property Directed Self Composition, ATVA 2023](https://kumarmadhukar.github.io/papers/atva2023-autopdsc.pdf), §§1–4, Theorem 1 | Chooses compositions and discovers predicates for k-safety of memory-disjoint program copies; refinement removes spurious counterexamples | Neither choosing a proof-friendly composition nor predicate-guided relational reasoning is new. Memory-disjoint copies are distinct from the cross-thread rf/co issue here; its theorem cannot simply replace the TSO graph proof |
| [Slicing Shared-Memory Concurrent Programs, ICSME 2023](https://personales.upv.es/josilga/papers/ICSME2023.pdf), §§II,V–VI | Revises threaded system dependence graphs for calling contexts and interference/time-travel precision; §II uses cobegin/shared variables without other synchronization | Backward data/control/interference closure is standard. Our conservative same-object closure is less precise; we cannot claim a new slicer. Keeping all A/RMW/order events addresses an additional required TSO boundary, not a demonstrated general algorithmic advance |
| [DESTIVA, OOPSLA 2026](https://mikekben.github.io/resources/OOPSLA_DESTIVA.pdf), Lemmas 4.4–4.6, Theorem 4.7, §4.3 | Decomposes translation validation spatially/temporally; correctness requires accurate sets of compiler changes and correct boundary composition | Selecting smaller validation obligations and composing with unchanged regions is prior art. We do not have their compiler change-set provider; our complete source/Q skeleton checks are conservative and still mandatory |
| [Stellite, ESOP 2018](https://www.cs.kent.ac.uk/people/staff/mjb211/docs/esop18.pdf), §§3–5 and appendix soundness theorems | Open histories summarize concurrent context interactions and ordering constraints; fixed relaxed-memory semantics rather than arbitrary local value equivalence | Its central warning is directly reused. We retain every public endpoint/order relation and prove a narrow value-repair lemma in the existing TSO model; this does not establish a novel general contextual refinement method |
| [VALID](https://plv.mpi-sws.org/validc/paper.pdf), memory matching and its validation conditions; [TInA](https://arxiv.org/pdf/1903.06407), block lifting/certification | Existing concurrent transformation checks and existing certified inline-asm lifting respectively | The reused open symbolic equations, event matching and local proof infrastructure do not become novel because a property closure is placed before them. Actual artifact/query binding remains a specific system capability |

The named works have different proof directions and premises. An existing
simulation theorem can encode this finite system after a faithful memory/state
encoding, but that encoding and an independently checkable host/activation
bridge remain necessary. Conversely, no proof here establishes a lower cost
than such an encoding; this round intentionally performs no performance study.

## What is actually new in this repository

The candidate certificate separates **mandatory complete event/order/activation
checking** from a narrow, property-directed subset of **write-value equalities**.
Its boundary witness is a checked single-dynamic-owner access census plus
two-sided dependency closure. The proof reconstructs target private values
on the same complete rf/co/fr graph; it does not delete events or independently
compose per-fragment executions. A pure-if source/LLVM check closes a previously
explicit host gap for one finite grammar. These are concrete additions to this
implementation and a closed restricted theorem; novelty beyond existing
noninterference, ownership and simulation principles is **not established**.

This rule is intentionally conservative: all multi-activation/multiwriter
objects keep full value checking; ordinary worker reads must be immutable;
conditional memory effects, arbitrary loops/aliases and hidden source syntax
reject. A static unobserved FAA value can be excluded while its complete
atomic event/order footprint remains checked. That distinguishing example
demonstrates implementation semantics, not independent research novelty.

## ISSTA Research Paper decision criterion

A viable new-method claim would need a specific barrier not already handled
by a reasonable combination of property simulation, dependence closure and
ownership reasoning, plus a demonstrably useful sound rule or decomposition
beyond this single-owner case. Merely renaming the certificate, reporting more
tests, or adding parser rules would not satisfy that criterion.

Current independent algorithm-novelty decision: **No-Go / not established**.
The restricted reliability/feasibility investigation is still worth delivering:
it can demonstrate what may safely be omitted, what must remain global, and
where a property-only conclusion differs from exact translation. It is not yet
a sufficient theoretical/method foundation for an ISSTA Research Paper claim.
No broad software or performance campaign is justified by this round alone.

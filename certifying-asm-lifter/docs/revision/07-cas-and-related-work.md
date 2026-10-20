# CAS admission and related-work checkpoint

Reviewed 2026-10-20, before CAS execution and third-party admission.

## What is already occupied

* [Stellite, ESOP 2018, §§3–6](https://link.springer.com/chapter/10.1007/978-3-319-89884-1_36):
  compositional validation, open local executions, histories and a finiteness
  result already exist. Its theory permits structural changes; its reported
  prototype supports atomic reads/writes/fences but not branching or LL/SC.
  Its theoretical language is richer than that implementation. Neither
  compositionality nor open reads is a new contribution here.
* [Kater, POPL 2023, §§3.1, 3.7](https://plv.mpi-sws.org/kater/paper.pdf):
  relational inclusion/equivalence and compilation mappings are automated;
  the implementation represents RMW as two events. Splitting an RMW or preserving
  CAT relations is not a new contribution here. The published inputs are model
  expressions and mapping assumptions, not authenticated GNU constraints and
  a particular final Dat3M Program.
* [Hetrify, ICSE 2025 official abstract](https://conf.researchr.org/details/icse-2025/icse-2025-research-track/99/Hetrify-Efficient-Verification-of-Heterogeneous-Programs-on-RISC-V):
  compiles heterogeneous code to binaries, converts to C, and claims an
  operational equivalence proof on RISC-V.
  [Hetrify+ artifact](https://github.com/GraceDyer/Hetrify-plus) explicitly
  supports mixed C/asm and downstream CBMC. Thus neither mixed-language lifting
  nor semantic-preserving lifting into an existing verifier is novel.
  The IEEE full paper endpoint was inaccessible in this review. Its exact
  concurrency model, failed atomic treatment and per-instance certification
  coverage remain **unresolved**, not presumed absent.
  Delivery follow-up also confirms the
  [author's Hetrify+ TSE 2026 record](https://orcid.org/0000-0003-2449-1150)
  (DOI `10.1109/TSE.2026.3692469`); IEEE document pages for both versions did not
  expose their full proofs in this review. A missing accessible full text is
  not evidence that concurrency or this certification boundary is unsupported.
* [TInA, ASE 2019](https://arxiv.org/abs/1903.06407) and
  [RUSTInA](https://arxiv.org/abs/2102.07485) already address trustworthy inline
  lifting and GNU interface compliance, respectively.

The candidate research distinction is an independently checked chain from the
actual GNU interface through actual emitted LLVM to final solver events, including
conditional endpoints, live continuations and complete activation accounting.
This is an integration boundary suggested by the inspected sources, not a proof
that no existing method covers it. A new soundness argument/algorithmic benefit
beyond combining known checks remains necessary for an independent paper.
There is no novelty PASS gate, and no performance comparison is authorized here.

## CAS theorem instantiation (before experiments)

For a strong locked CAS, let e be the old accumulator input, d the desired input,
and u the open read response. Both e and d must be independent of this operation's
u (emitter admission and independent LLVM interpretation enforce this).

Reference endpoints: r always occurs, with address p, value u and A tag.
The write w occurs iff u=e, with address p, value d and A tag. The output
accumulator is u in both cases. The actual static RMWStore must point to r;
the *executed* rmw edge exists exactly when w executes.

Proof by the two exhaustive logical cases, not by testing values:
if u=e, the branch to the join is false, w executes, and the paired endpoint
and output equal the reference; if u≠e, the branch is true, w is skipped,
r still executes, and the accumulator becomes u. Typed DAG interpretation
proves this for every u, including join-state consistency and total exit.
The checker must prove write-presence equivalence, not merely write values
under a successful guard, and must retain the read's atomic identity regardless
of that guard. The existing D/R proof applies without changing the reference.

For the pinned tso.cat, a prior W and r(A) remain related by `implied`,
and r and a later R remain related by `po-tso`; a later W is also ordered
after r by the R×M part. These relations exist even when w does not execute.
This is an algebraic consequence of the existing CAT definitions, not a proof
that every ISA/cache/memory domain is modeled by this CAT.

Two controlled real programs instantiate a single worker with x=0 or x=1,
e=0,d=2, and assertions consuming the old accumulator. They are execution
acceptance evidence for success/failure, while the local theorem ranges over
all u. Program assertions and backend PASS are never hypotheses of that theorem.

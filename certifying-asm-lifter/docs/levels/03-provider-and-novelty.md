# Concrete HCC-provider investigation and contribution boundary

No new generic HCC was implemented. An admissible provider would have to emit
independently checkable open-host relations for these actual GNU/LLVM/Q objects,
with matching x86/TSO semantics, defined-input domain, source-error-to-target-
error direction, arbitrary port responses, and finite error-prefix adequacy.
A theorem for a different compiler is not evidence about this compiler run.

| Concrete component inspected | Existing theorem/evidence | Missing adapter or premise here | Decision |
|---|---|---|---|
| [CompCertTSO](https://fzn.fr/projects/wmc/readings/compcerttso-long.pdf), §§4–6 | Coq compiler simulation for ClightTSO to x86; TSO optimizations | Actual GNU/Clang LLVM and Dat3M are outside that compiler; advertised target-behavior inclusion is not automatically our safety-transfer direction; no actual Q monitor/prefix bridge | Cannot install as this HCC provider |
| [CompCertOC artifact](https://github.com/SJTU-PLV/compcertoc-pldi25-artifact), §§6–7 | Threaded simulations and thread linking, compiler correctness in Coq | Artifact states cooperative semantics; connection to preemptive semantics remains future work. Its compiler/language differ; no fixed TSO/Dat3M open-host certificate consumer. Artifact's SimplExpr pass is noted separately as unverified there | Concrete useful precedent, not an applicable provider |
| [DESTIVA](https://mikekben.github.io/resources/OOPSLA_DESTIVA.pdf), Theorems 4.7/4.9 | Spatial/temporal decomposition; complete change sets are a soundness premise | Sequential LLVM validation and compiler change sets do not establish this TSO host/port/lifecycle/query relation | No general HCC from decomposition alone |
| [Stellite](https://www.cs.kent.ac.uk/people/staff/mjb211/docs/esop18.pdf), Theorems 1–4 | Open contextual histories with the same context and finite reduction | Different relaxed-memory model; not an actual source-to-final-Q host certificate producer | Reuse conceptual discipline, not its theorem without a model bridge |
| [VALID](https://plv.mpi-sws.org/validc/paper.pdf), §3 | Concurrent memory transformation checks, including unmatched actions | Does not discharge all ordinary host functional/control/error semantics and this import pipeline | Complementary check, insufficient provider |
| [TInA](https://arxiv.org/pdf/1903.06407), §VI | Real inline-asm lifting and block equivalence through recompiled CFG correspondence | Its local certification does not provide Dat3M activation/query or TSO context contracts; testing fallback cannot authorize a level | Direct system baseline; layered local results are not a new lifting idea |

This is a targeted feasibility investigation, not a proof that no provider can
ever exist. We did not port a different compiler, reclassify unverified host
compilation as a verified component, or add a general C interpreter.

## What is actually contributed in this round

The checkable system boundary is more usable: original complete-client code
can yield authentic per-site GNU→LLVM certificates while retaining unsupported
host behavior unchanged. The activation level separately requires actual Q
and exhaustive applicable instances. Refusal retains useful lower-level
results. ITE support closes a concrete serialization/interpretation hole and
allows a restricted actual LLVM/Q branch-dependent case to be checked.

The reusable algorithmic ingredients are existing open symbolic equivalence,
typed substitution, complete finite coverage and event/order preservation.
Four level names, template caching and a JSON hierarchy are **not** new theory.
The specific GNU/LLVM/Dat3M artifact and activation binding can be a system
contribution if later evidence establishes breadth, useful cost and defect
detection on independent software. Controlled faults are not upstream bugs.

Six local sites from one unchanged CK smoke-test client establish a real but
small improvement over zero usable full-client results. They do not establish
whole-client safety, independently competitive coverage, or publication
readiness at FSE/CAV/ISSTA. The independent-method novelty decision remains
No-Go; a tool/system research decision must be based on the measured local
coverage and cost reported in the delivery, separately from that decision.

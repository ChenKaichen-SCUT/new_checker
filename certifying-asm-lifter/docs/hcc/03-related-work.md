# Primary-source audit: composition and reuse

These five primary texts were reopened for this round. Earlier audits remain
unchanged. The following are algorithm/theorem comparisons, not tool-name or
GNU-syntax comparisons. None supplies the missing actual Clang→Dat3M HCC.

| Work and exact evidence | Reusable result | Why it is not an installed HCC provider here |
|---|---|---|
| [TInA, §VI S1/S2](https://arxiv.org/pdf/1903.06407) | Lift/recompile and compare matching blocks using CFG structure, labels/debug information and SMT; testing fallback is separate | Does not establish this pipeline's TSO shared history, runtime and actual query interface. Our universal block reuse is not a new lifting principle |
| [VALID, §3](https://plv.mpi-sws.org/validc/paper.pdf) | Checks concurrent memory transformation legality, including unmatched actions and guards under its models | Memory-action checks are not a proof of all host functional behavior, GNU/LLVM semantics or source-error inclusion for this backend |
| [Stellite, §4, Theorems 1–2 and appendices](https://www.cs.kent.ac.uk/people/staff/mjb211/docs/esop18.pdf) | Open histories under the **same** reduced environment; adequacy/full abstraction for the stated relaxed model | Strong prior contextual theory. Cannot reuse an RA-model theorem as a TSO theorem without a bridge. Local final-state equality is weaker than its hypotheses |
| [CompCertTSO, §§4–6](https://fzn.fr/projects/wmc/readings/compcerttso-long.pdf) | Verified compiler simulations and TSO optimizations; treats global memory effects, not only sequential values | ClightTSO/compiler pipeline differs from actual GNU/Clang/LLVM/Dat3M. Its stated generated-behavior inclusion direction alone does not give our source-error-to-target-error direction |
| [DESTIVA, §4, Theorems 4.7/4.9](https://mikekben.github.io/resources/OOPSLA_DESTIVA.pdf) | Spatial extraction with complete change information and temporal composition; directly relevant precedent for reducing repeated validation | The theorem depends on accurate changed sets. Sequential decomposition/data dependence is not automatically a shared-memory order proof or a verified host compiler |

DESTIVA explicitly conditions spatial soundness on compiler-instrumented change
sets accurately reflecting all changes; its fallback expands the problem.
Our exact LLVM frame comparison is useful evidence for the lifter's own change,
but says nothing by itself about source→LLVM or LLVM→Q host compilation.
[DESTIVA §§4.2–4.3](https://mikekben.github.io/resources/OOPSLA_DESTIVA.pdf)

The common-environment requirement is not new: Stellite's corresponding history
must use the same context parameters. This round's one-global-rf/co construction
is a deliberately stricter event-preserving sufficient condition, consistent
with earlier project audits, not a stronger general contextual theory.
[Stellite §4.3](https://www.cs.kent.ac.uk/people/staff/mjb211/docs/esop18.pdf)

The genuinely specific engineering work is the combination of authentic GNU
ports, typed universal templates, real LLVM interval checking, actual Dat3M
activation/monitor/query binding and explicit refusal without a host provider.
These are potentially reusable system components. They do not currently
establish independent algorithm novelty or a publication-ready system.
Template memoization is universal instantiation with conservative invalidation;
contract factorization is standard simulation composition. Neither is claimed
as a new theorem mechanism.

The comparison is an audit of the cited primary texts, not an impossibility
claim about future implementations or a claim to have exhaustively excluded
all compositional compiler research. A future verified provider must identify
its precise language/model, theorem direction, artifact relation, assertion
and prefix semantics; tool availability alone cannot fill these gaps.

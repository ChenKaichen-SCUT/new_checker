# Relation-guided synthesis (DSL only)

Run from `certifying-asm-lifter/` with Python 3.13 and `z3-solver==5.0.0.0`.
No compiler, Dat3M, target process, credentials or real-software mutation is used.
The subprocesses in `benchmark.py` execute only this Python module.

```powershell
python -m unittest relation_synthesis.test_core semantic_testing.test_core -v
python -m relation_synthesis.pilot experiments/relation-synthesis/my-pilot
python -m relation_synthesis.branch_acceptance experiments/relation-synthesis/my-branch
python -m relation_synthesis.benchmark campaign --manifest experiments/relation-synthesis/protocol-02/manifest.json --output experiments/relation-synthesis/my-campaign
python -m relation_synthesis.summarize experiments/relation-synthesis/my-campaign experiments/relation-synthesis/my-summary
python -m relation_synthesis.audit experiments/relation-synthesis/my-campaign experiments/relation-synthesis/my-replay.json
python -m relation_synthesis.integrity --verify
```

Use fresh output directories; none of these commands overwrite prior results.
Old unit tests can be directed with `SG_TEST_EVIDENCE` to a fresh evidence directory.

API:

```python
from relation_synthesis.grammar import domain
from relation_synthesis.patterns import targets
from relation_synthesis.encode import synthesize
from relation_synthesis.check import accept_synthesis, replay

directory = "experiments/relation-synthesis/my-query"
candidate = synthesize(domain(3), [{"pattern": targets()[5]}], directory)
if candidate["status"] == "SAT_CANDIDATE":
    checked = accept_synthesis(directory, targets())
    # Require acceptance.json CONFIRMED_SYNTHESIS, not SAT_CANDIDATE.
print(replay(directory))
```

Pattern JSON has `name/nodes/edges`. Each node has `kind` R/W and optional Boolean
`atomic/initial`. Each edge is `[relation,node_index,node_index,boolean]`.
Omitted edges are unconstrained; false explicitly requires absence. Relations:
`po/rf/co/fr/rmw/mfence/K/same_thread/same_obj`. Embeddings are injective.
Multiple requests share one program but have independently existential executions.
Optional `input` fixes only that witness's Boolean b, never the program's full domain.

Synthesis status: SAT_CANDIDATE / BOUNDED_UNSAT / UNKNOWN / TIMEOUT / INTERNAL_ERROR.
Complete acceptance requires raw-DSL reconstruction, concrete witness verification,
old symbolic B, explicit complete A₀, and whole-graph target extraction. Unknown
complete semantics retains the local witness but does not count as confirmed.
UNSAT replay uses Z3, not an independently checked resolution proof. Only the
declared finite slot grammar is covered by relative completeness.

Files include request/domain, exact SMT formula, solver model, raw program,
minimal witness, reconstructed grammar, independent graph certificates, full B/A₀
sets, per-path obligations, observations/properties, features and resource logs.
Timing runs preserve incomplete attempts and parent resource termination records.
`formal-01` has the disclosed attempt-cutoff flaw; `formal-02` uses the uniformly
repaired pure time budget. It is never valid to merge their best outcomes.

The published final table is `summary-03` (same `formal-02` data; adds complete
phase accounting), final correctness pilot `pilot-02`, extra branch check
`branch-both-01`. `replay-formal-01.json` rechecks 931 records; it is named for
the first publication replay, **not** for the superseded formal-01 experiment.
The report is `docs/relation-synthesis/00-review-report.md`.

# Finite semantics-guided prototype (stage 2)

This module only consumes `finite-tso-1` JSON. It never executes a compiler,
backend, original C program or external testing target. Read the Chinese
[review](../docs/semantics-guided-prototype/00-review-report.md) and
[proof correspondence](../docs/semantics-guided-prototype/02-algorithms-and-proof-correspondence.md).

Tested with Python 3.13.12 and `z3-solver==5.0.0.0`. Install into a separate
environment with `python -m pip install -r semantic_testing/requirements.txt`.
Commands below run from `certifying-asm-lifter/`; choose fresh output paths.
They deliberately refuse to overwrite an existing run directory.

```sh
python -m semantic_testing.test_core
python -O -m semantic_testing.test_core
python -m semantic_testing.run acceptance --frozen experiments/semantics-guided-prototype/frozen-01 --output output/sg-acceptance
python -m semantic_testing.audit --input output/sg-acceptance --output output/sg-acceptance-audit.json
python -m semantic_testing.run campaign --frozen experiments/semantics-guided-prototype/frozen-01 --output output/sg-pilot
python -m semantic_testing.audit --input output/sg-pilot --frozen experiments/semantics-guided-prototype/frozen-01 --output output/sg-pilot-audit.json
```

For unit-test evidence set `SG_TEST_EVIDENCE` to a fresh directory. Default:
`output/semantic-testing-unit/`. Unit artifacts are retained, including deliberate
certificate tamper fixtures. These are not injected defects in a real verifier.

Replay published final evidence without regenerating candidates:

```sh
python -m semantic_testing.audit --input experiments/semantics-guided-prototype/acceptance-05 --output output/sg-published-acceptance-audit.json
python -m semantic_testing.audit --input experiments/semantics-guided-prototype/pilot-03 --frozen experiments/semantics-guided-prototype/frozen-01 --output output/sg-published-pilot-audit.json
```

`dsl.py`: strict syntax/type/all-path definitions.
`symbolic.py`: algorithm B, complete graph blocking, budget => UNKNOWN.
`witness.py`: raw-program concrete execution and unified graph checks, no SMT.
`exhaustive.py`: separate explicit co/rf enumeration in A0 (Boolean inputs,
input-only store values and FAA operands), no solver or B path summaries.
`expectations.py`: independent completeness gate, exact terminal properties,
observation differences and open-read reachability.
`transforms.py`: constructors and separate rule side-condition checks.
`features.py`: full-graph relation patterns and three fixed selection policies.
`audit.py`: raw formula/blocker bindings, full graph reconstruction, features,
transformation claims and complete fixed selection ledger verification.

This implementation does not prove equivalence between FIFO operational TSO
and CAT. It does not change any legacy certificate or Gamma. B can construct
formulas beyond A0, but independent completeness is not authorized outside A0.
The entire input domain is part of every observation. SAFE is **DSL terminal
SAFE only**, never program SAFE for C, LLVM or Dat3M.

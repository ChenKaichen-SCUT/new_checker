# P1a acceptance — before P1b implementation

Status: restricted **D1a conditional SAFE transfer demonstrated**, not compiler
or verifier correctness. The sufficient-condition proof was written before
implementation; its implementation-pending status records that design point.
This report supplies the subsequent implementation/acceptance evidence.

`experiments/p1a/acceptance-01` contains six separate actual runs:

| Case | Actual backend observation | Checker |
|---|---|---|
| original CK, shared-read increment | PASS | CONDITIONAL_SAFE |
| main property changed to `x == 0` | FAIL; actual safety SAT | no SAFE transfer |
| increment bound to RMW read instead of entry read | PASS | write-value obligation rejected |
| increment changed to literal 1 | PASS | write-value obligation rejected |
| worker assertion negated | FAIL | monitor obligation rejected |
| actual solver assumption changed to false | PASS | actual-assumption obligation rejected |

The real optimized LLVM contains `%2 = load i32, ptr %0` and passes `%2`
to the unchanged CK inline asm. Its source is a known-object thread argument
round trip through `void *`. Two real worker activations each have independently
checked ordinary reads, locked RMW endpoints, live user monitor and completion.
No source or target register mapping was supplied by the harness or runner.

`fault-isolation.json` compares real pre/post-mutation objects: each value fault
changes one Store's value and its automatically derived reads; the assertion
fault changes one condition; the query fault changes no Program event. Event
census and all memory objects remain identical in all four cases.

The unsafe property is analytically false: initialize x=1, run worker 1 through
its read and locked addition (x=2), then worker 2 (x=4), join both, and test x==0.
Both worker `old != 0` checks succeed. The actual SAT query is retained separately;
the tool does not generally infer source FALSE from SAT alone.

Regression: 37 focused tests passed (33 P0/repair tests, four P1 entry tests).
`experiments/p1a/p0-regression-safe` reruns the original P0 source through actual
Dat3M and the full original gate: CONDITIONAL_SAFE, both actual queries UNSAT.
Old captures, query files and certificates were not overwritten. Component
tests with alpha-renamed registers are labelled as such and are not substituted
for these real runs.

Development evidence is retained: one prefix-state bug initially caused a
conservative rejection; startup/completion state evaluation was corrected.
The first negative Java build failed on an explicit integer-type cast; its
failure log remains. The second pinned negative build is the accepted build.
No unexpected backend conversion defect was established by these injected faults.

Next authorized stage: prove finite multi-hole substitution and exhaustive
call-context/activation coverage, then implement and test P1b. Do not generalize
this result to different worker functions, branching, arbitrary aliases or loops.

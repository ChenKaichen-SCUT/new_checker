# P1a proof/check correspondence and adversarial review

This is a new, explicitly named D1a domain; it does not retroactively enlarge D0.
The original eight Gamma contracts are copied verbatim into each program
certificate. No backend PASS is used as a semantic comparison premise.

| Required premise | Independent implementation obligation |
|---|---|
| C0 actual unchanged upstream interface | `authenticate_capture`, full raw/observer asm census, dependency/blob hashes, all-site srcloc identity join, `wrapper_interface`, exact inline debug lineage |
| Typed complete wrapper | original two typed formals; complete asm/return body; `+m` and `+q`/`+r`, exact clobbers and constraints; scalar return is the updated formal |
| Complete source reachability | full main and worker statement interpretation; exactly one direct wrapper call in whole AST; exactly main and worker survive in LLVM; no other call/asm admitted |
| Known pointer argument | `source_main(...typed_entry=True)`, `llvm_main`, actual ThreadCreate argument, ThreadArgument creator/index, exact complete-object pointee type |
| Universal input binding | `source_worker` and `llvm_worker` compare C argument values with actual LLVM operands over free typed read responses; no `%name -> rname` path |
| Local asm and lowering | unchanged independent reference, BLOCK_EXACT and LLVM_FRAGMENT_EXACT; candidate has original host frame and fresh SSA |
| Actual endpoints | `program_workers` consumes actual Program events in order, interprets register definitions, compares reference addresses, values, width, A/RMW tags and actual pair identity |
| Open output/continuation | actual RMW read writer receives the same reference response; actual continuation expression trees are interpreted from that environment; all monitors agree universally |
| Dynamic coverage | all actual named worker threads equal the checked create census, global event IDs unique, each creator/argument checked, per-activation fresh symbols and separate RMW obligations |
| Full shared/lifecycle partition | original `program_main`, full objects/Init/main/worker census, protocol private objects, joins and monitors; P1 typed argument extension preserves null-argument P0 default |
| C4 | unchanged query equations and completeness obligations in `p0_queries`; explicit D1a host result token; same-run actual audit, assumption literal, error and bound queries and API results |
| Final authorization | positive pinned build only, every layer checked, exact theorem bytes retained, all eight Gamma stated; never unconditional SAFE |

## What is and is not proved

The analytic prefix/substitution/graph proof establishes sufficiency of the
listed predicates. Python implementation refinement, AST/export capture,
LLVM host compilation, x86/CAT agreement, pthread protocol semantics, backend
encoding and solver soundness remain exactly the original Gamma obligations.
Implementing a predicate is not a mechanized proof of that code.

P1a reuses the pinned positive P0 exporter and actual query auditor unchanged.
Only the negative build installs `P1Faults`. These mutations happen to the actual
Program after preprocessing and before analyses/encoding, or to the actual
assumption passed to the solver. Pre/post snapshots are observational evidence,
not replacements for the same-run encoding snapshot. A test-only fault build
can never authorize SAFE even if an unexpected fault passes semantic checks;
the acceptance runner additionally requires the intended semantic rejection,
so this last prohibition is not counted as detecting a fault.

## Attacks considered analytically

1. **Equal-looking names:** replacing `%2` with an unrelated `r2` would be invalid.
   The old local endpoint API now rejects symbolic LLVM inputs without a proof.
   The new production path evaluates each actual writer and expression; a
   component-only alpha-renaming test checks that spelling has no special role.
2. **Independent read choices:** comparing each region under independently
   existentially chosen responses could hide an incorrect update. All equalities
   are universal in shared response variables. A fresh namespace is used for
   each actual activation; source/LLVM/Q reuse the same response within that
   activation. Global rf/co is transported once in the proof.
3. **Unspecified C evaluation order:** monitors are restricted to pure locals
   and literals; nested calls are rejected. A call is a complete declaration
   initializer, its first actual is a pure object address, and only the second
   actual can supply the supported scalar expression. No arbitrary expression
   evaluation order is assumed.
4. **Pointer arithmetic or alias guesses:** only a complete source object can
   travel through `void *`, with an exact pointee type and width on return.
   Numeric coincidences cannot identify distinct objects.
5. **Protocol register reuse:** startup and completion may write the same
   actual register. Their expressions must be evaluated in separate states.
   An initial development run correctly rejected the implementation's mistaken
   shared environment; the corrected checker models definitions in order.
6. **Dormant missing effects:** all source statements and every LLVM instruction
   and Q user effect are consumed. Missing ordinary reads, extra RMWs, early
   returns, arbitrary control, or additional worker threads cannot be dismissed
   merely because a final assertion remains true.

The narrow supported subset intentionally rejects general pointer arithmetic,
signed operations, additional call nesting, branching worker bodies and unknown
expression classes. These are explicit limitations, not new trusted assumptions.
P1b remains a separate gated stage.

# Restricted live continuation: proof before implementation

This addendum extends the worker theorem C, not the ISA or memory model.
It does not infer implementation correctness from passing executions.

## Domain and independently checked premises

The original LLVM worker has one asm definition `v`, followed only by a finite
straight-line sequence of 32/64-bit integer equality/inequality comparisons,
`zext i1 ... to i32`, verifier assertions, and `ret ptr null`. All data dependencies
of this continuation terminate at constants or `v`. Every instruction is
consumed by the parser; unknown instructions, flags, calls and types reject.
The asm inputs remain constants and static globals, and creation remains the
direct, straight-line pthread census of theorem C.

The actual final core worker has an authenticated closed asm region R. Outside
R, its user continuation consists only of interpreted pure locals and assertions
before the runtime completion events. No other user memory, assumption, branch,
call or observable action may be silently discarded. The checker must separately
identify and restrict the runtime prefix/suffix, and reject an assertion moved
into the asm interval. Source locations propose boundaries, not equalities.

Let L be the set of actual registers assigned in R and read outside R.
For this restricted extension require |L| = 1 for a live result (or L empty for
the already supported dead result). The unique register r is obtained from actual
RegWriter/RegReader objects, without a source-name convention or user mapping.
Require r's type equals v's type and prove, for every entry state and open memory
response, exit(R,r) = asm-output. This is the existing region output obligation.
An absent or additional live register rejects. This deliberately rejects valid
optimizations which leave multiple representations of the same source result.

Interpret the original LLVM continuation with v = a fresh symbolic value z.
Interpret the actual core continuation with r = the same z. Other actual
registers start as independent symbols; they cannot be assumed equal to z or
to constants. Check exactly the same ordered assertion count and prove each
corresponding Boolean assertion condition equal for every z and every independent
entry register. Check that v occurs in an assertion dependency and that at least
one condition genuinely depends on z (a satisfiable two-value difference).
Reject unproved obligations, including UNKNOWN. Save these obligations as well
as the region obligations. No assertion's truth is assumed while proving another.

## Lemma C-live (logical argument)

Pure expression evaluation respects substitution, by structural induction:
constants are unchanged, variables use the supplied valuation, and each typed
operator applies the same deterministic function to equal operands. Sequential
assignment extends that valuation; induction over the instruction list therefore
gives the interpreted assertion condition at each assertion occurrence.
The independent core interpretation has the same property.

By the region theorem R, corresponding executions reaching R's exit have equal
observable memory endpoints, order/pair relations and r = asm-output. LLVM
fragment exactness and interface reconstruction identify v with that same source
output. Instantiating both continuation interpretations at this common value z,
the universally established condition equalities give identical truth values
at every corresponding assertion. Pure assignments add no memory endpoints.
Consequently the continuation preserves assertion observations and the already
proved memory-event correspondence. It does not require choosing a concrete read
response or an enumerated set of inputs.

For n directly created workers, theorem C's bijection covers each activation.
Apply the preceding argument to each copy; the old endpoint/CAT isomorphism proof
still applies, since these pure continuations introduce no memory edges.
Ordinary compiler/host semantics, runtime completion/join handling, assertion
encoding, the restricted ISA/CAT interpretation, exporter, checker and solver
remain explicit trusted conditions. This is not a whole-program proof.

## Rejection and non-circularity

Boundary discovery, register census and candidate selection do not prove semantic
equalities. The region theorem consumes a projection only after checking it;
the continuation theorem consumes an independently interpreted original suffix.
Neither uses backend PASS, the candidate emitter's output expression, a manually
supplied register correspondence, or the truth of a program assertion.
Compiler authenticity and source/debug provenance remain external capture
conditions, not consequences of these SMT obligations.

Branches outside the asm region, multiple live registers, escaping return values,
additional user memory and unknown expression classes remain unsupported.
Implementation must satisfy these premises before this lemma is applicable.

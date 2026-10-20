# Same-invocation provenance and inline-call composition (design)

Status: this design was written before implementation. The final implementation
audit and restricted proof are in [09](09-ck-composition-proof.md); the same-run
acceptance and remaining trusted premises are in [the report](../15-ck-acceptance.md).
The completed previous delivery remains unchanged. Scope is the original CK
`ck_pr_faa_32` called by `benchmarks/ck-live.c`, not arbitrary C/LLVM.

## Objects and trust boundary

Let A be the actual Clang AST/SourceManager state in the invocation that emits
optimized LLVM L. A read-only observer exports every GCCAsmStmt, its enclosing
declaration, typed operands, full enclosing body, and source-location ancestry.
The original preprocessor inputs and raw AST are retained. SourceManager raw
encodings are invocation-local: never compare them across invocations.

Pinned Clang 21.1.8, `CGStmt.cpp:getAsmSrcLocInfo`, defines K(s) as the raw
encoding of the asm StringLiteral's begin location followed by the raw
locations of the start of each subsequent (non-final-empty) line. These are
exactly the integer tuple in L's `!srcloc`. K is an identity witness, not a hash
of asm text. Macro expansion creates SourceManager locations distinct from
spelling locations. All locations, including expansion/spelling ancestry, are
preserved. No file basename, routine-name selector, or template similarity is
used to select a site.

The observer's faithful serialization, pinned Clang's metadata emission and
preservation, ordinary C compilation, and the compiler process/dependency
receipt are explicit external trusted premises. Checking bytes and identities
does not prove that compiler contract. No cryptographic hash proves semantics.

## P: unique provenance join

For every surviving LLVM inline-asm call c, form
J(c) = {s in all exported asm nodes | K(s) = srcloc(c)}.
Require |J(c)| = 1; missing or ambiguous metadata rejects. Independently check
the template, ordered constraints, clobbers, target, types and argument
consumption, so identity matching cannot substitute for interface checking.
If the current implementation accepts one surviving static site, reject any
additional site; do not silently discard it. The full AST census is retained.

Lemma P (conditional on faithful metadata): c is associated with its actual
source asm. Clang's contract gives s_actual in J(c); cardinality one implies
J(c) = {s_actual}. This is a set-theoretic proof, independent of text equality.
Matching by debug path alone would not prove this lemma.

## I: typed call substitution, separate from provenance

Accepted inline wrappers must have exactly an asm followed by returning its
single scalar output parameter. No other expression statement, memory access,
branch, call, initializer or return conversion is admitted. Formal parameters
are unqualified canonical unsigned scalars or pointers to such objects.
Parentheses, lvalue-to-rvalue loads of scalar parameters, and canonical
identity pointer casts are interpreted explicitly. Other casts reject.

For an actual direct wrapper call in the host, recover parameter substitution
from ordered CallExpr arguments and declaration identities. Accepted concrete
arguments are an address of a suitably typed static global and representable
integer literals with explicit C conversion checks. Dereferencing the
identity-cast pointer yields the same lvalue; reading the scalar parameter
yields the same bit vector. Reconcile these independently derived values with
the actual LLVM indirect-memory arguments and read/write tied inputs.

Lemma I: within this expression grammar, evaluation under the call environment
equals evaluation of substituted operands, and the return is the updated
register-output value. Proof by induction on expression constructors:
parentheses preserve evaluation; a DeclRef is the environment lookup;
lvalue-to-rvalue reads that parameter's value; an identity pointer cast
preserves both pointer representation and pointee type; dereference preserves
the designated lvalue; address-of and integer literal cases are immediate.
The wrapper body has no additional transitions, so the return follows the asm
update. This lemma does not justify arbitrary aliasing casts, arithmetic,
volatile host reads, side effects, integer/pointer conversions, or hidden calls.

## N: multiplicity and composition

Distinguish source site s, static inline call context i, and worker activation a.
The witness is (s,i,a), not just s. The admitted host has one direct wrapper
call in its worker, no loops/branches before it, and a checked pure live
assertion continuation. Main has a finite straight-line direct pthread census.
Recover i from actual AST declaration/call links and independently check the
LLVM inline debug chain and enclosing worker. Recover a from actual
ThreadCreate-to-Thread links and compare it bijectively with source/LLVM
creation occurrences. All actual user-memory endpoints must be assigned to
the region for that activation; runtime framing is checked separately.
Reject ambiguous source-line intervals or extra live outputs/branches.

Theorem (restricted, conditional composition). Assume P and I, the existing
BLOCK_EXACT and LLVM_FRAGMENT_EXACT theorems, REGION_EXACT for each activation,
the checked host frame, and C-live continuation equivalence. Assume also the
declared compiler, ISA/model, backend exporter/encoder and solver contracts.
Then replacing the admitted inline asm preserves its open read-response
behavior, live returned value, and checked assertion continuation in every
potential worker activation of the admitted host.

Proof: P selects the actual source site; I instantiates its operands and
identifies the returned scalar. Local equivalence supplies equal endpoints
and output for every valuation and open read response. The activation
bijection supplies exactly one such proof for every potential occurrence.
Disjoint regions and exact outside framing prevent unassigned user events.
Substitution of equal outputs into the C-live relation preserves the ordered
assertion observations. Applying the existing conditional concurrent-context
theorem preserves allowed executions subject to its stated model/host
premises. No inference uses a Dat3M PASS or sample enumeration.

No claim of arbitrary event restructuring, multiple surviving static sites,
general C compiler verification, or whole-program formal correctness follows.
Implementation and evidence must separately discharge each syntactic premise;
until then these are lemmas over the stated objects, not implementation facts.

The delivered implementation further restricts the selected template to plain
narrow string tokens without escapes/newlines, two read-write outputs (one
memory and one scalar), one direct wrapper call context, and a small attribute
whitelist excluding hidden entry points. It separately checks the source C
assertion conditions against the original LLVM continuation. These restrictions
strengthen the admission premises; they do not change the reference semantics.

Source: [pinned Clang code](https://github.com/llvm/llvm-project/blob/llvmorg-21.1.8/clang/lib/CodeGen/CGStmt.cpp#L2427),
[read-only plugin action order](https://clang.llvm.org/docs/ClangPlugins.html#interaction-with-clear-ast-before-backend).

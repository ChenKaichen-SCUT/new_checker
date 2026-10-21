# Trust boundary and implementation correspondence

The small reusable component is the **block proof service**, not a newly
verified whole-program kernel. Python, its parsers, symbolic interpreters and
SMT remain in Gamma_check. The new prototype does not shrink the program-SAFE
TCB: D2's complete host interpreter remains its only implemented HCC provider.
It becomes optional for local certification, not optional for an otherwise
unsupported program's SAFE result. No verified external host provider exists.

| Obligation | Automatic implementation evidence | Remaining original trust |
|---|---|---|
| H1 objects/domain | `prepare_entry`, `source_main`, `source_worker`, `llvm_main`; whole-object types, initializers, arguments, ordinary/asm conflict exclusion | Gamma_front/ISA/domain, actual object validity and GNU extension meaning |
| H2 host | `llvm_worker`, `llvm_main`, `program_workers`, `program_main` consume every supported operation | Gamma_front's original open compilation contract, Gamma_check/capture |
| H3 ports | `wrapper_interface`, block proof, `check_fragment`, actual register definition/use and live continuation obligations | compiler metadata/capture and implementation refinement; no `%name` guessing |
| H4 global order | ordered complete host/region partition and actual RMW/A checks; unchanged CAT/build | Gamma_ISA CAT bridge; Gamma_runtime private protocol projection |
| H5 coverage | dependent create→worker→static-call union and actual start/argument/endpoint identities | Gamma_capture/runtime; no induction provider for loops |
| H6 finite prefixes | supported straight-line host/assertion census and C4 property checks | Gamma_runtime/encode explicitly include prefix adequacy; this is not mechanically proved by an SMT UNSAT |
| H7 artifacts | authenticated capture/dependencies, exact unchanged frame, pinned jar/CAT, same-run before/after Program and implementation snapshots | Gamma_front/capture, OS/build fidelity |
| H8 queries | `p0_queries.check_queries`: actual safety task, assertions, assumption, stack, property/bound formula and result | Gamma_encode/check/solve; no independent solver proof checker |

All eight original Gamma strings are carried unchanged from `certify_p0.py`.
There are no new *semantic* assumptions on the accepting path. There is new
implementation code in the existing Gamma_check boundary, so its engineering
surface has grown; it would be misleading to call the whole TCB smaller.

| Comparison | D2 before | Scheme A prototype |
|---|---|---|
| Host source semantics | restricted conflict-free GNU/x86 | identical for program SAFE |
| Host compiler theorem | assumed original Gamma_front plus exhaustive restricted checks | identical; HCC makes these obligations explicit |
| Backend import/runtime | checked restricted projection plus original Gamma | identical |
| Whole-host checking | mandatory before translation preparation | optional for local-only ports; mandatory for program SAFE |
| Block proof | once per static call | once per exact semantic template per run |
| LLVM/Q checking | per actual site/activation | retained per actual site/activation |
| External verified host theorem | none | none; naming CompCertTSO does not supply one |
| HCC declaration without basis | no such input | explicitly rejected; independently completed local evidence retained |
| Loop guarantee | none | none implemented; conditional induction theorem only |

## Prototype interfaces

`certification/templates.py` uses canonical normalized GNU text, candidate IR,
width, address width, model and exact implementation hashes as the key. It calls
the independent block checker on every first key. Certificates are held as
private immutable serialized bytes and returned by copy; checked evidence bytes
are verified on reuse. No persisted `EXACT` JSON can be imported to authorize
reuse. The certificate reference points to the single saved SMT bundle.
Width/IR/key mutations require a new proof or reject. Cache identity is not
semantic correctness: actual first-use SMT checks establish the proposition.

`prepare.py` and `p1_entry.py` gain only an optional internal `template_pool`
argument. Existing runners default to no reuse. Fragment interpretation,
untouched host frame, SSA freshness, typed source/LLVM interpretation, Q region
checks and continuation checks are unchanged. A proof of an open block is
reusable; a certificate for one actual worker or result register is not.

`local_ports.py` authenticates the real capture, joins all surviving LLVM asm
to the whole AST through checked origin tuples and inline lineage, checks the
unchanged wrapper and typed interface, and independently checks each actual
LLVM replacement. It does **not** interpret main, branches or worker argument
expressions. Its precise conclusion is conditional port equality for all valid
typed LLVM entries. Source argument evaluation, object validity, full source
dynamic coverage, Q and safety remain pending. It is not a complete-source
certificate merely because all surviving LLVM sites were found.

`hcc.py` declares the exact artifacts, direction, model, required clauses and
provider. The schema is closed: additional assumptions, a fabricated verified
provider, wrong artifact or wrong direction rejects. Only `d2-checked` can
discharge a contract, and `certify_hcc.py` recomputes its original C0-C4 checks;
it never loads a provider's asserted `PASS` from disk. `unavailable` explicitly
closes SAFE while retaining local results. Malformed/missing declarations also
reject. On supported inputs, the actual Q hash, transformed module and actual
query audit are attached after the same run, rather than predicted by a caller.

The implementation API is Python code in Gamma_check, not a hostile-code
sandbox: calling internal functions with fabricated objects is not the public
certificate acceptance interface. The production CLI accepts source captures,
pinned builds and declarations only, not prepared regions/register maps.

## Limits and decision rule

No source statement was moved into an unconditional trusted HCC. Complex local
ports can now be checked without the host interpreter, but accepting a complex
whole program still requires a credible provider. A proof-assistant-certified
open host bridge, or independently checked host simulation certificate, would
be future work requiring separate authorization and a concrete implementation.
We have not created either by giving a name to the missing conditions.

If measured coverage only increases at the local layer and no robust cost
benefit is shown, the broad Scheme A claim is **No-Go in this delivery**. That
does not negate the usefulness of the evidence API or future tool research.

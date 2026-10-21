# Frozen CK context audit

Baseline: `caed1a34dd551ba6ac1bfdf153675fb8cb13dc77`.

This is a **static applicability audit**, not an adapter or new semantic checker.
All 15 pre-existing L2 sites remain in the denominator. Six are FAA32; none of
their unchanged complete upstream contexts satisfies the existing guarded domain.
The other nine are five FAA64 and four XCHG sites. Result: **NO_GO for integration
by capture adaptation alone**. Original L2 results remain unchanged.

Chinese review: [report](../../docs/ck-context-audit/01-report-zh.md),
[six detailed candidates](../../docs/ck-context-audit/02-six-candidates.md),
[all 15 sites](../../docs/ck-context-audit/03-all-sites.md),
[replay and limitations](../../docs/ck-context-audit/04-replay-and-review.md).

Run `python reconstruct.py --verify` and `python render_table.py --verify` from
this directory, or invoke their paths from any directory. Only Python's standard
library is required. No compiler/backend/SMT/test experiment is executed.

- `evidence/`: deterministic facts reconstructed from frozen raw objects.
- `evidence/raw/`: unchanged full C/LLVM copies and selected full header buffers.
- `evidence/inputs.json`: hashes and CAS locations, including raw AST and all
  original per-site certificate/SMT/validation files read in this audit.
- `assessments.json`: explicitly manual, evidence-backed domain judgements.
- `audit-table.json/csv`: the full joined table, not a semantic certificate.
- `logs/`: final static reconstruction and publication-preparation checks.

No third-party code was altered. Upstream copyright/license notices in copied
headers and test sources are retained. The original CK repository/commit and
compilation commands are recorded in `evidence/registration.json`. The raw
capture package already belongs to the frozen repository; no tool binaries or
credentials are added here.

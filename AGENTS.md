# Repository workflow

- The user authorized uploading this research to
  `https://github.com/ChenKaichen-SCUT/new_checker` and pushing subsequent updates.
  After completing an authorized update, run relevant checks, commit it, push to
  the configured upstream, and verify the remote commit. Do not force-push or
  overwrite unrelated remote work.
- Report each completed research stage and the next stage to the user.
- Current authorization: audit stages 1–4, then run the minimum real-source
  acceptance using only `certifying-asm-lifter/benchmarks/backend-source.c`,
  pinned Clang 21 and Dat3M, and a few controlled faulty transformations.
  Save actual compiler/solver objects, all obligations and execution logs.
  No full SV-COMP runs, batch performance evaluation or instruction expansion.
  Stop after this acceptance delivery; further expansion needs user approval.
  This minimum acceptance is now complete. Preserve its raw runs and stop
  compiler/verifier experiments until the user gives the next instruction.
- Establish theoretical claims with logical proofs; experiments and enumeration
  are validation evidence, not substitutes for proofs.
- Keep proved results, assumptions, experimental observations, and open gaps
  distinct. Preserve the current limitations until new evidence resolves them.
- Keep downloaded toolchains, literature caches, credentials, and temporary
  binaries out of Git. Preserve third-party attribution and artifact hashes.

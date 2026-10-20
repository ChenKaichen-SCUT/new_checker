# Repository workflow

- The user authorized uploading this research to
  `https://github.com/ChenKaichen-SCUT/new_checker` and pushing subsequent updates.
  After completing an authorized update, run relevant checks, commit it, push to
  the configured upstream, and verify the remote commit. Do not force-push or
  overwrite unrelated remote work.
- Report each completed research stage and the next stage to the user.
- Current review gate (user instruction): deliver revised stages 1–4 first.
  Do not run experiments, pytest/SMT validation, native comparisons, compiler or
  verifier experiments until the user explicitly approves. Source inspection,
  mathematical reasoning, editing, and file syntax/link/hash checks may continue.
  This gate overrides the normal request to run relevant execution checks before
  pushing; label the new implementation as unvalidated when pushing this delivery.
- Establish theoretical claims with logical proofs; experiments and enumeration
  are validation evidence, not substitutes for proofs.
- Keep proved results, assumptions, experimental observations, and open gaps
  distinct. Preserve the current limitations until new evidence resolves them.
- Keep downloaded toolchains, literature caches, credentials, and temporary
  binaries out of Git. Preserve third-party attribution and artifact hashes.

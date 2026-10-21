"""In-process reuse of independently checked universal BLOCK proofs only.

There is deliberately no API for importing a certificate/status from disk.
Every run rechecks each distinct semantic template. LLVM and Q instantiations
are never cached. The full Python implementation remains in Gamma_check.
"""
import json
import time
from pathlib import Path
from checker.check import check, MODEL_VERSION
from certification.interface import sha
from certification.evidence import save_json
from certification.provenance import require
from certification.run_pipeline import ROOT, implementation_hashes


def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


class TemplatePool:
    def __init__(self, directory):
        self.directory = Path(directory)
        self.directory.mkdir(parents=True, exist_ok=False)
        self.implementation = implementation_hashes()
        self._checked = {}
        self.requests = []

    def verify(self, normalized, candidate, width):
        # Key does not identify concrete calls; all values remain universally
        # quantified. GNU binding/clobber checks remain mandatory at every site.
        require(implementation_hashes() == self.implementation, "template implementation changed")
        signature = {"normalized": normalized, "candidate": candidate, "width": width,
                     "address_width": 64, "model": MODEL_VERSION,
                     "implementation": self.implementation}
        key = sha(canonical(signature))
        tick = time.perf_counter()
        reused = key in self._checked
        if not reused:
            directory = self.directory / key
            cert = check(normalized, candidate, width, output_dir=directory)
            save_json(directory / "certificate.json", cert)
            save_json(directory / "signature.json", signature)
            require(cert["result"] == "EXACT", "template proof rejected: " + cert.get("reason", "unknown"))
            # Private immutable serialization, never retain a caller's mutable IR.
            payload = canonical(cert)
            files = {p.name: sha(p.read_bytes()) for p in directory.iterdir() if p.is_file()}
            self._checked[key] = (payload, files)
        payload, files = self._checked[key]
        directory = self.directory / key
        require(all((directory / p).is_file() and sha((directory / p).read_bytes()) == h
                    for p, h in files.items()), "template evidence mutated")
        cert = json.loads(payload)
        proof_path = directory.resolve().relative_to(ROOT.resolve()).as_posix() if directory.resolve().is_relative_to(ROOT.resolve()) else str(directory.resolve())
        cert["template_reference"] = {"key": key, "evidence_directory": proof_path,
                                      "certificate_sha256": files["certificate.json"],
                                      "reused_in_this_run": reused,
                                      "scope": "BLOCK_ONLY; per-site interface/LLVM and per-Q-instance checks required"}
        self.requests.append({"key": key, "reused": reused, "seconds": time.perf_counter() - tick})
        save_json(self.directory / "reuse.json", self.summary())
        return cert

    def summary(self):
        return {"requests": self.requests, "site_requests": len(self.requests),
                "distinct_template_proofs": len(self._checked),
                "avoided_block_proofs": sum(r["reused"] for r in self.requests),
                "persistent_certificate_import": False,
                "instantiation_checks_skipped": 0}

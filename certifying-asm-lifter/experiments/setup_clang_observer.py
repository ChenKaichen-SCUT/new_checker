"""Local-only pinned observer SDK setup; no system package changes."""
import json
import urllib.request
from pathlib import Path
from certification.run_pipeline import ROOT
from certification.evidence import Commands, save_json
from certification.interface import sha
from experiments.run_dat3m import linux

PACKAGES = {
    "libclang-21-dev": ("30202524", "ba5797e02caf800e49560a2c0971c410b05c90083d9d6b5ad7124f9f24056642"),
    "llvm-21-dev": ("51694656", "aa13e8f4ad91572eaf40e959232d32e07362856e14f22861236017c544ed11d4"),
}


def run():
    out = ROOT / "experiments/ck-provenance/sdk-setup"
    out.mkdir(parents=True, exist_ok=False)
    logs = Commands(out / "commands")
    root = ROOT / "vendor/clang-observer-sdk"
    root.mkdir(exist_ok=True)
    receipt = {}
    for name, (size, expected) in PACKAGES.items():
        _, metadata, _ = logs.run(["wsl", "-d", "Ubuntu", "--exec", "apt-cache", "show", name])
        (out / (name + ".metadata.txt")).write_bytes(metadata)
        filename = f"{name}_21.1.8-6ubuntu1_amd64.deb"
        url = "https://archive.ubuntu.com/ubuntu/pool/universe/l/llvm-toolchain-21/" + filename
        target = root / filename
        with urllib.request.urlopen(url, timeout=90) as response:
            data = response.read()
        if len(data) != int(size) or sha(data) != expected:
            raise RuntimeError("package size/hash mismatch")
        target.write_bytes(data)
        logs.run(["wsl", "-d", "Ubuntu", "--exec", "dpkg-deb", "-x", linux(target), linux(root)])
        receipt[name] = {"url": url, "bytes": len(data), "sha256": expected,
                         "version": "1:21.1.8-6ubuntu1"}
        save_json(out / "receipt.json", receipt)
    print(json.dumps(receipt, indent=2))


if __name__ == "__main__":
    run()

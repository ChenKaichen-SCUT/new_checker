"""Durable evidence utilities. No solver or transformation semantics here."""
import json
import subprocess
from pathlib import Path
from certification.interface import sha
from frontend.gnu import Reject
from certification.platform_launch import native_args


def save_json(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes((json.dumps(value, indent=2, ensure_ascii=False) + "\n").encode("utf-8"))


def save_certificate(directory, cert):
    directory = Path(directory)
    directory.mkdir(parents=True, exist_ok=True)
    for i, obligation in enumerate(cert.get("obligations", [])):
        if "smt2" in obligation:
            filename = f"{i:03d}-{obligation['name']}.smt2"
            data = obligation["smt2"].encode("utf-8")
            (directory / filename).write_bytes(data)
            obligation.update(file=filename, smt_sha256=sha(data))
    save_json(directory / "certificate.json", cert)


class Commands:
    """Keep stdout/stderr even for failure/timeout; args are never a shell string."""
    def __init__(self, directory):
        self.directory = Path(directory)
        self.directory.mkdir(parents=True, exist_ok=True)
        self.rows = []

    def run(self, args, timeout=120, allow_failure=False):
        i = len(self.rows)
        prefix = f"{i:03d}"
        row = {"args": [str(a) for a in args], "stdout": prefix + ".stdout.log",
               "stderr": prefix + ".stderr.log"}
        self.rows.append(row)
        try:
            executed = native_args(row["args"])
            if executed != row["args"]:
                row["executed_args"] = executed
            process = subprocess.run(executed, capture_output=True, timeout=timeout)
            stdout, stderr = process.stdout, process.stderr
            row["returncode"] = process.returncode
        except subprocess.TimeoutExpired as error:
            stdout, stderr = error.stdout or b"", error.stderr or b""
            row.update(returncode=None, timeout_seconds=timeout)
        (self.directory / row["stdout"]).write_bytes(stdout)
        (self.directory / row["stderr"]).write_bytes(stderr)
        save_json(self.directory / "commands.json", self.rows)
        if row["returncode"] != 0 and not allow_failure:
            raise Reject("external command failed; inspect " + str(self.directory / row["stderr"]))
        return row["returncode"], stdout, stderr

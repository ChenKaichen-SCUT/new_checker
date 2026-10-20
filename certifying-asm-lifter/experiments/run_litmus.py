import json
from run_dat3m import ROOT, VENDOR, run

results = []
for path, model in [
    (VENDOR / "litmus/X86/SB.litmus", "sc"),
    (VENDOR / "litmus/X86/SB.litmus", "tso"),
    (ROOT / "benchmarks/litmus/SB-SF.litmus", "tso"),
    (ROOT / "benchmarks/litmus/SB-MF.litmus", "tso"),
]:
    r = run(path, model, extra=("--printer.afterProcessing=true",))
    # PASS on an existential Litmus specification means the requested outcome exists.
    r["exists_outcome_allowed"] = True if r["result"] == "PASS" else False if r["result"] == "FAIL" else None
    (ROOT / "experiments/backend-logs" / (path.stem + "-" + model + ".log")).write_text(r["output"], encoding="utf-8")
    results.append(r)
    print(path.stem, model, r["result"], flush=True)
(ROOT / "experiments/litmus-backend-results.json").write_text(json.dumps(results, indent=2), encoding="utf-8")

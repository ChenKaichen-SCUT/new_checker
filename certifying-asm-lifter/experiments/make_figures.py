import json
from pathlib import Path
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

ROOT = Path(__file__).resolve().parents[1]
data = json.loads((ROOT / "experiments/checker-results.json").read_text())["rows"]
groups = [("Raw extracted\n(no type context)", "raw_statement_without_C_type_context"),
          ("Normalized\ninterfaces", "manually_normalized_interface")]
fig, axs = plt.subplots(1, 2, figsize=(10, 3.6), layout="constrained")
totals = [sum(r["category"] == c for r in data) for _, c in groups]
exact = [sum(r["category"] == c and r["result"] == "EXACT" for r in data) for _, c in groups]
axs[0].bar([0, 1], exact, label="EXACT", color="#287F8E")
axs[0].bar([0, 1], [n - a for n, a in zip(totals, exact)], bottom=exact, label="REJECT", color="#CCD4DA")
axs[0].set_xticks([0, 1], [x[0] for x in groups])
axs[0].set_ylabel("Asm statements / normalized cases")
axs[0].set_title("Coverage: categories must not be pooled")
axs[0].legend(frameon=False)
for i, (n, a) in enumerate(zip(totals, exact)):
    axs[0].text(i, n + 1, f"{a}/{n} EXACT", ha="center", fontsize=9)
rows = [r for r in data if r["category"] == groups[1][1] and r["result"] == "EXACT"]
axs[1].barh([r["name"] for r in rows],
            [1000*r["checker_median_seconds"] for r in rows], color="#287F8E")
axs[1].set_xlabel("Checker median wall time (ms, 5 runs)")
axs[1].set_title("Exploratory Windows measurements")
fig.savefig(ROOT / "experiments/checker-summary.png", dpi=180)
fig.savefig(ROOT / "experiments/checker-summary.svg")

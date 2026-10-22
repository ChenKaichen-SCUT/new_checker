"""Read-only analysis of retained runs; writes only a new summary directory."""
import argparse
import csv
import statistics
from pathlib import Path
from .dsl import canonical, require
from .run import load, save


def main():
    parser = argparse.ArgumentParser(); parser.add_argument("--root", required=True); parser.add_argument("--output", required=True)
    args = parser.parse_args(); root, output = Path(args.root), Path(args.output)
    output.mkdir(parents=True, exist_ok=False)
    s = load(root / "pilot-03" / "selection.json")
    rows = []
    for r in s["runs"]:
        rows.append({"budget": r["budget"], "seed": r["seed"], "strategy": r["strategy"], **r["coverage"],
                     "effective_ratio": r["effective_ratio"], "selection_seconds": r["selection_seconds"],
                     "selected_oracle_seconds": r["selected_oracle_seconds"], "selected_evidence_bytes": r["selected_evidence_bytes"]})
    with (output / "selection.csv").open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0])); w.writeheader(); w.writerows(rows)
    pairs = []
    for budget in (5, 10, 20):
        for base in ("random", "syntax"):
            for metric in ("objective", "heldout_three", "heldout_behavior"):
                changes = []
                for seed in (11, 29, 47, 71, 101):
                    a = next(r for r in rows if r["budget"] == budget and r["seed"] == seed and r["strategy"] == "semantic")
                    b = next(r for r in rows if r["budget"] == budget and r["seed"] == seed and r["strategy"] == base)
                    changes.append(a[metric] - b[metric])
                pairs.append({"budget": budget, "baseline": base, "metric": metric, "paired_differences": changes,
                              "wins": sum(v > 0 for v in changes), "ties": changes.count(0), "losses": sum(v < 0 for v in changes)})
    save(output / "paired.json", pairs)
    stable = []
    for task in sorted((root / "pilot-03").glob("p*/result.json")):
        final = load(task); key = task.parent.name
        for prior in ("pilot-01", "pilot-02"):
            old = load(root / prior / key / "result.json")
            same = {canonical(c["core"]) for c in old["graphs"]} == {canonical(c["core"]) for c in final["graphs"]}
            require(same and old["observations"] == final["observations"], "SEMANTIC_REVISION_DISAGREEMENT")
            stable.append({"task": key, "prior": prior, "full_graph_and_observation_sets_equal": same})
    save(output / "revision-consistency.json", stable)
    tasks = load(root / "pilot-03" / "tasks.json")
    results = [load(f) for f in (root / "pilot-03").glob("*/result.json")]
    summary = {"denominator": len(tasks), "complete": sum(t["status"] == "COMPLETE" for t in tasks),
        "agreement": sum(t["independent"] == "AGREEMENT" for t in tasks), "graphs": sum(t["graphs"] for t in tasks),
        "observations": sum(t["observations"] for t in tasks), "queries": sum(len(r["queries"]) for r in results),
        "final_unsat": sum(sum(q["status"] == "unsat" for q in r["queries"]) for r in results),
        "preprocessing": s["preprocessing"], "total_campaign": load(root / "pilot-03" / "campaign-resource.json"),
        "phase_totals": {k: sum(r["metrics"][k] for r in results) for k in results[0]["metrics"]},
        "oracle_median_seconds": statistics.median(t["wall_seconds"] for t in tasks),
        "oracle_max_seconds": max(t["wall_seconds"] for t in tasks), "coverage": s["summary"],
        "feature_unions": s["feature_unions"], "paired": pairs,
        "conclusion": {"finite_oracle": "RESTRICTED_GO_A0", "transformations": "RESTRICTED_GO",
            "selection": "SMALL_BUDGET_PILOT_BENEFIT_ONLY", "new_algorithm": "NOT_ESTABLISHED", "real_tool_testing": "NOT_AUTHORIZED_NEXT_REVIEW_REQUIRED"}}
    save(output / "summary.json", summary)


if __name__ == "__main__": main()

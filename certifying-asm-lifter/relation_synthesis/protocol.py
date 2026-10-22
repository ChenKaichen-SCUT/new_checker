"""Freeze the common grammar, relation targets and budgets BEFORE solving."""
from pathlib import Path
from semantic_testing.run import save, env
from semantic_testing.dsl import digest
from .grammar import domain
from .patterns import targets, negatives


def freeze(output):
    output = Path(output); output.mkdir(parents=True,exist_ok=False)
    p = dict(baseline='4ffe20639ea376485e04a7d545e84776233e80d1',version='relation-protocol-1',
        domains=[domain(2),domain(3)],targets=targets(),negative_targets=negatives(),
        pilot_seed=7,seeds=[11,29,47],strategies=['random','syntax','semantic','inverse'],
        modes=[dict(name='count3',outputs=3,seconds=60),dict(name='time12',outputs=None,seconds=12)],
        pool_size=8,max_attempts=24,synthesis_seconds=15,oracle_seconds=15,max_graphs=512,
        process_memory_bytes=2147483648,hard_grace_seconds=3,
        optimization='FAA predecessor redundant propagation on; targeted ablation off',
        selection='random stream; syntax greedy batches of 8; semantic FULL batches of 8 ranked by new target hits then F2; inverse requests next unmet target',
        multi_target='pilot only: two targets share grammar, independent execution copies',
        timing='isolated sequential Python workers; end-to-end including all generation/SMT/oracle/A/features/I/O; outputs completed after deadline excluded',
        dedup='canonical raw program before oracle; completed outputs dedup by complete F2+F3 feature-set; retain all attempts',
        evaluation=['target_hit','full_graphs','F2','heldout_F3','behavior_probes','observations','paths','wall_cpu','queries','peak_bytes','evidence_bytes','duplicates','failures'],
        go='separate correctness, novel-in-old-pool, paired count/time effectiveness, method novelty; no verifier claim')
    save(output/'manifest.json',p); save(output/'manifest-sha256.json',dict(sha256=digest(p)))
    save(output/'environment.json',env())
    return p


if __name__ == '__main__':
    import sys
    freeze(sys.argv[1])

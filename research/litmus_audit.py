"""Small exhaustive counterexample checks, NOT an ISA implementation or proof.

Abstract SC and FIFO-store-buffer TSO, aligned single-location accesses only.
Compiler barriers and SFENCE are no-ops in this restricted ordinary-WB model.
Locked RMW is an indivisible memory operation requiring an empty local buffer.
All programs are finite; there are no C data-race/undefined-behavior rules here.
"""
from collections import deque
import json
from pathlib import Path


def explore(programs, model="TSO"):
    # State: PCs, shared x/y/z, per-thread FIFO buffers, per-thread register r.
    n = len(programs)
    initial = ((0,) * n, (0, 0, 0), ((),) * n, (-1,) * n)
    queue = deque([initial])
    seen = {initial}
    outcomes = set()
    while queue:
        pc, mem, buffers, regs = queue.popleft()
        if all(pc[t] == len(programs[t]) for t in range(n)) and not any(buffers):
            outcomes.add((regs, mem))
        successors = []
        for t in range(n):
            if model == "TSO" and buffers[t]:
                m, b = list(mem), list(buffers)
                address, value = b[t][0]
                m[address], b[t] = value, b[t][1:]
                successors.append((pc, tuple(m), tuple(b), regs))
            if pc[t] == len(programs[t]):
                continue
            op, *args = programs[t][pc[t]]
            if op in ("F", "A", "CF") and buffers[t]:
                continue
            p, m, b, r = list(pc), list(mem), list(buffers), list(regs)
            p[t] += 1
            if op in ("W", "WR"):
                address = args[0]
                value = args[1] if op == "W" else r[t] + 1
                if model == "TSO":
                    b[t] += ((address, value),)
                else:
                    m[address] = value
            elif op in ("R", "CF", "CU"):
                address = args[0]
                # CF/CU are guaranteed-failing CAS on z, expected value 1.
                value = next((v for a, v in reversed(b[t]) if a == address), m[address])
                if op == "R":
                    r[t] = value
                else:
                    assert value == 0
            elif op == "A":
                address = args[0]
                r[t], m[address] = m[address], m[address] + 1
            elif op not in ("F", "CB", "SF"):
                raise ValueError(op)
            successors.append((tuple(p), tuple(m), tuple(b), tuple(r)))
        for state in successors:
            if state not in seen:
                seen.add(state)
                queue.append(state)
    return outcomes, len(seen)


def run():
    result = {}
    for model, barrier in [("SC", None), ("TSO", None), ("TSO", "CB"),
                           ("TSO", "SF"), ("TSO", "F"),
                           ("TSO", "CF"), ("TSO", "CU")]:
        middle = [] if barrier is None else [(barrier, 2)]
        programs = [[("W", 0, 1)] + middle + [("R", 1)],
                    [("W", 1, 1)] + middle + [("R", 0)]]
        outcomes, states = explore(programs, model)
        result[f"SB_{model}_{barrier or 'none'}"] = {
            "read_pairs": sorted({r for r, _ in outcomes}), "states": states}
    for name, programs in {
        "atomic_increments": [[("A", 0)], [("A", 0)]],
        "split_increments": [[("R", 0), ("WR", 0)], [("R", 0), ("WR", 0)]],
        "two_stores": [[("W", 0, 1), ("W", 0, 2)], [("R", 0)]],
        "only_last_store": [[("W", 0, 2)], [("R", 0)]],
    }.items():
        outcomes, states = explore(programs, "SC")
        result[name] = {"observations": sorted(outcomes), "states": states}
    assert [0, 0] not in [list(x) for x in result["SB_SC_none"]["read_pairs"]]
    assert (0, 0) in result["SB_TSO_none"]["read_pairs"]
    assert (0, 0) in result["SB_TSO_CB"]["read_pairs"]
    assert (0, 0) in result["SB_TSO_SF"]["read_pairs"]
    assert (0, 0) not in result["SB_TSO_F"]["read_pairs"]
    assert (0, 0) not in result["SB_TSO_CF"]["read_pairs"]
    assert (0, 0) in result["SB_TSO_CU"]["read_pairs"]
    assert {m[0] for _, m in result["atomic_increments"]["observations"]} == {2}
    assert {m[0] for _, m in result["split_increments"]["observations"]} == {1, 2}
    assert {r[1] for r, _ in result["two_stores"]["observations"]} == {0, 1, 2}
    assert {r[1] for r, _ in result["only_last_store"]["observations"]} == {0, 2}
    path = Path(__file__).with_name("litmus_results.json")
    path.write_text(json.dumps(result, indent=2), encoding="utf-8")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    run()

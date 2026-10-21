#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../.."
python3 -m venv output/gap45-replay-venv
output/gap45-replay-venv/bin/python -m pip install z3-solver==5.0.0.0
output/gap45-replay-venv/bin/python -m experiments.gap45.publish --prefix pilot-01
output/gap45-replay-venv/bin/python -m experiments.gap45.replay --out output/gap45-portable-replay

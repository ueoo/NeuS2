#!/usr/bin/env bash

set -euo pipefail

# # Activate conda env 'sdf' with Python 3.9
# if [ -f "/home/ubuntu/miniconda/etc/profile.d/conda.sh" ]; then
# 	. "/home/ubuntu/miniconda/etc/profile.d/conda.sh"
# elif command -v conda >/dev/null 2>&1; then
# 	eval "$(conda shell.bash hook)"
# fi
# conda activate sdf

# # Ensure Python can find the locally built extension and prefer system libstdc++
export PYTHONPATH="/home/ubuntu/NeuS2/build:${PYTHONPATH:-}"
export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH:-}"
export LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libstdc++.so.6:${LD_PRELOAD:-}"

python /home/ubuntu/NeuS2/scripts/run.py \
    --gui \
	--save_mesh \
	--save_mesh_path /home/ubuntu/NeuS2/output/dtu_test/mesh/15000.obj \
	--scene /home/ubuntu/NeuS2/data/dtu_scan24/transform.json \
	--name dtu_test \
	--network dtu.json \
	--n_steps 15000

# Alternative CLI app without Python:
# /home/ubuntu/NeuS2/build/testbed --no-gui --scene /home/ubuntu/NeuS2/data/dtu_scan24/transform.json



exit 0

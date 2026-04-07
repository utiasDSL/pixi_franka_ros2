#!/bin/bash
set -euo pipefail

current_dir="$PWD"

cd "$HOME/repos/franka_desk_api_client"
uv run scripts/enable_franka.py 172.16.1.2
cd "$current_dir"

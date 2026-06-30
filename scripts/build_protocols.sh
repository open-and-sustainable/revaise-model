#!/usr/bin/env bash
# Build the RevAIse protocol documentation site for GitHub Pages.
#
# Usage: scripts/build_protocols.sh [out_dir]
set -euo pipefail

OUT="${1:-site_protocols}"

mkdocs build -f mkdocs-protocols.yml --site-dir "$OUT"

echo "Built protocol site -> ${OUT}"

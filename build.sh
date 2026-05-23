#!/usr/bin/env bash
# Simple shell build script to render the Quarto book locally
set -euo pipefail

if ! command -v quarto >/dev/null 2>&1; then
  echo "Quarto not found. Install from https://quarto.org and retry." >&2
  exit 1
fi

echo "Rendering Quarto book..."
quarto render .
echo "Render complete. Output in _site/"

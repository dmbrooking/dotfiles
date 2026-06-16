#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$DOTFILES_DIR"
for pkg in */; do
  pkg="${pkg%/}"
  [[ "$pkg" == "bin" ]] && continue
  stow -t ~ --adopt "$pkg"
done

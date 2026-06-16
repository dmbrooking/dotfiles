#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

log() { echo "==> $*"; }

# Install Homebrew
if ! command -v brew &>/dev/null; then
  log "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

log "Installing brew packages..."
brew install stow starship neovim mise

# Clone zprezto
if [ ! -d "$HOME/.zprezto" ]; then
  log "Cloning zprezto..."
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
fi

# Remove default zprezto runcoms managed by this repo so stow can symlink them
log "Preparing zprezto runcoms..."
rm -f "$HOME/.zprezto/runcoms/zshrc" "$HOME/.zprezto/runcoms/zpreztorc"

# Stow all packages
"$DOTFILES_DIR/bin/install.sh"

log "Done."
echo
echo "Next steps:"
echo "  1. Set your default shell if needed: chsh -s \$(which zsh)"
echo "  2. Add 'export ZDOTDIR=\"\$HOME/.config/zsh\"' to ~/.zshenv if using that config path"
echo "  3. Restart your shell"

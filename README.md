# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

| Package | Stows to | Contents |
|---------|----------|----------|
| `zsh` | `~/.config/zsh/`, `~/.zprezto/runcoms/` | zshrc, aliases, zprezto config |
| `starship` | `~/.config/starship.toml` | Starship prompt theme |
| `opencode` | `~/.config/opencode/` | opencode config and slash commands |

## Prerequisites

- macOS (Apple Silicon)
- [Xcode Command Line Tools](https://developer.apple.com/xcode/resources/): `xcode-select --install`
- Git

## Quick start

```bash
git clone https://github.com/dbrooking/dotfiles.git ~/code/dotfiles
cd ~/code/dotfiles
bash bin/setup.sh   # full bootstrap (brew + stow)
# or, if already bootstrapped:
bash bin/install.sh # stow only
```

## What bin/setup.sh does

1. Installs [Homebrew](https://brew.sh) if not present
2. Installs required brew packages: `stow`, `starship`, `neovim`, `mise`
3. Clones [zprezto](https://github.com/sorin-ionescu/prezto) to `~/.zprezto`
4. Removes the default zprezto runcoms that are managed by this repo
5. Runs `stow zsh starship opencode`

## Running stow manually

From the root of this repo:

```bash
# Stow all packages
stow -t ~ zsh starship opencode

# Stow a single package
stow -t ~ starship

# Preview what stow would do (dry run)
stow -t ~ --simulate zsh

# Unstow a package
stow -t ~ -D zsh
```

Or use the shorthand that adopts existing files and globs all packages:

```bash
stow -t ~ --adopt *
```

Stow symlinks each package's contents into `$HOME`, mirroring the directory structure. For example, `zsh/.config/zsh/.zshrc` becomes `~/.config/zsh/.zshrc`.

## Optional tools

These are referenced in the shell config but not installed by `setup.sh`:

- **[mise](https://mise.jdx.dev)** — installed by setup.sh; manages per-project tool versions
- **[yarn](https://yarnpkg.com)** — install via `npm install -g yarn` or `brew install yarn`
- **[rvm](https://rvm.io)** — Ruby version manager; install separately if needed
- **[Google Cloud SDK](https://cloud.google.com/sdk)** — install via `brew install --cask google-cloud-sdk`
- **[opencode](https://opencode.ai)** — install via `brew install opencode`

## Shell setup

If zsh is not your default shell:

```bash
chsh -s $(which zsh)
```

zprezto requires `ZDOTDIR` to be set if you want zsh config in `~/.config/zsh/`. Add this to `~/.zshenv`:

```bash
export ZDOTDIR="$HOME/.config/zsh"
```

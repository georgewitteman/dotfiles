# My Dotfiles

[![Quick Install](https://github.com/georgewitteman/dotfiles/actions/workflows/one_line_install.yml/badge.svg)](https://github.com/georgewitteman/dotfiles/actions/workflows/one_line_install.yml) [![CI](https://github.com/georgewitteman/dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/georgewitteman/dotfiles/actions/workflows/ci.yml)

I use [`chezmoi`](https://www.chezmoi.io/) to manage my dotfiles.

## Installation

```bash
curl --fail --silent --show-error --location "https://get.chezmoi.io" | sh -s -- -b "${HOME}/.local/bin" -d init --apply georgewitteman
```

### OR (curl short)

```bash
curl -fsSL "https://get.chezmoi.io" | sh -s -- -b ~/.local/bin -d init -a georgewitteman
```

### OR (wget)

```bash
wget -qO- "https://get.chezmoi.io" | sh -s -- -b ~/.local/bin -d init -a georgewitteman
```

## Colors

- [iTerm2](https://github.com/tallpants/vscode-theme-iterm2)

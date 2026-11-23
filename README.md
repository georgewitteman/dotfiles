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

## Updating a vim plugin

Vim plugins are copied as-is into
`home/exact_dot_vim/exact_pack/exact_vendor/`, with no plugin manager. Plugins
in `exact_start/` load automatically. Plugins in `exact_opt/` are loaded from
the vimrc. To update one:

1. Clone the plugin's repo into a temporary folder.
2. Delete the plugin's folder here and copy in the new version's runtime
   folders (`plugin/`, `autoload/`, `doc/`, `syntax/`, and so on) and its
   license, wherever the plugin states it (a LICENSE file, its README, or its
   doc). Leave out tests, CI config, and dotfiles. Don't edit the files.
3. Rebuild the help tags:
   `vim -u NONE -es -c 'helptags <plugin folder>/doc' -c q`
4. Make sure no file name starts with a chezmoi prefix like `dot_` or
   `executable_`, or ends in `.tmpl`. chezmoi would treat those specially.
5. Check the result with `chezmoi diff`, then commit with the upstream commit
   hash in the message.

## Colors

- [iTerm2](https://github.com/tallpants/vscode-theme-iterm2)

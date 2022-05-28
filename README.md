# My Dotfiles

[![Quick Install](https://github.com/georgewitteman/dotfiles/actions/workflows/one_line_install.yml/badge.svg)](https://github.com/georgewitteman/dotfiles/actions/workflows/one_line_install.yml) [![CI](https://github.com/georgewitteman/dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/georgewitteman/dotfiles/actions/workflows/ci.yml)

**Check out [`exact_bin`](https://github.com/georgewitteman/dotfiles/tree/master/exact_dot_bin) for some cool shell scripts!**

I use `chezmoi` to manage my dotfiles, which is why the files have the weird prefixes.

## Installation

```bash
curl --fail --silent --show-error --location "https://git.io/chezmoi" | sh -s -- -b "${HOME}/.local/bin" -d init --apply georgewitteman
```

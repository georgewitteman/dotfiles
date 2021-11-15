# My Dotfiles

**Check out [`exact_bin`](https://github.com/georgewitteman/dotfiles/tree/master/exact_bin) for some cool shell scripts!**

I use `chezmoi` to manage my dotfiles, which is why the files have the weird prefixes.

## Installation

```bash
sh -c "$(curl -fsLS git.io/chezmoi)" -- -b "${HOME}/bin" -d init --use-builtin-git --apply georgewitteman
```

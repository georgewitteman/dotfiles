# My Dotfiles

**Check out [`exact_bin`](https://github.com/georgewitteman/dotfiles/tree/master/exact_bin) for some cool shell scripts!**

I use `chezmoi` to manage my dotfiles, which is why the files have the weird prefixes.

## Install

```sh
# Monitor the installation, some if it is interactive
BINDIR="${HOME}/.local/bin sh" -c "$(curl -fsLS git.io/chezmoi)" -- init --apply georgewitteman
```

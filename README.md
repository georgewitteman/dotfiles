# My Dotfiles

**Check out [`private_dot_local/exact_bin`](https://github.com/georgewitteman/dotfiles/tree/master/private_dot_local/exact_bin) for some cool shell scripts!**

I use `chezmoi` to manage my dotfiles, which is why the files have the weird prefixes.

## Install
1. Install Homebrew ([brew.sh](https://brew.sh))
1. Install chezmoi `brew install chezmoi` ([chezmoi.io](https://www.chezmoi.io/docs/install/))
1. Install 1Password CLI https://support.1password.com/command-line-getting-started/. Get UUIDs from URLs in web client.
1. Setup 1Password CLI `eval $(op signin my.1password.com george@witteman.me)`
1. `chezmoi init --apply --verbose https://github.com/georgewitteman/dotfiles.git`
1. Restart terminal
1. `bootstrap`
1. Restart terminal

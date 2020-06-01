# My Dotfiles

I use yadm for my dotfiles.

## Setup
```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install yadm
yadm clone git@github.com:georgewitteman/dotfiles.git
yadm status
```

## Tools I Use
 - [Alacritty](https://github.com/jwilm/alacritty) (terminal emulator)
 - [Kitty](https://sw.kovidgoyal.net/kitty/index.html) (terminal emulator)
 - [Neovim](https://neovim.io) (text editor) with WebStorm/PyCharm as a backup
 - [yadm](https://yadm.io) (dotfiles manager, aka thing that manages this repo)
 - [asdf](https://asdf-vm.com/#/) (version manager)
 - [tmux](https://github.com/tmux/tmux/wiki) ("window" manager)
 - [fd](https://github.com/sharkdp/fd) (faster `find` with better sytnax and output)
 - [rg](https://github.com/BurntSushi/ripgrep) (faster `grep` with better syntax and output)
 - [httpie](https://httpie.org) (basically `curl` with better syntax and formatted/colored output)
 - [jq](https://stedolan.github.io/jq/) (json formatter that you can pipe logfiles or anything to)
 - [tealdeer](https://github.com/dbrgn/tealdeer) (command line tool reference that's much easier to read than `man`)
   - There are multiple implementations of the `tldr` command/reference, but this one is in Rust and is super fast

## TODO
 - [ ] Improve setup script
 - [ ] Improve cross platform support (macOS and linux)
 - [ ] Only enable features of plugins when their dependencies are installed and enabled

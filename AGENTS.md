# Agent guidance

These are my dotfiles, managed with chezmoi. The goal is for them to stay
lightweight, fast to apply, and easy to maintain. These are principles, not
hard rules: break one when the value is clearly worth it, and say why.

- **Lean toward installing nothing.** Applying the dotfiles should mostly just
  write files. Installs, downloads, and fetched repos slow every new machine
  down and can break, so each one needs to earn its place.
- **Degrade gracefully.** Config that relies on a tool should still work when
  that tool is missing.
- **Prefer built-ins.** Reach for what the shell, editor, or OS already
  provides, even when it's only close enough, before adding a plugin, a tool,
  or custom code that recreates what another tool did.
- **Keep shells fast.** A new terminal should show its first prompt in under
  50 ms, and a new prompt should draw in under 10 ms.
- **Prefer things that don't need updating.** A copy committed as-is beats
  something fetched or kept current. Third-party GitHub Actions count too.
- **Make the flow easy to follow.** A line should not make the reader stop
  and work out whether it runs. Use `if` for anything a condition controls,
  so `cmd || return` and `[ -n "$x" ] && cmd` become `if` blocks. Familiar
  one-word tricks like `cmd || true` stay.
- **Works everywhere I use it.** The same files apply on:
  - my Mac, with Homebrew
  - GitHub Codespaces and devcontainers on several base images (Debian,
    Ubuntu, Alpine, and the large `universal` image)
  - Linux servers running various distributions, often without my usual tools

  Don't assume one OS, shell, package manager, or installed tool. Shell setup
  should work well in bash, zsh, and plain POSIX `sh`. Files read by more than
  one shell must stick to POSIX `sh` (zsh loads them with `emulate sh -c`).
  System startup files differ too: Ubuntu's `/etc/zsh/zshrc` runs `compinit`,
  and the `universal` image's runs a second `compinit` for nvm. CI covers
  macOS and the codespaces images, to catch anything important breaking. It
  doesn't need to enforce style, so don't add linters to it. `./check` lints
  wherever shellcheck and shfmt happen to be installed, which includes
  shellcheck on CI's Ubuntu runners.
- **Apply right after making changes.** Check `chezmoi diff` first, since
  applying can delete files, and ask only if it would delete or change
  something unexpected.
- **Commit in small steps.** One commit per change, not one large commit
  bundling several.
- **Test git scripts in a scratch repository.** Run scripts that use git in a
  throwaway repository with a local remote, never in this repo or another real
  one, even just to check their arguments.
- **Keep it minimal.** Small diffs, few files, no features nobody asked for.
  Delete anything that's no longer used. Every line, option and setting should
  solve a problem you can name; if nobody can say what it's for, remove it or
  ask. Restate a default only when something you use doesn't have it as the
  default, like an older version or a system config that changes it.
- **No doc comments at the top of files.** Comments go next to the code they
  explain. A script's description goes in its help message; why any other
  file exists goes in the commit that adds it. Lines a tool needs at the top
  (shebangs, `# vim:` modelines, `#compdef`) are fine. Avoid comments that go
  stale when something else changes, like references to other files, how
  other code works, current behavior or versions, history, or measurements.
  Explain commands, flags and syntax a reader might have to look up, like
  `git rev-parse --short`, `complete -o nospace` or
  `${var/pattern/replacement}`, and name the command or flag so it's clear
  which line the comment is for. Skip what's obvious or already explained
  nearby. Keep comments as short as clarity allows, even if that's several
  lines. The intent behind a value is fine to explain too, even when it names
  something else, like "match the macOS `ls` colors". For values in a dense
  notation, explain the notation instead of restating each value, since the
  notation stays true when the values change. Put a comment on its own lines
  above the code it explains, not at the end of a line, and leave a blank line
  between unrelated blocks.
- **Shell style.** Use `[[ ]]` in bash and zsh, and `[ ]` in POSIX `sh`.
  shellcheck enforces this for bash and `sh`, but doesn't read zsh. Text that
  another tool checks for word for word, like 1Password's SSH config, stays
  exactly as that tool writes it.
- **Scripts share a house style.** Scripts in `~/.scripts` look and behave
  alike: `-h` and `--help` print a usage line, a description and the options
  in the same format as the other scripts, and unknown options are errors.
  Errors and warnings go to stderr as plain text, starting with `error:` or
  `warning:`. Commands that change something run through `echo-run`, or
  `safe-run` to ask first. Otherwise, keep each script independent, so it can
  be copied on its own. Call another script only when it does real work, like
  `git-show` or `ccopy`, not for something a few lines would do.
- **Keep completions in sync with scripts.** When a script in `~/.scripts`
  gains, loses, or changes an option or argument, update its zsh completion in
  `~/.local/share/zsh/functions` in the same change, if it has one.

Update this file when a preference changes. Keep it short.

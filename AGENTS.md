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
  provides before adding a plugin or tool.
- **Prefer things that don't need updating.** A copy committed as-is beats
  something fetched or kept current. Third-party GitHub Actions count too.
- **Simple over complete.** A close-enough built-in beats custom code that
  recreates what another tool did.
- **Works everywhere I use it.** The same files apply on:
  - my Mac, with Homebrew
  - GitHub Codespaces and devcontainers on several base images (Debian,
    Ubuntu, Alpine, and the large `universal` image)
  - Linux servers running various distributions, often without my usual tools

  Don't assume one OS, shell, package manager, or installed tool. Shell setup
  should work well in bash, zsh, and plain POSIX `sh`, and files read by more
  than one shell must stick to POSIX `sh`. System startup files differ too:
  Ubuntu's `/etc/zsh/zshrc` runs `compinit`, and the `universal` image's runs
  another for nvm. CI covers macOS and the codespaces images.
- **Apply right after making changes.** Check `chezmoi diff` first, since
  applying can delete files, and ask only if it would delete or change
  something unexpected.
- **Keep it minimal.** Small diffs, few files, no features nobody asked for.
  Delete anything that's no longer used.
- **No doc comments at the top of files.** Comments go next to the code they
  explain. A script's description goes in its help message; why any other
  file exists goes in the commit that adds it. Lines a tool needs at the top
  (shebangs, `# vim:` modelines, `#compdef`) are fine. Avoid comments that go
  stale when something else changes, like references to other files, how
  other code works, current behavior or versions, history, or measurements.
- **Keep completions in sync with scripts.** When a script in `~/.scripts`
  gains, loses, or changes an option or argument, update its zsh completion in
  `~/.local/share/zsh/functions`, or its `compdef` line in `.zshrc`, in the
  same change, if it has one.

Update this file when a preference changes. Keep it short.

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
- **Works everywhere I use it.** The same files apply on my Mac and in fresh
  Linux codespaces and containers. Don't assume one OS, shell, or package
  manager.
- **Apply right after making changes.** Check `chezmoi diff` first, since
  applying can delete files, and ask only if it would delete or change
  something unexpected.
- **Keep it minimal.** Small diffs, few files, no features nobody asked for.
  Delete anything that's no longer used.
- **No doc comments at the top of files.** Comments go next to the code they
  explain. A script's description goes in its help message; why any other
  file exists goes in the commit that adds it. Lines a tool needs at the top
  (shebangs, `# vim:` modelines, `#compdef`) are fine.
- **Keep completions in sync with scripts.** When a script in `~/.scripts`
  gains, loses, or changes an option or argument, update its zsh completion in
  `~/.local/share/zsh/functions` in the same change, if it has one.

Update this file when a preference changes. Keep it short.

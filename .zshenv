# http://zsh.sourceforge.net/Intro/intro_3.html
#
# `.zshenv' is sourced on all invocations of the shell, unless the -f option is
# set. It should contain commands to set the command search path, plus other
# important environment variables. `.zshenv' should not contain commands that
# produce output or assume the shell is attached to a tty.
#
# NOTE: The above is from the documentation, but in reality we probably don't
# want to set the $PATH variable here. It will get overridden by /etc/zprofile
# and would also prevent us from doing things like "PATH=/custom/path gdb
# program" since the custom $PATH would get overridden by this file. You should
# only put something in here that you know you want in every single
# program/script

if [[ "$ZPROF" = true ]]; then
  zmodload zsh/zprof
fi

# XDG Base Directories
# Where user-specific configurations should be written (analogous to /etc)
export XDG_CONFIG_HOME=$HOME/.config
# Where user-specific non-essential (cached) data should be written (analogous
# to /var/cache)
export XDG_CACHE_HOME=$HOME/.cache
# Where user-specific data files should be written (analogous to /usr/share)
export XDG_DATA_HOME=$HOME/.local/share

# Don't write python pyc files, because they're not necessary and clutter
# directories with binary files
export PYTHONDONTWRITEBYTECODE=1

export EDITOR='vim'

# Don't write python pyc files, because they're not necessary
export PYTHONDONTWRITEBYTECODE=1

export FZF_DEFAULT_COMMAND="git ls-tree -r --name-only HEAD 2>/dev/null || fd --type f --hidden \$dir"
export FZF_CTRL_T_COMMAND="fd --type f --type d --hidden \$dir"
export FZF_FIND_FILE_COMMAND="git ls-tree -r --name-only HEAD 2>/dev/null || fd --type f --hidden \$dir"
export FZF_CD_COMMAND="fd --type d \$dir"
export FZF_CD_WITH_HIDDEN_COMMAND="fd --type d --hidden \$dir"
export FZF_OPEN_COMMAND="fd \$dir"

export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# XDG Base Directories
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=$TMPDIR

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME="$XDG_CONFIG_HOME"/asdf/tool-versions
export ASDF_CONFIG_FILE=$XDG_CONFIG_HOME/asdf/asdfrc
export ASDF_DATA_DIR=$XDG_DATA_HOME/asdf
export AWS_SHARED_CREDENTIALS_FILE=$HOME/.aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export PYTHON_EGG_CACHE="$XDG_CACHE_HOME"/python-eggs
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME"/httpie
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export ZGEN_DIR="$XDG_DATA_HOME"/zgen
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
# export GEM_HOME="$XDG_DATA_HOME"/gem
# export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export BABEL_CACHE_PATH="$XDG_CACHE_HOME"/babel.json
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm
export NPM_CONFIG_TMP=$XDG_RUNTIME_DIR/npm
export PYENV_ROOT=$XDG_DATA_HOME/pyenv

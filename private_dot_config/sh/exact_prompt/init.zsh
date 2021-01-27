#!/usr/bin/env zsh

setopt prompt_subst

VIRTUAL_ENV_DISABLE_PROMPT=1
unset _OLD_VIRTUAL_PS1

ps_git_head=2
ps_git_stashes=3
ps_git_stash_word=4
ps_git_branching=5

ps_cmd_time=6
ps_cmd_color=7

ps_pwd=8

ps_venv_name=9

prompt-git() {
  psvar[$ps_git_head]=
  psvar[$ps_git_stashes]=
  psvar[$ps_git_branching]=

  # Search up each directory until we get to the root or find one
  # that has a git repository
  local git_root="$PWD"
  until [[ "$git_root" = "/" || -d "${git_root}/.git" ]]; do
    git_root="${git_root:a:h}"
  done

  # Check if we found a git repo
  [[ "$git_root" != "/" && -f "${git_root}/.git/HEAD" ]] || return 1

  # Read contents of HEAD file
  local head=$(<"${git_root}/.git/HEAD")
  if [[ "$head" == 'ref: '* ]]; then
    psvar[$ps_git_head]=${head##ref: refs\/heads\/}
  else
    psvar[$ps_git_head]=${head:0:10}
  fi

  # Branching state
  if [[ -f "$git_root/.git/rebase-merge/interactive" ]]; then
    psvar[$ps_git_branching]="rebase-i"
  elif [[ -d "$git_root/.git/rebase-merge" ]]; then
    psvar[$ps_git_branching]="rebase-m"
  else
    if [[ -d "$git_root/.git/rebase-apply" ]]; then
      if [[ -f "$git_root/rebase-apply/rebasing" ]]; then
        psvar[$ps_git_branching]="rebase"
      elif [[ -f "$git_root/.git/rebase-apply/applying" ]]; then
        psvar[$ps_git_branching]="am"
      else
        psvar[$ps_git_branching]="am/r"
      fi
    elif [[ -f "$git_root/.git/MERGE_HEAD" ]]; then
      psvar[$ps_git_branching]="merge"
    elif [[ -f "$git_root/.git/BISECT_LOG" ]]; then
      psvar[$ps_git_branching]="bisect"
    fi
  fi

  # Set # of stashes
  [[ -f "${git_root}/.git/logs/refs/stash" ]] || return

  local stashes=("${(f)$(<${git_root}/.git/logs/refs/stash)}")
  [[ "${#stashes}" -eq 0 ]] && return
    psvar[$ps_git_stashes]="${#stashes}"
  if [[ "${#stashes}" -eq 1 ]]; then
    psvar[$ps_git_stash_word]="stash"
  else
    psvar[$ps_git_stash_word]="stashes"
  fi
}

prompt-cmd-time() {
  psvar[$ps_cmd_time]=

  [[ -z "$PROMPT_START_TIME" ]] && return

  local elapsed="$(( SECONDS - PROMPT_START_TIME ))"
  unset PROMPT_START_TIME

  if [[ "$elapsed" -lt 1 ]]; then
    return
  fi

  local split=("$elapsed" 0)
  local units="s"
  psvar[$ps_cmd_color]="yellow"

  if (( elapsed >= 60 )); then
    # Minutes
    split=("${(ps:.:)$(( elapsed / 60.0 ))}")
    units="m"
    psvar[$ps_cmd_color]="red"
  fi
  psvar[$ps_cmd_time]="${split[1]}"
  if [[ "${split[2][1]}" -ne 0 ]]; then
    psvar[$ps_cmd_time]+=".${split[2][1]}"
  fi
  psvar[$ps_cmd_time]+="$units"
}

prompt-venv-name() {
  psvar[$ps_venv_name]=
  if [[ -z "${VIRTUAL_ENV:-}" ]]; then
    return
  fi

  if [[ "${VIRTUAL_ENV%%/src/.venv}" != "$VIRTUAL_ENV" ]] || [[ "${VIRTUAL_ENV%%/src/.venv3}" != "$VIRTUAL_ENV" ]]; then
    psvar[$ps_venv_name]="${VIRTUAL_ENV:h:h:t}"
    return
  fi

  psvar[$ps_venv_name]="${VIRTUAL_ENV:t2}"
}

prompt-precmd() {
  prompt-cmd-time
  prompt-git
  prompt-venv-name
}

prompt-preexec() {
  PROMPT_START_TIME="$SECONDS"
}

[[ -z "${precmd_functions+1}" ]] && precmd_functions=()
[[ -z "${preexec_functions+1}" ]] && preexec_functions=()

if [[ ${precmd_functions[(ie)prompt-precmd]} -gt ${#precmd_functions} ]]; then
    precmd_functions+=(prompt-precmd)
fi
if [[ ${preexec_functions[(ie)prompt-preexec]} -gt ${#preexec_functions} ]]; then
    preexec_functions+=(prompt-preexec)
fi


## Left prompt
PROMPT=''

# Virtual env
PROMPT+="%(${ps_venv_name}V.%F{242}%${ps_venv_name}v%f .)"

# Short path if available
PROMPT+="%F{cyan}%~ %f%b"

# Background jobs
PROMPT+="%(1j.%F{yellow}%j:bg%f .)"

# Subshell warning
PROMPT+="%(3L.%F{yellow}%L+%f .)"

# Prompt character
PROMPT+="%(0?..%F{red})%#%f "


## Continuation prompt
PROMPT2='%F{242}%_… %f>%f '


## Executation trace prompt (set -x)
PS4="%B%D{%H:%M:%S.%9.} +%N:%i>%b "


## Right prompt
RPROMPT=

# Command time
RPROMPT+="%(${ps_cmd_time}V.%F{%${ps_cmd_color}v}%${ps_cmd_time}v%f.)"

# Exit code
RPROMPT+='%(0?.. %K{red}%F{15} ${signals[$status-127]+${signals[$status-127]}:}%? %k%f)'

# Git HEAD
RPROMPT+="%(${ps_git_head}V. %F{magenta}%${ps_git_head}v%f%(${ps_git_branching}V.:%F{yellow}%${ps_git_branching}v%f.).)"

# Git stashes
RPROMPT+="%(${ps_git_stashes}V. [%F{yellow}%${ps_git_stashes}v%f %${ps_git_stash_word}v].)"

# Time
RPROMPT+=" %D{%L:%M %p}"

# Don't add the random extra space at the end of the right prompt
# https://superuser.com/a/726509
# Turned this off because it messes up the space after the prompt
# character when not in tmux.
# Turned this back on because it doesn't seem to be an issue now.
ZLE_RPROMPT_INDENT=0

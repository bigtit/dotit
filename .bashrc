pname=$(uname)
# Shell colors
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
BOLD_BLUE="\[\e[1;34m\]"
BOLD_CYAN="\[\e[1;36m\]"
WHITE="\[\e[0;37m\]"
BLOOD="\[\e[1;91m\]"
NO_COLOR="\[\e[0m\]"

# basic
USER_COLOR=${YELLOW}
PROMPT_DIRTRIM=3
[[ ${EUID} -eq 0 ]] && USER_COLOR=${BLOOD}
export PS1="${USER_COLOR}\u${NO_COLOR}@${BOLD_CYAN}\h${WHITE}:${GREEN}\w${BOLD_BLUE}"'$ '${NO_COLOR}

# exit code
PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs
__prompt_command() {
  local EXIT="$?"             # This needs to be first
  if [[ ${EXIT} != 0 ]]; then
    PS1="${BLOOD}${EXIT}${NO_COLOR}|"
  else
    PS1="${EXIT}|"
  fi
  PS1+="${USER_COLOR}\u${NO_COLOR}@${BOLD_CYAN}\h${WHITE}:${GREEN}\w${BOLD_BLUE}"'$ '${NO_COLOR}
}

# alias
if [[ ${pname} != "Darwin" && ${pname} != *"BSD" ]]; then
  alias ls='ls --color=auto'
else
  alias ls='ls -G'
fi
alias la='ls -a'
alias ll='ls -l'
alias l='ls -la'
alias vi=vim
alias sudo='sudo -E'

export LC_COLLATE=C
export TERM=xterm-256color

# history
HISTCONTROL=ignoredups:erasedups
shopt -s histappend

#bind 'TAB:menu-complete'
if [[ $- =~ i ]]; then
  bind 'set show-all-if-ambiguous on'
  bind '"\e[B":history-search-forward'
  bind '"\e[A":history-search-backward'
  bind 'set completion-ignore-case on'
fi

# completion
if ! shopt -oq posix; then
  if [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
  elif [[ -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
  fi
fi


pname=$(uname)
# git functions too slow
##
# Shell colors
##
BLACK="\[\e[0;30m\]"  BOLD_BLACK="\[\e[1;30m\]"  UNDER_BLACK="\[\e[4;30m\]"
RED="\[\e[0;31m\]"    BOLD_RED="\[\e[1;31m\]"    UNDER_RED="\[\e[4;31m\]"
GREEN="\[\e[0;32m\]"  BOLD_GREEN="\[\e[1;32m\]"  UNDER_GREEN="\[\e[4;32m\]"
YELLOW="\[\e[0;33m\]" BOLD_YELLOW="\[\e[1;33m\]" UNDER_YELLOW="\[\e[4;33m\]"
BLUE="\[\e[0;34m\]"   BOLD_BLUE="\[\e[1;34m\]"   UNDER_BLUE="\[\e[4;34m\]"
PURPLE="\[\e[0;35m\]" BOLD_PURPLE="\[\e[1;35m\]" UNDER_PURPLE="\[\e[4;35m\]"
CYAN="\[\e[0;36m\]"   BOLD_CYAN="\[\e[1;36m\]"   UNDER_CYAN="\[\e[4;36m\]"
WHITE="\[\e[0;37m\]"  BOLD_WHITE="\[\e[1;37m\]"  UNDER_WHITE="\[\e[4;37m\]"
BLOOD="\[\e[1;91m\]"
NO_COLOR="\[\e[0m\]"

USER_COLOR=${YELLOW}
PROMPT_DIRTRIM=3
[[ ${EUID} -eq 0 ]] && USER_COLOR=${BLOOD}
export PS1="${USER_COLOR}\u${NO_COLOR}@${BOLD_CYAN}\h${WHITE}:${GREEN}\w${BOLD_BLUE}"'$ '${NO_COLOR}

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
alias ..='cd ..'
alias ...='cd ../..'

export LC_COLLATE=C
export TERM=xterm-256color

bind 'TAB:menu-complete'
bind 'set show-all-if-ambiguous on'
bind '"\e[B":history-search-forward'
bind '"\e[A":history-search-backward'
bind 'set completion-ignore-case on'

# completion
[[ -f /etc/bash_completion ]] && ! shopt -oq posix && source /etc/bash_completion

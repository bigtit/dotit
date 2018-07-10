# custom prompt
# use online generator such as: http://bashrcgenerator.com/
export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]\[\033[38;5;15m\]\n>\[$(tput sgr0)\]"

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias l='ls -la'
alias vi=vim
alias sudo='sudo -E'

export LC_COLLATE=C

bind "TAB:menu-complete"
bind "set show-all-if-ambiguous on"

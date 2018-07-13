git config --global bash.showDirtyState false
pname=$(uname)
git_adv="true"
if [[ ${pname} != "Linux" && ${pname} != "Darwin" && ${pname} != *"BSD" ]]; then
  git config --global core.preloadindex true
  git config --global core.fscache true
  git config --global gc.auto 256
  git_adv="" # disable advanced git status on windows
fi
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
NO_COLOR="\[\e[0m\]"

##
# Git shell prompt
##
function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
function git_prompt {
  #[ -d .git ] && echo -e "($(git_branch)$(git_dirty))"
  if [[ -d .git ]]; then
    local git_color="\e[2;32m" local git_mark=""
    local changes=""
    [[ $(git status 2> /dev/null) != *"nothing to commit"* ]] && \
      {
        git_color="\e[2;31m"; git_mark="*";
        [[ git_adv ]] && \
          {
            local untracked=0 local unstaged=0 local staged=0
            untracked=$(git ls-files --other --exclude-standard|wc -l);
            staged=$(git diff --cached|egrep "^diff --git"|wc -l);
            unstaged=$(git diff|egrep "^diff --git"|wc -l);
            changes="\e[2;35m(${untracked}/${unstaged}/${staged})";
          }
      }
    echo -e "${git_color}($(git_branch)${git_mark}) ${changes}"
  fi
}
export PS1="${PURPLE}[\D{%m/%d} \A] ${BLUE}\u${NO_COLOR}@${BOLD_CYAN}\h${WHITE} ${GREEN}\w \$(git_prompt)${NO_COLOR} "$'\n> '

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

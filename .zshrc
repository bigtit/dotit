source ~/.profile

autoload zmv
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNichts gefunden fuer: %d%b'

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

zstyle -e ':completion:*:approximate:*' \
        max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
zmodload zsh/complist

autoload bashcompinit
bashcompinit

setopt autocd
setopt correctall

autoload colors
colors

autoload -U promptinit
promptinit
prompt walters

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nano='nano -w'
alias mmv='noglob zmv -W'
alias vi=vim

zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals*' insert-sections true
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'

zstyle ':completion:*:cd:*' ignore-parents parent pwd

zstyle ':completion:*' menu select
zstyle ':completion:*:kill:*'   force-list always

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "\e[A"  history-beginning-search-backward-end
bindkey "\e[B"  history-beginning-search-forward-end

autoload -U url-quote-magic
zle -N self-insert url-quote-magic

setopt notify pushdtohome autolist noclobber
setopt longlistjobs share_history  inc_append_history
setopt autoresume histignoredups pushdsilent NO_BG_NICE
setopt autopushd pushdminus extendedglob rcquotes mailwarning
setopt append_history auto_list auto_menu auto_param_keys auto_param_slash
setopt bad_pattern bang_hist correct NO_beep NO_NOMATCH complete_aliases
setopt equals extended_glob extended_history function_argzero glob
setopt NO_glob_assign glob_complete NO_glob_dots glob_subst hash_cmds
setopt hash_dirs hash_list_all hist_allow_clobber hist_beep hist_ignore_dups
setopt hist_ignore_space NO_hist_no_store hist_verify NO_hup NO_ignore_braces
setopt NO_ignore_eof interactive_comments NO_list_ambiguous NO_list_beep
setopt list_types long_list_jobs magic_equal_subst NO_mail_warning NO_mark_dirs
setopt NO_menu_complete multios numeric_glob_sort NO_overstrike path_dirs
setopt posix_builtins NO_print_exit_value NO_prompt_cr prompt_subst
setopt pushd_ignore_dups NO_pushd_minus pushd_silent pushd_to_home
setopt rc_expand_param NO_rc_quotes NO_rm_star_silent NO_sh_file_expansion
setopt sh_option_letters short_loops NO_sh_word_split NO_single_line_zle
setopt NO_sun_keyboard_hack NO_verbose zle

bindkey '^p' history-beginning-search-backward
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char

rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias ll='ls -l'
alias la='ls -a'
alias l='ls -al'

alias ldd='otool -L'
alias rot13='tr A-Za-z N-ZA-Mn-za-m'

export LC_COLLATE=C

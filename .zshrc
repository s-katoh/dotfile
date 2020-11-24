# zsh-setting
autoload -U compinit
compinit
zstyle ':completion:*' menu select
setopt correct
bindkey ^T kill-word
autoload -U select-word-style
select-word-style bash
export WORDCHARS='.-'
#history-setting
export HISTFILE=${HOME}/.zsh_history
setopt share_history
setopt HIST_IGNORE_ALL_DUPS

# Git_ps1 prompt
source ~/.git-prompt.sh
setopt PROMPT_SUBST
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=verbose
GIT_PS1_SHOWCOLORHINTS=true
precmd () { __git_ps1 "%F{009}%c%f" "%F{200}$%f " "(%s)" }
 #precmd () { __git_ps1 "%c" "$ " "(%s)" }

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# peco
function peco-history-selection() {
  BUFFER=`history -n 1 | tail -r | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# mysql
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

#alias
alias be='bundle exec'
#flutter
export PATH="$PATH:/Users/s-katoh/development/flutter/bin"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

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

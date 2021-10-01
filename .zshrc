zstyle ':completion:*' menu select
setopt correct
bindkey ^T kill-word
autoload -U select-word-style

select-word-style bash
export WORDCHARS='.-'
#history-setting
export HISTFILE=${HOME}/Dropbox/.zsh_history
#export HISTFILE=${HOME}/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt share_history
setopt HIST_SAVE_NO_DUPS  
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
stty stop undef
bindkey -r "^O"
bindkey "^/" redo
zshaddhistory() {
    local line=${1%%$'\n'}
    local cmd=${line%% *}

    # Only those that satisfy all of the following conditions are added to the history
    [[ ${#line} -ge 5
       && ${cmd} != ll
       && ${cmd} != ls
       && ${cmd} != la
       && ${cmd} != cd
       && ${cmd} != man
       && ${cmd} != scp
       && ${cmd} != vim
       && ${cmd} != nvim
       && ${cmd} != less
       && ${cmd} != ping
       && ${cmd} != open
       && ${cmd} != file
       && ${cmd} != which
       && ${cmd} != whois
       && ${cmd} != drill
       && ${cmd} != uname
       && ${cmd} != md5sum
       && ${cmd} != pacman
	   && ${cmd} != xdg-open
       && ${cmd} != traceroute
       && ${cmd} != speedtest-cli
    ]]
}
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
alias g=git
alias be='bundle exec'
#flutter
export PATH="$PATH:$HOME/development/sdks/flutter/bin"

#jenv
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"

#angular
export PATH="$HOME/.npm-global/bin:$PATH"

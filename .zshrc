# path
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/llvm/share/llvm:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/bin/node:$PATH"
export CPATH="/usr/include/c++/4.2.1"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# env 
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export TERM=xterm-256color
export CLICOLOR=true

# opt
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt SHARE_HISTORY # for share history in tmux

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000 #memory
SAVEHIST=1000000 #file
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

# binding and compliment 
bindkey -e # emacs

autoload -Uz compinit
compinit
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@{},|" #/ is asso separator
zstyle ':zle:*' word-styel unspecified
zstyle ':completion:*:default' menu select=2 # candidate will be selected by cursor
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# plugin
source /usr/local/Cellar/antigen/1/share/antigen.zsh
# cl tool
antigen bundle git
antigen bundle pip
antigen bundle brew

antigen bundle command-not-found
antigen bundle mollifier/cd-bookmark
alias cdb='cd-bookmark'
antigen bundle peco/peco
antigen bundle mollifier/anyframe
antigen bundle zsh-users/zsh-completions
antigen apply

# view
PROMPT='%F{magenta}[%~] %f'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

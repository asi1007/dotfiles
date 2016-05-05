# path
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/llvm/share/llvm:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="$HOME/miniconda3/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/Cellar/apache-spark/1.5.0/libexec/ec2:$PATH"

# env 
export LANG=ja_JP.UTF-8
export TERM=xterm-256color
export LC_ALL=ja_JP.UTF-8
export CLICOLOR=true

export IPYTHON=1 # for spark
source ~/.ec2/key.sh

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# init xenv for recognized by shell
eval "$(rbenv init -)"
eval "$(pyenv init -)"

# opt
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt SHARE_HISTORY # for share history in tmux
setopt CORRECT # for check command, and advice correct command

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

function listMavenCompletions { reply=(cli:execute cli:execute-phase archetype:generate compile clean install test test-compile deploy package cobertura:cobertura jetty:run -Dmaven.test.skip=true -DarchetypeCatalog=http://tapestry.formos.com/maven-snapshot-repository -Dtest= `if [ -d ./src ] ; then find ./src -type f | grep -v svn | sed 's?.*/\([^/]*\)\..*?-Dtest=\1?' ; fi`); }
compctl -K listMavenCompletions mvn

# plugin
source /usr/local/Cellar/antigen/1/share/antigen.zsh
if [ -f /usr/local/etc/brew-wrap ];then
  source /usr/local/etc/brew-wrap
fi
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle mollifier/cd-bookmark
alias cdb='cd-bookmark'
antigen bundle peco/peco
antigen bundle mollifier/anyframe
antigen bundle brew
antigen bundle zsh-users/zsh-completions
antigen apply
PROMPT='%F{magenta}[%~] %f'

# alias
alias la='ls -a'
alias ll='ls -l'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -g G='| grep'

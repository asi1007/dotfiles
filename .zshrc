# env var
export LANG=ja_JP.UTF-8
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export TERM=xterm-256color
export CLICOLOR=true
export LC_ALL=ja_JP.UTF-8
export IPYTHON=1 # for spark

# init prog
eval "$(rbenv init -)"
eval "$(pyenv init -)"

# opt
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

bindkey -e # emacs

autoload -Uz compinit
compinit
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@{},|"
zstyle ':zle:*' word-styel unspecified

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
antigen bundle mollifier/anyframe
antigen bundle brew
antigen bundle zsh-users/zsh-completions
antigen apply
PROMPT='%F{magenta}[%~] %f'


export LANG=ja_JP.UTF-8
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
eval "$(pyenv init -)"
#export TERM=xterm-256color
source /usr/local/Cellar/antigen/1/share/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
#antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle brew
antigen bundle zsh-users/zsh-completions
antigen theme wedisagree
antigen apply

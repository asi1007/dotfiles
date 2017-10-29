set runtimepath+=$HOME/dotfiles/vim

call plug#begin('$HOME/.vim/plugged')
  runtime help_plug.vim
  runtime look_plug.vim
  runtime unite_plug.vim
  runtime ide_plug.vim
  runtime lang_plug.vim
  Plug 'shougo/vimproc.vim',{'do': 'make'}
call plug#end()

runtime unite.vim
runtime map.vim
runtime look.vim
runtime ide.vim

set keywordprg=:help
set clipboard+=autoselect
set clipboard+=unnamed

augroup ReadVimrc
  autocmd!
  autocmd BufWritePost .vimrc source ~/.vimrc
augroup END

set runtimepath+=$HOME/dotfiles/vim

call plug#begin('.vim/plugged')
  Plug 'vim-jp/vimdoc-ja'
  Plug 'thinca/vim-ft-help_fold'
  runtime look_plug.vim
call plug#end()

inoremap jj <ESC>

runtime look.vim

augroup ReadVimrc
  autocmd!
  autocmd BufWritePost .vimrc source ~/.vimrc
augroup END

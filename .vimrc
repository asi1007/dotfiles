
call plug#begin('.vim/plugged')
  Plug 'vim-jp/vimdoc-ja'
  Plug 'thinca/vim-ft-help_fold'
call plug#end()

inoremap jj <ESC>

augroup ReadVimrc
  autocmd!
  autocmd BufWritePost .vimrc source ~/.vimrc
augroup END

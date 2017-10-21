set runtimepath+=$HOME/dotfiles/vim

call plug#begin('.vim/plugged')
  runtime help_plug.vim
  runtime look_plug.vim
  runtime unite_plug.vim
call plug#end()

runtime unite.vim
runtime map.vim
runtime look.vim

let g:unite_source_grep_recursive_opt = ''
augroup ReadVimrc
  autocmd!
  autocmd BufWritePost .vimrc source ~/.vimrc
augroup END

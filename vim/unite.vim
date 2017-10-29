"data dir
let mru#file_mru_path          = expand('~/.vim/etc/neomru/file')
let g:neomru#directory_mru_path     = expand('~/.vim/etc/neomru/direcroty')
let g:unite_data_directory          = expand('~/.vim/etc/unite')


"look
let g:unite_split_rule = 'topleft'
let g:unite_winwidth = 50
let g:unite_source_grep_max_candidates = 200

" beghavior
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_command = 'ag' " require ag

function! s:unite_project(...)
  let opts = (a:0 ? join(a:000,''):'')
  let dir = unite#util#path2project_directory(expand('%'))
  execute 'Unite' opts 'file_rec/async:' . dir
endfunction

nnoremap [unite] <Nop>
nmap <space> [unite]
nnoremap <silent> [unite]o :<C-u>Unite -vertical -no-quit -start-insert outline<CR>
nnoremap <silent> [unite]f :<C-u>Unite -vertical -no-quit -start-insert file_rec/async<CR>
nnoremap <silent>[unite]a :<C-u>Unite -start-insert neomru/file<CR>
nnoremap <silent>[unite]p :<C-u>call <SID>unite_project('-start-insert')<CR>

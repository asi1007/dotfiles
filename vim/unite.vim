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

nnoremap [unite] <Nop>
nmap <space> [unite]
nnoremap <silent> [unite]o :<C-u>Unite -vertical -no-quit -start-insert outline<CR>
nnoremap <silent> [unite]f :<C-u>Unite -vertical -no-quit -start-insert file_rec/async<CR>
nnoremap <silent>[unite]a :<C-u>Unite neomru/file<CR>

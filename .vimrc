"**********************************
"setting at starting
"**********************************
if has('vim_starting')
  let s:vimrc = "~/dotfiles/.vimrc"
  let s:neobundle_root = "~/.vim/bundle/"
  set nocompatible
  "install neobundle 
  if !isdirectory(expand("~/.vim/.bundle/neobundle.vim/"))
    echo "install neobundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/.bundle/neobundle.vim")
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  "enable plugin
  filetype plugin indent on
  filetype plugin on
  syntax enable
  syntax on
  runtime! macros/editexisting.vim
endif

"**********************************
"Neo Bundle's setting
"**********************************
call neobundle#begin(expand('~/.vim/bundle/'))
let g:neobundle_default_git_protocol='https'
NeoBundleFetch 'Shougo/neobundle.vim'
"**********************************
"programming language
"**********************************
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'davidhalter/jedi-vim' "cmmpletion for python 
NeoBundleLazy "lambdalisue/vim-django-support", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
NeoBundleLazy "lambdalisue/vim-pyenv", {
      \ "depends": ['davidhalter/jedi-vim'],
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
NeoBundle 'nvie/vim-flake8'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'aklt/plantuml-syntax' "make uml by text
NeoBundle 'stephpy/vim-yaml'
"**********************************
"IDE
"**********************************
NeoBundle "Shougo/vimfiler.vim"
NeoBundle "Shougo/vimshell.vim"
NeoBundle 'thinca/vim-quickrun'
NeoBundle "osyo-manga/shabadou.vim" "to use various window in quickrun
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ } "asyncronic compile or run
NeoBundle 'scrooloose/syntastic.git' "syntax check by save
NeoBundle 'aperezdc/vim-template'
"neosnippet and neocomplete
NeoBundle 'shougo/neocomplete' "neocomplete plugin
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets' "neosnipet deffinition file
NeoBundle "honza/vim-snippets" "snip files
"git
NeoBundle 'tpope/vim-fugitive'
"**********************************
"Unite
"**********************************
NeoBundle 'Shougo/unite.vim'
NeoBundle 'shougo/neomru.vim' "show recently used file in unite
NeoBundle 'soramugi/auto-ctags.vim' "to use unite outline
NeoBundle 'Shougo/unite-outline'
NeoBundle "tacroe/unite-mark"
NeoBundle 'Shougo/unite-help'
NeoBundle 'osyo-manga/unite-qfixhowm'
"**********************************
"reenfoce function
"**********************************
NeoBundle 'kana/vim-submode'
NeoBundle "Lokaltog/vim-easymotion"
NeoBundle "vim-scripts/YankRing.vim"
NeoBundle 'chrisbra/csv.vim'
"**********************************
"memo
"**********************************
NeoBundle 'fuenor/qfixhowm' "to various memo manually install
NeoBundle 'fuenor/qfixgrep' "to various memo manually install
"**********************************
"edit
"**********************************
NeoBundle "tpope/vim-surround"
NeoBundle "scrooloose/nerdcommenter"
"**********************************
"looks
"**********************************
NeoBundle 'tomasr/molokai' "colorscheme
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'jacquesbh/vim-showmarks'
NeoBundle 'Lokaltog/vim-powerline'
"**********************************
"read helping info
"**********************************
NeoBundle "vim-jp/vimdoc-ja"
NeoBundle 'thinca/vim-ft-help_fold'

NeoBundleCheck "プラグインがインストールされているかチェックする
call neobundle#end()
if !has('vim_starting')
  call neobundle#call_hook('on_source') "vimrcを読み込み直したときのための設定
  call neobundle#end()
endif

"**********************************
"fugitive
"**********************************
"statusline に %{fugitive#statusline()} を追加すると、ステータスラインに今いるブランチ名が表示される
"nmap [fugitive] <Nop>
nnoremap gc :Gcommit -m "
nnoremap gpush :Git push<aCR>
nnoremap gpull :Git pull<CR>
nnoremap gs :Gstatus<CR>
nnoremap gd :Gvdiff<CR>
nnoremap gb :Gblame -s<CR>
nnoremap gw :Gwrite<CR>
nnoremap gr :Gread<CR>

"**********************************
"submode.vim
"**********************************
let g:submode_timeout = 0
"change window size mode
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')
"goto tab mode
call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
call submode#leave_with('changetab', 'n', '', 'g')
call submode#map('changetab', 'n', '', 't', 'gt')
call submode#map('changetab', 'n', '', 'T', 'gT')

"**********************************
"template
"**********************************
let g:templates_directory = ['~/.vim/template']
let g:templates_name_prefix ='=template='
let g:templates_global_name_prefix ='=template='

"**********************************
"yankring    
"**********************************
let g:yankring_history_dir = '~/.vim/history'
let g:yankring_max_history  =  10
let g:yankring_max_display = 10

"**********************************
"gundo
"**********************************
nnoremap <leader>gt :GundoToggle<CR>
nnoremap <F4> :GundoToggle<CR>

"**********************************
"show mark
"**********************************
nnoremap [Mark] <Nop>
nmap <leader>m [Mark]
augroup show-marks-sync
  autocmd!
  autocmd BufReadPost * silent! ShowMarksOnce
augroup END

"**********************************
"easy motion
"**********************************
map <leader> <Plug>(easymotion-prefix)
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key=","

"**********************************
"pyFlakes 
"**********************************
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
let g:PyFlakeDefaultComplexity=10

"**********************************
"syntastic
"**********************************
let g:syntastic_python_checkers = ['pyflakes', 'pep8', 'pylint']

"**********************************
"qFixHown
"**********************************
let QFixHowm_Key = 'g'
let QFixHowm_KeyB = ','
let howm_filename = '%Y/%m/%d-%H.md'
"date
let QFixHowm_DatePattern = '%Y-%m-%d'
let QFixHowm_FileType = 'markdown'
let QFixHowm_Title = '#'
let QFixMRU_Title = {}
let QFixMRU_Title['mkd'] = '^###[^#]'
"encoding
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
let QFixHowm_DiaryFile      = '%Y/%m/%d.md'
"export
let QFixHowm_ScheduleExportFile = '~/qfixmemo/calendar/qfixhowm.ics'
let QFixHowmAutoExport = 1
nmap g,u g,<S-u>
"window
let QFix_CopenCmd = 'botright'
let QFix_PreviewOpenCmd = 'botright'
let QFixHowm_QuickMemoFile  = 'quick.md'
"new entry
let QfixHowm_Template  =  ["%TAG%",  "%DATE%", ""]
let QFixHowm_Cmd_NewEntry = "$a"
"arrangement
let QFixHowm_Autoformat = 1
let QFixHowm_Autoformat_TitleMode = 1 "行頭にTitle全てタイトルとみなして整形
let QFixHowm_SaveTime = 1 "タイムスタンプを自動で付加する
let QFixHowm_DefaultTag = ''

"**********************************
"vim filer
"**********************************
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
let g:vimfiler_execute_file_list = 'vim'
nmap <silent>e. :VimFiler -split -simple -winwidth=20 -no-quit<CR>
let g:vimfiler_data_directory       = expand('~/.vim/etc/vimfiler')

"**********************************
"unite.vim
"**********************************
let g:neomru#file_mru_path          = expand('~/.vim/etc/neomru/file')
let g:neomru#directory_mru_path     = expand('~/.vim/etc/neomru/direcroty')
let g:unite_data_directory          = expand('~/.vim/etc/unite')
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_max_candidates = 200
let g:unite_source_grep_recursive_opt = ''
let g:unite_split_rule = 'topleft'
let g:unite_winwidth = 50
let g:unite_enable_start_insert = 0
let g:unite_source_mark_marks = 'abcABC012'
"vimfiler
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')
if !exists("g:unite_source_menu_menus")
  let g:unite_source_menu_menus = {}
endif
let g:unite_source_menu_menus.shortcut = {
\   "description" : "shortcut"
\}
let g:unite_source_menu_menus.shortcut.candidates = [
\   [ "vimrc"  , s:vimrc ],
\   [ "neobundles", s:neobundle_root ],
\   [ "Unite Beautiful Attack", "Unite -auto-preview colorscheme" ],
\   [ "Pocket", "http://www.getpocket.com/a/queue/" ],
\]
function! g:unite_source_menu_menus.shortcut.map(key, value)
  let [word, value] = a:value
  if isdirectory(value)
    return {
          \               "word" : "[directory] ".word,
          \               "kind" : "directory",
          \               "action__directory" : value
          \           }
  elseif !empty(glob(value))
    return {
          \               "word" : "[file] ".word,
          \               "kind" : "file",
          \               "default_action" : "tabdrop",
          \               "action__path" : value,
          \           }
  else
    return {
          \               "word" : "[command] ".word,
          \               "kind" : "command",
          \               "action__command" : value
          \           }
  endif
endfunction

nnoremap [unite] <Nop>
nmap <space> [unite]
nnoremap [unite]<space> :Unite<space>
nnoremap <silent>[unite]d :cd ~/Documents<CR>:<C-u>Unite -vertical -start-insert file_rec/async<CR>
nnoremap <silent>[unite]b :<C-u>Unite -vertical bookmark<CR>
nnoremap <silent>[unite]m :<C-u>Unite -vertical menu<CR>
nnoremap <silent> [unite]o :<C-u>Unite -vertical -no-quit outline<CR>
nnoremap <silent> [unite]f :<C-u>Unite -vertical -no-quit file_rec/async<CR>
nnoremap <silent>[unite]h  :<C-u>Unite help<CR>
nnoremap <silent>[unite]g  :<C-u>Unite qfixhowm<CR>
nnoremap <silent>[unite]a :<C-u>Unite neomru/file<CR>

"**********************************
"quicktun config
"**********************************
if !exists("g:quickrun_config")
    let g:quickrun_config={}
endif
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 20,
\       "outputter" : "multi:buffer:quickfix",
\       "outputter/buffer/split" : ":botright 4sp",
\       "hook/unite_quickfix/enable_failure" : 1,
\       "hook/close_unite_quickfix/enable_hook_loaded" : 1,
\       "hook/close_quickfix/enable_exit" : 1,
\       "hook/close_quickfix/enable_hook_loaded" : 1,
\       "hook/close_quickfix/enable_success" : 1,
\       "hook/close_buffer/enable_failure" : 1,
\       "hook/close_buffer/enable_empty_data" : 1,
\       "hook/shabadoubi_touch_henshin/enable" : 1,
\       "hook/shabadoubi_touch_henshin/wait" : 20,
\	"hook/echo/output_success" : "（＾ω＾U 三 U＾ω＾）",
\	"hook/echo/output_failure" : "(∪´;ﾟ;ω;ﾟ)･;'.､･;'.･;';ﾌﾞﾌｫ",
\       "hook/time/enable" : 1,
\   }
\}

let g:quickrun_config.tex = {'command' : 'latexmk', 
      \ 'exec' : ['%c %o %s'], 
\       "hook/shabadoubi_touch_henshin/enable" : 0,
      \ 'cmdopt' : '-pdfdvi'}
augroup texrun
  autocmd!
  autocmd FileType tex nnoremap <buffer> <leader>lr :!latexmk -pdfdvi %<CR>
  autocmd FileType tex nnoremap <buffer> <leader>lo :!open -a skim %<.pdf<CR>
augroup END

let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked\ 2',
      \ 'exec'      : '%c %o %a %s',
      \ }

nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

noremap <leader>r :<C-u>QuickRun<CR>
noremap <F5> :<C-u>QuickRun<CR>

"**********************************
"jedi
"**********************************
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
autocmd FileType python setlocal completeopt-=preview

"**********************************
"neocommplete
"**********************************
"keyword pattern
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#data_directory    = expand('~/.vim/etc/neocomplete')
let g:neocomplete#max_keyword_width  =  30
let g:neocomplete#max_list  =  5
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#enable_underbar_completion  =  1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#Complet
"jedi work together with neocomplete
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
highlight Pmenu ctermbg=8
highlight PmenuSel ctermbg=1
highlight PmenuSbar ctermbg = 0

"**********************************
"Neosnippets
"**********************************
let g:neosnippet#snippets_directory = []
if ! empty(neobundle#get("vim-snippets"))
  let g:neosnippet#snippets_directory += ['~/.vim/bundle/vim-snippets/snippets']
endif
let s:my_snippet = '~/.vim/snippets/'
let g:neosnippet#snippets_directory += [s:my_snippet]
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#disable_runtime_snippets = {'_' : 1}
set completeopt-=preview
" For snippet_complete marker.
if has('conceal')
  set conceallevel=0 concealcursor=i
endif

autocmd InsertLeave * NeoSnippetClearMarkers
autocmd BufNewFile,BufRead *.snip set syntax=snippet ft=snippet foldmethod=indent
autocmd FileType java :setlocal omnifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo

imap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnnipet_expand_target)
"**********************************
"help 
"**********************************
set keywordprg=:help " Open Vim internal help by K command
set helplang=ja
augroup helpgroup
  autocmd!
  autocmd helpgroup FileType help nnoremap <buffer> q <C-w>c
augroup END

"**********************************
"LOOKS
"**********************************
let g:rehash256 = 1 "?
colorscheme molokai
let g:molokai_original = 1
set background=dark

"status line and command line
set laststatus=2 
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set wildmenu wildmode=list:full
set showcmd "タイプ途中のコマンドを画面最下行に表示
set guifont=Ricty-Regular:h14
set number 
set cmdheight=2 "コマンドラインの高さを2行に
set cursorline
set autoindent
set expandtab "tab is replaced by space
set shiftwidth=2 "タブ文字の代わりにスペース２個を使う
set shiftround "shiftwidthの倍数に丸める
set softtabstop=2 "tab width in display is two 
filetype indent on
filetype indent plugin on "ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有向にする
set display=lastline 
set wrap "折り返し

"**********************************
"THE OTHERS
"**********************************
set modelines=0
set imdisable "english in normal mode
set clipboard=unnamed " ヤンクなどで * レジスタにも書き込む
set modifiable

augroup ChangeDir
  autocmd!
  autocmd BufEnter * execute ":lcd " . substitute(expand("%:p:h")," ","\\\\ ","g")
augroup END
set backspace=indent,eol,start 
"start: validate BS in incert mode back from normal mode"
"eol:  delete eol
"indent:  delete indent"

"**********************************
"save and read window
"**********************************
"windowsize 
let g:save_window_file = expand('~/.vim/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
          \ 'set columns=' . &columns,
          \ 'set lines=' . &lines,
          \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
          \ ]
  call writefile(options, g:save_window_file)
  endfunction
augroup END

if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif
  
augroup init 
  if has("gui_running")
    set fuoptions=maxvert,maxhorz "update lines and columns"
  endif
augroup end

"**********************************
"character code
"**********************************
set fileencoding=utf-8
if has('macunix')
  set fileencodings=utf-8
elseif has('win32') || has('win64')
  set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
endif
set encoding=utf-8

"**********************************
"KEY BIND
"**********************************
let mapleader = ","
"tab
nnoremap [tab] <Nop>
nmap t [tab]
map <silent> [tab]n :tablast <bar> tabnew<CR>
"insertmode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
"normal mode
noremap <s-y> y$
nnoremap <buffer> q <C-w>c
nnoremap <S-w> :<C-u>w<CR>
nnoremap <S-q> :<C-u>q<CR>
nnoremap ZQ <Nop>
"move
noremap j gj
noremap gj j
noremap k gk
noremap gk k
noremap <C-h> ^
noremap <C-l>  $
"search
nnoremap n nzz
nnoremap N Nzz
"help
nnoremap <C-h> :<C-u>help<Space>

"copy and paste 
"カーソル位置以降の単語の文字列ととヤンクした文字列を置換
noremap <silent> cy ce<c-r>0<ESC>:let@/ = @1<CR>:noh<CR>
noremap <silent> ciy ciw<c-r>0<ESC>:let@/ = @1<CR>:noh<CR>
inoremap jj <ESC>

" vimrc
nnoremap <Space>. <C-u>:edit $MYVIMRC<CR>
nnoremap <Space>s. <C-u>:source $MYVIMRC<CR>

"**********************************
"search
"**********************************
set scrolloff=5
set nostartofline
set incsearch
set ignorecase "検索時に大文字小文字を無視する
set hlsearch "highlight"
set smartcase "if Upper Case exist not igonore case
nnoremap<ESC><ESC> :nohlsearch<CR>  

"**********************************
"fold
"**********************************
set foldtext=foldCCtext()
let g:foldCCtext_tail = 'v:foldend-v:foldstart+1'
highlight Folded guibg=grey guifg=blue

"**********************************
"source vimrc when save
"**********************************
augroup ReadVimrc
    autocmd!
    autocmd BufWritePost .vimrc source ~/.vimrc
augroup END


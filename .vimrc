if has('vim_starting')
  let s:vimrc = "~/dotfiles/.vimrc"
  let s:neobundle_root = "~/.vim/bundle/"
  set nocompatible "viと互換性を維持しない 
  if !isdirectory(expand("~/.vim/.bundle/neobundle.vim/"))
    " neobundleの自動インストール。要git
    echo "install neobundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/.bundle/neobundle.vim")
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  set runtimepath+=/usr/local/Cellar/vim/7.4.488/share/vim/vim74/syntax
  filetype plugin indent on
  filetype plugin on
  syntax enable
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
NeoBundle 'vim-scripts/javacomplete'
NeoBundle 'bps/vim-textobj-python'
NeoBundle 'davidhalter/jedi-vim' "cmmpletion for python 
NeoBundle 'tpope/vim-markdown'
NeoBundle 'vim-scripts/dbext.vim', '18.0'
NeoBundle 'aklt/plantuml-syntax' "make uml by text
NeoBundle 'rbonvall/vim-textobj-latex'
"**********************************
"IDE
"**********************************
NeoBundle "Shougo/vimfiler.vim"
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
NeoBundle 'vim-scripts/project.tar.gz' 
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'shougo/neomru.vim' "show recently used file in unite
"neosnippet and neocomplete
NeoBundle 'shougo/neocomplete' "neocomplete plugin
NeoBundle 'ujihisa/neco-look' "completion for english
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets' "neosnipet deffinition file
NeoBundle "honza/vim-snippets" "snip files
"git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'cohama/agit.vim'
"**********************************
"Unite
"**********************************
NeoBundle 'Shougo/unite.vim'
NeoBundle 'soramugi/auto-ctags.vim' "to use unite outline
NeoBundle 'Shougo/unite-outline'
NeoBundle "tacroe/unite-mark"
NeoBundle 'Shougo/unite-help'
NeoBundle 'osyo-manga/unite-qfixhowm'
"**********************************
"reenfoce function
"**********************************
NeoBundle 'kana/vim-submode'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle "Lokaltog/vim-easymotion"
NeoBundle "vim-scripts/YankRing.vim"
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'sjl/gundo.vim'
"**********************************
"vim-ref
"**********************************
NeoBundle 'thinca/vim-ref' "for dictionary and pydoc
NeoBundle 'mojako/ref-sources.vim'
"**********************************
"memo
"**********************************
NeoBundle 'fuenor/qfixhowm' "to various memo manually install
NeoBundle 'fuenor/qfixgrep' "to various memo manually install
NeoBundle 'mattn/calendar-vim'
"**********************************
"text object and operator
"**********************************
NeoBundle 'kana/vim-textobj-user' "to expand text-objects
NeoBundle 'kana/vim-operator-user' "to expand operatior
NeoBundle 'kana/vim-textobj-function' "to add function to text obj
NeoBundle 'kana/vim-textobj-indent' " to add same indent block to text obj
NeoBundle 'sgur/vim-textobj-parameter'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'osyo-manga/vim-textobj-multitextobj' 
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'thinca/vim-textobj-between'
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
nnoremap gc :Gcommit -am "
nnoremap gpush :Git push<CR>
nnoremap gpusll :Git pull<CR>
nnoremap gs :Gstatus<CR>
nnoremap gd :Gvdiff<CR>
nnoremap gb :Gblame -s<CR>
nnoremap gw :Gwrite<CR>
nnoremap gr :Gread<CR>

"**********************************
"agit
"**********************************
nnoremap gl :Agit<CR>

"**********************************
"quickhl
"**********************************
nmap <leader>h <Plug>(quickhl-manual-this)
xmap <leader>h <Plug>(quickhl-manual-this)
nmap <leader>H <Plug>(quickhl-manual-reset)
xmap <leader>H <Plug>(quickhl-manual-reset)

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
let g:templates_name_prefix ='template'
let g:templates_global_name_prefix ='template'

"**********************************
"incserch.vim
"**********************************
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"**********************************
"multitextobj
"**********************************
" 上から順に textobj を適用していき、該当するものが使用される
let g:textobj_multitextobj_textobjects_i = [
\   "\<Plug>(textobj-url-i)",
\   "\<Plug>(textobj-multiblock-i)",
\   "\<Plug>(textobj-function-i)",
\   "\<Plug>(textobj-entire-i)",
\]
omap amt <Plug>(textobj-multitextobj-a)
omap imt <Plug>(textobj-multitextobj-i)
vmap amt <Plug>(textobj-multitextobj-a)
vmap imt <Plug>(textobj-multitextobj-i)

"**********************************
"yankring    
"**********************************
let g:yankring_history_dir = '~/.vim/history'
let g:yankring_max_history  =  10
let g:yankring_max_display = 10
nnoremap <silent> <leader>Y :<c-u>YRShow<CR>

"**********************************
"gundo
"**********************************
nnoremap <leader>gt :GundoToggle<CR>
nnoremap <F4> :GundoToggle<CR>

"**********************************
"open browser
"**********************************
"let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <leader>os <Plug>(openbrowser-smart-search)
nnoremap <leader>ob :OpenBrowser http://google.com/<CR> 

"**********************************
"show mark
"**********************************
nnoremap [Mark] <Nop>
nmap <leader>m [Mark]
augroup show-marks-sync
  autocmd!
  autocmd BufReadPost * silent! ShowMarksOnce
augroup END
" マークと表示の更新を同時に行う
nnoremap [Mark] :<C-u>call <SID>AutoMarkrement()<CR><CR>:ShowMarksOnce<CR>
" マークの全削
command! -bar MarksDelete silent :delm! | :delm 0-9A-Z | :wv! | :ShowMarksOnce
nnoremap <silent>d[Mark] :MarksDelete<CR>

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
let g:syntastic_python_checkers = ['pyflakes', 'pep8']

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
"MRUでタイトル行とみなす正規表現(vimの正規表現)
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
"エントリを自動整形する
let QFixHowm_Autoformat = 1
let QFixHowm_Autoformat_TitleMode = 1 "行頭にTitle全てタイトルとみなして整形
let QFixHowm_SaveTime = 1 "タイムスタンプを自動で付加する
"let QFixHowm_SplitMode = 1 "ウィンドウ分割を基本にしてhowmファイルを開く
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
"vim-ref
"**********************************
let g:ref_cache_dir                 = expand('~/.vim/etc/vim_ref_cache')
let g:ref_use_vimproc=1
let g:ref_refe_version=2
let g:ref_refe_encoding = 'utf-8'
let g:ref_source_webdict_sites = {
  \ 'je': {
  \   'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
  \   'line': 14,
  \ },
  \ 'ej': {
  \   'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
  \   'line': 14,
  \ },
  \ 'wiki': {
  \   'url': 'http://ja.wikipedia.org/wiki/%s',
  \ }}
let g:ref_source_webdict_sites.default = 'ej'
"出力に対するフィルタ。最初の数行を削除
function! g:ref_source_webdict_sites.je.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.ej.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.wiki.filter(output)
  return join(split(a:output, "\n")[17 :], "\n")
endfunction
nmap <leader>d :<C-u>Ref webdict ej<Space>

"**********************************
"ref-sources
"**********************************
let g:ref_kotobank_auto_resize = 1
let g:ref_kotobankej_auto_resize = 1

"**********************************
"unite.vim
"**********************************
let g:neomru#file_mru_path          = expand('~/.vim/etc/neomru/file')
let g:neomru#directory_mru_path     = expand('~/.vim/etc/neomru/direcroty')
let g:unite_data_directory          = expand('~/.vim/etc/unite')
"grep
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_max_candidates = 200
let g:unite_source_grep_recursive_opt = ''
"looks
let g:unite_split_rule = 'topleft'
let g:unite_winwidth = 50
"settings
let g:unite_enable_start_insert = 0
"marks
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
"map
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
" g:quickrun_config の初期化
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
"tex
let g:quickrun_config.tex = {'command' : 'latexmk', 
      \ 'exec' : ['%c %o %s'], 
\       "hook/shabadoubi_touch_henshin/enable" : 0,
      \ 'cmdopt' : '-pdfdvi'}
      
noremap <leader>r :<C-u>QuickRun<CR>

augroup texrun
  autocmd!
  autocmd FileType tex nnoremap <buffer> <leader>lr :!latexmk -pdfdvi %<CR>
  autocmd FileType tex nnoremap <buffer> <leader>lo :!open -a skim %<.pdf<CR>
augroup END

"markdown
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked\ 2',
      \ 'exec'      : '%c %o %a %s',
      \ }
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

"**********************************
"neocommplete
"**********************************
let g:neocomplete#data_directory    = expand('~/.vim/etc/neocomplete')
let g:neocomplete#max_keyword_width  =  50
let g:neocomplete#max_list  =  5
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:neocomplete#keyword_patterns['_'] = '\h\w*'
let g:acp_enableAtStartup = 0
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
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"keyword pattern
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
highlight Pmenu ctermbg=8
highlight PmenuSel ctermbg=1
highlight PmenuSbar ctermbg = 0

"**********************************
"Neosnippets
"**********************************
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#disable_runtime_snippets = {'_' : 1}
set completeopt-=preview
autocmd InsertLeave * NeoSnippetClearMarkers
"snippetdir
let g:neosnippet#snippets_directory = []
if ! empty(neobundle#get("vim-snippets"))
  let g:neosnippet#snippets_directory += ['~/.vim/bundle/vim-snippets/snippets']
endif
let s:my_snippet = '~/.vim/snippets/'
let g:neosnippet#snippets_directory += [s:my_snippet]
"map
imap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnnipet_expand_target)
nnoremap ,ne :NeoSnippetEdit<CR>
autocmd BufNewFile,BufRead *.snip set syntax=snippet ft=snippet foldmethod=indent
" For snippet_complete marker.
if has('conceal')
  set conceallevel=0 concealcursor=i
endif
"java-complete
autocmd FileType java :setlocal omnifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo

"**********************************
"jedi
"**********************************
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

"**********************************
"help 
"**********************************
augroup helpgroup
  autocmd!
augroup END
autocmd helpgroup FileType help nnoremap <buffer> q <C-w>c
set keywordprg=:help " Open Vim internal help by K command
set helplang=ja

"**********************************
"LOOKS
"**********************************
colorscheme molokai
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
syntax on
let g:molokai_original = 1
let g:rehash256 = 1 "?
set background=dark
set guifont=Ricty-Regular:h14
set number 
set cmdheight=2 "コマンドラインの高さを2行に
set cursorline
set autoindent
set expandtab "tab is replaced by space
set shiftwidth=2 "タブ文字の代わりにスペース２個を使う
set shiftround "shiftwidthの倍数に丸める
set softtabstop=2 "tab width is two
filetype indent on
filetype indent plugin on "ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有向にする
set display=lastline "できるかぎり表示する　コマンドの結果？
set wrap "折り返し

"**********************************
"THE OTHERS
"**********************************
set modelines=0		"?
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
"status line and command line
"**********************************
set laststatus=2 "?
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set wildmenu wildmode=list:full
set showcmd "タイプ途中のコマンドを画面最下行に表示

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
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set encoding=utf-8

"**********************************
"tab BIND
"**********************************
nnoremap    [tab]   <Nop>
nmap    t [tab]
map <silent> [tab]n :tablast <bar> tabnew<CR>

"**********************************
"KEY BIND
"**********************************
let mapleader = ","
if has('macunix')
  let mapleader = ","
endif
"insertmode
inoremap : ;
inoremap ; :
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
nnoremap : ;
nnoremap ; :
"move
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
noremap <C-h> ^
noremap <C-l>  $
"search
nnoremap n nzz
nnoremap N Nzz
"help
nnoremap <C-h>      :<C-u>help<Space>

"copy and paste 
"カーソル位置以降の単語の文字列ととヤンクした文字列を置換
noremap <silent> cy ce<c-r>0<ESC>:let@/ = @1<CR>:noh<CR>
noremap <silent> ciy ciw<c-r>0<ESC>:let@/ = @1<CR>:noh<CR>
inoremap jj <ESC>

"**********************************
"search
"**********************************
set scrolloff=5
set nostartofline

"**********************************
"search
"**********************************
set incsearch
set ignorecase "検索時に大文字小文字を無視する
set hlsearch "highlight"
set smartcase "if Upper Case exist not igonore case
nnoremap<ESC><ESC> :nohlsearch<CR>  

"**********************************
"fold
"**********************************
"foldCC
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



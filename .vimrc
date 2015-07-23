

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
"neobundle#rc
"neobundle#get
call neobundle#begin(expand('~/.vim/bundle/'))
let g:neobundle_default_git_protocol='https'
NeoBundleFetch 'Shougo/neobundle.vim'
"**********************************
"colorscheme
"**********************************
NeoBundle 'tomasr/molokai' "colorscheme
"**********************************
"programming language
"**********************************
NeoBundle 'vim-scripts/javacomplete'
"python
NeoBundle "klen/python-mode"
NeoBundle 'bps/vim-textobj-python'
NeoBundle 'davidhalter/jedi-vim' "cmmpletion for python 
"/vim-flake8" "python coding policy check
"latex
"NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
NeoBundle 'lervag/vimtex'
"NeoBundle 'lervag/vim-latex'
"NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
"R
NeoBundle 'vim-scripts/Screen-vim---gnu-screentmux'
NeoBundle 'vim-scripts/Vim-R-plugin'
"markdown
NeoBundle 'tpope/vim-markdown'
"DB
NeoBundle 'vim-scripts/dbext.vim', '18.0'
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
"NeoBundle 'aklt/plantuml-syntax' "make uml by text
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'shougo/neomru.vim' "show recently used file in unite
"neosnippet and neocomplete
"NeoBundle 'shougo/neocomplete.vim' "neocomplete plugin
NeoBundle 'shougo/neocomplete' "neocomplete plugin
NeoBundle 'ujihisa/neco-look' "completion for english
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets' "neosnipet deffinition file
NeoBundle "honza/vim-snippets" "snip files
NeoBundle "shougo/vimshell"
NeoBundle 'sjl/gundo.vim'
NeoBundle 'mhinz/vim-startify'
"git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'cohama/agit.vim'
"unite-giti / unite-versions
"**********************************
"Unite
"**********************************
NeoBundle 'Shougo/unite.vim'
NeoBundle 'soramugi/auto-ctags.vim' "to use unite outline
NeoBundle 'Shougo/unite-outline'
NeoBundle "osyo-manga/unite-quickfix"
NeoBundle "tacroe/unite-mark"
NeoBundle 'Shougo/unite-help'
NeoBundle 'osyo-manga/unite-qfixhowm'
NeoBundle 'haya14busa/unite-reading-vimrc'
NeoBundle 'ujihisa/unite-colorscheme'
"quickrun_config
"re animate
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
"NeoBundle 'migrs/qfixhowm' "to various memo manually install
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
NeoBundle 'thinca/vim-textobj-comment' "to add comment to text obj
NeoBundle 'kana/vim-operator-replace' "replace object with yanked item
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'thinca/vim-textobj-between'
NeoBundle 'rbonvall/vim-textobj-latex'
"NeoBundle 'emonkak/vim-operator-comment' "to add commentout operator 
"**********************************
"edit
"**********************************
NeoBundle "tpope/vim-surround"
NeoBundle "scrooloose/nerdcommenter"
NeoBundle "h1mesuke/vim-alignta"
"NeoBundle 'taku-o/vim-toggle'
NeoBundle 'zef/vim-cycle'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'Townk/vim-autoclose'
"**********************************
"looks
"**********************************
"NeoBundle "nathanaelkane/vim-indent-guides"
NeoBundle 'Yggdroot/indentLine'
"NeoBundle "rbtnn/rabbit-ui.vim"
"NeoBundle "rbtnn/rabbit-ui-collection.vim"
NeoBundle 'jacquesbh/vim-showmarks'
NeoBundle 'Lokaltog/vim-powerline'
"**********************************
"read helping info
"**********************************
"**********************************
"not organized
"**********************************
NeoBundle "vim-jp/vimdoc-ja"
NeoBundle 'tyru/open-browser.vim'
NeoBundle "Lokaltog/vim-easymotion"
"NeoBundle 'houtsnip/vim-emacscommandline'
NeoBundle "vim-scripts/YankRing.vim"
NeoBundle "gregsexton/VimCalc"
"NeoBundle 'haya14busa/vim-migemo'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'cloudformdesign/vim.ergonomic'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'LeafCage/foldCC.vim'
"NeoBundle 'vim-scripts/ViewOutput'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'kana/vim-submode'
"Neobundle 'zhaocai/GoldenView.Vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tyru/restart.vim'
NeoBundle 'thinca/vim-prettyprint'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'thinca/vim-ft-help_fold'
NeoBundle 'tyru/capture.vim'
NeoBundle "t9md/vim-quickhl" "for highlight variable

"poslist
"smartinput endwise
"NeoBundle 'nielsadb/vim-filtering' "serch filtering
"NeoBundle 'kana/vim-arpeggio' "simultaneously pressed key
"winresizer
"tpope/vim-abolish
"svermeulen/vim-easyclip
"godlygeek/tabular
"switch.vim
"vim-slime
""browser load mac
"tyru/capture export to buffer
"endwie
"rspec
"rsense
"dbnext
"unitere rake
"ref-ri
"HarveyHunt/howm
"coot/atp_vim
"fholgado/minibufexpl.vim
"context filetype
"watchdog
"substituitive
"tagbar
"ultisnip
"org-mode
"Ctrlp
"NeoBundle 'vim-scripts/matchit.zip'
"NeoBundle 'vim-scripts/taglist.vim'grep.vim
"mustache/vim-mustache-handlebars
"'alpaca-tc/alpaca_tags'
"easy-align
"NeoBundle 'kannokanno/previm'
"NeoBundle 'LeafCage/yankround.vim'
"'mattn/emmet-vim
"'NeoBundle 'moll/vim-node'
"NeoBundle 'yuratomo/w3m.vim'
"NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'slim-template/vim-slim'
" 最近知ったjellybeanから乗り換えたcolor scheme
"NeoBundle 'junegunn/seoul256.vim'
"nextfile
"" WORD for Japanese.
"NeoBundle 'deton/jasegment.vim'
"NeoBundle 'yuku-t/vim-ref-ri'
"NeoBundle 'rbtnn/vimconsole.vim'
"virtualenv.vim
"set guioptions-=m
"set guioptions-=T
"if has('multi_byte_ime') || has('xim')
  "highlight CursorIM guibg=Purple guifg=NONE
  "set iminsert=0 imsearch=0
"endif
" autocmd gvimrc GUIEnter * set transparency=220
" autocmd gvimrc FocusGained * set transparency=220
" autocmd gvimrc FocusLost * set transparency=128
"NeoBundle 'LeafCage/yankround.vim'
"nmap p <Plug>(yankround-p)
"xmap p <Plug>(yankround-p)
"nmap P <Plug>(yankround-P)
"nmap gp <Plug>(yankround-gp)
"xmap gp <Plug>(yankround-gp)
"nmap gP <Plug>(yankround-gP)
"nmap <C-p> <Plug>(yankround-prev)
"nmap <C-n> <Plug>(yankround-next)NeoBundle 'osyo-manga/unite-fold'

NeoBundleCheck "プラグインがインストールされているかチェックする
call neobundle#end()
if !has('vim_starting')
  call neobundle#call_hook('on_source') "vimrcを読み込み直したときのための設定
  call neobundle#end()
endif
"let g:neocomplete#data_directory    = expand('~/.vim/etc/neocomplete')
"let g:vimfiler_data_directory       = expand('~/.vim/etc/vimfiler')
"let g:vimshell_temporary_directory  = expand('~/.vim/etc/VimShell')
"let g:unite_data_directory          = expand('~/.vim/etc/unite')
"let g:neomru#file_mru_path          = expand('~/.vim/etc/neomru/file')
"let g:neomru#directory_mru_path     = expand('~/.vim/etc/neomru/direcroty')
"let g:ref_cache_dir                 = expand('~/.vim/etc/vim_ref_cache')
"let g:w3m#history#save_file         = expand('~/.vim/etc/.vim_w3m_hist')
"let g:yankround_dir                 = expand('~/.vim/etc/.cache/yankround')
"**********************************
"fugitive
"**********************************
let g:restart_sessionoptions = 'blank,buffers,curdir,folds,help,localoptions,tabpages'
let g:restart_vim_progname  =  "gvim"
let g:restart_save_window_values  = 1

"**********************************
"fugitive
"**********************************
"statusline に %{fugitive#statusline()} を追加すると、ステータスラインに今いるブランチ名が表示される
"nmap [fugitive] <Nop>
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
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
"capture
"**********************************
nnoremap <leader>c :Capture<CR>

"**********************************
"quickhl
"**********************************
nmap <leader>h <Plug>(quickhl-manual-this)
xmap <leader>h <Plug>(quickhl-manual-this)
nmap <leader>H <Plug>(quickhl-manual-reset)
xmap <leader>H <Plug>(quickhl-manual-reset)

"**********************************
"cycle.vim
"**********************************
source ~/.vim/bundle/vim-cycle/plugin/cycle.vim
call AddCycleGroup(['section', 'subsection', 'subsubsection'])
call AddCycleGroup(['equation', 'align'])
call AddCycleGroup(['equation', 'align'])

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
"undo redo mode
call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
call submode#map('undo/redo', 'n', '', '-', 'g-')
call submode#map('undo/redo', 'n', '', '+', 'g+')

"**********************************
"toggle.vim
"**********************************
"let g:toggle_pairs = {} 
"let g:toggle_pairs['section'] = 'subsection'
"let g:toggle_pairs['subsection'] = 'subsubsection'
"let g:toggle_pairs['subsubsection'] = 'section'
"nmap + <Plug>ToggleN
"", 'subsection' : 'subsubsection'  }
"**********************************
"smart input
"**********************************
"call smartinput#map_to_trigger('i', '<Plug>(smartinput_BS)',
      "\                        '<BS>',
      "\                        '<BS>')
"call smartinput#map_to_trigger('i', '<Plug>(smartinput_C-h)',
      "\                        '<BS>',
      "\                        '<C-h>')
"call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)',
      "\                        '<Enter>',
      "\                        '<Enter>')
"call smartinput#define_rule({
      "\ 'at'    : '\%([^''"][\sA-Za-z]\*\|^\|%\)\%#',
      "\ 'char'  : '%',
      "\ 'input' : "<C-R>=smartchr#one_of(' % ', '%')<CR>",
      "\ })


"**********************************
"vimshell
"**********************************
if has("mac")
  let g:vimshell_editor_command="/usr/local/bin/vim"
endif

"**********************************
"smartchar
"**********************************
inoremap <expr> = smartchr#one_of('=', ' = ', ' == ', ' === ')
inoremap <expr> + smartchr#loop('+', ' + ')
inoremap <expr> - smartchr#loop('-', ' - ')
inoremap <expr> , smartchr#loop(', ', ',')
"inoremap <expr> / smartchr#one_of(' / ', '// ', '/')
inoremap <buffer><expr> . smartchr#loop('.', '<-', '...')

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
"vim-r-plugin
"**********************************
let vimrplugin_applescript = 0
let maplocalleader = ","
"vmap <Space> <Plug>RDSendSelection
"nmap <Space> <Plug>RDSendLine
"let vimrplugin_vsplit=1
let vimrplugin_objbr_w = 30
let vimrplugin_rconsole_height = 5

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
"vim-startify
"**********************************
" startifyのヘッダー部分に表示する文字列を設定する
let g:startify_custom_header =
  \ map(split(system('date'), '\n'), '"   ". v:val') + ['','']
"使用するアルファベットを指定(デフォルトだと数字)
let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']
" よく使うファイルをブックマークとして登録しておく
let g:startify_bookmarks = ['~/dotfiles/.vimrc']

"**********************************
"argeggio
"**********************************
"call arpeggio#load()
"map cc <Plug>(operator-comment) 
"Arpeggiomap od <Plug>(operator-uncomment)

"**********************************
"dash 
"**********************************
" dash.vim {{{
nmap <Leader>d <Plug>DashSearch
" }}}

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
"nmap brw <Plug>(openbrowser-search)
"nmap browse <silent>:OpenBrowser http://google.com/  

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
" 1 ストローク選択を優先する
"let g:EasyMotion_grouping=1

"**********************************
"make java
"**********************************
"autocmd Filetype java set makeprg=javac\ %
"set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
"map :make :make<Return>:copen<Return>

"**********************************
"pyFlakes 
"**********************************
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
let g:PyFlakeDefaultComplexity=10

"**********************************
"python mode
"**********************************
let g:pymode_run = 1
let g:pymode_run_bind='<F5>'

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
"vim filtering
"**********************************
"nnoremap ,f :call FilteringNew().addToParameter('alt', @/).run()<CR>
"nnoremap ,F :call FilteringNew().parseQuery(input('>'), '|').run(
"nnoremap ,g :call FilteringGetForSource().return()<CR>
"nmap ,r :call Gather(expand("<cword>"), 0)<CR>:echo<CR>

"**********************************
"vim filer
"**********************************
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = ' '
"let g:vimfiler_tree_opened_icon = '▾'
"let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
let g:vimfiler_execute_file_list = 'vim'
nmap <silent>e. :VimFiler -split -simple -winwidth=20 -no-quit<CR>
"autocmd VimEnter * VimFiler -split -simple -winwidth=20 -no-quit

"**********************************
"vim-ref
"**********************************
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
":UniteWithCursorWord
"qfixhowm
"let g:unite#custom_source('qfixhowm', 'sorters', ['sorter_qfixhowm_updatetime','sorter_reverse'])
""qfixhowm/new"

let g:unite_qfixhowm_new_memo_cmd = "tabnew"
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
"AllMap
"map
nnoremap [unite] <Nop>
nmap <space> [unite]
nnoremap [unite]<space> :Unite<space>
nnoremap <silent> [unite]a :<C-u>Unite -vertical buffer file_mru<CR>
nnoremap <silent>[unite]d :cd ~/Documents<CR>:<C-u>Unite -vertical -start-insert file_rec/async<CR>
nnoremap <silent>[unite]b :<C-u>Unite -vertical bookmark<CR>
"nnoremap <silent> [unite]m :<C-u>Unite -vertical mark<CR>
nnoremap <silent>[unite]m :<C-u>Unite -vertical menu<CR>
nnoremap <silent>[unite]n :<C-u>Unite -vertical neobundle<CR>
nnoremap <silent> [unite]o :<C-u>Unite -vertical -no-quit outline<CR>
nnoremap <silent> [unite]f :<C-u>Unite -vertical -no-quit file_rec/async<CR>
nnoremap <silent>[unite]d :cd ~/Documents<CR>:<C-u>Unite -vertical -start-insert file_rec/async<CR>
nnoremap <silent>[unite]s  :<C-u>Unite source<CR>
nnoremap <silent>[unite]h  :<C-u>Unite help<CR>
nnoremap <silent>[unite]g  :<C-u>Unite qfixhowm<CR>
"nnoremap <silent>[unite]c  :<C-u>Unite command<CR>
nnoremap <silent>[unite]v  :<C-u>Unite output:version<CR>
nnoremap <silent>[unite]l  :<C-u>Unite -start-insert line<CR>
nnoremap <silent>[unite]p  :<C-u>Unite -start-insert process<CR>
nnoremap <silent>[unite]r  :<C-u>Unite -start-insert register<CR>
"output:message
"output:imap
"function
"vimgrep
"find
"launcher
"alias
"history/yank
"runtimepath
"output:maplmap!llmap
"mapping
"qfixhowm:nocache
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
"outputter/buffer/close_on_empty"
"tex
let g:quickrun_config.tex = {'command' : 'latexmk', 
      \ 'exec' : ['%c %o %s'], 
\       "hook/shabadoubi_touch_henshin/enable" : 0,
      \ 'cmdopt' : '-pdfdvi'}
      "\ 'cmdopt' : '-pdfdvi', 
      
noremap <leader>r :<C-u>QuickRun<CR>

augroup texrun
  autocmd!
  "autocmd BufWritePost *.tex :QuickRun
  autocmd FileType tex nnoremap <buffer> <leader>lr :!latexmk -pdfdvi %<CR>
  autocmd FileType tex nnoremap <buffer> <leader>lo :!open -a skim %<.pdf<CR>
augroup END

"markdown
"autocmd BufNewFile,BufRead .{md,mdwn,mkd,mkdn,mark} set filetype=markdownlet g:quickrun_config = {}
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
"looks
let g:neocomplete#max_keyword_width  =  50
let g:neocomplete#max_list  =  5
"not organized
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"call neocomplete#custom#source('_', 'matchers',
"      \ ['matcher_head', 'matcher_length'])
"let g:neocomplete#enable_auto_select  =  1
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
"
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:neocomplete#keyword_patterns['_'] = '\h\w*'
""enable
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#use_vimproc                     = 1
""enable
"let g:neocomplete#disable_auto_complete           = 1
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#enable_underbar_completion  =  1
""cache size
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
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
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>
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
"imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
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
" docstringは表示しない
"autocmd FileType python setlocal completeopt-=preview

"**********************************
"vim-latex
"**********************************
" change to vim-latex
let g:tex_conceal = ""
let g:vimtex_latexmk_enabled = 1
let g:vimtex_latexmk_options = '-pdfdvi'
let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer = '/applications/skim.app/contents/macos/skim'
let g:vimtex_quickfix_ignore_all_warnings = 1
"" fold
"let g:latex_fold_parts = [
"      \ "appendix",
"      \ "frontmatter",
"      \ "mainmatter",
"      \ "backmatter",
"    \ ]
"let g:latex_fold_sections = [
"      \ "part",
"      \ "chapter",
"      \ "section",
"      \ "subsection",
"      \ "subsubsection",
"    \ ]
"let g:latex_fold_enabled = 1
"let g:latex_fold_automatic = 1
"let g:latex_fold_envs = 0
""compile
let g:vimtex_latexmk_continuous = 1
let g:vimtex_latexmk_background = 1
"let g:latex_latexmk_callback = 0  " コンパイル終了後のエラー通知オフ
""table of contents
let g:latex_toc_split_pos = "topleft"
let g:latex_toc_width = 10
"" synctex
function! s:synctexforward()
  call system('/applications/skim.app/contents/sharedsupport/displayline -g '
    \ . line(".") . " "
    \ . g:latex#data[b:latex.id].out() . " "
    \ . expand('%:p'))
endfunction
" preview
function! s:previewtex() range
    let l:tmp = @@
    silent normal gvy
    let l:selected = split(@@, "\n")
    let @@ = l:tmp
    let l:template1 = ["\\documentclass[a4paper]{jsarticle}",
                      \"\\usepackage[dvipdfmx]{graphicx}",
                      \"\\usepackage{amsmath,amssymb,bm}",
                      \"\\pagestyle{empty}",
                      \"\\begin{document}"]
    let l:template2 = ["\\end{document}"]
    let l:output_file = "preview.tex"
    call writefile(extend(extend(l:template1, l:selected), template2), l:output_file)
    silent call system("latexmk -pdfdvi preview &")
endfunction
"autocmd myautocmd filetype tex
            "\   nnoremap <buffer> <space>la :call latex#motion#next_section(0,1,0)<cr>v:call latex#motion#next_section(0,0,1)<cr>:call <sid>previewtex()<cr>
            "\ | vnoremap <buffer> <space>la :call <sid>previewtex()<cr>
            "\ | nnoremap <buffer> <space>ls :call <sid>synctexforward()<cr>
" for neocomplete
"if !exists('g:neocomplete#sources#omni#input_patterns')
let g:neocomplete#sources#omni#input_patterns = {}
"endif
let g:neocomplete#sources#omni#input_patterns.tex = '\\ref{\s*[0-9a-za-z_:]*'
"""\citeも自動補完するなら
let g:neocomplete#sources#omni#input_patterns.tex = '\\cite{\s*[0-9a-za-z_:]*\|\\ref{\s*[0-9a-za-z_:]*'
"nmap <localleader>ll <plug>(vimtex-compile-toggle)
"**************************************
"" latex box
""*************************************
"let g:latexbox_output_type = 'pdf'
"let g:latexbox_latexmk_options = '-pdf'
"let g:latexbox_latexmk_options = '-pdfdvi'
"let g:latexbox_latexmk_options = '-pdfps'
"let g:latexbox_viewer = 'open'

"**********************************
" LATEX
"**********************************
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"set grepprg=grep\ -nH\ $* "?
""looks
"let g:tex_flavor='latex'
"let g:tex_conceal=''
"let g:TeX_AutoFolding = 1
"let g:Tex_Folding = 1
""placeholder
"let g:Imap_UsePlaceHolders = 1 
"let g:Imap_DeleteEmptyPlaceHolders = 1 
"let g:Imap_StickyPlaceHolders = 0 
""compile
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf' "tex > dvi > pdf
"let g:Tex_FormatDependency_ps = 'dvi,ps' "tex > dvi > ps
"let g:Tex_MultipleCompileFormats = 'pdf'
"let g:Tex_CompileRule_dvi = 'platex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi' 
"let g:Tex_BibtexFlavor = 'upbibtex'
"let g:Tex_MakeIndexFlavor = 'mendex -U $*.idx'
"let g:Tex_UseEditorSettingInDVIViewer = 1 
""viewer
"let g:Tex_ViewRule_pdf = 'Skim'
""let g:Tex_ViewRule_pdf = 'open -a Preview.app'
""let g:Tex_ViewRule_ps = 'open'
""let g:Tex_ViewRule_dvi = 'open'
"let g:Tex_IgnoreLevel = 9 
"let g:Tex_IgnoredWarnings = 
    "\"Underfull\n".
    "\"Overfull\n".
    "\"specifier changed to\n".
    "\"You have requested\n".
    "\"Missing number, treated as zero.\n".
    "\"There were undefined references\n".
    "\"Citation %.%# undefined\n".
    "\"LaTeX Font Warning: Font shape `%s' undefined\n".
    "\"LaTeX Font Warning: Some font shapes were not available, defaults substituted."
"augroup MyIMAPs
  "au!
  "au VimEnter * call IMAP('FMB', '\mathbf{}', 'tex')
  "au VimEnter * call IMAP('FBM', '\bm{}<++>', 'tex')
  "au VimEnter * call IMAP('FBB', '\mathbb{<++>}<++>', 'tex')
  "au VimEnter * call IMAP('ECA', '\begin{cases} ^M \case <++> ^M \end{cases}<++>', 'tex')
"augroup END

"**********************************
"indent-guides
"**********************************
"change to indent -line bcause indent line have better looks than indent guides
"let g:indent_guides_color_change_percent = 10
"let g:indent_guides_guide_size = 1
"let g:indent_guides_enable_on_vim_startup = 1
"nmap <silent> <Leader>ig <Plug>IndentGuidesToggle

"**********************************
"indent-line
"**********************************
"**********************************
"help 
"**********************************
"cnoremap help :<C-u>vertical topleft help<Space>
augroup helpgroup
  autocmd!
augroup END
autocmd helpgroup FileType help nnoremap <buffer> q <C-w>c
set keywordprg=:help " Open Vim internal help by K command
set helplang=ja
"nnoremap <Space>t :<C-u>tab help<Space>
"nnoremap <Space>v :<C-u>vertical belowright help<Space>
" MoveToNewTab
nnoremap <silent> tm :<C-u>call <SID>MoveToNewTab()<CR>
function! s:MoveToNewTab()
    tab split
    tabprevious
    if winnr('$') > 1
        close
    elseif bufnr('$') > 1
        buffer #
    endif
    tabnext
endfunction
"**********************************
"LOOKS
"**********************************
colorscheme molokai
syntax on
let g:molokai_original = 1
let g:rehash256 = 1 "?
set background=dark
set guifont=Ricty-Regular:h14
set number 
set cmdheight=2 "コマンドラインの高さを2行に
set cursorline
"set list 
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
"tab / indent
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
"set backspace=2		" more powerful backspacing
set imdisable "english in normal mode
set clipboard=unnamed " ヤンクなどで * レジスタにも書き込む
set modifiable
"set autochdir  "this option disenable vimshell
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
"initialization
"**********************************
set exrc "read /current_dir/.vimrc "
set secure "read for secure"
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
  "autocmd GUIEnter * <M-Right> 
  "au GUIEnter * set fullscreen
endif
augroup end

"**********************************
"character code
"**********************************
set fileencoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
"iso-2022-jp,utf-8,euc-jp,cp932
set encoding=utf-8

"**********************************
"window size
"**********************************
"nnoremap <S-Left>  <C-w><<CR>
"nnoremap <S-Right> <C-w><CR>
nnoremap <S-Up>    <C-w>+<CR>
nnoremap <S-Down>  <C-w>-<CR>
" Ctrl + hjkl でウィンドウ間を移動
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

"**********************************
"tab BIND
"**********************************
nnoremap    [tab]   <Nop>
nmap    t [tab]
map <silent> [tab]n :tablast <bar> tabnew<CR>
map <silent> [tab]x :tabclose<CR>

"**********************************
"KEY BIND
"**********************************
let mapleader = ","
if has('macunix')
  let mapleader = ","
endif
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
"nnoremap <Space>/  *
"jump
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
"help
nnoremap <C-h>      :<C-u>help<Space>

"copy and paste 
"カーソル位置以降の単語の文字列ととヤンクした文字列を置換
noremap <silent> cy ce<c-r>0<ESC>:let@/ = @1<CR>:noh<CR>
noremap <silent> ciy ciw<c-r>0<ESC>:let@/ = @1<CR>:noh<CR>
"command history
"nnoremap qqq <ESC>q:
"nnoremap <leader>h <ESC>q:
"nnoremap q: <NOP>
"nnoremap q/ <NOP>
"nnoremap q? <NOP>
"noremap <Space>h  ^
"noremap <Space>l  $
"nnoremap <Space>/  *
"incertmode
inoremap jj <ESC>
"inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
inoremap <C-l> <Right>
"nnoremap q :<C-u>q<CR>
"quickfix
map <F10> :cprevious<Return>
map <F11> :cnext<Return>

"**********************************
"snippet
"**********************************
"java
abbreviate println System.out.println(
abbreviate main public static void main(String[] args){

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
" ### Folding ### {{{
" 折りたたみを示す列を表示
"set foldcolumn=1
" 最初に折りたたみをなるべく開く
"set foldlevel=99
" デフォルトの折りたたみ方法
"set foldmethod=marker
"set foldmethod = indent
" 折りたたまれたテキストの表示方法
"set foldtext=MyFoldText()
"FoldCCtext()
" }}}
highlight Folded guibg=grey guifg=blue
"highlight FoldColumn guibg=darkgrey guifg=white

"" オリジナル foldtext
"function! MyFoldText()
  "let line = getline(v:foldstart)
  "let marker_removed = substitute(line, '{{{', '', 'g') " }}}
  "let line_count = v:foldend - v:foldstart
  "let lines = line_count > 1 ? ' lines' : ' line'
  "let count_in_brace = substitute(marker_removed, '{\s*$', '{ ('.line_count.lines.') }', '')
  "return count_in_brace
"endfunction
"fold marker {{{ }}}

"**********************************
"write vimrc when save
"**********************************
augroup ReadVimrc
    autocmd!
    autocmd BufWritePost .vimrc source ~/.vimrc
augroup END



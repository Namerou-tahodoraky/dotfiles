set relativenumber
set number
set fileencodings=utf-8,cp932
filetype on
filetype plugin indent on

let mapleader = ","

" if exists('$TMUX')
"   " 挿入モードに入る時，前回の挿入モードにおける IME の状態を復元する．
"   let &t_SI .= "\ePtmux;\e\e[<r\e\e[6 q\e\\"
"   " 挿入モードを出る時，現在の IME の状態を保存し，IME をオフにする．
"   let &t_EI .= "\ePtmux;\e\e[<s\e\e[<0t\e\e[2 q\e\\"
"   " Vim 終了時，IME を無効にし，無効にした状態を保存する．
"   let &t_te .= "\ePtmux;\e\e[<0t\e\e[<s\e\e[4 q\e\\"
" " elseif &term =~ 'xterm'
" else
"   " 挿入モードに入る時，前回の挿入モードにおける IME の状態を復元する．
"   let &t_SI .= "\e[<r"
"   " 挿入モードを出る時，現在の IME の状態を保存し，IME をオフにする．
"   let &t_EI .= "\e[<s\e[<0t"
"   " Vim 終了時，IME を無効にし，無効にした状態を保存する．
"   let &t_te .= "\e[<0t\e[<s"
"   " set t_te+=\e[<0t\e[<s
" 
"   " 挿入モード時に非点滅の縦棒タイプのカーソル
"   let &t_SI .= "\e[6 q"
"   " ノーマルモード時に非点滅のブロックタイプのカーソル
"   let &t_EI .= "\e[2 q"
"   " 置換モード時に非点滅の下線タイプのカーソル
"   let &t_SR .= "\e[4 q"
" 
"   let &t_SI .= "\e[?7727h"
"   let &t_EI .= "\e[?7727l"
"   inoremap <special> <Esc>0[ <Esc>
" endif

" ESC キーを押してから挿入モードを出るまでの時間を短くする
" set ttimeoutlen=100
set timeoutlen=100
""
""""" FOR SEARCH
""set hlsearch
""set incsearch
""set ignorecase
""set smartcase
""set wrapscan
""nnoremap <Esc><Esc> :nohlsearch<CR>
""nnoremap n nzz
""nnoremap N Nzz
""nnoremap * *zz
""nnoremap # #zz
""nnoremap g* g*zz
""nnoremap g# g#zz
""
""""""" FOR WINDOWS
""""set shellslash
""
""""" FOR VISUALIZE CHAR
""syntax enable
""set showmatch matchtime=1
""set matchpairs& matchpairs+=<:>
""""""set list listchars=tab:\▸\-,trail:\▸
""set list listchars=tab:\+\-,trail:\+
""set wrap
""set display=lastline
""set foldmethod=indent
""set foldlevel=100
""set foldcolumn=1
"""au BufWinLeave * mkview
"""au BufWinEnter * silent loadview
"""" FOR CURSOL
""set nocursorline
"""set cursorline
""set ambiwidth=double
""
"""""" FOR STATUS BAR
"""set laststatus=2
"""set wildmenu
"""set wildmode=list:longest
"""set showcmd
"""set cmdheight=2
"""set statusline=%F
"""set statusline+=[%Y]
"""set statusline+=%r
"""set statusline+=%h
"""set statusline+=%w
"""set statusline+=%=
"""set statusline+=[LOW=%l/%L]
"""set statusline+=[ENC=%{&fileencoding}]
""
""""" FOR INSERT MODE
""set backspace=indent,eol,start
""set textwidth=0
""
""""" FOR VIRTUAL MODE
""set virtualedit=block
""
""""" FOR NUMERIC
""set nrformats=
""
"""" FOR TAB INDENT
set smartindent
"set cindent
"set cinoptions=:0,p0,t0
set expandtab
set shiftwidth=4
set tabstop=8
set softtabstop=4
"set cinwords=if,else,then,while,for,do,switch,case
""
""
""""" FOR SWAP,BACUUP,UNDO
"""set backup
"""set backupdir=~/.vim/backup/
""set nowritebackup
"""set swapfile
"""set directory=~/.vim/backup/
""set noswapfile
""set noundofile
""
""" FOR FILE OPEN
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif
""
""""" FOR COLOR
colorscheme desert
"""hi Comment ctermfg=3
""
""""""" FOR GUI
""""set guioptions-=T
""""set guioptions-=m
""""set guioptions+=a
""""set clipboard=unnamed,autoselect
""
""
""" FOR AUTO INSERT
noremap <S-h> ^
noremap <S-l> $
inoremap { {}<Left>
"inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap ( ()<ESC>i
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
"inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
inoremap " ""<LEFT>
inoremap <C-j>  <down>
inoremap <C-k>  <up>
inoremap <C-h>  <left>
inoremap <C-l>  <right>
inoremap <C-o>  <ESC>o
inoremap <C-x>  <Del>
inoremap <C-d>  <BS>
""
""""" FOR NETWORK.VIM
""let g:netrw_liststyle = 3
""let g:netrw_banner = 0
""let g:netrw_altv = 1
""""let g:netrw_alto = 1
""""let g:netrw_winsize = 25
""
""""""" FOR PYTHON
""""""autocmd FileType python setl autoindent
""""autocmd FileType python setl cinwords=if,elif,else,for,while,try,except,finally,def,class
""""autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType python setl tabstop=4 shiftwidth=4 softtabstop=4 expandtab
""""
""""
""""""" FOR SHELLSCRIPT
""""""autocmd FileType python setl autoindent
""""autocmd FileType sh setl cinwords=if,elif,else,do,function
""""autocmd FileType sh setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
""
set hidden
if has('nvim')
  command! -nargs=* Ts split | terminal <args>
  command! -nargs=* Tv vsplit | terminal <args>
endif
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" ターミナルウィンドウに移動したら自動的にターミナルノーマルモードにする
if has('nvim')
  " Neovim 用
   autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
else
  " Vim 用
  autocmd WinEnter * if &buftype ==# 'terminal' | normal i | endif 
endif


""dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

"# dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.cache/dein')

"# dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

"dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  
  "# dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.config/nvim/dein')
  
  "# 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  
  "# 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir .  '/dein_lazy.toml', {'lazy': 1})
  
  call dein#end()
  call dein#save_state()
endif

"filetype plugin indent on
"syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
""End dein Scripts-------------------------

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/vim-lsp.log')

let s:pyls_config = {'pyls': {'plugins': {
  \   'autopep8': {
  \     'enabled': v:true,
  \   },
  \   'pycodestyle': {'enabled': v:false},
  \   'pydocstyle': {'enabled': v:false},
  \   'pylint': {'enabled': v:false},
  \   'pyflakes': {'enabled': v:false},
  \   'flake8': {'enabled': v:true},
  \   'jedi_definition': {
  \     'follow_imports': v:true,
  \     'follow_builtin_imports': v:true,
  \   },
  \ }}}
""  \   'pyls_mypy': {
""  \     'enabled': v:true,
""  \     'live_mode': v:true,
""  \   },
""  \   'pyls-mypy': {
""  \     'enabled': v:true,
""  \     'live_mode': v:true,
""  \   },

""  \   'mypy-ls': {
""  \     'enabled': v:true,
""  \     'live_mode': v:true,
""  \   },

""pylsの起動定義
augroup LspPython
  autocmd!
  autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': { server_info -> ['pyls'] },
    \ 'whitelist': ['python'],
    \ 'workspace_config': s:pyls_config
    \})
augroup END

" " let s:pyls_path = fnamemodify(g:python_host_prog, ':h') . '/'. 'pyls'
" let s:pyls_path = "~/.local/bin/pyls"
" augroup LspPython
"   autocmd!
"   autocmd User lsp_setup call lsp#register_server({
"     \ 'name': 'pyls',
"     \ 'cmd': { server_info -> [expand(s:pyls_path)] },
"     \ 'whitelist': ['python'],
"     \ 'workspace_config': s:pyls_config
"     \})
" augroup END


function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"

  "定義情報のホバー表示
  nnoremap <buffer> K :<C-u>LspHover<CR>
  "参照検索
  nnoremap <buffer> gr :<C-u>LspReferences<CR>
  "Lint結果をQuickFixで表示
  nnoremap <buffer> gl :<C-u>LspDocumentDiagnostics<CR>
  "テキスト整形
  nnoremap <buffer> gf :<C-u>LspDocumentFormat<CR>
endfunction

" vim-lspの各種オプション設定
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 400
let g:lsp_text_edit_enabled = 1

" " Pipfile自動探索
" function! s:findRoot(target)
"   let dir = getcwd()
"   while 1
"     let files = split(globpath(l:dir, '*'), '\n')
"     for f in l:files
"       if a:target == fnamemodify(f, ':t')
"         return l:dir
"       endif
"     endfor
"     if l:dir == "/"
"       break
"     endif
"     let dir = fnamemodify(l:dir, ':h')
"   endwhile
"   return ""
" endfunction
" 
" " Pipfileのあるディレクトリの.venvからライブラリ読み込み
" function! s:setVenv()
"   let dir = s:findRoot('Pipfile')
"   echo l:dir
"   if dir != ""
"     let $VIRTUAL_ENV = trim(system("cd " . l:dir . "; pipenv --venv"))
"   endif
" endfunction
" autocmd FileType python call s:setVenv()

"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')

let g:vista_sidebar_width = 40
let g:vista_echo_cursor = 0

" デフォルトの情報ソースをctagsにする
let g:vista_default_executive = 'ctags'
" 特定の言語の場合vim-lspを利用した情報ソースを利用するようにする
let g:vista_executive_for = {
  \ 'python': 'vim_lsp',
  \ }

" トグル(アウトラインを非表示の場合は表示、表示済みの場合は非表示に)
nnoremap <silent> <Leader>o :<C-u>Vista!!<CR>

""let g:lightline = {
""    \ 'active': {
""    \   'left':  [ ['mode', 'paste'], ['readonly', 'myfilename', 'method', 'modified'], ],
""    \   'right': [ [ 'lineinfo' ], [ 'percent' ], ['char_code', 'fileformat', 'fileencoding', 'filetype' ], ],
""    \ },
""    \ 'component_function': {
""    \   'myfilename': 'LightlineFilename',
""    \   'method': 'NearestMethodOrFunction',
""    \ },
""    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
""    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
""    \ }
""
""function! LightlineFilename()
""  let l:p = expand('%:t')
""  if '' !=# l:p
""    return l:p
""  endif
""  return '[No Name]'
""endfunction
""
""function! NearestMethodOrFunction() abort
""  let l:func_name = get(b:, 'vista_nearest_method_or_function', '')
""  if l:func_name != ''
""    return '| ' . l:func_name
""  endif
""  return ''
""endfunction
""
""augroup LightLineOnVista
""  autocmd!
""  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
""augroup END

" inoremap <ESC> <ESC>:set iminsert=0<CR>

""" vim-gitgutter設定
"#更新時間
set updatetime=100
"#記号列の背景色設定(defaultは灰色だけど色なしに変更)
highlight! link SignColumn LineNr
"#記号の色
highlight GitGutterAdd ctermfg=white ctermbg=green
highlight GitGutterChange ctermfg=white ctermbg=172
highlight GitGutterDelete ctermfg=white ctermbg=red
highlight GitGutterChangDelete ctermfg=white ctermbg=red
"#表示する記号
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = '~-'


set statusline=%{anzu#search_status()}
highlight Search ctermfg=white ctermbg=green
nnoremap <Esc><Esc> :nohlsearch<CR>

""let g:python3_host_prog = '/home/kazu-0918/.pyenv/shims/python'

" 挿入モードに入る時，前回の挿入モードにおける IME の状態を復元する．
set t_SI+=^[[<r

" 挿入モードを出る時，現在の IME の状態を保存し，IME をオフにする．
set t_EI+=^[[<s^[[<0t

" Vim 終了時，IME を無効にし，無効にした状態を保存する．
set t_te+=^[[<0t^[[<s

" ESC キーを押してから挿入モードを出るまでの時間を短くする
set timeoutlen=100


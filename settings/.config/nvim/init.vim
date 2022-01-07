set relativenumber
set number
set fileencodings=utf-8,cp932
filetype on
filetype plugin indent on

let mapleader = ","


" ESC キーを押してから挿入モードを出るまでの時間を短くする
set timeoutlen=100
"""" FOR TAB INDENT
set smartindent
set expandtab
set shiftwidth=4
set tabstop=8
set softtabstop=4

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

" """"" FOR COLOR
" colorscheme desert

""" FOR AUTO INSERT
noremap <S-h> ^
noremap <S-l> $
inoremap { {}<Left>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
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

""""" FOR NETWORK.VIM
""let g:netrw_liststyle = 3
""let g:netrw_banner = 0
""let g:netrw_altv = 1
""""let g:netrw_alto = 1
""""let g:netrw_winsize = 25

""""""" FOR PYTHON
autocmd FileType python setl tabstop=4 shiftwidth=4 softtabstop=4 expandtab


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
  
  call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate'})
  call dein#add('altercation/vim-colors-solarized')

  call dein#end()
  call dein#save_state()
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = {},
  },
}
EOF

syntax enable
set background=dark
colorscheme solarized





" " If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif
""End dein Scripts-------------------------


" augroup lsp_install
"   au!
"   autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
" augroup END
" command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/vim-lsp.log')
" 
" let s:pyls_config = {'pyls': {'plugins': {
"   \   'autopep8': {
"   \     'enabled': v:true,
"   \   },
"   \   'pycodestyle': {'enabled': v:false},
"   \   'pydocstyle': {'enabled': v:false},
"   \   'pylint': {'enabled': v:false},
"   \   'pyflakes': {'enabled': v:false},
"   \   'flake8': {'enabled': v:true},
"   \   'jedi_definition': {
"   \     'follow_imports': v:true,
"   \     'follow_builtin_imports': v:true,
"   \   },
"   \ }}}
" 
" ""pylsの起動定義
" augroup LspPython
"   autocmd!
"   autocmd User lsp_setup call lsp#register_server({
"     \ 'name': 'pyls',
"     \ 'cmd': { server_info -> ['pyls'] },
"     \ 'whitelist': ['python'],
"     \ 'workspace_config': s:pyls_config
"     \})
" augroup END
" 
" function! s:on_lsp_buffer_enabled() abort
"   setlocal omnifunc=lsp#complete
"   setlocal signcolumn=yes
"   nmap <buffer> gd <plug>(lsp-definition)
"   nmap <buffer> <f2> <plug>(lsp-rename)
"   inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
" 
"   "定義情報のホバー表示
"   nnoremap <buffer> K :<C-u>LspHover<CR>
"   "参照検索
"   nnoremap <buffer> gr :<C-u>LspReferences<CR>
"   "Lint結果をQuickFixで表示
"   nnoremap <buffer> gl :<C-u>LspDocumentDiagnostics<CR>
"   "テキスト整形
"   nnoremap <buffer> gf :<C-u>LspDocumentFormat<CR>
" endfunction
" 
" " vim-lspの各種オプション設定
" let g:lsp_diagnostics_highlights_enabled = 0
" let g:lsp_diagnostics_enabled = 1
" let g:lsp_diagnostics_echo_cursor = 1
" let g:lsp_virtual_text_enabled = 1
" let g:asyncomplete_auto_popup = 1
" let g:asyncomplete_auto_completeopt = 0
" let g:asyncomplete_popup_delay = 400
" let g:lsp_text_edit_enabled = 1

let g:python3_host_prog = expand("~/.cache/nvim/.venv/bin/python")
let $PATH = expand("~/.cache/nvim/.venv/bin/") . ':' . $PATH

let mapleader = "\<space>"

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
  call dein#load_toml(s:toml_dir . '/common.dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/nvim.dein.toml', {'lazy': 0})
  
  "# 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir .  '/nvim.dein_lazy.toml', {'lazy': 1})

  "call dein#add('w0ng/vim-hybrid')

  call dein#end()
  call dein#save_state()
endif

" tomlに書くとキャッシュが変更される度に壊れてうまくいかないのでこちらに書く.
" set background=dark
" colorscheme tokyonight
colorscheme iceberg
" colorschemeを読み込んだ後に定義する
syntax enable


if filereadable(expand('~/.config/nvim/common.vim'))
  source ~/.config/nvim/common.vim
endif

" yank時に一瞬ハイライトする
" vimの場合は以下のプラグインを導入すれば可能
" https://jdhao.github.io/2020/05/22/highlight_yank_region_nvim/
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
augroup END


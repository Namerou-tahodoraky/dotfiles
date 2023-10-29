
let mapleader = "\<space>"

" ペースト時の自動改行無効
" set paste
autocmd InsertLeave * set nopaste

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
  
  ""# 遅延読み込みしたいプラグイン群
  "call dein#load_toml(s:toml_dir .  '/dein_lazy.toml', {'lazy': 1})

  "call dein#add('w0ng/vim-hybrid')

  call dein#end()
  call dein#save_state()
endif


""""" FOR COLOR
colorscheme desert

if filereadable(expand('~/.config/nvim/common.vim'))
  source ~/.config/nvim/common.vim
endif


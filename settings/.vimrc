set relativenumber
set number
set fileencodings=utf-8,cp932
filetype on
filetype plugin indent on

""" FOR SEARCH
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
nnoremap <Esc><Esc> :nohlsearch<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

""" FOR WINDOWS
set shellslash

""" FOR VISUALIZE CHAR
syntax enable
set showmatch matchtime=1
set matchpairs& matchpairs+=<:>
""""set list listchars=tab:\▸\-,trail:\▸
set list listchars=tab:\+\-,trail:\+
set wrap
set display=lastline
set foldmethod=indent
set foldlevel=100
" set foldcolumn=1
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
"" FOR CURSOL
set nocursorline
"set cursorline
set ambiwidth=double

""" FOR STATUS BAR
set laststatus=2
set wildmenu
set wildmode=list:longest
set showcmd
set cmdheight=2
set statusline=%F
set statusline+=[%Y]
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=%=
set statusline+=[LOW=%l/%L]
let ff_table = {'dos' : 'CR+LF', 'unix' : 'LF', 'mac' : 'CR' }
set statusline+=[%{ff_table[&ff]}]
set statusline+=[%{&fileencoding}]

""" FOR INSERT MODE
set backspace=indent,eol,start
set textwidth=0

""" FOR VIRTUAL MODE
set virtualedit=block

""" FOR NUMERIC
set nrformats=

"""" FOR TAB INDENT
set smartindent
"set cindent
"set cinoptions=:0,p0,t0
set expandtab
set shiftwidth=4
set tabstop=8
set softtabstop=4
"set cinwords=if,else,then,while,for,do,switch,case


""" FOR SWAP,BACUUP,UNDO
"set backup
"set backupdir=~/.vim/backup/
set nowritebackup
"set swapfile
"set directory=~/.vim/backup/
set noswapfile
set noundofile

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

""" FOR COLOR
colorscheme desert
"hi Comment ctermfg=3

""" FOR GUI
set guioptions-=T
set guioptions-=m
set guioptions+=a
set clipboard=unnamed,autoselect


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

""" FOR NETWORK.VIM
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_altv = 1
""let g:netrw_alto = 1
""let g:netrw_winsize = 25

""" FOR PYTHON
""autocmd FileType python setl autoindent
autocmd FileType python setl cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4


""" FOR SHELLSCRIPT
""autocmd FileType python setl autoindent
autocmd FileType sh setl cinwords=if,elif,else,do,function
autocmd FileType sh setl tabstop=8 expandtab shiftwidth=2 softtabstop=2

""" FOR YAML
autocmd FileType yaml setl tabstop=8 expandtab shiftwidth=2 softtabstop=2


" ペースト時に自動インデントが入らないようにする
if has("patch-8.0.0238")
    " Bracketed Paste Mode対応バージョン(8.0.0238以降)では、特に設定しない
    " 場合はTERMがxtermの時のみBracketed Paste Modeが使われる。
    " tmux利用時はTERMがscreenなので、Bracketed Paste Modeを利用するには
    " 以下の設定が必要となる。
    if &term =~ "screen"
        let &t_BE = "\e[?2004h"
        let &t_BD = "\e[?2004l"
        exec "set t_PS=\e[200~"
        exec "set t_PE=\e[201~"
    endif
else
    " 8.0.0210 ～ 8.0.0237 ではVim本体でのBracketed Paste Mode対応の挙動が
    " 望ましくない(自動インデントが無効にならない)ので、Vim本体側での対応を
    " 無効にする。
    if has("patch-8.0.0210")
        set t_BE=
    endif

    " Vim本体がBracketed Paste Modeに対応していない時の為の設定。
    if &term =~ "xterm" || &term =~ "screen"
        let &t_ti .= "\e[?2004h"
        let &t_te .= "\e[?2004l"

        function XTermPasteBegin(ret)
            set pastetoggle=<Esc>[201~
            set paste
            return a:ret
        endfunction

        noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
        inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
        vnoremap <special> <expr> <Esc>[200~ XTermPasteBegin("c")
        cnoremap <special> <Esc>[200~ <nop>
        cnoremap <special> <Esc>[201~ <nop>
    endif
endif

" インサートモードを抜けた際にIMEを自動無効する
if exists('$TMUX')
  " 挿入モードに入る時，前回の挿入モードにおける IME の状態を復元する．
  let &t_SI .= "\ePtmux;\e\e[<r\e\e[6 q\e\\"
  " " 挿入モードを出る時，現在の IME の状態を保存し，IME をオフにする．
  " let &t_EI .= "\ePtmux;\e\e[<s\e\e[<0t\e\e[2 q\e\\"
  " 挿入モードを出る時，現在の IME の状態を保存せず，IME をオフにする．
  let &t_EI .= "\ePtmux;\e\e[<0t\e\e[2 q\e\\"
  " Vim 終了時，IME を無効にし，無効にした状態を保存する．
  let &t_te .= "\ePtmux;\e\e[<0t\e\e[<s\e\e[4 q\e\\"
else
  " 挿入モードに入る時，前回の挿入モードにおける IME の状態を復元する．
  let &t_SI .= "\e[<r"
  " " 挿入モードを出る時，現在の IME の状態を保存し，IME をオフにする．
  " let &t_EI .= "\e[<s\e[<0t"
  " 挿入モードを出る時，現在の IME の状態を保存せず，IME をオフにする．
  let &t_EI .= "\e[<0t"
  " Vim 終了時，IME を無効にし，無効にした状態を保存する．
  let &t_te .= "\e[<0t\e[<s"

  " 挿入モード時に非点滅の縦棒タイプのカーソル
  let &t_SI .= "\e[6 q"
  " ノーマルモード時に非点滅のブロックタイプのカーソル
  let &t_EI .= "\e[2 q"
  " 置換モード時に非点滅の下線タイプのカーソル
  let &t_SR .= "\e[4 q"

  " xterm 等の端末エミュレータで挿入モードでの ESC キーを押した後の待ちを無くす
  let &t_SI .= "\e[?7727h"
  let &t_EI .= "\e[?7727l"
  inoremap <special> <Esc>0[ <Esc>
endif

" ESC キーを押してから挿入モードを出るまでの時間を短くする
set timeoutlen=100

"""dein Scripts-----------------------------
""if &compatible
""  set nocompatible               " Be iMproved
""endif
""
""" Required:
""set runtimepath+=C:\Users\kazu-\.cache\dein\repos\github.com\Shougo\dein.vim
""
""" Required:
""if dein#load_state('C:\Users\kazu-\.cache\dein')
""  call dein#begin('C:\Users\kazu-\.cache\dein')
""
""  " Let dein manage dein
""  " Required:
""  call
""  dein#add('C:\Users\kazu-\.cache\dein\repos\github.com\Shougo\dein.vim')
""
""  " Add or remove your plugins here like this:
""  "call dein#add('Shougo/neosnippet.vim')
""  "call dein#add('Shougo/neosnippet-snippets')
""
""  " Required:
""  call dein#end()
""  call dein#save_state()
""endif
""
""" Required:
""filetype plugin indent on
""syntax enable
""
""" If you want to install not installed plugins on
""startup.
"""if dein#check_install()
"""  call dein#install()
"""endif
""
"""End dein Scripts-------------------------"

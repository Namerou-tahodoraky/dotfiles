" set relativenumber
set number
set fileencodings=utf-8,cp932
filetype on
filetype plugin indent on

"" 何故か効かない.(:echo mapleaderによってスペースが設定されていることは確認できるが、
"" 実際にスペースを押すと1文字移動の挙動となる.
""let g:mapleader = "\<space>"

" let g:lexima_enable_newline_rules = 0

" ESC キーを押してから挿入モードを出るまでの時間を短くする
set timeoutlen=500

"""" FOR TAB INDENT
set smartindent
set expandtab
set shiftwidth=4
set tabstop=8
set softtabstop=4

""""" FOR SEARCH
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
nnoremap <Esc><Esc> :nohlsearch<CR>
" nnoremap n nzz
" nnoremap N Nzz
" nnoremap * *zz
" nnoremap # #zz
" nnoremap g* g*zz
" nnoremap g# g#zz

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


""" FOR AUTO INSERT
noremap <S-h> ^
noremap <S-l> $
" inoremap { {}<Left>
" inoremap ( ()<LEFT>
" inoremap [ []<LEFT>
" inoremap ' ''<LEFT>
" inoremap " ""<LEFT>
" inoremap " ""<LEFT>
inoremap <C-h>  <left>
inoremap <C-l>  <right>
inoremap <C-o>  <ESC>o
inoremap <C-x>  <Del>
inoremap <C-d>  <BS>

inoremap <silent> jj <ESC>

""""" FOR NETWORK.VIM
""let g:netrw_liststyle = 3
""let g:netrw_banner = 0
""let g:netrw_altv = 1
""""let g:netrw_alto = 1
""""let g:netrw_winsize = 25

""""""" FOR PYTHON
autocmd FileType python setl tabstop=4 shiftwidth=4 softtabstop=4 expandtab


" 初期状態はcursorlineを表示しない
" 以下の一行は必ずcolorschemeの設定後に追加すること
hi clear CursorLine

" 'cursorline' を必要な時にだけ有効にする
" http://d.hatena.ne.jp/thinca/20090530/1243615055
" を少し改造、number の highlight は常に有効にする
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
  autocmd WinEnter * call s:auto_cursorline('WinEnter')
  autocmd WinLeave * call s:auto_cursorline('WinLeave')

  setlocal cursorline
  hi clear CursorLine

  let s:cursorline_lock = 0
  function! s:auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      hi CursorLine term=underline cterm=underline guibg=Grey30 " ADD
      let s:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
      hi clear CursorLine " ADD
    elseif a:event ==# 'CursorMoved'
      if s:cursorline_lock
        if 1 < s:cursorline_lock
          let s:cursorline_lock = 1
        else
          " setlocal nocursorline
          hi clear CursorLine " ADD
          let s:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      " setlocal cursorline
      hi CursorLine term=underline cterm=underline guibg=Grey30 " ADD
      let s:cursorline_lock = 1
    endif
  endfunction
augroup END


" 行末の空白のハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=#6495ed ctermbg=222
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

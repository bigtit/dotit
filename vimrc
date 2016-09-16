set nocompatible
set backspace=2
set fileformat=unix
colorscheme molokai
set encoding=utf-8
set fenc=utf-8
set guifont=Consolas:h10:cANSI
set gfw=Consolas:h10:cANSI
set ambiwidth=double
"indent settings
set cin
set si
set shiftwidth=2
set tabstop=2
set expandtab
filetype plugin indent on
set nu
set mouse=a
set ruler
set incsearch
set hlsearch
set hidden
set autochdir
set fdm=syntax
set foldlevel=100
set laststatus=2
set showmatch
set cursorline
"set nowrap
set writebackup
set nobackup
set history=50
set list
set listchars=tab:..,eol:$
syntax enable
syntax on
au BufRead,BufNewFile *.c,*.h,*.coffee,*.php,*.rb,*.js,*.node,*.sh,*.vim,*.css 2match Underlined /.\%81v/
if has("gui_running")
  set lines=35 columns=120
  "set guioptions-=m
  set guioptions-=T
  "set guioptions-=L
  "set guioptions-=r
  "set guioptions-=b
  "set showtabline=0
endif

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf
" auto complete
" insert mode only
" tags
inoremap <C-]> <C-X><C-]>
" filename
inoremap <C-F> <C-X><C-F>
" macro
inoremap <C-D> <C-X><C-D>
" header file
inoremap <C-I> <C-X><C-I>
" auto complete
" insert mode only
" tags
inoremap <C-]> <C-X><C-]>
" filename
inoremap <C-F> <C-X><C-F>
" macro
inoremap <C-D> <C-X><C-D>
" header file
inoremap <C-I> <C-X><C-I>

" esc
inoremap jk <esc>
inoremap <esc> <nop>
vnoremap jk <esc>
" arrows
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" highlight search off
nnoremap <esc><esc> <esc>:nohl<cr><esc>
vnoremap <esc><esc> <esc>:nohl<cr><esc>

"set nocompatible
"filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

"Plugin 'gmarik/Vundle.vim'
"Plugin 'dyng/ctrlsf.vim'
"Plugin 'octol/vim-cpp-enhanced-highlight'

"call vundle#end()
"filetype plugin indent on

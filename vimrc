" User vimrc.before if available {{{
    if filereadable(expand("~/.vimrc.before"))
        source ~/.vimrc.before
    endif
" }}}

" redefine leader key
let mapleader = ','

" Sets how many lines of history VIM har to remember
set history=5000

set modeline

" Enable filetype plugin
set completeopt=longest,menu

" enable fold {{{
    autocmd FileType lua,go,c,cpp setlocal foldmethod=syntax
    autocmd FileType python       setlocal foldmethod=indent
    autocmd FileType vim          setlocal foldmethod=marker
    set foldlevel=1
    set foldlevelstart=99
" }}}

" Set to auto read when a file is changed from the outside
set autoread
" set autochdir

" Have the mouse enabled all the time:
set mouse=a

set modifiable

" Enable syntax
syntax enable

" guioptions {{{
    if has('gui_running')
        set guioptions-=m
        set guioptions-=T
        set guioptions-=L
        set guioptions-=r
        set guioptions-=b
    endif
" }}}

" Navigation between split windows {{{
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-h> <C-w>h
    nnoremap <C-l> <C-w>l
" }}}

" Mapping for tab management {{{
    nnoremap <Leader>tc :tabc<CR>
    nnoremap <Leader>tn :tabn<CR>
    nnoremap <Leader>tp :tabp<CR>
    nnoremap <Leader>te :tabe<CR>
" }}}

" Reselect visual block after indent/outdent {{{
    vnoremap < <gv
    vnoremap > >gv
" }}}

" Improve up/down movement on wrapped lines {{{
    nnoremap j gj
    nnoremap k gk
" }}}

set nowrap

" Clear search highlight
nnoremap <silent><Leader>/ :nohls<CR>

" Keep search pattern at the center of the screen {{{
    nnoremap <silent>n nzz
    nnoremap <silent>N Nzz
    nnoremap <silent>* *zz
    nnoremap <silent># #zz
    nnoremap <silent>g* g*zz
" }}}

" Force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap <silent><Leader><Space> :StripTrailingWhitespaces<CR>

" Stolen from Steve Losh vimrc: https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
" Open a Quickfix window for the last search.
nnoremap <silent> <leader>q/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" make ctrl-] center {{{
    nnoremap <C-]> <C-]>zz
" }}}

" Favorite filetypes
set ffs=unix,dos,mac
" Always show current position
set ruler

" The commandbar is 2 high
set cmdheight=2

" Show line number
set nu

" Ignore case when searching
set ignorecase
set incsearch

" Set magic on
set magic

" No sound on errors.
set noerrorbells
set novisualbell
set vb t_vb=

" show matching bracets
set showmatch
set showfulltag

" How many tenths of a second to blink
set mat=2

" Highlight search things
set hlsearch
set incsearch

set cursorline

set showcmd

set cmdheight=1
set laststatus=2

" Turn on wild menu, try typing :h and press <Tab>
set wildmenu
" Display incomplete commands
set showcmd
" Shortens messages to avoid 'press a key' prompt
set shortmess=aoOtTI

" Turn backup off
set nobackup
set nowb
set noswapfile

set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" auto add header for new python file
function! s:PythonHeader()
    normal i#! /usr/bin/env python
    normal o# -*- coding:utf-8 -*-
    put o
endfunction

autocmd BufNewFile *.py call s:PythonHeader()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start

set smarttab
set lbr
set tw=800

set smartindent
set autoindent

" NeoBundle
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

let bundle_readme = expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(bundle_readme)
    echo 'Instaling NeoBundle...'
    echo ''
    silent !mkdir -p ~/.vim/bundle/
    silent !git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
endif
unlet bundle_readme

if has('vim_starting')
    if &compatible
        set nocompatible
        filetype off
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

for fpath in split(globpath("~/.vim/vundles", "*.vim"), "\n")
    execute 'source' fpath
endfor

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" coloscheme
if has("gui_running")
    set background=dark
    set guifont=Monaco\ for\ Powerline:h13
end
silent! colorscheme molokai

" Auto close {{{
    inoremap <C-c> <CR>}<Esc>O
" }}}


hi Visual term=reverse cterm=reverse guibg=Grey

" User vimrc.after if available {{{
    if filereadable(expand("~/.vimrc.after"))
        source ~/.vimrc.after
    endif
" }}}

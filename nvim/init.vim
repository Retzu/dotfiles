" vim: foldmethod=marker
" Basic options ----------------------------------- {{{
syntax on
filetype on

" Turn off backup files
set nobackup
set noswapfile

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4
set expandtab

filetype indent on  " Choose indent for filetype

set list  " Display whitespace characters
set splitbelow  " `:split`s appear below
set splitright  " `:vsplit`s appear right

set title  " Set the window title to filename

set relativenumber  " Show line numbers relative to current line number for quicker jumping

set nofoldenable  " Don't automatically fold everything when opening a file
" }}}

" Set automatic case sensitive search
" /test - case insensitive
" /Test - case sensitive
set smartcase

" Leader stuff ------------------------------------ {{{
let mapleader = ","

map ,<space> :nohlsearch<CR>  " ,<space> = remove hilights from last search
" }}}

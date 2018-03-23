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

" Set automatic case sensitive search
" /test - case insensitive
" /Test - case sensitive
set smartcase

" Dark color scheme
set background=dark

" Enable mouse
set mouse=a
" }}}

" Leader stuff ------------------------------------ {{{
let mapleader = ","

nmap <silent> <leader><space> :nohlsearch<CR>  " <leader><space> = remove highlights from last search
nmap <silent> <leader>w :set wrap!<CR>  " <leader>w = toggle line wrapping
map <F2> :20Lexplore<CR>  " <leader>F2 = open explorer
" }}}

" Other keybindings ------------------------------- {{{
inoremap kj <Esc>
inoremap jk <Esc>
" }}}

" Plugins ----------------------------------------- {{{
call plug#begin('~/.config/nvim/plugged/')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'dylanaraps/wal.vim'
call plug#end()
" }}}

" Plugins options --------------------------------- {{{
" Colorscheme
colorscheme wal

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

" Bind ctrlp.vim to Ctrl+P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
" }}}

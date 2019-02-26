" vim: foldmethod=marker
" Basic options ----------------------------------- {{{
syntax on
filetype on

" Turn off backup files
set nobackup
set noswapfile

" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2
set expandtab

filetype indent on  " Choose indent for filetype

set list  " Display whitespace characters
set splitbelow  " `:split`s appear below
set splitright  " `:vsplit`s appear right

set title  " Set the window title to filename

set number  " Show line numbers

set nofoldenable  " Don't automatically fold everything when opening a file

" Set automatic case sensitive search
" /test - case insensitive
" /Test - case sensitive
set smartcase

" Enable mouse
set mouse=a
" }}}

" netrw options ----------------------------------- {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" }}}

" Leader stuff ------------------------------------ {{{
let mapleader = ","

nmap <silent> <leader><space> :nohlsearch<CR>  " <leader><space> = remove highlights from last search
nmap <silent> <leader>w :set wrap!<CR>  " <leader>w = toggle line wrapping
map <F2> :20Lexplore<CR>  " F2 = open explorer
" }}}

" Other keybindings ------------------------------- {{{
inoremap kj <Esc>
inoremap jk <Esc>
" }}}

" Plugins ----------------------------------------- {{{
call plug#begin('~/.config/nvim/plugged/')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dylanaraps/wal.vim'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'mgee/lightline-bufferline'
Plug 'tpope/vim-commentary'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
call plug#end()
" }}}

" Plugins options --------------------------------- {{{
" Colorscheme
colorscheme wal

" lightline.vim
set noshowmode
set showtabline=2
let g:lightline = { 'colorscheme': 'wal' }
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline.tabline = { 'left': [['buffers']], 'right': [['close']] }
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}

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

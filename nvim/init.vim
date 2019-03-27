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
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'maximbaz/lightline-ale'
Plug 'mgee/lightline-bufferline'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
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
let g:lightline.component_expand = {
      \  'buffers': 'lightline#bufferline#buffers',
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \}
let g:lightline.component_type = {
      \  'buffers': 'tabsel',
      \  'linter_checking': 'left',
      \  'linter_warnings': 'warning',
      \  'linter_errors': 'error',
      \  'linter_ok': 'left',
      \}
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

" Bind ctrlp.vim to Ctrl+P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ALE
let g:ale_linters = { 'python': ['flake8', 'pyls'] }
let g:ale_python_pyls_use_global = 1

" COC
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" }}}

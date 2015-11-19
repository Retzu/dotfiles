" vim: foldmethod=marker
set nocompatible

" Basic options ----------------------------------- {{{
set t_Co=256
set mouse=a
set hidden
set relativenumber
set number
set magic " for regular expressions, turn magic on
set mat=2 " How many tenths of a second to blink when matching brackets

syntax on
filetype on
au BufNewFile,BufRead *.js.twig set filetype=javasript
au BufNewFile,BufRead *.css.twig set filetype=css

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set expandtab

" Linebreak on 500 characters
set lbr
set tw=500

" Automagically choose correct indent for filetypes
filetype indent on
set nowrap "Don't wrap lines
set showmode
set ttyfast
set hidden

set list
set listchars=tab:▸\ ,extends:❯,precedes:❮
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set autowrite
set title
set linebreak
"set colorcolumn=+1

" If using GVim set the window size
if has("gui_running")
  set lines=45 columns=170
endif

" Remove GVim toolbars
set guioptions-=m
set guioptions-=T

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Leader
let mapleader = ","
let maplocalleader = "\\"

set nofoldenable

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}}

" Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.

augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" }}}

" Wildmenu completion {{{

set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib

" }}}

" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" }}}

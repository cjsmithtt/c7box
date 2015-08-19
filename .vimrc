syntax on
filetype plugin indent on
colorscheme molokai
set title
set t_Co=256
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

"always redraw statusline
"set laststatus=2
"
""tab stuff
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nocompatible
"search stuff
"set ignorecase
"set smartcase
"set incsearch
"
""easier regex handling in searches
nnoremap / /\v
vnoremap / /\v

set splitright
set cursorline
set ruler
set showcmd
set hidden
set nowrap
set scrolloff=2

set wildmenu
set wildmode=longest,list

set number

set guioptions-=m
set guioptions-=T

set pastetoggle=<F2>

let mapleader = ","
nnoremap <leader><space> :noh<cr>
nnoremap <leader>l :set invrelativenumber<cr>
nnoremap <leader>n :bnext<cr>
nnoremap <leader>p :bprev<cr>

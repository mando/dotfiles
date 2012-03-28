set nocompatible " Just say no to plain vi
syntax enable
set encoding=utf-8
filetype plugin indent on " load file type plugins and indentation

"" Whitespace
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set gdefault
nnoremap / /\v
vnoremap / /\v
nnoremap <CR><CR> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"" Handle long lines
set wrap " maybe switch to sidescroll instead of wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80
nnoremap j gj
nnoremap k gk

"" Invisibles
set list
"set listchars=tab:▸\,extends:»,precedes:«,trail:▒,nbsp:
set listchars=tab:→\ ,extends:»,precedes:«,trail:·

"" Margin line numbers
set number
set numberwidth=4

"" Disable F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Set some stuff
set scrolloff=1 " Keep 1 line of context around the cursor at all times
set autoindent " Match the next line's indent to the current line
set showmode
set showcmd
set hidden

set wildmenu
set wildmode=list:longest:full

" what files to ignore when doing filename completion, etc.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bundler and sass cache
set wildignore+=vendor/gems/*,vendor/cache/*,.bundle/*,.sass-cache/*
" Disable temp and backup files
set wildignore+=*.swp,*~,._*

set visualbell
set ttyfast
set ruler
set laststatus=2
set undofile

"" Key binding
let mapleader=","
let maplocalleader="\\"

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"" Pathogen
call pathogen#infect()
call pathogen#helptags()

"" Tcomment
vnoremap ,c :TComment<cr>
nmap ,c gcc

set background=dark
let g:solarized_termcolors=256
colorscheme railscasts

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

set noswapfile

" Basic config
set nocompatible
syntax enable
filetype off

"  VUNDLE CONFIG
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-sensible'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8

"" Whitespace
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start

" what files to ignore when doing filename completion, etc.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bundler and sass cache
set wildignore+=vendor/gems/*,vendor/cache/*,.bundle/*,.sass-cache/*
" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Make vim think files with md file extenion are markdown and not Modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

set visualbell
set ttyfast
set ruler
set laststatus=2
set undofile

"" Key binding
let mapleader=","
let maplocalleader="\\"

"" Colors
colorscheme jellybeans

"" Tcomment
vnoremap ,c :TComment<cr>
nmap ,c gcc

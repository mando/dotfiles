" Basic config
set nocompatible
syntax enable
filetype off
filetype plugin indent on

" Plug config
call plug#begin('~/.vim/plugged')

Plug 'ntpeters/vim-better-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-markdown'
Plug 'airblade/vim-gitgutter'

call plug#end()

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

"" Gotta have line numbers
set number

"" Put undofiles in /tmp
set undodir=/tmp

"" No swapfile, no cry
set noswapfile

"" Selecta config

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>

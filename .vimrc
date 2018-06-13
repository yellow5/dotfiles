runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  execute pathogen#infect()
endif

" Configure the default colorscheme
syntax enable
set t_Co=256
set background=dark
let g:gruvbox_contrast_dark = "medium"
let g:gruvbox_contrast_light = "medium"
colorscheme gruvbox

" General configuration
filetype plugin indent on
set shell=bash\ --rcfile\ ~/.bashrc
set number
set expandtab
set printoptions=duplex:off

" Default spacing
set tabstop=2
set shiftwidth=2

" Erlang spacing
augroup erlang
  au!
  au BufNewFile,BufRead *.erl setlocal tabstop=4
  au BufNewFile,BufRead *.erl setlocal shiftwidth=4
  au BufNewFile,BufRead *.hrl setlocal filetype=erlang
  au BufNewFile,BufRead relx.config setlocal filetype=erlang
augroup END

" Simple helpers
iabbrev rpry require 'pry'; binding.pry
command! -bar -range=% Trim :<line1>,<line2>s/\s\+$//e
command! EchoFile echo expand('%:p')

" Associate *.sc files with Scala
augroup scala
  au!
  au BufNewFile,BufRead *.sc setfiletype scala
augroup END

" Disable NERDTree by default
let NERDTreeHijackNetrw=0

" Airline config
let g:airline#extensions#tabline#enabled = 1

" Load ~/.vimrc.local if it's available
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

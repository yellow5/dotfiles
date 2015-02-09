runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  execute pathogen#infect()
endif

syntax enable
filetype plugin indent on

augroup vimrc
  autocmd!
  autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()
augroup END

set number
set expandtab

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

iabbrev rpry require 'pry'; binding.pry
command! -bar -range=% Trim :<line1>,<line2>s/\s\+$//e
command! EchoFile echo expand('%:p')

let NERDTreeHijackNetrw=0

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

set shell=bash\ --rcfile\ ~/.bashrc
set printoptions=duplex:off

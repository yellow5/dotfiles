runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  execute pathogen#infect()
endif

syntax on
filetype plugin indent on

augroup vimrc
  autocmd!
  autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()
augroup END

set number
set tabstop=2
set shiftwidth=2
set expandtab

iabbrev rpry require 'pry'; binding.pry
command! -bar -range=% Trim :<line1>,<line2>s/\s\+$//e

let NERDTreeHijackNetrw=0

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

set shell=bash\ --rcfile\ ~/.bashrc
set printoptions=duplex:off

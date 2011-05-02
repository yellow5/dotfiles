runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
endif

syntax on
filetype plugin indent on

augroup vimrc
  autocmd!
  autocmd GuiEnter * set guioptions-=T columns=190 lines=50 number
augroup END

set tabstop=2
set shiftwidth=2
set expandtab

let NERDTreeHijackNetrw=0

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

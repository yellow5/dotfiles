runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))
endif

syntax on
filetype plugin indent on

augroup vimrc
  autocmd!
  autocmd GuiEnter * set guifont=Inconsolata\ Medium\ 9 guioptions-=T columns=190 lines=50
  autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()
augroup END

set number
set tabstop=2
set shiftwidth=2
set expandtab

iabbrev rdebug  require 'ruby-debug'; Debugger.start; Debugger.settings[:autoeval] = 1; Debugger.settings[:autolist] = 1; debugger

let NERDTreeHijackNetrw=0

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

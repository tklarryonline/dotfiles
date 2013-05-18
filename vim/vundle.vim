" Vundle's file for VIM!!!!
" ============================================================================
" be using VImproved!
set nocompatible               
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" ----- Selected Plugins -----
" Auto close for quotes, brackets, etc.
Bundle 'Raimondi/delimitMate'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'


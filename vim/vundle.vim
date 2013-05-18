" ============================================================================
" Vundle's file for VIM!!!!
" ============================================================================
" be using VImproved!
set nocompatible               
" required!
filetype off 

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" ----- Selected Plugins -----
" Auto close for quotes, brackets, etc.
Bundle 'Raimondi/delimitMate'

" Ultimate snip!
Bundle 'SirVer/ultisnips'
" Map snippet expand
let g:UltiSnipsExpandTrigger = '<nl>'
let g:UltiSnipsJumpForwardTrigger = '<m-j>'
let g:UltiSnipsJumpBackwardTrigger = '<m-k>'
let g:UltiSnipsListSnippets = '<m-m>'

" Auto-completion with clang compatible
Bundle 'Valloric/YouCompleteMe'

" NERDtree
Bundle 'scrooloose/nerdtree'
" Auto quit NERDTree if it's the only buffer left {
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			endif
		endif
	endif
endfunction
"}

" Tagbar
Bundle 'majutsushi/tagbar'

" Auto compile for small projects
Bundle 'xuhdev/SingleCompile'

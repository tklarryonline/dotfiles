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
" Auto open NERDTree when open vim
autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
" Place the cursor directly on the file I'm intended to edit
autocmd VimEnter * wincmd w
" Auto quit NERDTree if it's the only buffer left {{{
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
"}}}

" Tagbar
Bundle 'majutsushi/tagbar'

" Auto compile for small projects
Bundle 'xuhdev/SingleCompile'

" Markdown Vim mode
Bundle 'plasticboy/vim-markdown'
" Disable folding for markdown
let g:vim_markdown_folding_disabled=1
" Enable wrapline for Markdown
augroup WrapLineInMDFile
	autocmd!
	autocmd FileType md setlocal wrap
augroup END

" Vim-Ruby
Bundle 'vim-ruby/vim-ruby'

" Vim-Rails by awesome Tpope
Bundle 'tpope/vim-rails'

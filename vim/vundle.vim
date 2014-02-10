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
"Bundle 'Valloric/YouCompleteMe'

" NERDtree
Bundle 'scrooloose/nerdtree'
" Auto open NERDTree when open vim
" On second thought, it would be better if NERDTree is not opened
" I would toggle it later
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror
" Show line-number
let g:NERDTreeShowLineNumbers=1
" Make sure the working dir is set correctly
let g:NERDTreeChDirMode=2
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

" Powerline
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" try Vim Airline
Bundle 'bling/vim-airline'
" Use powerline symbols
let g:airline_powerline_fonts = 1

" Fugitive - Git plugin for Vim
Bundle 'tpope/vim-fugitive'

" Python-mode!!!"
Bundle 'klen/python-mode'

" Auto-complete Jedi-style for Python
Bundle 'davidhalter/jedi-vim'

" Nerd commenter
Bundle 'scrooloose/nerdcommenter'

" Haml to the rescue
Bundle 'tpope/vim-haml'

" Vim-liquid
Bundle 'tpope/vim-liquid'

" HTML5 for Vim
Bundle 'othree/html5.vim'

" Some colorschemes shall we?
" I decided to use the current colorscheme in my iTerm,
" which is Solarized!!! \m/
"Bundle 'flazz/vim-colorschemes'

" Fuzzysearch FTW!
Bundle 'kien/ctrlp.vim'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let MRU_Max_Entries = 400

" Ag for awesome code searching
Bundle 'rking/ag.vim'

" Rainbow parentheses
Bundle 'kien/rainbow_parentheses.vim'
" Some options for color pairs
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
" Always have rainbow parentheses ON
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Browser reload - easier for me
Bundle "tell-k/vim-browsereload-mac"
" Returns to iTerm window
" But this only useful on multiple screen...
"let g:returnApp = "iTerm"
" Stop returnApp. Change this when you get to work on multiple screen
let g:returnAppFlag = 0

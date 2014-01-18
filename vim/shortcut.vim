" --------------------------------------------
" CUSTOM KEY BINDINGS
" --------------------------------------------

"  1 IMPORTANT -------------------------------
" Map 'jk' to <ESC>
inoremap jk <ESC>

" ';' could be used as ':'
nnoremap ; :
vnoremap ; :

" Maps <leader> from \ to ,
let mapleader=","

" C-w is super difficult to press, so make it <leader>w
nmap <leader>w <c-w>

" Make C-space usable
imap <Nul> <C-Space>

"  2 MOVING AROUND, SEARCHING AND PATTERNS ---

"  3 TAGS ------------------------------------

"  4 DISPLAYING TEXT -------------------------

"  5 SYNTAX, HIGHLIGHTING AND SPELLING -------
" Clear out a search
nnoremap <Esc> :noh<CR><Esc>

"  6 MULTIPLE WINDOWS ------------------------
" Moving around splits using Ctrl+h/j/k/l
map <c-j> <c-w>j
map <c-h> <c-w>h
map <c-k> <c-w>k
map <c-l> <c-w>l

" F11 maximizes current split (vertically only)
nnoremap <f11> <c-w>99+

" F12 minimizes current split (vertically only)
nnoremap <f12> <c-w>99-

" Up Down to adjust current split size
nnoremap <up> <c-w>+
nnoremap <down> <c-w>-

"  7 MULTIPLE TAB PAGES ----------------------
" Moving around tabs by <leader>n\m
nnoremap <leader>n <esc>:tabp<cr>
nnoremap <leader>m <esc>:tabn<cr>

"  8 TERMINAL --------------------------------

"  9 USING THE MOUSE -------------------------

" 10 GUI -------------------------------------

" 11 PRINTING --------------------------------

" 12 MESSAGES AND INFO -----------------------

" 13 SELECTING TEXT --------------------------
" Duplicate a selection in Visual mode
vmap D y'>p

" Make Y to be consistent with C and D
" (Yank to the end of line)
nnoremap Y y$

" 14 EDITING TEXT ----------------------------
" Auto add ; at the last
inoremap <leader>s <C-o>m`<C-o>A;<C-o>``

" Move lines
nmap <A-j> :m<space>.+1<CR>==
nmap <A-S-up> :m<space>.-2<CR>==
inoremap <A-S-down> <Esc>:m .+1<CR>==gi
inoremap <A-S-up> <Esc>:m .-2<CR>==gi
vnoremap <A-S-down> :m '>+1<CR>gv=gv
vnoremap <A-S-up> :m '<-2<CR>gv=gv

" Ctrl+Space to auto complete on local buff
imap <C-Space> <C-P>

" 15 TABS AND INDENTING ----------------------
" F8 indents whole file
nnoremap <f8> gg=G
" Easier block indenting (does not exit visual mode after one shift)
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

" 16 FOLDING ---------------------------------

" 17 DIFF MODE -------------------------------

" 18 MAPPING ---------------------------------

" 19 READING AND WRITING FILES ---------------
" ss to save file -- much more quicker
nmap ss :w<CR>
" Write file with sudo permission
nnoremap <leader>wf :w<space>!sudo<space>tee<space>%<cr>

" Quickly open config files ----- {{{
" Vimrc files
nnoremap <leader>ve :e<space>~/.vimrc<cr>
nnoremap <leader>vt :tabe<space>~/.vimrc<cr> " Open in newtab
nnoremap <leader>vv :tabe<space>~/dotfiles/vim/vundle.vim<cr> "This one too
" Zshrc files
nnoremap <leader>zr :e<space>~/.zshrc<cr>
nnoremap <leader>zt :e<space>~/dotfiles/oh-my-zsh-custom/tklarry.zsh-theme<cr>
" Git config files
nnoremap <leader>gc :e<space>~/.gitconfig<cr>
nnoremap <leader>gt :tabe<space>~/.gitconfig<cr>
" }}}

" Left Right to cycle through buffers
nnoremap <left> <c-w><
nnoremap <right> <c-w>>

" Open vim options help file in new tab
nnoremap <leader>h :tabe<space>~/Documents/optionwindow<cr>

" Expand current file's path
cnoremap <C-F> <C-R>=expand('%:p:h')<CR>

" 20 THE SWAP FILE ---------------------------

" 21 COMMAND LINE EDITING --------------------

" 22 EXECUTING EXTERNAL COMMANDS/PLUGINS -----
" NERDTree
nnoremap <leader>n :NERDTree .<cr>
nnoremap <leader>nt :NERDTreeToggle<cr>

" CtrlP keymaps
let g:ctrlp_map = '<Leader><Space>'
nnoremap <silent> <F4> <Esc>:ClearCtrlPCache<CR>
nnoremap <silent> <F3> :TlistToggle<CR>
nnoremap <Leader>u :ClearCtrlPCache<CR>
nnoremap <Leader>j :CtrlPMRU<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>

" F5 toggles tagbar
nnoremap <f5> :TagbarToggle<cr>

" F6 Compile the file
nnoremap <F6> <esc>:SCCompile<CR>

" Ctrl + F6 compile and run
nnoremap <C-F6> <esc>:SCCompileRun<CR>

" 23 RUNNING MAKE AND JUMPING TO ERRORS ------

" 24 LANGUAGE SPECIFIC -----------------------

" 25 MULTI-BYTE CHARACTERS -------------------

" 26 VARIOUS ---------------------------------


" --------------------------------------------
" FUNCTIONS
" --------------------------------------------
" Auto reloads vimrc
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" Visually selects text and press ~ to toggle through cases.
" There are three types:
"   all lowercase,
"   ALL UPPERCASE,
"   First Letter Uppercase
" ToggleCase(str) {
function! ToggleCase(str)
    if a:str ==# toupper(a:str)
        let result = tolower(a:str)
    elseif a:str ==# tolower(a:str)
        let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
    else
        let result = toupper(a:str)
    endif
    return result
endfunction
" map '~' to ToggleCase()
vnoremap ~ ygv"=ToggleCase(@")<CR>Pgv
" }

" Highlight excess line length for Python files
augroup vimrc_autocmds
    autocmd!
    " highlight chars past col 120"
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

" Indent options for Ruby group
function SetRubyAndWebOption()
    setlocal shiftwidth=2
    setlocal tabstop=2
endfunction
autocmd Filetype ruby call SetRubyAndWebOption()
autocmd Filetype eruby call SetRubyAndWebOption()
autocmd Filetype haml call SetRubyAndWebOption()
autocmd Filetype liquid call SetRubyAndWebOption()
autocmd Filetype scss call SetRubyAndWebOption()
autocmd Filetype css call SetRubyAndWebOption()

" Hightlight ExtraWhiteSpace
highlight ExtraWhitespace ctermbg=green ctermfg=white guibg=green guifg=white
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" Clear whitespace highlighting when leaving buffer
" for better performance
autocmd BufWinLeave * call clearmatches()
" Auto removing all trailing whitespaces when save
autocmd BufWritePre * :%s/\s\+$//e

" Change highlighting for search hits
highlight Search ctermbg=white guibg=white

" Autocmd for Python/Django development
" Automatically set the filetype of HTML to htmldjango
au BufNewFile,BufRead *.html setlocal filetype=htmldjango
" Indent options for Python/Django group
function SetPythonDjangoOption()
    setlocal shiftwidth=4
    setlocal tabstop=4
endfunction

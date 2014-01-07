" vim: fdm=marker ts=4 sts=4 sw=4 fdl=0

" startup/global general settings {{{
:set nocompatible
:set shortmess +=I
:set noswapfile
:set ttyfast
:set showcmd
:set history=100
:set switchbuf=useopen
:set hidden
:set visualbell t_vb=
:set novisualbell
:set nu
:set ruler
:set foldcolumn=2
:set foldmethod=marker
"}}}

" keyboard/mouse general settings {{{
:set mouse=a
:set backspace=indent,eol,start
:set listchars=tab:▸\ ,eol:¬
"}}}

" indentation and syntax highlighting {{{
filetype plugin indent on
:syntax on
:set ai
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set textwidth=0
:set wrapmargin=0
:set encoding=utf-8

" functions {{{
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
"}}}

if has("autocmd")
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    "autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

    " map file extensions to type
    autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml

    autocmd BufWritePre *.py,*.js,*.php,*.html,*.htm :call <SID>StripTrailingWhitespaces()
endif
"}}}

" keymaps {{{
nmap <leader>l :set list!<CR>

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
"}}}

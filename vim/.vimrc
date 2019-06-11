set number relativenumber
syntax on

" Unicode
set encoding=utf-8

" X clipboard
set clipboard=unnamedplus

" Change tab size
set tabstop=4
set shiftwidth=4

" Save / Load views
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Indent
set autoindent

" Highlight Searches
set hlsearch

" Color Changes
highlight folded ctermbg=black
highlight search ctermbg=darkblue ctermfg=black
highlight overlength ctermbg=darkred ctermfg=white

" Length over 80 columns
match overlength /\%81v.\+/

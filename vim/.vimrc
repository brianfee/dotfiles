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

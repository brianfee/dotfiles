set number relativenumber
syntax on

" Unicode
set encoding=utf-8

" X clipboard
set clipboard=unnamedplus

" Change tab size
set tabstop=4
set shiftwidth=4

" Change tab display
set list listchars=tab:\|•

" Save / Load views
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Indent
set autoindent

" Highlight Searches
set hlsearch

" Deletable text in Insert Mode
set backspace=indent,eol,start

" Color Changes
highlight comment ctermfg=darkblue
highlight cursorLineNr ctermfg=darkyellow
highlight folded ctermbg=black ctermfg=darkgrey
highlight lineNr ctermfg=darkgrey
highlight overlength ctermbg=darkred ctermfg=white
highlight search ctermbg=darkblue ctermfg=black
highlight specialkey ctermfg=darkgrey
highlight string ctermfg=darkgreen

" Identify Length >= 80 columns
match overlength /\%80v.\+/

" ---------- Key remappings ----------
" Toggle fold with spacebar
nnoremap <space> za


" ---------- Python Files ----------
au BufNewFile, BufRead *.py
	\ set softtabstop=4
	\ set expandtab
	\ set fileformat=unix



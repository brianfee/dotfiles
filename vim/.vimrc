filetype plugin on

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
highlight folded ctermbg=black ctermfg=lightgrey
highlight lineNr ctermfg=darkgrey
highlight overlength ctermbg=darkred ctermfg=white
highlight search ctermbg=darkblue ctermfg=black
highlight specialkey ctermfg=darkgrey
highlight string ctermfg=darkgreen

" Identify Length >= 80 columns
match overlength /\%80v.\+/

" Split handling
set splitbelow
set splitright

" ---------- Key remappings ----------
" Toggle fold with spacebar
nnoremap <space> za

" Split Movement
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>


" ---------- NerdTree ----------
map <C-n> :NERDTreeToggle<CR>

" ---------- Syntastic ----------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline +=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive' }

" Temporary Files
au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile

syntax off
filetype plugin on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set breakindent
set linebreak
set autoindent
set smartindent
set number
set relativenumber
set numberwidth=1

nnoremap j gj
nnoremap k gk
vnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
inoremap <C-j> <Esc>
inoremap <C-e> <C-o>$

hi NonText ctermfg=0
hi LineNr ctermfg=8
hi Visual ctermbg=7
hi Visual ctermbg=7
hi ErrorMsg ctermfg=1 ctermbg=none

let g:loaded_matchparen=1

set fillchars+=eob:\ 

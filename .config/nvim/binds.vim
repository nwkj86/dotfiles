"============================
" Binds
"============================
" show whitespaces
nmap <leader><F1> :set list!<CR>

" wrap in all windows
nmap <leader><F2> :set wrap!<CR>

" paste/nopaste
nmap <leader><F3> :set paste!<CR>

" diff on/off
nmap <leader><F5> :windo diffthis<CR>
nmap <leader><F6> :windo diffoff<CR>

" don't move by screen-line
nnoremap j gj
nnoremap k gk

" vim: ft=vim

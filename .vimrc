" Syntax color
syntax on
" Use defined color scheme
colorscheme elflord

" Change tab to spaces
set expandtab
set smarttab

" Each tab is 2 spaces
set shiftwidth=2
set tabstop=2

" Indent
set autoindent
set smartindent

" Wrapping
set nowrap

" Line numbers
set number
" mark current line
set cursorline

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Trim whitespaces at the end of the line
autocmd BufWritePre *
\ :%s/\s\+$//e

" highlight searched word
set hlsearch

" Enable 256 colors
set t_Co=256

" show whitespaces
nmap <leader>w :set list!<CR>
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Show syntax highlighting groups for word under cursor
nmap <leader>x :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

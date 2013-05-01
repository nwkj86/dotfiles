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

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Remember info about open buffers on close
set viminfo^=%

" Trim whitespaces at the end of the line
autocmd BufWritePre *
\ :%s/\s\+$//e


"============================
" Settings
"============================
" syntax color
syntax on

" enable file type detection
filetype plugin on

" use true colors
set termguicolors

set guicursor=""

" tab = 4 spaces
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" indent
set autoindent
set smartindent

" wrapping
set nowrap

" line numbers
set number
set relativenumber

" mark current line & column
set nocursorline
set nocursorcolumn

" change buffer without saving
set hidden

" highlight searched word
set hlsearch

" status width
set laststatus=2

" lines 'from the bottom'
set scrolloff=10

" ignore whitespaces
"set diffopt+=iwhite

" disable vi-backward compatibility
set nocompatible

" case insensitive, smart and incremental search
set ignorecase
set smartcase
set incsearch

" spell check
set nospell

" more human completition
set wildmode=longest,list
set wildmenu

" use clipboard as yank register
set clipboard=unnamedplus

" whitespaces
set list

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" trim whitespaces at the end of the line
autocmd BufWritePre *
\ :%s/\s\+$//e

" show syntax highlighting groups for word under cursor
nmap <leader>x :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" vim: ft=vim

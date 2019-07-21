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

" update time - avoid lags
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Better display for messages
set cmdheight=2

" indent
set autoindent
set smartindent

" wrapping
set nowrap

" line numbers
set number
" set relativenumber

" mark current line & column
set cursorline
set nocursorcolumn

" change buffer without saving
set hidden

" highlight searched word
set hlsearch

" status width
set laststatus=2

set updatetime=500

" lines 'from the bottom'
set scrolloff=10

" don't show mode - use airline instead
set noshowmode

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

" syntax color
syntax on

" enable file type detection
filetype plugin on

" use defined color scheme
colorscheme artur

" change tab to spaces
set expandtab
set smarttab

" each tab is 2 spaces
set shiftwidth=2
set tabstop=2

" indent
set autoindent
set smartindent
" wrapping
set nowrap

" line numbers
set number

" mark current line
set cursorline

" mark current column
set cursorcolumn

" change buffer without saving
set hidden

" highlight searched word
set hlsearch

" status width
set laststatus=2

" enable 256 colors
set t_Co=256

" ignore whitespaces
set diffopt+=iwhite

" enable omni completion
set omnifunc=syntaxcomplete#Complete

" case insensitive, smart and incremental search
set ignorecase
set smartcase
set incsearch

" show whitespaces
nmap <leader>l :set list!<CR>

" wrap in all windows
nmap <leader>w :set wrap!<CR>

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

" - - - - - - - - - - - - - -
" Vundle settings
" - - - - - - - - - - - - - -

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"--------------
" Plugins
"--------------
"Plugin 'Rip-Rip/clang_complete'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/Buffergator'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'xterm-color-table.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

" - - - - - - - - - - - - - -
" NERDTree settings
" - - - - - - - - - - - - - -
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>

" - - - - - - - - - - - - - -
" tagbar settings
" - - - - - - - - - - - - - -
map <C-t> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_sort = 1
let g:tagbar_width = 60

" - - - - - - - - - - - - - -
" powerline
" - - - - - - - - - - - - - -
let g:Powerline_symbols = "unicode"
" - - - - - - - - - - - - - -
" A
" - - - - - - - - - - - - - -
let g:alternateExtensions_C = "h"
let g:alternateExtensions_h = "C"

" - - - - - - - - - - - - - -
" CtrlP
" - - - - - - - - - - - - - -
let g:ctrlp_root_markers = ['.ctrlp']


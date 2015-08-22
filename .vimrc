" syntax color
syntax on

" enable file type detection
filetype plugin on

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

" mark current line & column
set cursorline
set cursorcolumn

" change buffer without saving
set hidden

" highlight searched word
set hlsearch

" status width
set laststatus=2

" lines 'from the bottom'
set scrolloff=10

" enable 256 colors
set t_Co=256

" ignore whitespaces
"set diffopt+=iwhite

" enable omni completion
set omnifunc=syntaxcomplete#Complete

" case insensitive, smart and incremental search
set ignorecase
set smartcase
set incsearch

" more human completition
set wildmode=longest,list
set wildmenu

" show whitespaces
nmap <leader><F1> :set list!<CR>

" wrap in all windows
nmap <leader><F2> :set wrap!<CR>

" paste/nopaste
nmap <leader><F3> :set paste!<CR>

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
"Plugin 'altercation/vim-colors-solarized.git'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'vim-scripts/taglist.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'vim-scripts/YankRing.vim'         " yield history

Plugin 'bling/vim-airline'                " status line
Plugin 'gmarik/Vundle.vim'                " plugins management
Plugin 'kana/vim-operator-user'           " user defined separators, dependency
Plugin 'kien/ctrlp.vim'                   " search wile by name
Plugin 'majutsushi/tagbar'                " file outline
Plugin 'mattn/emmet-vim'                  " expanding abbreviations
Plugin 'mileszs/ack.vim'                  " grep replacement
Plugin 'rhysd/vim-clang-format'           " C/C++ source formatter
Plugin 'scrooloose/nerdtree'              " file explorer
Plugin 'scrooloose/syntastic'             " syntax checker for many languages
Plugin 'tmhedberg/matchit'                " match more by %
Plugin 'tpope/vim-commentary'             " comment stuff out
Plugin 'tpope/vim-dispatch'               " run task in new tmux window, fetch results back to vim when done
Plugin 'tpope/vim-eunuch'                 " Remove, Unlink, Moe, Rename, Chmod, Mkdir...
Plugin 'tpope/vim-fugitive'               " git in vim
Plugin 'tpope/vim-unimpaired'             " many useful shortcuts in ]<letters> and ]<letters>
Plugin 'vim-scripts/Align'                " aligning text
Plugin 'vim-scripts/Buffergator'          " buffers & tabs outline
Plugin 'vim-scripts/a.vim'                " pairing cpp with h
Plugin 'xterm-color-table.vim'            " print colors, useful to check if 256 cols available
Plugin 'vim-scripts/DoxygenToolkit.vim'   " insert doxygen block
Plugin 'MarcWeber/vim-addon-local-vimrc'
"Plugin 'embear/vim-localvimrc'            " source .lvimrc files

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'               " additional snippets for snipmate

Plugin 'lervag/vimtex'                    " latex in vim

Plugin 'nanotech/jellybeans.vim'          " colorscheme

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" - - - - - - - - - - - - - -
" NERDTree settings
" - - - - - - - - - - - - - -
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeDirArrows = 0

" - - - - - - - - - - - - - -
" tagbar settings
" - - - - - - - - - - - - - -
map <C-t> :TagbarToggle<CR>
let g:tagbar_autoclose = 1
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
" CtrlP
" - - - - - - - - - - - - - -
let g:ctrlp_root_markers = ['.ctrlp']

" - - - - - - - - - - - - - -
" Buffergator
" - - - - - - - - - - - - - -
let g:buffergator_viewport_split_policy = "B"

" - - - - - - - - - - - - - -
" syntastic
" - - - - - - - - - - - - - -
let g:syntastic_cpp_compiler_options = ' -std=c++14'

" - - - - - - - - - - - - - -
" jellybeans
" - - - - - - - - - - - - - -
colorscheme jellybeans
let g:jellybeans_use_lowcolor_black = 0

" - - - - - - - - - - - - - -
" ultisnips
" - - - - - - - - - - - - - -
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"

" - - - - - - - - - - - - - -
" Ack
" - - - - - - - - - - - - - -

let g:ack_default_options =
  \ " -s -H --nocolor --nogroup --column --smart-case --follow --ignore-file=is:tags"

" - - - - - - - - - - - - - -
" clang_complete
" - - - - - - - - - - - - - -
let g:clang_format#style_options = {
            \ "UseTab": "Never",
            \ "BreakConstructorInitializersBeforeComma": "true",
            \ "AlignTrailingComments": "true",
            \ "IndentWidth": 2,
            \ "BreakBeforeBraces": "Allman",
            \ "AllowShortIfStatementsOnASingleLine": "false",
            \ "IndentCaseLabels": "false",
            \ "Standard" : "C++11",
            \ "ColumnLimit": 0 }


" - - - - - - - - - - - - - -
" a.vim
" - - - - - - - - - - - - - -
let g:alternateExtensions_cpp = "h,hpp"
let g:alternateExtensions_h = "cpp,c"

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

" enable 256 colors
set t_Co=256

" enable omni completion
set omnifunc=syntaxcomplete#Complete

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

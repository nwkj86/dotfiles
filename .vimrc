" Syntax color
syntax on
" Use defined color scheme
colorscheme artur

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

" mark current column
set cursorcolumn

" change buffer without saving
set hidden

" highlight searched word
set hlsearch

" Enable 256 colors
set t_Co=256

" show whitespaces
nmap <leader>l :set list!<CR>

" wrap in all windows
nmap <leader>w :set wrap!<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Trim whitespaces at the end of the line
autocmd BufWritePre *
\ :%s/\s\+$//e

" Show syntax highlighting groups for word under cursor
nmap <leader>x :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

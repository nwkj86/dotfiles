" junegunn/vim-plug
call plug#begin()

" ---
" --- Colorschemes & highlights
" ---
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'sickill/vim-monokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'MaxSt/FlatColor'
Plug 'mhinz/vim-janah'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'

Plug 'arakashic/chromatica.nvim'                              " clang based c-like languages scheme
Plug 'elzr/vim-json'                                          " better json support

" ---
" --- Plugins
" ---
Plug 'neomake/neomake'                                        " asynchronous linting and make framework
Plug 'wbthomason/buildit.nvim'                                " async builder
Plug 'brooth/far.vim'                                         " find and replace

Plug 'tmhedberg/matchit'                                      " match more by % (HTML, Latex, ...)

Plug 'airblade/vim-gitgutter'                                 " git marks

Plug 'SirVer/ultisnips'                                       " snippets

Plug 'bling/vim-airline'                                      " status line
Plug 'vim-airline/vim-airline-themes'                         " themes for airline

Plug 'xolox/vim-misc'                                         " Dependency for vim-sessions
Plug 'xolox/vim-session'                                      " Sessions management

Plug 'tpope/vim-commentary'                                   " comment stuff out
Plug 'tpope/vim-eunuch'                                       " Remove, Unlink, Moe, Rename, Chmod, Mkdir...
Plug 'tpope/vim-fugitive'                                     " git in vim
Plug 'tpope/vim-unimpaired'                                   " many useful shortcuts in ]<letters> and ]<letters>
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'vim-scripts/Align'                                      " aligning text
Plug 'vim-scripts/DoxygenToolkit.vim'                         " insert doxygen block
Plug 'vim-scripts/Mark'                                       " highlight in different colors
Plug 'vim-scripts/a.vim'                                      " pairing cpp with h
Plug 'vim-scripts/xterm-color-table.vim'                      " print colors, useful to check if 256 cols available

Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }   " asynchronous unite all interfaces
Plug 'Shougo/neoyank.vim'                                     " yank history
Plug 'Shougo/vinarise.vim'                                    " hex editing for vim

" syntax autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " asynchronous completion framework
Plug 'zchee/deoplete-jedi'                                    " python autocompletion
Plug 'neovim/python-client'                                   " required by deoplete-ternjs
Plug 'carlitux/deoplete-ternjs'                               " js autocompletion
Plug 'mhartington/nvim-typescript'                            " typescript autocompletion
Plug 'sebastianmarkow/deoplete-rust'                          " rust autocompletion
Plug 'zchee/deoplete-clang'
" Plug 'Valloric/YouCompleteMe'                                 " clang completion

Plug 'mbbill/undotree'                                        " undo tree visualiser
Plug 'majutsushi/tagbar'                                      " ctags based outline
Plug 'nathanaelkane/vim-indent-guides'                        " indentation guidlines
Plug 'ludovicchabant/vim-gutentags'                           " ctags management
Plug 'mhinz/vim-startify'                                     " nice start screen
Plug 'scrooloose/nerdtree'                                    " file navigator

" Plug 'ryanoasis/vim-devicons'

call plug#end()

" - - - - - - - - - - - - - -
" colorscheme
" - - - - - - - - - - - - - -
let g:jellybeans_use_lowcolor_black = 0
let g:gruvbox_contrast_dark = 'hard'
colorscheme jellybeans
set background=dark

" - - - - - - - - - - - - - -
" ludovicchabant/vim-gutentags
" - - - - - - - - - - - - - -
let g:gutentags_enabled = 0 " call :GutentagsUpdate

" - - - - - - - - - - - - - -
" scrooloose/nerdtree
" - - - - - - - - - - - - - -
map <C-n> :NERDTreeCWD<CR>
map <C-m> :NERDTreeFind<CR>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeWinSize = 60

" - - - - - - - - - - - - - -
" Valloric/YouCompleteMe
" - - - - - - - - - - - - - -
let g:ycm_error_symbol = '!'
let g:ycm_warning_symbol = '>'
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_server_log_level = 'debug'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1

nmap <leader>g :YcmCompleter GoToDefinition<CR>
nmap <leader>h :YcmCompleter GoToDeclaration<CR>

" - - - - - - - - - - - - - -
" neomake/neomake
" - - - - - - - - - - - - - -
autocmd! BufWritePost * Neomake
let g:neomake_python_flake8_maker = { 'args': ['--ignore=E501'] } " too long lines

" - - - - - - - - - - - - - -
" arakashic/chromatica.nvim
" - - - - - - - - - - - - - -
let g:chromatica#enable_at_startup=1

" - - - - - - - - - - - - - -
" xolox/vim-session
" - - - - - - - - - - - - - -
let g:session_directory = "~/.config/nvim/sessions"
let g:session_autoload = 'no'
let g:session_autosave = 'prompt'

" - - - - - - - - - - - - - -
" mhinz/startify
" - - - - - - - - - - - - - -
let g:startify_session_dir = "~/.config/nvim/sessions"
let g:startify_list_order = [ ['  Sessions:'], 'sessions', ['  Files:'], 'files', ['  Current dir:'], 'dir', ['  Bookmarks:'], 'bookmarks']

" - - - - - - - - - - - - - -
" vim-scripts/a.vim
" - - - - - - - - - - - - - -
let g:alternateExtensions_cpp = "h,hpp"
let g:alternateExtensions_h = "cpp,c"

" - - - - - - - - - - - - - -
" Shougo/deoplete.nvim
" - - - - - - - - - - - - - -
call deoplete#enable()
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif " close preview window after completion: Shougo/deoplete.nvim/issues/115

" - - - - - - - - - - - - - -
" zchee/deoplete-clang
" - - - - - - - - - - - - - -
let g:deoplete#sources#clang#libclang_path =  "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header =  "/usr/lib/clang"

" - - - - - - - - - - - - - -
" zchee/deoplete-jedi
" - - - - - - - - - - - - - -
let g:deoplete#sources#jedi#show_docstring = 1

" - - - - - - - - - - - - - -
" carlitux/deoplete-ternjs
" - - - - - - - - - - - - - -
let g:deoplete#sources#ternjs#tern_bin = "/usr/bin/tern"
let g:deoplete#sources#ternjs#timeout = 2
let g:deoplete#sources#ternjs#docs = 1

" - - - - - - - - - - - - - -
" Shougo/denite.nvim
" - - - - - - - - - - - - - -
nnoremap <C-p> :Denite file_rec -buffer-name=file_rec<cr>
nnoremap <leader>g :DeniteCursorWord -buffer-name=grep grep:.<CR>
nnoremap <leader>b :Denite -buffer-name=buffer buffer<cr>
nnoremap <leader>y :Denite -buffer-name=yank unite:history/yank<cr>
nnoremap <leader>j :Denite -buffer-name=jump jump<cr>

call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>', 'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('insert', '<C-s>', '<denite:do_action:split>', 'noremap')
call denite#custom#map('normal', '<C-s>', '<denite:do_action:split>', 'noremap')
call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabopen>', 'noremap')
call denite#custom#map('normal', '<C-t>', '<denite:do_action:tabopen>', 'noremap')
call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>', 'noremap')

call denite#custom#option('_', {
            \ 'prompt': '>',
            \ 'mode': 'normal',
            \ 'cursor_wrap': v:true })

call denite#custom#option('grep', {
            \ 'quit': v:false })

call denite#custom#option('file_rec', {
            \ 'mode': 'insert' })

call denite#custom#option('buffer', {
            \ 'auto-resize': v:true,
            \ 'split': 'no' })

call denite#custom#option('outline', {
            \ 'auto-resize': v:true,
            \ 'split': 'no' })

call denite#custom#option('yank', {
            \ 'auto-resize': v:true })

call denite#custom#option('tab', {
            \ 'auto-resize': v:true })

" - - - - - - - - - - - - - -
" nathanaelkane/vim-indent-guides
" - - - - - - - - - - - - - -
nmap <leader><F4> ::IndentGuidesToggle<CR>

" - - - - - - - - - - - - - -
" majutsushi/tagbar
" - - - - - - - - - - - - - -
nnoremap <C-t> :TagbarToggle<CR>
let g:tagbar_compact = 1
let g:tagbar_compact = 1
let g:tagbar_foldlevel = 3
let g:tagbar_autoshowtag = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_sort = 1

" - - - - - - - - - - - - - -
" SirVer/ultisnips
" - - - - - - - - - - - - - -
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/snips"
  let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

" - - - - - - - - - - - - - -
" bling/vim-airline
" - - - - - - - - - - - - - -
let g:airline_symbols_ascii = 1

" vim: ft=vim

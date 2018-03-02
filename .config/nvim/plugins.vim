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

" Plug 'arakashic/chromatica.nvim'                              " clang based c-like languages scheme
Plug 'peter-edge/vim-capnp'                                   " syntax highlight for Cap'n Proto
Plug 'peterhoeg/vim-qml'

" ---
" --- Plugins
" ---
Plug 'w0rp/ale'                                               " Asynchronous Lint Engine
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
Plug 'tpope/vim-eunuch'                                       " Remove, Unlink, Move, Rename, Chmod, Mkdir...
Plug 'tpope/vim-fugitive'                                     " git in vim
Plug 'tpope/vim-unimpaired'                                   " many useful shortcuts in ]<letters> and ]<letters>
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'vim-scripts/Align'                                      " aligning text
Plug 'vim-scripts/DoxygenToolkit.vim'                         " insert doxygen block
Plug 'vim-scripts/Mark--Karkat'                               " highlight in different colors
Plug 'vim-scripts/a.vim'                                      " pairing cpp with h
Plug 'vim-scripts/xterm-color-table.vim'                      " print colors, useful to check if 256 cols available

Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }   " asynchronous unite all interfaces
Plug 'Shougo/neoyank.vim'                                     " yank history
Plug 'Shougo/vinarise.vim'                                    " hex editing for vim

" syntax autocompletion
Plug 'Valloric/YouCompleteMe'                                 " clang completion

Plug 'mbbill/undotree'                                        " undo tree visualiser
Plug 'majutsushi/tagbar'                                      " ctags based outline
Plug 'nathanaelkane/vim-indent-guides'                        " indentation guidlines
Plug 'mhinz/vim-startify'                                     " nice start screen
Plug 'tpope/vim-vinegar'
Plug 'ludovicchabant/vim-gutentags'                           " ctags generator/manager
Plug 'chrisbra/NrrwRgn'                                       " Narrow region

Plug 'ludovicchabant/vim-gutentags'                           " ctags auto-management

Plug 'hardenedapple/vsh/'                                     " Store and replay shell sessions -- also output search/modification/undo/redo.

Plug 'tmux-plugins/vim-tmux'                                  " tmux.conf file support
Plug 'justinmk/vim-dirvish'                                   " file explorer

call plug#end()


" - - - - - - - - - - - - - -
" colorscheme
" - - - - - - - - - - - - - -
let g:jellybeans_use_lowcolor_black = 0
let g:gruvbox_contrast_dark = 'hard'
colorscheme jellybeans
set background=dark

" - - - - - - - - - - - - - -
" netrw
" - - - - - - - - - - - - - -
let g:netrw_liststyle = 1
map <C-n> :Explore<CR>
autocmd FileType netrw setl bufhidden=delete

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

nmap <leader>d :YcmCompleter GoToDefinition<CR>
nmap <leader>f :YcmCompleter GoToDeclaration<CR>

" - - - - - - - - - - - - - -
" w0rp/ale
" - - - - - - - - - - - - - -
    " validated by YCM
let g:ale_linters = {
            \ 'cpp' : [],
            \}
let g:ale_python_flake8_options = '--ignore=E501'

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
" Shougo/denite.nvim
" - - - - - - - - - - - - - -
nnoremap <C-p> :Denite file_rec -buffer-name=file_rec<CR>
nnoremap <leader>g :DeniteCursorWord -buffer-name=grep grep:.<CR>
nnoremap <leader>b :Denite -buffer-name=buffer buffer<CR>
nnoremap <leader>y :Denite -buffer-name=yank unite:history/yank<CR>
nnoremap <leader>j :Denite -buffer-name=jump jump<CR>
nnoremap <leader>h :Denite grep:. -mode=normal<CR>


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


call denite#custom#option('file_rec', {
            \ 'mode': 'insert' })
call denite#custom#var('file_rec', 'command',
            \ ['rg', '--files', '--glob', '!.git', ''])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
            \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#option('grep', { 'quit': v:false })

" - - - - - - - - - - - - - -
" nathanaelkane/vim-indent-guides
" - - - - - - - - - - - - - -
nmap <leader>i ::IndentGuidesToggle<CR>

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
let g:tagbar_width = 70

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

" - - - - - - - - - - - - - -
" mbbill/undotree
" - - - - - - - - - - - - - -
nmap <leader>u :UndotreeToggle<CR> :UndotreeFocus<CR>


" - - - - - - - - - - - - - -
" justinmk/vim-dirvish
" - - - - - - - - - - - - - -
let g:dirvish_mode = ':sort ,^.*[\/],'
autocmd FileType dirvish silent keeppatterns g@\v/\.[^\/]+/?$@d _

" vim: ft=vim

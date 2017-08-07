" junegunn/vim-plug
call plug#begin()

" Colorschemes & highlights
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'sickill/vim-monokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'MaxSt/FlatColor'
Plug 'mhinz/vim-janah'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'

Plug 'arakashic/chromatica.nvim' " clang based c-like languages scheme

" Plugins
Plug 'Valloric/YouCompleteMe'                                 " clang completion
Plug 'neomake/neomake'                                        " asynchronous linting and make framework
Plug 'wbthomason/buildit.nvim'                                " async builder
Plug 'brooth/far.vim'                                         " find and replace

Plug 'jsfaint/gen_tags.vim'                                   " generate ctags

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

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " asynchronous completion framework
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }   " asynchronous unite all interfaces
Plug 'Shougo/unite.vim'                 " Unite itself
Plug 'Shougo/unite-help'                " help files
Plug 'Shougo/unite-outline'
Plug 'Shougo/neoyank.vim'               " yank history
Plug 'Shougo/vimfiler.vim'              " file explorer (like NerdTree)

Plug 'tsukkee/unite-tag'                " selecting |tags| or selecting files including |tags|
Plug 'tacroe/unite-mark'
Plug 'chemzqm/denite-extra'

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
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

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
" vim-scripts/a.vim
" - - - - - - - - - - - - - -
let g:alternateExtensions_cpp = "h,hpp"
let g:alternateExtensions_h = "cpp,c"

" - - - - - - - - - - - - - -
" Shougo/deoplete.nvim
" - - - - - - - - - - - - - -
call deoplete#enable()

" - - - - - - - - - - - - - -
" Shougo/denite.nvim
" - - - - - - - - - - - - - -
nnoremap <C-p> :Denite file_rec -buffer-name=file_rec<cr>
nnoremap <C-t> :Denite unite:outline -buffer-name=outline<cr>
nnoremap <leader>g :DeniteCursorWord -buffer-name=grep grep:.<CR>
nnoremap <leader>b :Denite -buffer-name=buffer buffer<cr>
nnoremap <leader>t :Denite -buffer-name=tab unite:tab<cr>
nnoremap <leader>y :Denite -buffer-name=yank unite:history/yank<cr>
nnoremap <leader>j :Denite -buffer-name=mark unite:mark<cr>

call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>', 'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('insert', '<C-s>', '<denite:do_action:split>', 'noremap')
call denite#custom#map('normal', '<C-s>', '<denite:do_action:split>', 'noremap')
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
            \ 'force_quit' : v:true,
            \ 'split': 'no' })

call denite#custom#option('outline', {
            \ 'auto-resize': v:true,
            \ 'force_quit' : v:true,
            \ 'split': 'no' })

call denite#custom#option('yank', {
            \ 'auto-resize': v:true,
            \ 'force_quit' : v:true })

call denite#custom#option('tab', {
            \ 'auto-resize': v:true,
            \ 'force_quit' : v:true })

" - - - - - - - - - - - - - -
" Shougo/unite.vim
" - - - - - - - - - - - - - -
call unite#custom#profile('source/outline', 'context', {
            \   'start_insert': 0,
            \   'prompt_direction': 'top',
            \   'direction': 'botright',
            \   'split': 0,
            \ })

call unite#custom#profile('source/history/yank', 'context', {
            \   'winheight': 20,
            \   'prompt_direction': 'top',
            \ })

call unite#custom#profile('source/tab', 'context', {
            \   'start_insert': 0,
            \   'prompt_direction': 'top',
            \   'direction': 'top',
            \   'split': 0,
            \ })

let g:unite_source_mark_marks =
            \   "abcdefghijklmnopqrstuvwxyz"
            \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

" - - - - - - - - - - - - - -
" VimFiler
" - - - - - - - - - - - - - -
let g:vimfiler_as_default_explorer = 1
map <C-n> :VimFiler -force-quit<CR>
map <C-m> :VimFiler -find -force-quit<CR>
" Expand instead of cd on <Enter>
autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
            \ "\<Plug>(vimfiler_expand_tree)",
            \ "\<Plug>(vimfiler_edit_file)")

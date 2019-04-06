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
Plug 'challenger-deep-theme/vim'
Plug 'mhinz/vim-janah'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug 'romainl/flattened'
Plug 'chriskempson/base16-vim'
Plug 'patstockwell/vim-monokai-tasty'

Plug 'peter-edge/vim-capnp'                                   " syntax highlight for Cap'n Proto
Plug 'peterhoeg/vim-qml'                                      " syntax highlight for Qt-QML
Plug 'tmux-plugins/vim-tmux'                                  " tmux.conf file support

" ---
" --- Plugins
" ---

" from tpope
Plug 'tpope/vim-commentary'                                   " comment stuff out
Plug 'tpope/vim-eunuch'                                       " Remove, Unlink, Move, Rename, Chmod, Mkdir...
Plug 'tpope/vim-unimpaired'                                   " many useful shortcuts in ]<letters> and ]<letters>
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" git
Plug 'airblade/vim-gitgutter'                                 " git marks
Plug 'tpope/vim-fugitive'                                     " git in vim
Plug 'junegunn/gv.vim'                                        " git history browser

Plug 'tommcdo/vim-exchange'                                   " swap words, regions etc

" from vim-scripts
Plug 'vim-scripts/Align'                                      " aligning text
Plug 'vim-scripts/DoxygenToolkit.vim'                         " insert doxygen block
Plug 'vim-scripts/Mark--Karkat'                               " highlight in different colors
Plug 'vim-scripts/a.vim'                                      " pairing cpp with h
Plug 'vim-scripts/xterm-color-table.vim'                      " print colors, useful to check if 256 cols available

" from Shougo
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }   " asynchronous unite all interfaces
Plug 'Shougo/neoyank.vim'                                     " yank history
Plug 'Shougo/vinarise.vim'                                    " hex editing for vim

" C++ related
Plug 'critiqjo/lldb.nvim'                                     " LLDB helper
Plug 'huawenyu/neogdb.vim'                                    " GBD helper
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}} " Completion and other language server support for Neovim, featured as VSCode
Plug 'neoclide/coc-lists'

" Python related
Plug 'davidhalter/jedi-vim'                                   " Jedi completion and syntax checking

" programming
Plug 'szymonmaszke/vimpyter'                                  " edit your jupyter notebooks in vim/neovim
Plug 'w0rp/ale'                                               " asynchronous lint engine
Plug 'wbthomason/buildit.nvim'                                " async builder
Plug 'SirVer/ultisnips'                                       " snippets
Plug 'majutsushi/tagbar'                                      " ctags based outline
Plug 'machakann/vim-highlightedyank'                          " Make the yanked region apparent!
Plug 'nathanaelkane/vim-indent-guides'                        " indentation guidlines
Plug 'thiagoalessio/rainbow_levels.vim'                       " a different approach to code highlighting
Plug 'ludovicchabant/vim-gutentags'                           " ctags generator/manager
Plug 'tmhedberg/matchit'                                      " match more by % (HTML, Latex, ...)

" others
Plug 'justinmk/vim-dirvish'                                   " file explorer
Plug 'brooth/far.vim'                                         " find and replace
"Plug 'airblade/vim-rooter'                                    " Changes Vim working directory to project root (identified by presence of known directory or file).

Plug 'wsdjeg/vim-fetch'                                       " make vim handle line and column numbers in file names with a minimum of fuss
Plug 'bling/vim-airline'                                      " status line
Plug 'vim-airline/vim-airline-themes'                         " themes for airline

Plug 'xolox/vim-misc'                                         " Dependency for vim-sessions

Plug 'mbbill/undotree'                                        " undo tree visualiser
Plug 'mhinz/vim-startify'                                     " nice start screen
Plug 'chrisbra/NrrwRgn'                                       " Narrow region
Plug 'hardenedapple/vsh'                                      " Store and replay shell sessions -- also output search/modification/undo/redo.
Plug 'junegunn/goyo.vim'                                      " distraction-free writing in Vim

call plug#end()


" - - - - - - - - - - - - - -
" colorscheme
" - - - - - - - - - - - - - -
let g:jellybeans_use_lowcolor_black = 0
let g:gruvbox_contrast_dark = 'hard'
let base16colorspace=256  " Access colors present in 256 colorspace

colorscheme base16-default-dark
set background=dark

" - - - - - - - - - - - - - -
" neoclide/coc.vim
" - - - - - - - - - - - - - -
nmap <leader>cs <Plug>(coc-declaration)
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>cy <Plug>(coc-type-definition)
nmap <leader>cr <Plug>(coc-references)
nmap <leader>ci <Plug>(coc-implementation)
nmap <leader>cn <Plug>(coc-rename)
nmap <leader>ch :call CocAction('doHover')<CR>
nmap <leader>co :CocList outline<CR>
nmap <leader>cB :call CocLocations('ccls','$ccls/inheritance')<CR>
nmap <leader>cD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<CR>
nmap <leader>cc :call CocLocations('ccls','$ccls/call')<CR>
nmap <leader>cC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<CR>

" - - - - - - - - - - - - - -
" w0rp/ale
" - - - - - - - - - - - - - -
    " validated by YCM
let g:ale_linters = {
    \ 'cpp' : [],
    \}
let g:ale_python_flake8_options = '--ignore=E501'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

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
nnoremap <Leader>p  :Denite -buffer-name=file/rec file/rec<CR>
nnoremap <leader>b  :Denite -buffer-name=buffer buffer<CR>
nnoremap <leader>y  :Denite -buffer-name=yank neoyank<CR>
nnoremap <leader>j  :Denite -buffer-name=jump jump<CR>
nnoremap <leader>gw :DeniteCursorWord -buffer-name=grep -no-empty grep:.<CR>
nnoremap <leader>gg :Denite -buffer-name=grep -no-empty grep:.<CR>

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


call denite#custom#option('file/rec', {
            \ 'mode': 'insert' })
call denite#custom#var('file/rec', 'command',
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
nnoremap <leader>t :TagbarToggle<CR>
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
" Plug 'airblade/vim-gitgutter'
" - - - - - - - - - - - - - -
let g:gitgutter_async = 0


" - - - - - - - - - - - - - -
" justinmk/vim-dirvish
" - - - - - - - - - - - - - -
map <leader>nn :Dirvish %<CR>
map <leader>nm :Dirvish<CR>
let g:dirvish_mode = ':sort ,^.*[\/],'
autocmd FileType dirvish silent keeppatterns g@\v/\.[^\/]+/?$@d _

" - - - - - - - - - - - - - -
" lyuts/vim-rtags
" - - - - - - - - - - - - - -
function! SetupNeocompleteForCppWithRtags()
    " Enable heavy omni completion.
    setlocal omnifunc=RtagsCompleteFunc

    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let l:cpp_patterns='[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.cpp = l:cpp_patterns
    set completeopt+=longest,menuone
endfunction

autocmd FileType cpp,c call SetupNeocompleteForCppWithRtags()

" vim: ft=vim

" junegunn/vim-plug
call plug#begin()

" ---
" --- Colorschemes
" ---
Plug 'ayu-theme/ayu-vim'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'mhartington/oceanic-next'
Plug 'mhinz/vim-janah'
Plug 'romainl/flattened'
Plug 'MPiccinato/wombat256'
Plug 'nanotech/jellybeans.vim'

" ---
" --- Highlights
" ---
Plug 'cstrahan/vim-capnp'
Plug 'sheerun/vim-polyglot'

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
Plug 'cohama/agit.vim'

Plug 'tommcdo/vim-exchange'                                   " swap words, regions etc

" from vim-scripts
Plug 'vim-scripts/Align'                                      " aligning text
Plug 'vim-scripts/DoxygenToolkit.vim'                         " insert doxygen block
Plug 'vim-scripts/Mark--Karkat'                               " highlight in different colors
Plug 'vim-scripts/a.vim'                                      " pairing cpp with h
Plug 'vim-scripts/xterm-color-table.vim'                      " print colors, useful to check if 256 cols available

" C++ related
"Plug 'critiqjo/lldb.nvim'                                     " LLDB helper
Plug 'huawenyu/neogdb.vim'                                    " GBD helper
"Plug 'jackguo380/vim-lsp-cxx-highlight'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}               " Completion and other language server support for Neovim, featured as VSCode

" programming
"Plug 'szymonmaszke/vimpyter'                                  " edit your jupyter notebooks in vim/neovim
Plug 'dense-analysis/ale'                                     " asynchronous lint engine
Plug 'wbthomason/buildit.nvim'                                " async builder
Plug 'SirVer/ultisnips'                                       " snippets
Plug 'majutsushi/tagbar'                                      " ctags based outline
Plug 'liuchengxu/vista.vim'                                   " LSP and ctags based outline
Plug 'machakann/vim-highlightedyank'                          " Make the yanked region apparent!
Plug 'nathanaelkane/vim-indent-guides'                        " indentation guidlines
Plug 'tmhedberg/matchit'                                      " match more by % (HTML, Latex, ...)

" others
Plug 'justinmk/vim-dirvish'                                   " file explorer
Plug 'brooth/far.vim'                                         " find and replace
"Plug 'airblade/vim-rooter'                                    " Changes Vim working directory to project root (identified by presence of known directory or file).
"Plug 'metakirby5/codi.vim'                                    " The interactive scratchpad for hackers.

Plug 'wsdjeg/vim-fetch'                                       " make vim handle line and column numbers in file names with a minimum of fuss
Plug 'bling/vim-airline'                                      " status line
Plug 'vim-airline/vim-airline-themes'                         " themes for airline
"Plug 'itchyny/lightline.vim'

Plug 'mbbill/undotree'                                        " undo tree visualiser
Plug 'mhinz/vim-startify'                                     " nice start screen
Plug 'chrisbra/NrrwRgn'                                       " Narrow region
Plug 'hardenedapple/vsh'                                      " Store and replay shell sessions -- also output search/modification/undo/redo.
Plug 'junegunn/goyo.vim'                                      " distraction-free writing in Vim

Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

call plug#end()

" - - - - - - - - - - - - - -
" colorscheme
" - - - - - - - - - - - - - -
let base16colorspace=256  " Access colors present in 256 colorspace

let ayucolor="dark"   " for dark version of theme
colorscheme jellybeans

" - - - - - - - - - - - - - -
" neoclide/coc.vim
" - - - - - - - - - - - - - -
let g:coc_global_extensions = [
    \ 'coc-cmake',
    \ 'coc-css',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-omnisharp',
    \ 'coc-python',
    \ 'coc-tasks',
    \ 'coc-tsserver',
    \ 'coc-yaml',
    \ 'coc-yank',
\ ]

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

nnoremap <leader>a  :CocList tasks<CR>
nnoremap <Leader>p  :CocList files<CR>
nnoremap <leader>b  :CocList buffers<CR>
nnoremap <leader>y  :CocList yank<CR>
nnoremap <leader>j  :CocList marks<CR>
nnoremap <leader>gg :exe 'CocList -I grep'<CR>
nnoremap <leader>gw :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
nnoremap <leader>l :CocListResume<CR>

" - - - - - - - - - - - - - -
" w0rp/ale
" - - - - - - - - - - - - - -
let g:ale_linters = {
    \ 'cpp' : [],
    \ 'python' : [],
    \}
let g:ale_python_flake8_options = '--ignore=E501'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" - - - - - - - - - - - - - -
" mhinz/startify
" - - - - - - - - - - - - - -
let g:startify_session_dir = "~/.config/nvim/sessions"
let g:startify_list_order = [ ['  Sessions:'], 'sessions', ['  Files:'], 'files', ['  Current dir:'], 'dir', ['  Bookmarks:'], 'bookmarks']

" - - - - - - - - - - - - - -
" vim-scripts/a.vim
" - - - - - - - - - - - - - -
let g:alternateExtensions_cpp = "h,hpp,hxx"
let g:alternateExtensions_h = "cpp,c,cxx"

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
" 'iuchengxu/vista.vim
" - - - - - - - - - - - - - -
let g:vista_sidebar_position = "vertical topleft"
let g:vista_sidebar_width = 100
let g:vista_close_on_jump = 1
nmap <leader>tc :Vista ctags<CR>
nmap <leader>tl :Vista coc<CR>

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
" Plug 'skywind3000/asyncrun.vim'
" - - - - - - - - - - - - - -
let g:asyncrun_open = 6
nnoremap <leader>as :AsyncStop<CR>
nnoremap <leader>ab :AsyncTask build<CR>
nnoremap <leader>at :AsyncTask test<CR>
nnoremap <leader>aq :call asyncrun#quickfix_toggle(8)<CR>

" - - - - - - - - - - - - - -
" Plug 'tpope/vim-fugitive'                                     " git in vim
" - - - - - - - - - - - - - -
nnoremap <leader>gs  :Gstatus<CR>

" vim: ft=vim

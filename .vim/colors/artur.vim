set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="artur"
"  what?                     cterm         ctermfg         ctermbg         term          gui         guifg         guibg
" cursor
hi LineNr                    cterm=NONE    ctermfg=240     ctermbg=NONE    term=NONE     gui=NONE    guifg=NONE    guibg=NONE
hi CursorLine                cterm=NONE    ctermfg=NONE    ctermbg=232     term=NONE     gui=NONE    guifg=NONE    guibg=NONE
hi CursorLineNr              cterm=NONE    ctermfg=255     ctermbg=NONE    term=NONE     gui=NONE    guifg=NONE    guibg=NONE
hi CursorColumn              cterm=NONE    ctermfg=NONE    ctermbg=232     term=NONE     gui=NONE    guifg=NONE    guibg=NONE
" popup menu
hi Pmenu                     cterm=NONE    ctermfg=255     ctermbg=240     term=NONE     gui=NONE    guifg=NONE    guibg=NONE
hi PmenuSel                  cterm=bold    ctermfg=255     ctermbg=1       term=NONE     gui=NONE    guifg=NONE    guibg=NONE
" non-printable symbols
hi NonText                   cterm=bold    ctermfg=190     ctermbg=NONE    term=NONE     gui=NONE    guifg=NONE    guibg=NONE
hi SpecialKey                cterm=bold    ctermfg=190     ctermbg=NONE    term=NONE     gui=NONE    guifg=NONE    guibg=NONE
" search higlight
hi Search                    cterm=bold    ctermfg=255     ctermbg=4       term=NONE     gui=NONE    guifg=NONE    guibg=NONE
" language general
hi Comment                   cterm=NONE    ctermfg=245     ctermbg=NONE    term=NONE     gui=NONE    guifg=NONE    guibg=NONE
hi Function                  cterm=NONE    ctermfg=28      ctermbg=NONE    term=NONE     gui=NONE    guifg=NONE    guibg=NONE
hi Identifier                cterm=NONE    ctermfg=28      ctermbg=NONE    term=NONE     gui=NONE    guifg=NONE    guibg=NONE

" C/C++
hi cInclude                  cterm=NONE    ctermfg=28      ctermbg=NONE    term=NONE     gui=NONE    guifg=NONE    guibg=NONE
hi cIncluded                 cterm=BOLD    ctermfg=40      ctermbg=NONE    term=NONE     gui=NONE    guifg=NONE    guibg=NONE
hi cStatement                cterm=NONE    ctermfg=184     ctermbg=NONE    term=NONE     gui=NONE    guifg=NONE    guibg=NONE
hi cppBoolean                cterm=NONE    ctermfg=40      ctermbg=NONE    term=NONE     gui=NONE    guifg=NONE    guibg=NONE

" color of matched brace
hi MatchParen                cterm=BOLD    ctermfg=4       ctermbg=NONE    term=NONE     gui=NONE    guifg=NONE    guibg=NONE



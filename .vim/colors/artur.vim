set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="artur"
"  what?                     cterm         ctermfg         ctermbg         term          gui         guifg         guibg
hi LineNr                    cterm=NONE    ctermfg=240     ctermbg=NONE    term=NONE     gui=NONE    guifg=NONE    guibg=NONE
hi CursorLine                cterm=NONE    ctermfg=NONE    ctermbg=232     term=NONE     gui=NONE    guifg=NONE    guibg=NONE
hi CursorLineNr              cterm=NONE    ctermfg=255     ctermbg=NONE    term=NONE     gui=NONE    guifg=NONE    guibg=NONE
hi CursorColumn              cterm=NONE    ctermfg=NONE    ctermbg=232     term=NONE     gui=NONE    guifg=NONE    guibg=NONE

hi Pmenu                     cterm=bold    ctermfg=255     ctermbg=240     term=NONE     gui=NONE    guifg=NONE    guibg=NONE
hi PmenuSel                  cterm=bold    ctermfg=255     ctermbg=232     term=NONE     gui=NONE    guifg=NONE    guibg=NONE



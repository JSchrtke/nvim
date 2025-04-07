vim.cmd([[
set nu rnu hls is scs
set nowrap
set listchars=tab:«•»,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set mouse=a
set textwidth=120
set shiftwidth=4 tabstop=4 expandtab
set colorcolumn=120
set ignorecase
set smartcase

" Wez's VIM colors for Dark background
" vim:ts=2:sw=2:et:

hi clear
if exists("syntax on")
  syntax reset
endif
let g:colors_name = "wez"
let &background="dark"

" The palette is taken from my xterm colors:
" XTerm*background:	black
" XTerm*foreground:	grey70
" XTerm*VT100*color0: black                  black
" XTerm*VT100*color1: rgb:cc/55/55           red
" XTerm*VT100*color2: rgb:55/cc/55           green
" XTerm*VT100*color3: rgb:cc/cc/55           yellow
" XTerm*VT100*color4: rgb:55/55/cc           blue
" XTerm*VT100*color5: rgb:cc/55/cc           magenta
" XTerm*VT100*color6: rgb:55/cc/cc           cyan
" XTerm*VT100*color7: rgb:cc/cc/cc           white
" XTerm*VT100*color8: rgb:55/55/55           bright black
" XTerm*VT100*color9: rgb:ff/55/55           bright red
" XTerm*VT100*color10: rgb:55/ff/55          bright green
" XTerm*VT100*color11: rgb:ff/ff/55          bright yellow
" XTerm*VT100*color12: rgb:55/55/ff          bright blue
" XTerm*VT100*color13: rgb:ff/55/ff          bright magenta
" XTerm*VT100*color14: rgb:55/ff/ff          bright cyan
" XTerm*VT100*color15: rgb:ff/ff/ff          bright white
" XTerm*VT100*colorUL: tomato                use tomato for underline
" XTerm*VT100*colorBD: white                 use white for bold

hi SignColumn ctermbg=NONE guibg=NONE

" I prefer to use color indices rather than names to avoid unpredictable
" color selection when high color terminals are used

" Grey
hi Normal       term=NONE ctermfg=7 guifg=#c3c3c3 guibg=NONE

if has("gui_running")
  hi Normal guibg=black
endif

" Yellow
hi Statement    term=bold cterm=None ctermfg=Yellow ctermbg=NONE
                \ gui=bold guifg=#ffff55 guibg=NONE

" Blue
hi PreProc      term=underline cterm=NONE ctermfg=blue ctermbg=NONE
                \ gui=NONE guifg=#8888ff guibg=NONE

" Cyan
hi Comment      term=bold cterm=italic ctermfg=LightCyan ctermbg=black
                \ gui=NONE guifg=#55cccc guibg=NONE

" Magenta
hi Constant     term=underline cterm=NONE ctermfg=DarkMagenta ctermbg=NONE
                \ gui=NONE guifg=#ff55ff guibg=NONE

" Magenta
hi String     term=underline cterm=NONE ctermfg=DarkMagenta ctermbg=NONE
                \ gui=NONE guifg=#ff55ff guibg=NONE

hi Character       term=underline cterm=NONE ctermfg=DarkMagenta ctermbg=NONE
                       \ gui=NONE guifg=#ff55ff guibg=NONE

hi Number          term=underline cterm=NONE ctermfg=DarkMagenta ctermbg=NONE
                       \ gui=NONE guifg=#ff55ff guibg=NONE

hi Boolean         term=underline cterm=NONE ctermfg=DarkMagenta ctermbg=NONE
                            \ gui=NONE guifg=#ff55ff guibg=NONE

" Red-ish; Orange in gui for better contrast
" Special chars are things like \n in a quoted string
hi Special      term=bold cterm=None ctermfg=DarkRed ctermbg=NONE
                \ gui=NONE guifg=Orange guibg=NONE
hi SpecialComment      term=bold cterm=italic ctermfg=DarkRed ctermbg=NONE
                \ gui=NONE guifg=Orange guibg=NONE
hi LineNr       term=bold cterm=bold ctermfg=DarkRed ctermbg=NONE
                \ gui=NONE guifg=Orange guibg=NONE

hi Folded       term=underline cterm=bold ctermfg=DarkCyan ctermbg=NONE
                \ gui=NONE guifg=#55cccc guibg=#555555

" Green for types
hi Type         term=underline cterm=None ctermfg=DarkGreen ctermbg=NONE
                \ gui=bold guifg=#55ff55 guibg=NONE

" Regular cyan for special function names etc.
hi Identifier   term=underline cterm=NONE ctermfg=DarkCyan ctermbg=NONE
                \ gui=NONE guifg=#55cccc guibg=NONE

hi Underlined   term=underline cterm=underline,bold ctermfg=DarkBlue
                \ gui=underline guifg=#5555ff

hi Ignore       term=NONE cterm=NONE ctermfg=black ctermbg=NONE
                \ gui=NONE guifg=bg guibg=NONE

hi Todo    term=standout cterm=italic ctermfg=Black ctermbg=LightCyan guifg=Orange guibg=#442222
hi IncSearch    term=reverse cterm=none ctermfg=Black ctermbg=DarkYellow
                \ gui=NONE guifg=black guibg=Orange
hi Search       term=reverse cterm=none ctermfg=Black ctermbg=DarkYellow
                \ gui=NONE guifg=black guibg=#cc55cc

hi Cursor       guifg=black guibg=#53ae71

hi Visual       term=reverse cterm=bold ctermfg=0 ctermbg=6
                \ gui=NONE guifg=black guibg=#55cccc


" NonText are things like the tilde after EOF. Greenish works well in GUI,
" and dark red in a terminal
hi NonText      term=NONE cterm=NONE ctermfg=1 gui=bold guifg=SeaGreen
hi SpecialKey   term=NONE cterm=NONE ctermfg=8 gui=NONE guifg=#666666 guibg=NONE

hi StatusLineNC cterm=NONE ctermbg=DarkGrey ctermfg=black gui=NONE
                \ guifg=black guibg=#555555
hi StatusLine   cterm=bold ctermbg=DarkBlue ctermfg=White gui=NONE
                \ guifg=#cccccc guibg=#5555cc

" pop-up menu
hi Pmenu        cterm=NONE ctermfg=0 ctermbg=4 gui=NONE
                \ guifg=black guibg=#5555cc
hi PmenuSel     cterm=NONE ctermfg=4 ctermbg=0 gui=NONE
                \ guifg=#cc55cc guibg=#2222aa
hi PmenuSbar    cterm=NONE ctermfg=5 ctermbg=0 gui=NONE
                \ guifg=black guibg=#cccccc
hi PmenuThumb   cterm=NONE ctermfg=1 ctermbg=6 gui=NONE
                \ guifg=black guibg=NONE

hi link Float           Number
hi link Function        Identifier
hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Operator        Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special

hi SpellBad term=underline cterm=underline,bold ctermfg=4
                \ gui=underline guifg=#5555ff

hi DiffAdd ctermfg=NONE ctermbg=22
hi DiffChange ctermfg=NONE ctermbg=23
hi DiffText ctermfg=NONE ctermbg=23
hi DiffDelete ctermfg=NONE ctermbg=52

" here's an example line that will wrap so that I can see how the showbreak stuff renders.

]])

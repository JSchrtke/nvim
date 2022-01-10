" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
    GuiFont! BlexMono\ NF:h13
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 0
endif

" if exists(':GuiRenderLigatures')
"     GuiRenderLigatures 1
" endif

" if exists(':GuiLinespace')
"     GuiLinespace 7
" endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv

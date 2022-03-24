" nvui
if exists(':NvuiAnimationsEnabled')
    set guifont=JetBrainsMono\ NF:h13
    :NvuiCursorAnimationDuration 0.02
    :NvuiMoveAnimationDuration 0.08
    :NvuiSnapshotLimit 64
    :NvuiTitlebarFontFamily BlexMono\ NF
    :NvuiScrollAnimationDuration 0.06
endif

" neovide
set guifont=JetBrainsMono\ NF:h13
let g:neovide_refresh_rate = 144
let g:neovide_cursor_animation_length = 0.025
let g:neovide_cursor_antialiasing=v:true

" guifont size + 1
function! s:ZoomIn()
  let l:fsize = substitute(&guifont, '^.*:h\([^:]*\).*$', '\1', '')
  let l:fsize += 1
  let l:guifont = substitute(&guifont, ':h\([^:]*\)', ':h' . l:fsize, '')
  let &guifont = l:guifont
endfunction

" guifont size - 1
function! s:ZoomOut()
  let l:fsize = substitute(&guifont, '^.*:h\([^:]*\).*$', '\1', '')
  let l:fsize -= 1
  let l:guifont = substitute(&guifont, ':h\([^:]*\)', ':h' . l:fsize, '')
  let &guifont = l:guifont
endfunction

" command
command! -narg=0 ZoomIn    :call s:ZoomIn()
command! -narg=0 ZoomOut   :call s:ZoomOut()
command! -narg=0 ZoomReset :call s:ZoomReset()

" map
nmap + :ZoomIn<CR>
nmap - :ZoomOut<CR>

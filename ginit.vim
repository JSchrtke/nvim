" neovide
set guifont=JetBrainsMono\ NF:h13
let g:neovide_refresh_rate = 144
let g:neovide_cursor_animation_length = 0.02
let g:neovide_cursor_trail_length=2
let g:neovide_cursor_antialiasing=v:true
let g:neovide_touch_deadzone=6.0
let g:neovide_touch_drag_timeout=0.17
let g:neovide_cursor_unfocused_outline_width=0.125
let g:neovide_floating_opacity=1
let g:neovide_fullscreen=v:true
lua << EOF
    vim.g.terminal_color_0 = "#090618"
    vim.g.terminal_color_1 = "#c34043"
    vim.g.terminal_color_2 = "#76946a"
    vim.g.terminal_color_3 = "#c0a36e"
    vim.g.terminal_color_4 = "#7e9cd8"
    vim.g.terminal_color_5 = "#957fb8"
    vim.g.terminal_color_6 = "#6a9589"
    vim.g.terminal_color_7 = "#c8c093"
    vim.g.terminal_color_8 = "#727169"
    vim.g.terminal_color_9 = "#e82424"
    vim.g.terminal_color_10 = "#98bb6c"
    vim.g.terminal_color_11 = "#e6c384"
    vim.g.terminal_color_12 = "#7fb4ca"
    vim.g.terminal_color_13 = "#938aa9"
    vim.g.terminal_color_14 = "#7aa89f"
    vim.g.terminal_color_15 = "#dcd7ba"
EOF

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

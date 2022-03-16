set colorcolumn=80
set textwidth=80
set tabstop=2
set shiftwidth=2

filetype plugin indent on
syntax enable

" settings for sumatraPDF
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'

setlocal tabstop=8
setlocal softtabstop=8
setlocal shiftwidth=8
setlocal noexpandtab
setlocal textwidth=80
setlocal colorcolumn=80
setlocal nomodeline

function! Format()
    let l:current_file = expand('%')
    execute '!clang-format -i '.current_file
endfunction

lua << EOF
require("which-key").register({
    r = {
        name = "+run in terminal",
        p = {"<cmd>Topen|T ./build_and_run.bat<cr>", "compile and run"},
        f = {"<cmd>call Format()<CR>", "formatter"},
    },
},  { prefix = "<leader>"})
EOF

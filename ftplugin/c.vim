setlocal tabstop=8
setlocal softtabstop=8
setlocal shiftwidth=8
setlocal noexpandtab
setlocal textwidth=80
setlocal colorcolumn=80
setlocal nomodeline

lua << EOF
require("which-key").register({
    r = {
        name = "+run in terminal",
        p = {"<cmd>Topen|T ./build_and_run.bat<cr>", "compile and run"},
    },
},  { prefix = "<leader>"})
EOF

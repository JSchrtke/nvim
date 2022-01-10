lua << EOF
if vim.fn.has('win32') then
    require("which-key").register({
        ["<leader>rp"] = {"<cmd>T build_and_run.bat<cr>", "project"}
    })
else
    require("which-key").register({
        ["<leader>rp"] = {"<cmd>T bash build_and_run.sh<cr>", "project"}
    })
end
EOF

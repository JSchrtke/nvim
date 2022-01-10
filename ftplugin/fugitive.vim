setlocal signcolumn=no
lua << EOF
require('which-key').register({
    ["<leader>gf"] = {"<cmd>Git fetch -a<cr>", "git fetch"},
    ["<leader>gp"] = {"<cmd>Git pull<cr>", "git pull"},
    ["<leader>gP"] = {"<cmd>Git push<cr>", "git push"},
})
EOF

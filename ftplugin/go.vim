set colorcolumn=80
setlocal makeprg=go
setlocal textwidth=80
setlocal noexpandtab

lua << EOF
local map = vim.api.nvim_set_keymap

map(
    'n',
    '<leader>rp',
    "<cmd>lua require('harpoon.term').sendCommand(2, '')<cr><cmd>lua require('harpoon.term').sendCommand(2, 'go run .')<cr><cmd>lua require('harpoon.term').gotoTerminal(2)<cr>",
    {}
)
map(
    'n',
    '<leader>rt',
    "<cmd>lua require('harpoon.term').sendCommand(3, 'go test')<cr><cmd>lua require('harpoon.term').gotoTerminal(3)<cr>",
    {}
)
map(
    'n',
    '<leader>rf',
    ":!go fmt<cr>",
    {}
)
EOF

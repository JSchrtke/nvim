set colorcolumn=80
setlocal makeprg=go
setlocal textwidth=80
setlocal noexpandtab

lua << EOF
local map = vim.api.nvim_set_keymap

map(
    'n',
    '<leader>rp',
    "<cmd>lua require('harpoon.term').sendCommand(1, 'go run .')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>",
    {}
)
map(
    'n',
    '<leader>rt',
    "<cmd>lua require('harpoon.term').sendCommand(1, 'go test')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>",
    {}
)
map(
    'n',
    '<leader>rf',
    "<cmd>lua require('harpoon.term').sendCommand(1, 'go fmt')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>",
    {}
)
EOF

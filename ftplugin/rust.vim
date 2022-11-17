lua << EOF
local map = vim.api.nvim_set_keymap
map('n', '<leader>rp', "<cmd>lua require('harpoon.term').sendCommand(1, 'cargo run')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", {})
map('n', '<leader>rt', "<cmd>lua require('harpoon.term').sendCommand(1, 'cargo test')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", {})
map('n', '<leader>rf', ":!cargo fmt<cr>", {})
EOF

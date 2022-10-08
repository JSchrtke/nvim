lua << EOF
local map = vim.api.nvim_set_keymap
map('n', '<leader>rp', "<cmd>lua require('harpoon.term').sendCommand(1, 'cargo run')<cr>", {})
map('n', '<leader>rt', "<cmd>lua require('harpoon.term').sendCommand(1, 'cargo test')<cr>", {})
map('n', '<leader>rf', "<cmd>lua require('harpoon.term').sendCommand(1, 'cargo fmt')<cr>", {})
EOF

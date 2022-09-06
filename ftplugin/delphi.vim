lua << EOF
local map = vim.api.nvim_set_keymap

map('n', '<leader>rp', "<cmd>lua require('harpoon.term').sendCommand(1, '.\\\\build_and_run.bat')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", {})
EOF

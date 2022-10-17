setlocal shiftwidth=2 tabstop=2 expandtab
setlocal textwidth=90 formatoptions-=t
setlocal commentstring=//\ %s
set colorcolumn=90

lua << EOF
local map = vim.api.nvim_set_keymap

map('n', '<leader>rp', "<cmd>lua require('harpoon.term').sendCommand(1, '.\\\\run.bat')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", {})
map('n', '<leader>rt', "<cmd>lua require('harpoon.term').sendCommand(1, '.\\\\test.bat')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", {})
map('n', '<leader>rb', "<cmd>lua require('harpoon.term').sendCommand(1, '.\\\\build.bat')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", {})
map('n', '<leader>rf', "<cmd>lua require('harpoon.term').sendCommand(1, '.\\\\fmt.bat')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", {})
EOF

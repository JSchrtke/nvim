vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap

-- navigation
map('n', '<leader><leader>', '<C-6>', {})
map('n', 'cd', ':Telescope zoxide list<CR>', {})

-- quickfix list
map('n', '<C-n>', ':cnext<cr>', {})
map('n', '<C-p>', ':cprev<cr>', {})

-- telescope
local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions
local themes = require("telescope.themes")
vim.keymap.set('n', '<leader>f', function() builtin.find_files(themes.get_ivy()) end)
vim.keymap.set('n', '<leader>b', function() builtin.buffers(themes.get_ivy()) end)
vim.keymap.set('n', '<leader>/', function() builtin.current_buffer_fuzzy_find(themes.get_ivy()) end)
vim.keymap.set('n', '<leader>g', function() extensions.live_grep_args.live_grep_args(themes.get_ivy()) end)
vim.keymap.set('n', '<leader>w', function() builtin.grep_string(themes.get_ivy()) end)
vim.keymap.set('n', 'g?', function() builtin.help_tags(themes.get_ivy()) end)
vim.keymap.set('n', '<leader>o', function() builtin.oldfiles(themes.get_ivy()) end)
vim.keymap.set('n', '<leader>t', function() builtin.resume(themes.get_ivy()) end)
vim.keymap.set('n', 'ss', function() builtin.lsp_document_symbols(themes.get_ivy()) end)
vim.keymap.set('n', '<leader>q', function() builtin.quickfix(themes.get_ivy()) end)

-- harpoon
map('n', '<leader>m', ':lua require("harpoon.mark").add_file()<cr>', {})
map('n', 'sm', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', {})
map('n', '<leader>h', ':lua require("harpoon.ui").nav_file(1)<cr>', {})
map('n', '<leader>j', ':lua require("harpoon.ui").nav_file(2)<cr>', {})
map('n', '<leader>k', ':lua require("harpoon.ui").nav_file(3)<cr>', {})
map('n', '<leader>l', ':lua require("harpoon.ui").nav_file(4)<cr>', {})
map('n', '<C-\'>', ':lua require("harpoon.term").gotoTerminal(1)<cr>', {})
map('n', '<C-h>', ':lua require("harpoon.term").gotoTerminal(1)<cr>', {})
map('n', '<C-j>', ':lua require("harpoon.term").gotoTerminal(2)<cr>', {})
map('n', '<C-k>', ':lua require("harpoon.term").gotoTerminal(3)<cr>', {})
map('n', '<leader>rh', "<cmd>lua vim.ui.input({ prompt = '1 > '}, function(input) require('harpoon.term').sendCommand(1, input) end)<cr>", {})
map('n', '<leader>rj', "<cmd>lua vim.ui.input({ prompt = '2 > '}, function(input) require('harpoon.term').sendCommand(2, input) end)<cr>", {})
map('n', '<leader>rk', "<cmd>lua vim.ui.input({ prompt = '3 > '}, function(input) require('harpoon.term').sendCommand(3, input) end)<cr>", {})

-- run things
map('n', '<leader>rp', "<cmd>lua require('harpoon.term').sendCommand(1, './run.sh')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", {})
map('n', '<leader>rt', "<cmd>lua require('harpoon.term').sendCommand(1, './test.sh')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", {})
map('n', '<leader>rb', "<cmd>lua require('harpoon.term').sendCommand(1, './build.sh')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", {})
map('n', '<leader>rf', ":lua vim.lsp.buf.format()<cr>", {})

-- terminal mappings
map('t', '<C-w>n', '<C-\\><C-n>', {})

-- yanky.nvim
map("n", "y", "<Plug>(YankyYank)", {})
map("x", "y", "<Plug>(YankyYank)", {})
map("n", "p", "<Plug>(YankyPutAfter)", {})
map("n", "P", "<Plug>(YankyPutBefore)", {})
map("x", "p", "<Plug>(YankyPutAfter)", {})
map("x", "P", "<Plug>(YankyPutBefore)", {})
map("n", "gp", "<Plug>(YankyGPutAfter)", {})
map("n", "gP", "<Plug>(YankyGPutBefore)", {})
map("x", "gp", "<Plug>(YankyGPutAfter)", {})
map("x", "gP", "<Plug>(YankyGPutBefore)", {})
map("n", "<leader>n", "<Plug>(YankyCycleForward)", {})
map("n", "<leader>p", "<Plug>(YankyCycleBackward)", {})

-- git
map("n", "sc", ":Gitsigns preview_hunk_inline<cr>", {})
map("n", "]c", ":Gitsigns next_hunk<cr>", {})
map("n", "[c", ":Gitsigns prev_hunk<cr>", {})
map("n", "dc", ":Gitsigns reset_hunk<cr>", {})
map("n", "sl", ":GcLog<cr>", {})
map("n", "co", ":Telescope git_branches<cr>", {})

-- diagnostic
vim.api.nvim_set_keymap("n", "sd", ":lua vim.diagnostic.open_float()<CR>", {})
vim.api.nvim_set_keymap("n", "sD", ":lua require('lsp-lines-config').toggle()<CR>", {})
vim.api.nvim_set_keymap("n", "sad", ":lua vim.diagnostic.setqflist({ title = 'Diagnostics' })<CR>", {})
vim.api.nvim_set_keymap("n", "se", ":lua vim.diagnostic.setqflist({ title = 'Errors', severity = vim.diagnostic.severity.ERROR })<CR>", {})
map("n", "]e", ":lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>", {})
map("n", "[e", ":lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>", {})

map("n", "sr", ":lua vim.lsp.buf.references()<CR>", {})

-- dir browser
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- zen mode
vim.keymap.set("n", "<C-w>z", ":ZenMode<CR>", { desc = "toggle zen mode" })

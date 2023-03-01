vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap

-- navigation
map('n', '<leader><leader>', '<C-6>', {})

-- quickfix list
map('n', '<C-n>', ':cnext<cr>', {})
map('n', '<C-p>', ':cprev<cr>', {})

-- telescope
map('n', '<leader>f', ':Telescope find_files<cr>', {})
map('n', '<leader>b', ':Telescope buffers<cr>', {})
map('n', '<leader>/', ':Telescope current_buffer_fuzzy_find<cr>', {})
map('n', '<leader>g', ':Telescope live_grep<cr>', {})
map('n', '<leader>w', ':Telescope grep_string<cr>', {})
map('n', '<leader>?', ':Telescope help_tags<cr>', {})
map('n', '<leader>o', ':Telescope oldfiles<cr>', {})
map('n', '<leader>t', ':Telescope resume<cr>', {})
map('n', 'ss', ':Telescope lsp_document_symbols<cr>', {})

-- harpoon
map('n', '<leader>m', ':lua require("harpoon.mark").add_file()<cr>', {})
map('n', '<leader>sm', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', {})
map('n', '<leader>h', ':lua require("harpoon.ui").nav_file(1)<cr>', {})
map('n', '<leader>j', ':lua require("harpoon.ui").nav_file(2)<cr>', {})
map('n', '<leader>k', ':lua require("harpoon.ui").nav_file(3)<cr>', {})
map('n', '<leader>l', ':lua require("harpoon.ui").nav_file(4)<cr>', {})
map('n', '<C-h>', ':lua require("harpoon.term").gotoTerminal(1)<cr>', {})
map('n', '<C-j>', ':lua require("harpoon.term").gotoTerminal(2)<cr>', {})
map('n', '<C-k>', ':lua require("harpoon.term").gotoTerminal(3)<cr>', {})
map('n', '<leader>rh', "<cmd>lua vim.ui.input({ prompt = '1 > '}, function(input) require('harpoon.term').sendCommand(1, input) end)<cr>", {})
map('n', '<leader>rj', "<cmd>lua vim.ui.input({ prompt = '2 > '}, function(input) require('harpoon.term').sendCommand(2, input) end)<cr>", {})
map('n', '<leader>rk', "<cmd>lua vim.ui.input({ prompt = '3 > '}, function(input) require('harpoon.term').sendCommand(3, input) end)<cr>", {})

-- run things
map('n', '<leader>rp', "<cmd>lua require('harpoon.term').sendCommand(1, './run.sh')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", {})
map('n', '<leader>rt', "<cmd>lua require('harpoon.term').sendCommand(1, './test.sh')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", {})
map('n', '<leader>rf', ":!./fmt.sh<cr>", {})

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

-- spectre
map("n", "<leader>R", ":lua require('spectre').open_visual({select_word=true})<CR>", {})

-- diagnostic
map("n", "sd", ":lua require('lsp-lines-config').toggle()<CR>", {})
map("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", {})
map("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", {})

-- glance
map("n", "sr", ":lua vim.lsp.buf.references()<CR>", {})

-- dirbuf
map("n", "<leader>e", ":Dirbuf <CR>", {})

map("n", "<C-w>z", ":NoNeckPain <CR>", {})

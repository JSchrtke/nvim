vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap

-- quickfix list
map('n', '<leader>n', ':cnext<cr>', {})
map('n', '<leader>p', ':cprev<cr>', {})

-- telescope
map('n', '<leader>f', ':Telescope find_files<cr>', {})
map('n', '<leader>b', ':Telescope buffers<cr>', {})
map('n', '<leader>/', ':Telescope current_buffer_fuzzy_find<cr>', {})
map('n', '<leader>g', ':Telescope live_grep<cr>', {})
map('n', '<leader>w', ':Telescope grep_string<cr>', {})
map('n', '<leader>?', ':Telescope help_tags<cr>', {})
map('n', '<leader>o', ':Telescope oldfiles<cr>', {})
map('n', '<leader><leader>', ':Telescope resume<cr>', {})


-- harpoon
map('n', '<leader>m', ':lua require("harpoon.mark").add_file()<cr>', {})
map('n', '<leader>M', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', {})
map('n', '<leader>h', ':lua require("harpoon.ui").nav_file(1)<cr>', {})
map('n', '<leader>j', ':lua require("harpoon.ui").nav_file(2)<cr>', {})
map('n', '<leader>k', ':lua require("harpoon.ui").nav_file(3)<cr>', {})
map('n', '<leader>l', ':lua require("harpoon.ui").nav_file(4)<cr>', {})
map('n', '<leader>t', ':lua require("harpoon.term").gotoTerminal(1)<cr>', {})
map('n', '<leader>rr', "<cmd>lua vim.ui.input({ prompt = '> '}, function(input) require('harpoon.term').sendCommand(1, input) end)<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", {})

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
map("n", "<c-n>", "<Plug>(YankyCycleForward)", {})
map("n", "<c-p>", "<Plug>(YankyCycleBackward)", {})

-- gitsigns
map("n", "<leader>sc", ":Gitsigns preview_hunk<cr>", {})
map("n", "<leader>c", ":Gitsigns next_hunk<cr>", {})
map("n", "<leader>C", ":Gitsigns prev_hunk<cr>", {})

-- spectre
map("n", "<leader>R", ":lua require('spectre').open_visual({select_word=true})<CR>", {})

-- diagnostic
map("n", "<leader>sd", ":lua vim.diagnostic.open_float()<CR>", {})
map("n", "<leader>d", ":lua vim.diagnostic.goto_next()<CR>", {})
map("n", "<leader>D", ":lua vim.diagnostic.goto_prev()<CR>", {})

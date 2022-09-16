vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap

-- movements
map('n', '<leader>h', '<C-w>h', {})
map('n', '<leader>j', '<C-w>j', {})
map('n', '<leader>k', '<C-w>k', {})
map('n', '<leader>l', '<C-w>l', {})

-- window management
map('n', '<leader>wo', '<C-w>o', {})
map('n', '<leader>qw', '<C-w>q', {})

-- telescope
map('n', '<leader>of', ':Telescope find_files<cr>', {})
map('n', '<leader>ob', ':Telescope buffers<cr>', {})
map('n', '<leader>ff', ':Telescope current_buffer_fuzzy_find<cr>', {})
map('n', '<leader>fd', ':Telescope live_grep<cr>', {})
map('n', '<leader>fw', ':Telescope grep_string<cr>', {})
map('n', '<leader>fh', ':Telescope help_tags<cr>', {})

-- harpoon
map('n', '<leader>m', ':lua require("harpoon.mark").add_file()<cr>', {})
map('n', '<leader>sh', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', {})
map('n', 'gh', ':lua require("harpoon.ui").nav_file(1)<cr>', {})
map('n', 'gj', ':lua require("harpoon.ui").nav_file(2)<cr>', {})
map('n', 'gk', ':lua require("harpoon.ui").nav_file(3)<cr>', {})
map('n', 'gl', ':lua require("harpoon.ui").nav_file(4)<cr>', {})
map('n', '<leader>t', ':lua require("harpoon.term").gotoTerminal(1)<cr>', {})

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

-- spectre
map("n", "R", ":lua require('spectre').open_visual({select_word=true})<CR>", {})

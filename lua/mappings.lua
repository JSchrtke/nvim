vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap

-- movements
map('n', '<leader>h', '<C-w>h', {})
map('n', '<leader>j', '<C-w>j', {})
map('n', '<leader>k', '<C-w>k', {})
map('n', '<leader>l', '<C-w>l', {})

-- window management
map('n', '<leader>wo', '<C-w>o', {})

-- telescope
map('n', '<leader>of', ':Telescope find_files<cr>', {})
map('n', '<leader>ff', ':Telescope current_buffer_fuzzy_find<cr>', {})

-- harpoon
map('n', '<leader>m', ':lua require("harpoon.mark").add_file()<cr>', {})
map('n', '<leader>sh', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', {})
map('n', 'gh', ':lua require("harpoon.ui").nav_file(1)<cr>', {})
map('n', 'gj', ':lua require("harpoon.ui").nav_file(2)<cr>', {})
map('n', 'gk', ':lua require("harpoon.ui").nav_file(3)<cr>', {})
map('n', 'gl', ':lua require("harpoon.ui").nav_file(4)<cr>', {})

-- terminal mappings
map('t', '<C-w>n', '<C-\\><C-n>', {})

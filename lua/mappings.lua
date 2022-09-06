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

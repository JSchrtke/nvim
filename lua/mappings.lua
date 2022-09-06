vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap
map('n', '<leader>of', ':Telescope find_files<cr>', {})

" Basic settings
lua << EOF
vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
EOF

" Make it easier to escape from terminal insert mode
lua << EOF
vim.api.nvim_set_keymap("t", "<C-w>n", "<C-\\><C-n>", {})
EOF

" Basic settings
lua << EOF
vim.o.number = true
vim.o.relativenumber = true
EOF

" Make it easier to escape from terminal insert mode
lua << EOF
vim.api.nvim_set_keymap("t", "<C-w>n", "<C-\\><C-n>", {})
EOF

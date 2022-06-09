" Basic settings
lua << EOF
vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.clipboard = "unnamedplus"
EOF

" Keymaps
let mapleader = "\<Space>"
lua << EOF
local map = function(mode, left, right, options)
    local opts = options or {}
    vim.api.nvim_set_keymap(mode, left, right, opts)
end

-- Buffer navigation
map("t", "<C-w>n", "<C-\\><C-n>")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>L", "<C-w>L")
map("n", "<leader>H", "<C-w>H")
map("n", "<leader>K", "<C-w>K")
map("n", "<leader>J", "<C-w>J")
map("n", "<leader>q", "<C-w>q")
map("n", "<leader>o", "<C-w>o")
map("n", "<leader>v", "<C-w>v")
map("n", "<leader>s", "<C-w>s")

-- Git
map("n", "<leader>gs", "<cmd>G<cr>")
map("n", "<leader>dp", "<cmd>diffput<cr>")
map("n", "<leader>dg", "<cmd>diffget<cr>")
EOF

" Install plugins
call plug#begin('~/.vim/plugged')
Plug 'phha/zenburn.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'tpope/vim-fugitive'
call plug#end()

" Colors
lua << EOF
vim.cmd("colorscheme zenburn")
EOF

" Configure nvim-treesitter
lua << EOF
require("nvim-treesitter.configs").setup({
    ensure_installed = {"c", "cpp", "lua", "vim", "go", "rust", "java", "markdown"},
    highlight = {
        enable = true,
    },
})
EOF

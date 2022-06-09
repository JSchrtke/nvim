lua << EOF
-- Basic settings
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
vim.o.cursorline = true

-- keymaps
vim.g.mapleader = " "
local map = function(mode, left, right, options)
    local opts = options or {}
    vim.api.nvim_set_keymap(mode, left, right, opts)
end

-- navigation and layout
map("t", "<C-w>n", "<C-\\><C-n>")

map("n", "<leader>l", "<C-w>l")
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>L", "<C-w>L")
map("n", "<leader>H", "<C-w>H")
map("n", "<leader>K", "<C-w>K")
map("n", "<leader>J", "<C-w>J")

map("n", "<leader>sl", "<C-w>v<C-w>l")
map("n", "<leader>sh", "<C-w>v")
map("n", "<leader>sk", "<C-w>s<C-w>k")
map("n", "<leader>sj", "<C-w>s<C-w>j")

map("n", "<leader>qw", "<C-w>q")
map("n", "<leader>qW", "<C-w>o")
map("n", "<leader>qt", "<cmd>tabclose<cr>")
map("n", "<leader>qT", "<cmd>tabonly<cr>")

-- Git
map("n", "<leader>gs", "<cmd>tabnew<cr><cmd>G<cr>")
map("n", "<leader>gl", "<cmd>tabnew<cr><cmd>Flog<cr>")
map("n", "<leader>dp", "<cmd>diffput<cr>")
map("n", "<leader>dg", "<cmd>diffget<cr>")

-- clipboard
map("n", "y", "<Plug>(YankyYank)")
map("x", "y", "<Plug>(YankyYank)")
map("n", "p", "<Plug>(YankyPutAfter)")
map("n", "P", "<Plug>(YankyPutBefore)")
map("x", "p", "<Plug>(YankyPutAfter)")
map("x", "P", "<Plug>(YankyPutBefore)")
map("n", "gp", "<Plug>(YankyGPutAfter)")
map("n", "gP", "<Plug>(YankyGPutBefore)")
map("x", "gp", "<Plug>(YankyGPutAfter)")
map("x", "gP", "<Plug>(YankyGPutBefore)")
map("n", "<c-n>", "<Plug>(YankyCycleForward)")
map("n", "<c-p>", "<Plug>(YankyCycleBackward)")

-- search
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
map("n", "<leader>ff", "<cmd>Telescope current_buffer_fuzzy_find<cr>")

-- open things
map("n", "<leader>of", "<cmd>Telescope find_files<cr>")
map("n", "<leader>ob", "<cmd>Telescope buffers<cr>")

-- Install plugins
vim.cmd([[
    call plug#begin('~/.vim/plugged')
    Plug 'phha/zenburn.nvim'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'tpope/vim-fugitive'
    Plug 'gbprod/yanky.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'rbong/vim-flog'
    call plug#end()
]])

-- Colors
vim.cmd("colorscheme zenburn")

-- Configure nvim-treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = {"c", "cpp", "lua", "vim", "go", "rust", "java", "markdown", "pascal"},
    highlight = {
        enable = true,
    },
})

-- Configure yanky
require("yanky").setup({
    highlight = {
        on_put = true,
        on_yank = true,
        timer = 200,
    },
    preserve_cursor_position = {
        enabled = true,
    }
})

-- Configure telescope.nvim
require("telescope").setup({})
EOF

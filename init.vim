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
vim.o.laststatus = 3
vim.o.signcolumn = "yes"
vim.o.mouse = "a"

-- Configure keymaps
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
map("n", "<leader>gd", "<cmd>Gvdiffsplit<bar>wincmd l<cr>")
map("n", "<leader>gl", "<cmd>Flog<cr>")
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
map("n", "<leader>fl", "<cmd>Telescope resume<cr>")
map("n", "<leader>fq", "<cmd>Telescope quickfix<cr>")

-- open things
map("n", "<leader>of", "<cmd>Telescope find_files<cr>")
map("n", "<leader>ob", "<cmd>Telescope buffers<cr>")
map("n", "<leader>or", "<cmd>Telescope oldfiles<cr>")

-- Install plugins
vim.cmd([[
    call plug#begin('~/.vim/plugged')
    Plug 'projekt0n/github-nvim-theme'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'tpope/vim-fugitive'
    Plug 'gbprod/yanky.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'rbong/vim-flog'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
    call plug#end()
]])

-- Colors
function set_light_theme()
    require("github-theme").setup({
        theme_style = "light",
        function_style = "bold",
        dark_float = true,
    })
    vim.cmd("highlight! LineNr guifg=#6E7781 guibg=#ffffff")
    vim.cmd("highlight! CursorLineNr gui=bold")
    vim.cmd("highlight! DiffText guibg=#d5e5f6")
end

function set_dark_theme()
    require("github-theme").setup({
        theme_style = "dark_default",
        function_style = "bold",
        dark_float = true,
    })
end

set_light_theme()

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
require("telescope").setup({
    defaults = {
        borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
        layout_strategy = "vertical",
        layout_config = {
            height = vim.o.lines,
            width = vim.o.columns,
            prompt_position = "top",
            preview_height = 0.4,
            preview_cutoff = 0,
            mirror = true,
        },
        sorting_strategy = "ascending",
    },
})

-- Configure LSP

 vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
   vim.lsp.diagnostic.on_publish_diagnostics, {
     update_in_insert = true,
   }
 )

require("nvim-lsp-installer").setup()

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>t', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['gopls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- Configure nvim-cmp
vim.lsp.protocol.CompletionItemKind = {
    Text = " [text]",
    Method = " [method]",
    Function = " [function]",
    Constructor = " [constructor]",
    Field = "ﰠ [field]",
    Variable = " [variable]",
    Class = " [class]",
    Interface = " [interface]",
    Module = " [module]",
    Property = " [property]",
    Unit = " [unit]",
    Value = " [value]",
    Enum = " [enum]",
    Keyword = " [key]",
    Snippet = "﬌ [snippet]",
    Color = " [color]",
    File = " [file]",
    Reference = " [reference]",
    Folder = " [folder]",
    EnumMember = " [enum member]",
    Constant = " [constant]",
    Struct = " [struct]",
    Event = "⌘ [event]",
    Operator = " [operator]",
    TypeParameter = " [type]",
}

local cmp = require 'cmp'
cmp.setup({
    experimental = {
        ghost_text = true
    },

    preselect = cmp.PreselectMode.None,

    completion = {
        completeopt = 'menu,menuone,noinsert',
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = string.format("[%s]", entry.source.name)

            vim_item.kind = vim.lsp.protocol.CompletionItemKind[vim_item.kind]
            return vim_item
        end,
    },

    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-q>"] = cmp.mapping.close(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<cr>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }
        )
    },

    sources = {
        {
            name = 'nvim_lsp',
            priority = 1000
        },
        {
            name = 'nvim_lsp_signature_help',
            priority = 1000
        },
        {
            name = 'vsnip',
            priority = 100
        },
        {
            name = 'path',
            priority = 10
        },
    },
})

EOF

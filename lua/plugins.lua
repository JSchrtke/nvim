require("packer").startup(function(use)
use "wbthomason/packer.nvim"
use "nvim-telescope/telescope.nvim"
use "nvim-lua/plenary.nvim"
use "rebelot/kanagawa.nvim"
use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
}
use 'JSchrtke/harpoon'
use 'rkennedy/vim-delphi'
use 'gbprod/yanky.nvim'
use 'ishan9299/nvim-solarized-lua'
use 'tpope/vim-commentary'
use 'lewis6991/gitsigns.nvim'
use 'nvim-treesitter/nvim-treesitter-context'
use 'ethanholz/nvim-lastplace'
use 'ishan9299/modus-theme-vim'
use 'Pocco81/auto-save.nvim'
use 'tpope/vim-fugitive'
use 'nvim-pack/nvim-spectre'
use 'savq/melange'
use "williamboman/mason.nvim"
use "williamboman/mason-lspconfig.nvim"
use "neovim/nvim-lspconfig"
use "simrat39/rust-tools.nvim"
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/vim-vsnip'
end)

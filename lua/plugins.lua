require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-telescope/telescope.nvim"
    use "nvim-lua/plenary.nvim"
    use "rebelot/kanagawa.nvim"
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'nvim-treesitter/playground'
    use 'JSchrtke/harpoon'
    use 'rkennedy/vim-delphi'
    use 'gbprod/yanky.nvim'
    use 'ishan9299/nvim-solarized-lua'
    use 'tpope/vim-commentary'
    use 'lewis6991/gitsigns.nvim'
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
    use 'nvim-lualine/lualine.nvim'
    use 'smjonas/live-command.nvim'
    use { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim', as = 'lsp_lines' }
    use 'DNLHC/glance.nvim'
    use 'saecki/crates.nvim'
    use 'tpope/vim-surround'
    use 'projekt0n/github-nvim-theme'
    use 'norcalli/nvim-colorizer.lua'
    use { 'L3MON4D3/LuaSnip', tag = "v1.1.0" }
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'SmiteshP/nvim-navic'
    use 'tpope/vim-repeat'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'lukas-reineke/virt-column.nvim'
    use 'sindrets/diffview.nvim'
    use { 'j-hui/fidget.nvim', tag = "legacy" }
    use 'folke/neodev.nvim'
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
            }
        end
    }
    use {
        'stevearc/oil.nvim',
    }
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'shaunsingh/solarized.nvim'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-path'
    use "nvim-telescope/telescope-live-grep-args.nvim"
    use 'folke/trouble.nvim'
    use 'rbong/vim-flog'
    use 'camgunz/amber'
    use {
        "mcchrish/zenbones.nvim",
        requires = "rktjmp/lush.nvim"
    }
    use 'doums/darcula'
    use 'wincent/ferret'
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    }
    use 'https://github.com/ramojus/mellifluous.nvim'
    use 'stevearc/dressing.nvim'
    use 'phha/zenburn.nvim'
    use 'p00f/alabaster.nvim'
    use 'jvgrootveld/telescope-zoxide'
end)

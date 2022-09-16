require("packer").startup(function()
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
end)

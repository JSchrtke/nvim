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
end)

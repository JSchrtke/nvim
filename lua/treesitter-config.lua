local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.delphi = "pascal"
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
}

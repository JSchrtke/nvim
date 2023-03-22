local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.delphi = "pascal"
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    playground = {
        enable = true,
    },
    textsubjects = {
        enable = true,
        prev_selection = ',', -- (Optional) keymap to select the previous selection
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
        },
    },
}

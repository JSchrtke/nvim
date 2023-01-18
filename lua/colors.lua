-- vim.cmd("colorscheme melange")

-- vim.cmd("colorscheme kanagawa")
-- vim.cmd("highlight! Normal guibg=#131318")
-- vim.cmd("highlight! NormalFloat guibg=#09090C")
-- vim.cmd("highlight! CursorLine guibg=#1f1f28")
-- vim.cmd("highlight! DiagnosticError gui=bold guibg=#43242B guifg=#e82424")
-- vim.cmd("highlight! DiagnosticWarn gui=bold guibg=#3A3229 guifg=#ff9e3b")
-- vim.cmd("highlight! DiagnosticHint gui=bold guibg=#131716 guifg=#6a9589")
-- vim.cmd("highlight! link TelescopeBorder Normal")

require('github-theme').setup({
    theme_style = "dark_default",
    dark_float = "true",
    keyword_style = "NONE",
})
vim.cmd("highlight! @variable guifg=#c9d1d9")
-- vim.cmd("highlight! @namespace guifg=#ffa657")
vim.cmd("highlight! @type guifg=#79c0ff")
-- vim.cmd("highlight! @punctuation.delimiter guifg=#ff7b72")
vim.cmd("highlight! link @punctuation.delimiter @variable")
vim.cmd("highlight! link @punctuation.special @variable")
vim.cmd("highlight! link @punctuation.bracket @variable")
vim.cmd("highlight! @function.macro gui=bold guifg=#d2a8ff")
vim.cmd("highlight! DiffText gui=bold guifg=#341a00 guibg=#e3b341")
-- vim.cmd("highlight! @string guifg=#56d364")
-- vim.cmd("colorscheme modus-operandi")

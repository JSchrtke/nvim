-- vim.cmd("colorscheme melange")
-- vim.cmd("highlight! Normal guibg=#1A1714")
-- vim.cmd("highlight! WinBar gui=bold guibg=#3A332E")
-- vim.cmd("highlight! link LineNr WinBar")
-- vim.cmd("highlight! CursorLineNr gui=bold guibg=#3A332E")
-- vim.cmd("highlight! GitSignsAdd guifg=#78997a guibg=#3A332E")
-- vim.cmd("highlight! GitSignsDelete guifg=#b65c60 guibg=#3A332E")
-- vim.cmd("highlight! GitSignsChange guifg=#b380b0 guibg=#3A332E")
-- vim.cmd("highlight! DiagnosticSignError guibg=#43242B guifg=#b65c60")
-- vim.cmd("highlight! DiagnosticSignWarn guibg=#3A3229 guifg=#ebc06d")
-- vim.cmd("highlight! DiagnosticSignInfo guibg=#131716 guifg=#9aacce")
-- vim.cmd("highlight! DiagnosticSignHint guibg=#131716 guifg=#99d59d")

-- vim.g.modus_dim_inactive_window=false
-- vim.cmd("colorscheme modus-vivendi")
-- vim.cmd("highlight! link WinBar NormalFloat")

-- require('github-theme').setup({
--     theme_style = "dark_default",
--     dark_float = "true",
--     keyword_style = "NONE",
-- })
-- vim.cmd("highlight! @variable guifg=#c9d1d9")
-- vim.cmd("highlight! @variable.javascript guifg=#c9d1d9")
-- vim.cmd("highlight! @type guifg=#79c0ff")
-- vim.cmd("highlight! link @punctuation.delimiter @variable")
-- vim.cmd("highlight! link @punctuation.special @variable")
-- vim.cmd("highlight! link @punctuation.bracket @variable")
-- vim.cmd("highlight! @function.macro gui=bold guifg=#d2a8ff")
-- vim.cmd("highlight! DiffText gui=bold guifg=#341a00 guibg=#e3b341")
-- vim.cmd("highlight! link TreesitterContext WinBar")
-- vim.cmd("highlight! link TreesitterContextLineNumber TreesitterContext")

require('github-theme').setup({
    theme_style = "light_default",
    dark_float = "true",
    keyword_style = "NONE",
})
vim.cmd("highlight! @variable guifg=#24292F")
vim.cmd("highlight! @variable.javascript guifg=#24292F")
-- vim.cmd("highlight! @operator guifg=#24292F")
vim.cmd("highlight! link @punctuation.delimiter @operator")
vim.cmd("highlight! @punctuation.bracket guifg=#24292F")
vim.cmd("highlight! @type guifg=#953800")
vim.cmd("highlight! link @type.qualifier @keyword")
vim.cmd("highlight! link @constant.builtin @type")
vim.cmd("highlight! link @namespace @type")

vim.g.modus_dim_inactive_window = false
vim.cmd("colorscheme modus-vivendi")
vim.cmd("highlight WinBar gui=bold guibg=#1e1e1e")
vim.cmd("highlight! DiffText gui=bold guifg=#2a2000 guibg=#b0ba9f")

local links = {
    ['@lsp.type.namespace'] = '@namespace',
    ['@lsp.type.type'] = '@type',
    ['@lsp.type.class'] = '@type',
    ['@lsp.type.enum'] = '@type',
    ['@lsp.type.interface'] = '@type',
    ['@lsp.type.struct'] = '@structure',
    ['@lsp.type.parameter'] = '@parameter',
    ['@lsp.type.variable'] = '@variable',
    ['@lsp.type.property'] = '@property',
    ['@lsp.type.enumMember'] = '@constant',
    ['@lsp.type.function'] = '@function',
    ['@lsp.type.method'] = '@method',
    ['@lsp.type.macro'] = '@macro',
    ['@lsp.type.decorator'] = '@function',
}
for newgroup, oldgroup in pairs(links) do
    vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
end

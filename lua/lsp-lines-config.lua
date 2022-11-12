M = {}

local lsp_lines = require("lsp_lines")

lsp_lines.setup()
vim.diagnostic.config({
    virtual_text = false,
})

function M.toggle()
    lsp_lines.toggle()
    local old_value = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({
        virtual_text = not old_value
    })
end

M.toggle()

return M

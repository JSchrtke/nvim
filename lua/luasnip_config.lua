local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<c-j>", function()
    ls.expand_or_jump()
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-k>", function()
    ls.jump(-1)
end, { silent = true })

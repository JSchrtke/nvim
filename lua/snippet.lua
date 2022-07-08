local ls = require("luasnip")
local s = ls.s
local i = ls.i
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local types = require("luasnip.util.types")

ls.config.set_config({
    history = true,
    updateevents = "TextChanged, TextChangedI",
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = {{ "<-", "Comment" }}
            }
        }
    }
})

vim.keymap.set({"i", "s"}, "<c-j>", function ()
    if ls.expand_or_jumpable then
        ls.expand_or_jump()
    end
end, {silent=true})

vim.keymap.set({"i", "s"}, "<c-k>", function ()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, {silent=true})

vim.keymap.set({"i", "s"}, "<c-l>", function ()
    if ls.choice_active then
        ls.change_choice(1)
    end
end, {silent=true})

vim.keymap.set({"i", "s"}, "<c-h>", function ()
    if ls.choice_active then
        ls.change_choice(-1)
    end
end, {silent=true})

ls.add_snippets("lua", {
    s("req", fmt("local {} = require('{}')", {i(1, "default"), rep(1)}))
})

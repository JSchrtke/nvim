local ls = require("luasnip")
local s = ls.s
local i = ls.i
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local types = require("luasnip.util.types")
local c = ls.c
local d = ls.dynamic_node
local t = ls.t
local sn = ls.sn


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

local get_return = function(position)
    return d(position, function()
        local choices = {
            t(" "),
            t(" error "),
            fmt("({}, error)", {i(1, "someType")})
        }
        return sn(nil, c(1, choices))
    end, {})
end

ls.add_snippets("go", {
    s(
        "f",
        fmt(
            [[
                func{} {}({}){}{{
                	{}
                }}
            ]],
            {
                c(1, {
                    t(""), fmt("  ({} {})", {i(1, "name"), i(2, "Type")})
                }),
                i(2, "funcName"),
                c(3, {
                    t(""), i(nil, "args")
                }),
                get_return(4),
                i(0),
            }
        )
    ),
    s(
        "test",
        fmt(
            [[
                func Test{}(t *testing.T) {{
                	{}
                }}
            ]],
            {
                i(1, "Something"),
                i(0, "t.Fatal(\"todo\")")
            }
        )
    ),
    s(
        "if",
        fmt(
            [[
                if {} {{
                	{}
                }}
            ]],
            {
                i(1, "condition"),
                i(0)
            }
        )
    ),
    s(
        "ie",
        fmt(
            [[
                if err != nil {{
                	{}
                }}
            ]],
            {
                d(1,function()
                    local choices = {
                        t("return err"),
                        t("panic(err)"),
                        fmt("return {}, err", {i(1, "value")}),
                        fmt('t.Fatalf("{}", {})', {i(1, "expected no error, but got '%s'"), i(2, "err.Error()")})
                    }
                    return sn(nil, c(1, choices))
                end)
            }
        )
    ),
    s(
        "st",
        fmt(
            [[
            type {} struct {{
            	{}
            }}
            ]],
            {
                i(1, "Name"),
                i(0),
            }
        )
    ),
    s("for",
        fmt([[
        for {} {{
        	{}
        }}
        ]],
        {
            c(1, {
                fmt(
                    [[
                        {} := {}; {} < {}; {}++
                    ]],
                    {
                        i(1, "i"), i(2, "0"), rep(1), i(3, "max"), rep(1)
                    }
                ),
                fmt(
                    [[
                        {}, {} := range {}
                    ]],
                    {
                        i(1, "_"), i(2, "thing"), i(3, "things")
                    }
                ),
                t("")
            }),
            i(0),
        })
    ),
})

lua << EOF
local ls = require("luasnip")
local s = ls.s
local i = ls.i
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("vim", {
    s(
        "l",
        fmt(
            "lua << EOF\n{}\nEOF",
            {i(1, "-- todo")}
        )
    ),
})
EOF

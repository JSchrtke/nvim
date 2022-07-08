local ls = require("luasnip")
local s = ls.s
local i = ls.i
local c = ls.c
local d = ls.dynamic_node
local t = ls.t
local sn = ls.sn
local fmt = require("luasnip.extras.fmt").fmt

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
                func {}({}){}{{
                	{}
                }}
            ]],
            {
                i(1, "funcName"), c(2, {t(""), i(nil, "args")}), get_return(3),
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
                        fmt("return {}, err", {i(1, "value")}),
                        fmt('t.Errorf("{}", {})', {i(1, "message"), i(2, "fmtArgs")})
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
    )
    -- s(
    --     "for",
    --     fmt(
    --         [[
    --         for {} {{
    --             {}
    --         }}
    --         ]],
    --         {
				-- -- d(1, function()
				-- -- 	local choices = {
				-- -- 		fmt("{}", {t("")}),
				-- -- 		fmt("{}", {t("")}),
				-- -- 		t("")
				-- -- 	}
				-- -- 	return sn(nil, c(1, choices))
				-- -- end),
				-- -- t(0, "")
    --             t(1, ""),
    --             t(0, "")
    --         }
    --     )
    -- ),
})

function! GoRunWithArgs()
    call nvim_feedkeys(':T go run . ', 't', v:true)
endfunction
lua << EOF
require("which-key").register({
  ["<leader>rt"] = {"<cmd>TroubleClose<CR>|<cmd>Topen|T go test .<cr>", "test project"},
  ["<leader>rb"] = {"<cmd>Topen|T go build .<cr>", "build project"},
  ["<leader>rp"] = {"<cmd>TroubleClose<CR>|<cmd>Topen|T go run .<cr>", "run project"},
  ["<leader>rf"] = {"<cmd>!go fmt<cr>", "formatter"},
  ["<leader>ri"] = {"<cmd>Topen|T go install<cr>", "installer"},
  ["<leader>rP"] = {"<cmd>call GoRunWithArgs()<cr>", "project (with args)"},
})
EOF

set colorcolumn=80
setlocal makeprg=go
setlocal textwidth=80
setlocal noexpandtab

lua << EOF
local ls = require("luasnip")
local s = ls.s
local i = ls.i
local c = ls.c
local d = ls.dynamic_node
local t = ls.t
local sn = ls.sn
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

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
--     s("foo",
-- 		fmt(
-- 			[[
-- 				test: {}, repeat: {}
-- 			]],
-- 			{
-- 				i(1), rep(1)
-- 			}
-- 		)
-- 	),
-- })
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
                        i(1, "i"), i(2, "thing"), i(3, "things")
                    }
                ),
                t("")
            }),
            i(0),
        })
    ),
})
EOF

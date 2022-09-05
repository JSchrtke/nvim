setlocal shiftwidth=2 tabstop=2 expandtab
setlocal textwidth=90 formatoptions-=t
setlocal commentstring=//\ %s
set colorcolumn=90

function! OpenDelphiProjectInIde()
    let exec_string = join([':T start ', fnamemodify(getcwd(), ':t'), "andtests.groupproj"], '')
    let enter = nvim_replace_termcodes("<CR>", v:true, v:false, v:true)
    call nvim_feedkeys(enter, 'n', v:true)
endfunction
lua << EOF
require("which-key").register({
    ["<leader>oi"] = {"<cmd>call OpenDelphiProjectInIde()<cr>", "open in rad studio"},
    ["<leader>rp"] = {"<cmd>lua require('harpoon.term').sendCommand(1, '.\\\\run.bat')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", "project"},
    ["<leader>rt"] = {"<cmd>lua require('harpoon.term').sendCommand(1, '.\\\\test.bat')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", "tests"},
    ["<leader>rf"] = {"<cmd>call FormatDelphi()<cr>", "formatter"},
})
EOF

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

ls.add_snippets("delphi", {
    -- todo, make this read the previous 'var' and add 'I: Integer' if it isn't there
    -- already
    s("for",
        fmt(
            [[
                for {} := {} to {} do
                begin
                  {}
                end;
            ]],
            {
                i(1, "I"), i(2, "0"), i(3, "Max"),
                i(0)
            }
        )
    ),
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
--     s(
--         "f",
--         fmt(
--             [[
--                 func{} {}({}){}{{
--                 	{}
--                 }}
--             ]],
--             {
--                 c(1, {
--                     t(""), fmt("  ({} {})", {i(1, "name"), i(2, "Type")})
--                 }),
--                 i(2, "funcName"),
--                 c(3, {
--                     t(""), i(nil, "args")
--                 }),
--                 get_return(4),
--                 i(0),
--             }
--         )
--     ),
--     s(
--         "test",
--         fmt(
--             [[
--                 func Test{}(t *testing.T) {{
--                 	{}
--                 }}
--             ]],
--             {
--                 i(1, "Something"),
--                 i(0, "t.Fatal(\"todo\")")
--             }
--         )
--     ),
--     s(
--         "if",
--         fmt(
--             [[
--                 if {} {{
--                 	{}
--                 }}
--             ]],
--             {
--                 i(1, "condition"),
--                 i(0)
--             }
--         )
--     ),
--     s(
--         "ie",
--         fmt(
--             [[
--                 if err != nil {{
--                 	{}
--                 }}
--             ]],
--             {
--                 d(1,function()
--                     local choices = {
--                         t("return err"),
--                         t("panic(err)"),
--                         fmt("return {}, err", {i(1, "value")}),
--                         fmt('t.Errorf("{}", {})', {i(1, "message"), i(2, "fmtArgs")})
--                     }
--                     return sn(nil, c(1, choices))
--                 end)
--             }
--         )
--     ),
--     s(
--         "st",
--         fmt(
--             [[
--             type {} struct {{
--             	{}
--             }}
--             ]],
--             {
--                 i(1, "Name"),
--                 i(0),
--             }
--         )
--     ),
--     s("for",
--         fmt([[
--         for {} {{
--         	{}
--         }}
--         ]],
--         {
--             c(1, {
--                 fmt(
--                     [[
--                         {} := {}; {} < {}; {}++
--                     ]],
--                     {
--                         i(1, "i"), i(2, "0"), rep(1), i(3, "max"), rep(1)
--                     }
--                 ),
--                 fmt(
--                     [[
--                         {}, {} := range {}
--                     ]],
--                     {
--                         i(1, "i"), i(2, "thing"), i(3, "things")
--                     }
--                 ),
--                 t("")
--             }),
--             i(0),
--         })
--     ),
})
EOF

if exists('*FormatDelphi')
    finish
endif
function! FormatDelphi()
    let l:current_file = expand('%:p')
    execute 'write '.current_file
    silent execute '!Formatter -config .\\formatter.config "'.current_file.'"'
    silent execute '!fix_delphi_format.exe "'.current_file'"'
    execute 'edit '.current_file
endfunction

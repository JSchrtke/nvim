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

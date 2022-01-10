function GoRunWithArgs()
    call nvim_feedkeys(':T go run . ', 't', v:true)
endfunction
lua << EOF
require("which-key").register({
  ["<leader>rt"] = {"<cmd>T go test .<cr>", "project"},
  ["<leader>rb"] = {"<cmd>T go build .<cr>", "project"},
  ["<leader>rp"] = {"<cmd>T go run .<cr>", "project"},
  ["<leader>rf"] = {"<cmd>!go fmt<cr>", "formatter"},
  ["<leader>ri"] = {"<cmd>T go install<cr>", "installer"},
  ["<leader>rP"] = {"<cmd>call GoRunWithArgs()<cr>", "project (with args)"},
})
EOF
set colorcolumn=79
setlocal makeprg=go
setlocal textwidth=79

function! GoRunWithArgs()
    call nvim_feedkeys(':T go run . ', 't', v:true)
endfunction
lua << EOF

local function file_exists(name)
    local file = io.open(name, "r")
    if file ~= nil then
        io.close(file)
        return true
    end

    return false
end

function run_go_tests()
    if file_exists("./test.bat") then
        require('harpoon.term').sendCommand(1, '.\\test.bat')
    elseif file_exists("./go.mod") then
        require('harpoon.term').sendCommand(1, 'go test')
	else
		vim.api.nvim_notify(
			"Unable to run Go tests, neither 'test.bat' nor 'go.mod' exists",
			0,
			{}
		)
    end
end

require("which-key").register({
  ["<leader>rt"] = {"<cmd>lua run_go_tests()<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", "test project"},
  ["<leader>rb"] = {"<cmd>lua require('harpoon.term').sendCommand(1, 'go build .')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", "build project"},
  ["<leader>rp"] = {"<cmd>lua require('harpoon.term').sendCommand(1, 'go run .')<cr><cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", "run project"},
  ["<leader>rf"] = {"<cmd>!go fmt<cr>", "formatter"},
  ["<leader>ri"] = {"<cmd>Topen|T go install<cr>", "installer"},
  ["<leader>rP"] = {"<cmd>call GoRunWithArgs()<cr>", "project (with args)"},
})
EOF

set colorcolumn=80
setlocal makeprg=go
setlocal textwidth=80
setlocal noexpandtab

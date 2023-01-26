vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.clipboard = 'unnamedplus'
vim.o.swapfile = false
vim.o.backup = false
vim.g.undodir = '~/.vim/undodir'
vim.o.undofile = true
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.wrap = true
vim.o.listchars="tab:-->,eol:↲,nbsp:␣,space:•,trail:•,extends:⟩,precedes:⟨"
vim.o.cursorline = true
vim.o.laststatus = 3

function Winbar()
    local navic = require("nvim-navic")
    local winbar = "%f"
    local location = ""
    if navic.is_available() then
	    location = navic.get_location()
    end
    if location ~= "" then
        winbar = winbar .. " > " .. location
    end

    return winbar
end
vim.opt.winbar = "%{%v:lua.Winbar()%}"
vim.o.scrolloff = 3

vim.cmd("autocmd FocusGained,BufEnter,CursorHold * :silent! checktime")

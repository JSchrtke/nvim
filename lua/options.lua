vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true

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
vim.o.listchars = "tab:-->,eol:↲,nbsp:␣,space:•,trail:•,extends:⟩,precedes:⟨"
vim.o.cursorline = true
vim.o.laststatus = 3
vim.o.colorcolumn = "80,100"
vim.o.updatetime = 1000
vim.opt.formatoptions:remove("o")

function Winbar()
    return "%f"
end

vim.opt.winbar = "%{%v:lua.Winbar()%}"
vim.o.scrolloff = 3

vim.cmd("autocmd FocusGained,BufEnter,CursorHold * :silent! checktime")

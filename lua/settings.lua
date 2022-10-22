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

vim.cmd("autocmd FocusGained,BufEnter,CursorHold * :silent! checktime")

vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("rust_autocommands", { clear = true }),
    pattern = "*.rs",
    callback = function ()
        require('harpoon.term').sendCommand(1, 'cargo test')
    end,
})

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "gopls", "sumneko_lua", "rust_analyzer", "vimls", "clangd" },
    automatic_installation = true,
})

require("mason-lspconfig").setup_handlers({
    function (server_name)
        if server_name == "rust_analyzer" then
            local rt = require("rust-tools")

            rt.setup({
                server = {
                    settings = {
                        ["rust-analyzer"] = {
                            checkOnSave = {
                                command = "clippy"
                            }
                        }
                    },
                    on_attach = function(_, bufnr)
                        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
                        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
                    end,
                },
                tools = {
                    inlay_hints = {
                        auto = false,
                    },
                },
            })
        else
            require("lspconfig")[server_name].setup({
                on_attach = function(_, bufnr)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
                    vim.keymap.set("n", "<Leader>a", vim.lsp.buf.code_action, { buffer = bufnr })
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
                end,
            })
        end
    end,
})

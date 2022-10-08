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
                },
                tools = {
                    inlay_hints = {
                        auto = false,
                    },
                },
            })
        else
            require("lspconfig")[server_name].setup({})
        end
    end,
})

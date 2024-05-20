require("mason").setup()
require("mason-lspconfig").setup({})

require("mason-lspconfig").setup_handlers({
    function(server_name)
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
                    on_attach = function(client, bufnr)
                        client.server_capabilities.semanticTokensProvider = nil
                        -- rust specific mappings
                        vim.keymap.set("n", "<leader>K", ":RustOpenExternalDocs<CR>", { buffer = bufnr })
                        -- the rest
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
                        vim.keymap.set("n", "<leader>t", vim.lsp.buf.type_definition, { buffer = bufnr })
                        vim.keymap.set("n", "gr", vim.lsp.buf.rename, {})
                        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {})
                        require("nvim-navic").attach(client, bufnr)
                    end,
                },
                tools = {
                    inlay_hints = {
                        auto = false,
                    },
                },
            })
        elseif server_name == "angularls" then
            require("lspconfig")[server_name].setup({
                root_dir = require("lspconfig.util").root_pattern('angular.json', 'project.json'),
                on_attach = function(client, bufnr)
                    client.server_capabilities.semanticTokensProvider = nil
                    vim.keymap.set("n", "<Leader>a", vim.lsp.buf.code_action, { buffer = bufnr })
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
                    vim.keymap.set("n", "<leader>t", vim.lsp.buf.type_definition, { buffer = bufnr })
                    vim.keymap.set("n", "gr", vim.lsp.buf.rename, {})
                    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {})
                    if client.server_capabilities.documentSymbol ~= nil then
                        require("nvim-navic").attach(client, bufnr)
                    end
                end,
            })
        else
            require("lspconfig")[server_name].setup({
                on_attach = function(client, bufnr)
                    client.server_capabilities.semanticTokensProvider = nil
                    vim.keymap.set("n", "<Leader>a", vim.lsp.buf.code_action, { buffer = bufnr })
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
                    vim.keymap.set("n", "<leader>t", vim.lsp.buf.type_definition, { buffer = bufnr })
                    vim.keymap.set("n", "gr", vim.lsp.buf.rename, {})
                    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {})
                    if client.server_capabilities.documentSymbol ~= nil then
                        require("nvim-navic").attach(client, bufnr)
                    end
                end,
            })
        end
    end,
})

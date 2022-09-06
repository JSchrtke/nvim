require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "rust", "pascal", "go" },
    auto_install = true,
    highlight = {
        enable = true,
    },
}

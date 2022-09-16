local actions = require('telescope.actions')
local layout = require('telescope.actions.layout')
require("telescope").setup({
    defaults = {
        layout_config = {
            prompt_position = "top",
            width = 0.99,
            height = 0.99,
        },
        sorting_strategy = "ascending",
        mappings = {
            i = {
                ["<M-p>"] = layout.toggle_preview,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
            },
            n = {
                ["<M-p>"] = layout.toggle_preview,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
            },
        },
    }
})


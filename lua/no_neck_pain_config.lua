require("no-neck-pain").setup({
    -- Prints useful logs about triggered events, and reasons actions are executed.
    debug = false,
    -- When `true`, enables the plugin when you start Neovim.
    enableOnVimEnter = false,
    -- When `true`, enables the plugin when you enter a new Tab.
    -- note: it does not trigger if it's an existing tab, to prevent unwanted interfer with user's decisions.
    enableOnTabEnter = false,
    -- The width of the focused window that will be centered, accepted values are:
    -- - Any integer > 0.
    -- - "textwidth", which retrieves the value of the `vim.bo.textwidth` option.
    -- - "colorcolumn", which retrieves the value of the `vim.opt.colorcolumn` option.
    -- When the terminal width is less than the `width` option, the side buffers won't be created.
    width = 150,
    -- Represents the lowest width value a side buffer should be.
    -- This option can be useful when switching window size frequently, example:
    -- in full screen screen, width is 210, you define an NNP `width` of 100, which creates each side buffer with a width of 50. If you resize your terminal to the half of the screen, each side buffer would be of width 5 and thereforce might not be useful and/or add "noise" to your workflow.
    minSidebufferWidth = 5,
    -- Sets a global mapping to Neovim, which allows you to toggle the plugin.
    -- When `false`, the mapping is not created.
    toggleMapping = false,
    -- Sets a global mapping to Neovim, which allows you to increase the width (+5) of the main window.
    -- When `false`, the mapping is not created.
    widthUpMapping = false,
    -- Sets a global mapping to Neovim, which allows you to decrease the width (-5) of the main window.
    -- When `false`, the mapping is not created.
    widthDownMapping = false,
    -- Disables the plugin if the last valid buffer in the list have been closed.
    disableOnLastBuffer = false,
    -- When `true`, disabling the plugin closes every other windows except the initially focused one.
    killAllBuffersOnDisable = false,
    --- Common options that are set to both side buffers.
    --- See |NoNeckPain.bufferOptions| for option scoped to the `left` and/or `right` buffer.
    buffers = {
        -- When `true`, the side buffers will be named `no-neck-pain-left` and `no-neck-pain-right` respectively.
        setNames = false,
        -- Leverages the side buffers as notepads, which work like any Neovim buffer and automatically save the content at the given `location`.
        -- note: quitting an unsaved scratchpad buffer is non-blocking.
        scratchPad = {
            -- When `true`, automatically sets the following options to the side buffers:
            -- - `autowriteall`
            -- - `autoread`.
            enabled = false,
            -- The name of the generated file. See `location` for more information.
            -- @example: `no-neck-pain-left.norg`
            fileName = "no-neck-pain",
            -- By default, files are saved at the same location as the current Neovim session.
            -- note: filetype is defaulted to `norg` (https://github.com/nvim-neorg/neorg), but can be changed from the buffer options globally `buffers.bo.filetype` or see |NoNeckPain.bufferOptions| for option scoped to the `left` and/or `right` buffer.
            -- @example: `no-neck-pain-left.norg`
            location = nil,
        },
        -- Hexadecimal color code to override the current background color of the buffer. (e.g. #24273A)
        -- Transparent backgrounds are supported by default.
        backgroundColor = nil,
        -- Brighten (positive) or darken (negative) the side buffers background color. Accepted values are [-1..1].
        blend = 0,
        -- Hexadecimal color code to override the current text color of the buffer. (e.g. #7480c2)
        textColor = nil,
        -- Vim buffer-scoped options: any `vim.bo` options is accepted here.
        bo = {
            filetype = "no-neck-pain",
            buftype = "nofile",
            bufhidden = "hide",
            buflisted = false,
            swapfile = false,
        },
        -- Vim window-scoped options: any `vim.wo` options is accepted here.
        wo = {
            cursorline = false,
            cursorcolumn = false,
            number = false,
            relativenumber = false,
            foldenable = false,
            list = false,
            wrap = true,
            linebreak = true,
        },
        --- Options applied to the `left` buffer, the options defined here overrides the ones at the root of the `buffers` level.
        --- See |NoNeckPain.bufferOptions|.
        left = NoNeckPain.bufferOptions,
        --- Options applied to the `right` buffer, the options defined here overrides the ones at the root of the `buffers` level.
        --- See |NoNeckPain.bufferOptions|.
        right = NoNeckPain.bufferOptions,
    },
    -- Supported integrations that might clash with `no-neck-pain.nvim`'s behavior.
    integrations = {
        -- By default, if NvimTree is open, we will close it and reopen it when enabling the plugin,
        -- this prevents having the side buffers wrongly positioned.
        -- @link https://github.com/nvim-tree/nvim-tree.lua
        NvimTree = {
            -- The position of the tree, either `left` or `right`.
            position = "left",
            -- When `true`, if the tree was opened before enabling the plugin, we will reopen it.
            reopen = true,
        },
        -- @link https://github.com/mbbill/undotree
        undotree = {
            -- The position of the tree, either `left` or `right`.
            position = "left",
        },
    },
})

NoNeckPain.bufferOptions = {
    -- When `false`, the buffer won't be created.
    enabled = true,
    -- Hexadecimal color code to override the current background color of the buffer. (e.g. #24273A)
    -- Transparent backgrounds are supported by default.
    backgroundColor = nil,
    -- Brighten (positive) or darken (negative) the side buffers background color. Accepted values are [-1..1].
    blend = 0,
    -- Hexadecimal color code to override the current text color of the buffer. (e.g. #7480c2)
    textColor = nil,
    -- Vim buffer-scoped options: any `vim.bo` options is accepted here.
    bo = {
        filetype = "no-neck-pain",
        buftype = "nofile",
        bufhidden = "hide",
        buflisted = false,
        swapfile = false,
    },
    -- Vim window-scoped options: any `vim.wo` options is accepted here.
    wo = {
        cursorline = false,
        cursorcolumn = false,
        number = false,
        relativenumber = false,
        foldenable = false,
        list = false,
        wrap = true,
        linebreak = true,
    },
}

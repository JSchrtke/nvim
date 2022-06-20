if has("nvim")
"### General settings ###
let mapleader = "\<Space>"
filetype plugin on
set number
set relativenumber
set updatetime=500
set ignorecase
set smartcase
set clipboard=unnamedplus
set mouse=a
set showbreak=↪\
set listchars=tab:-->,eol:↲,nbsp:␣,trail:⣿,space:•,extends:⟩,precedes:⟨
set diffopt+=algorithm:histogram
set colorcolumn=100
" always having the signcolumn shown avoids the entire buffer content moving whenever there are
" signs to be displayed
set signcolumn=yes
set t_Co=256
set termguicolors
set wrap
lua << EOF
vim.opt.laststatus = 3
vim.opt.fillchars:append({
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┨',
    vertright = '┣',
    verthoriz = '╋',
})
EOF

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab

" Undo/Redo
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" only show the cursorline in the currently active window
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" NOTE: avoid freezing the vim process forever, see
" https://github.com/neovim/neovim/issues/6660
if has('win32')
    nmap <C-z> <Nop>
endif

" make sure the file get's reloaded whenever it's changed by an outside
" program
autocmd FocusGained,BufEnter,CursorHold * :silent! checktime

" easliy escape from terminal insert mode
tnoremap <C-w>n <C-\><C-n>

" ### Install plugins ###
lua << EOF
require("packer").startup(function()
    use "wbthomason/packer.nvim"
    use 'nathom/filetype.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
end)
EOF

call plug#begin('~/.vim/plugged')

" Performance
Plug 'lewis6991/impatient.nvim'

" UI
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/trouble.nvim'
Plug 'folke/which-key.nvim'
Plug 'simeji/winresizer'
Plug 'kassio/neoterm'
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
" TODO configure this properly
Plug 'folke/zen-mode.nvim'
Plug 'sindrets/winshift.nvim'
Plug 'kwkarlwang/bufresize.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'rmagatti/goto-preview'
Plug 'SmiteshP/nvim-gps'
Plug 'stevearc/dressing.nvim'
Plug 'stevearc/aerial.nvim'
Plug 'j-hui/fidget.nvim'

" Search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'windwp/nvim-spectre'
Plug 'nvim-telescope/telescope-rg.nvim'

" Editing/motions
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'junegunn/vim-easy-align'

" Git
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'williamboman/nvim-lsp-installer'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

" Debugging
" TODO actually set this up
Plug 'mfussenegger/nvim-dap'

" Syntax/Languages
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'rkennedy/vim-delphi'
Plug 'dag/vim-fish'
Plug 'simrat39/rust-tools.nvim'
Plug 'fladson/vim-kitty'
Plug 'nvim-treesitter/nvim-treesitter-refactor'

" Editor behaviour
Plug 'Pocco81/AutoSave.nvim'
Plug 'famiu/bufdelete.nvim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'ethanholz/nvim-lastplace'
Plug 'gbprod/yanky.nvim'

" Colors
Plug 'rktjmp/lush.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'mcchrish/zenbones.nvim'
Plug 'JSchrtke/kanagawa.nvim', { 'branch': 'light-mode' }

" File management
Plug 'tamago324/lir.nvim'
Plug 'tamago324/lir-git-status.nvim'

call plug#end()

" ### Configure impatient.nvim ###
lua require('impatient').enable_profile()

" ### Configure treesitter ###
lua << EOF
local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.delphi = "pascal"

require("nvim-treesitter.configs").setup{
    highlight = {
        enable = true,
    }
}

require("treesitter-context").setup{}

EOF

" ### Configure nvim-cmp###
lua << EOF

vim.lsp.protocol.CompletionItemKind = {
    Text = " [text]",
    Method = " [method]",
    Function = " [function]",
    Constructor = " [constructor]",
    Field = "ﰠ [field]",
    Variable = " [variable]",
    Class = " [class]",
    Interface = " [interface]",
    Module = " [module]",
    Property = " [property]",
    Unit = " [unit]",
    Value = " [value]",
    Enum = " [enum]",
    Keyword = " [key]",
    Snippet = "﬌ [snippet]",
    Color = " [color]",
    File = " [file]",
    Reference = " [reference]",
    Folder = " [folder]",
    EnumMember = " [enum member]",
    Constant = " [constant]",
    Struct = " [struct]",
    Event = "⌘ [event]",
    Operator = " [operator]",
    TypeParameter = " [type]",
}

local cmp = require 'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    experimental = {
        ghost_text = true
    },

    preselect = cmp.PreselectMode.None,

    completion = {
        completeopt = 'menu,menuone,noinsert',
    },

    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = string.format("[%s]", entry.source.name)

            vim_item.kind = vim.lsp.protocol.CompletionItemKind[vim_item.kind]
            return vim_item
        end,
    },

    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-q>"] = cmp.mapping.close(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<c-y>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }
        )
    },

    sources = {
        {
            name = 'nvim_lsp',
            priority = 1000
        },
        {
            name = 'nvim_lsp_signature_help',
            priority = 1000
        },
        {
            name = "luasnip",
            priority = 100
        },
        {
            name = 'path',
            priority = 10
        },
    },
})

EOF

" ### Configure nvim diagnostics ###
lua << EOF

local function lspSymbol(name, icon)
    vim.fn.sign_define('DiagnosticSign' .. name, {text = icon, texthl = 'DiagnosticSign' .. name, numhl = 'DiagnosticSign' .. name})
end

lspSymbol('Error', '')
lspSymbol('Hint', '')
lspSymbol('Info', '')
lspSymbol('Warn', '')

vim.diagnostic.config({severity_sort = true})

EOF

" ### Configure LSP ###
lua << EOF

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
    }
)

local on_attach = function(client, bufnr)
    local opts = { silent = true; }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
    if client.resolved_capabilities['document_highlight'] then
        vim.cmd(string.format('au CursorHold  <buffer=%d> lua vim.lsp.buf.document_highlight()', bufnr))
        vim.cmd(string.format('au CursorHoldI <buffer=%d> lua vim.lsp.buf.document_highlight()', bufnr))
        vim.cmd(string.format('au CursorMoved <buffer=%d> lua vim.lsp.buf.clear_references()', bufnr))
    end
    require("aerial").on_attach(client, bufnr)
end

-- lsp status
local lsp_status = require("lsp-status")
lsp_status.config({
    status_symbol = ' ',
    indicator_info = '',
    indicator_errors = '',
    indicator_warnings = '',
    indicator_hint = '',
    indicator_ok = '',
})
lsp_status.register_progress()

-- lsp installer
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,
    }

    if server.name == "rust_analyzer" then
        local rust_opts = {
            tools = {
                autoSetHints = true,
                hover_with_actions = true,
                executor = require("rust-tools/executors").termopen,
                runnables = {
                    use_telescope = true
                },
                inlay_hints = {
                    show_parameter_hints = true,
                    parameter_hints_prefix = "<- ",
                    other_hints_prefix = "=> ",
                    only_current_line = true,
                    only_current_line_autocmd = "CursorMoved"
                },
                hover_actions = {
                    border = "single",
                    auto_focus = false
                }
            },

            server = vim.tbl_deep_extend("force", server:get_default_options(), opts, {
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            command = "clippy"
                        }
                    }
                }
            })
        }

        require("rust-tools").setup(rust_opts)
        server:attach_buffers()
    else
        server:setup(opts)
        vim.cmd([[do User LspAttachBuffers]])
    end
end)

EOF

" ### Configure telescope.nvim ###
lua << EOF

local actions = require('telescope.actions')
local layout = require('telescope.actions.layout')
local trouble = require("trouble.providers.telescope")

require('telescope').setup {
    defaults = {
        borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
        layout_config = {
            prompt_position = "top",
            width = 0.99,
            height = 0.99,
        },
        prompt_prefix = " ",
        sorting_strategy = "ascending",
        path_display = {
            truncate = 3,
        },
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        preview = {
            timeout = 100,
            hide_on_startup = true,
        },
        dynamic_preview_title = true,
        mappings = {
            i = {
                ["<C-q>"] = trouble.smart_open_with_trouble,
                ["<M-p>"] = layout.toggle_preview,
            },
            n = {
                ["<C-q>"] = trouble.smart_open_with_trouble,
                ["<M-p>"] = layout.toggle_preview,
            },
        },
    }
}

 -- telescope extensions
require('telescope').load_extension('project')

EOF

" ### Configure gitsigns.nvim ###
lua << EOF

require('gitsigns').setup{
    trouble = true,
    keymaps = {
        buffer = true,
    },
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '▸', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    current_line_blame = false,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true})
    end,
}

EOF

" ### Configure indent-blankline ###
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_filetype_exclude = ['help', 'Trouble', 'markdown']
let g:indent_blankline_buftype_exclude = ['terminal']
let g:indent_blankline_bufname_exclude = ['README.md', '.*\.txt']
let g:indent_blankline_show_first_indent_level = v:true
let g:indent_blankline_disable_with_nolist = v:false
let g:indentLine_char = '│'

" ### Configure winresizer ###
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
map <C-e> <nop>

" ### Configure which-key.nvim/mappings ###
map <silent> <F2> <cmd>lua vim.lsp.buf.rename()<CR>

lua << EOF

local wk = require("which-key")
t = require('telescope.builtin')
t_ext = require('telescope').extensions

-- Normal mode, no <leader> prefix
wk.register({
    ["gd"] = {"<cmd>lua vim.lsp.buf.definition()<CR>", "go to definition"},
    ["gt"] = {"next tab"},
    ["gT"] = {"previous tab"},
    ["]e"] = {"<cmd>silent lua vim.lsp.diagnostic.goto_next()<cr>", "next error"},
    ["[e"] = {"<cmd>silent lua vim.lsp.diagnostic.goto_prev()<cr>", "previous error"},
    ["]q"] = {"<cmd>cnext<cr>", "next quickfix item"},
    ["[q"] = {"<cmd>cprevious<cr>", "previous quickfix item"},
    ["]t"] = {"<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>", "next trouble"},
    ["[t"] = {"<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", "previous trouble"},
})

-- Normal mode, <leader> prefix
wk.register({
    -- ignored keys
    ["1"] = "which_key_ignore",
    ["2"] = "which_key_ignore",
    ["3"] = "which_key_ignore",
    ["4"] = "which_key_ignore",
    ["5"] = "which_key_ignore",
    ["6"] = "which_key_ignore",
    ["7"] = "which_key_ignore",
    ["8"] = "which_key_ignore",
    ["9"] = "which_key_ignore",

    ["<cr>"] = {"<cmd>TroubleClose<CR>|<cmd>Ttoggle<CR>", "toggle terminal"},

    h = {"<cmd>wincmd h<CR>", "move left"},
    j = {"<cmd>wincmd j<CR>", "move down"},
    k = {"<cmd>wincmd k<CR>", "move up"},
    l = {"<cmd>wincmd l<CR>", "move right"},

    c = {
        name = "+create",
        t = {"<cmd>tabnew<cr>", "new tab"},
    },

    -- open
    o = {
        name = "+open",
        f = {"<cmd>lua t.find_files()<CR>", "file"},
        e = {"<cmd>e .<CR>", "file explorer"},
        r = {"<cmd>lua t.oldfiles()<CR>", "recent"},
        b = {"<cmd>lua t.buffers()<CR>", "buffer"},
        gb = {"<cmd>lua t.git_branches()<CR>", "git branch"},
        gc = {"<cmd>lua t.git_commits()<CR>", "git commit"},
        p = {"<cmd>lua require('telescope').extensions.project.project{}<CR>", "project"},
    },

    -- find
    f = {
        name = "+find",
        f = {"<cmd>lua t.current_buffer_fuzzy_find()<CR>", "in file"},
        d = {"<cmd>lua t.live_grep()<CR>", "in directory"},
        w = {"<cmd>lua t.grep_string()<CR>", "word"},
        s = {"<cmd>lua t.lsp_document_symbols()<CR>", "document symbols"},
        S = {"<cmd>lua t.lsp_workspace_symbols()<CR>", "workspace symbols"},
        q = {"<cmd>lua t.quickfix()<CR>", "in quickfix list"},
        h = {"<cmd>lua t.help_tags()<CR>", "in help"},
        r = {"<cmd>lua t.lsp_references()<CR>", "references"},
        t = {"<cmd>lua t_ext.todo.todo()<CR>", "todos"},
    },

    -- window
    w = {
        name = "+window",
        h = {"<cmd>vsplit<CR>", "split left"},
        j = {"<cmd>split<bar>wincmd j<CR>", "split down"},
        k = {"<cmd>split<CR>", "split up"},
        l = {"<cmd>vsplit<bar>wincmd l<CR>", "split right"},
        p = {"<cmd>lua require('nvim-window').pick()<CR>", "pick window"},
        r = {"<cmd>WinResizerStartResize<CR>", "resize mode"},
        e = {"<cmd>wincmd =<CR>", "equalize size"},
        m = { "<cmd>WinShift<CR>", "toggle window move mode"},
        s = { "<cmd>WinShift swap<CR>", "toggle window swap mode"},
        z = {"<cmd>ZenMode<CR>", "toggle zen mode"},
        t = {"<cmd>wincmd T<CR>", "breakout into new tab"},
    },

    -- quit
    q = {
        name = "+quit",
        w = {"<cmd>q<CR>", "window"},
        W = {"<cmd>wincmd o<CR>", "all other windows"},
        b = {"<cmd>Bdelete<CR>", "buffer"},
        B = {"<cmd>BufOnly!<CR>", "all other buffers"},
        t = {"<cmd>tabclose<CR>", "tab"},
        T = {"<cmd>tabonly<CR>", "all other tabs"},
        q = {"<cmd>cclose<CR>", "quickfix list"},
    },

    -- go
    g = {
        name = "+go",
        D = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "declaration"},
        d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "definition"},
        i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "implementation"},
        t = {"<cmd>lua vim.lsp.buf.type_definition()<CR>", "type definition"},
    },

    -- show
    s = {
        name = "+show",
        E = {"<cmd>Tclose|Trouble workspace_diagnostics<CR>", "workspace errors"},
        c = {"<cmd>Gitsigns preview_hunk<CR>", "change"},
        C = {"<cmd>Gitsigns setqflist<CR>", "all changes"},
        d = {"<cmd>Gvdiffsplit|wincmd l<CR>", "git diff"},
        e = {"<cmd>lua vim.diagnostic.open_float()<CR>", "line errors"},
        h = {"<cmd>lua vim.lsp.buf.hover()<CR>", "hover"},
        i = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "signature_help"},
        l = {"<cmd>Flog<CR>", "git log"},
        q = {"<cmd>copen<CR>", "quickfix list"},
        s = {"<cmd>tabnew|G<CR>", "git status"},
        S = {"<cmd>AerialToggle!<CR>", "lsp symbols"},
        r = {"<cmd>Tclose|Trouble lsp_references<CR>", "lsp references"},
        b = {"<cmd>Gitsigns toggle_current_line_blame<CR>", "git blame"},
    },

    -- run
    r = {
        name = "+run",
        R = {"<cmd>lua require('spectre').open()<CR><bar><cmd>wincmd T<CR>", "search & replace"},
        w = {"<cmd>lua require('spectre').open_visual({select_word=true})<CR><bar><cmd>wincmd T<CR>", "replace word"},
        a = {"<cmd>lua t.lsp_code_actions(require('telescope.themes').get_cursor({}))<CR>", "code action"},
        n = {"<cmd>lua vim.lsp.buf.rename()<CR>", "rename"},
    },

    -- terminal
    t = {
        name = "+terminal",
        c = {"<cmd>Tclear<CR>", "clear"},
    },

    -- diff
    d = {
        name = "+diff",
        g = {"<cmd>diffget<cr>", "get"},
        p = {"<cmd>diffput<cr>", "put"},
    },

    -- next
    n = {
        name = "+next",
        e = {"<cmd>silent lua vim.lsp.diagnostic.goto_next()<cr>", "error"},
        q = {"<cmd>cnext<cr>", "quickfix item"},
        t = {"<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>", "trouble"},
        c = {"<cmd>lua require('gitsigns.actions').next_hunk()<CR>", "change"},
        s = {"<cmd>AerialNext<CR>", "symbol"},
    },
    -- previous
    p = {
        name = "+previous",
        e = {"<cmd>silent lua vim.lsp.diagnostic.goto_prev()<cr>", "error"},
        q = {"<cmd>cprevious<cr>", "quickfix item"},
        t = {"<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", "trouble"},
        c = {"<cmd>lua require('gitsigns.actions').prev_hunk()<CR>", "change"},
        s = {"<cmd>AerialPrev<CR>", "symbol"},
    },
}, { prefix = "<leader>"})

wk.register({
    d = {
        name = "+diff",
        g = {"<cmd>'<,'>diffget<cr>", "get"},
        p = {"<cmd>'<,'>diffput<cr>", "put"},
    },
}, {prefix = "<leader>", mode = "v"})

EOF

" ### Configure AutoSave.nvim ###
lua << EOF

local autosave = require("autosave")
autosave.setup(
    {
        enabled = true,
        execution_message = "",
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {"Cargo.toml"},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 2500
    }
)

EOF


" ### Configure nvim-window ###
lua << EOF

require("nvim-window").setup{
    chars = {
        'a', 's', 'd', 'f', 'j', 'k', 'l'
    },
    border = "none",
    normal_hl = 'Visual'
}

EOF


" ### Configure neoterm ###
lua << EOF
vim.g.neoterm_default_mod = "botright"
vim.g.neoterm_autojump = 0
vim.g.neoterm_automap_keys = false
vim.g.neoterm_autoscroll = 1
vim.g.neoterm_size = 10
EOF

if has ("win32")
    " https://github.com/kassio/neoterm/issues/171#issuecomment-344291532
    let g:neoterm_eof = "\r"
    let g:neoterm_shell = "cmd"
else
    let g:neoterm_shell = "fish"
endif

" ### Configure trouble ###
lua << EOF
require("trouble").setup {
    indent_lines = false, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
}
EOF

" ### Configure bufresize.nvim ###
lua require("bufresize").setup()

" ### Configure goto-preview.nvim ###
lua << EOF
require("goto-preview").setup {
    default_mappings = true;
    border = {"", "", "", "", "", "", "", ""};
}
EOF

" ### Configure nvim-lastplace ###
lua require("nvim-lastplace").setup{}

" ### Configure dressing.nvim ###
lua << EOF
require("dressing").setup({
    input = {
        enabled = true,
        relative = "cursor",
    },
})
EOF

" ### Configure Comment.nvim ###
lua << EOF
require("Comment").setup()
EOF

" ### Configure yanky.nvim ###
lua << EOF
require("yanky").setup({
    highlight = {
        on_put = true,
        on_yank = true,
        timer = 200,
    },
    preserve_cursor_position = {
        enabled = true,
    }
})

local map = vim.api.nvim_set_keymap
map("n", "y", "<Plug>(YankyYank)", {})
map("x", "y", "<Plug>(YankyYank)", {})
map("n", "p", "<Plug>(YankyPutAfter)", {})
map("n", "P", "<Plug>(YankyPutBefore)", {})
map("x", "p", "<Plug>(YankyPutAfter)", {})
map("x", "P", "<Plug>(YankyPutBefore)", {})
map("n", "gp", "<Plug>(YankyGPutAfter)", {})
map("n", "gP", "<Plug>(YankyGPutBefore)", {})
map("x", "gp", "<Plug>(YankyGPutAfter)", {})
map("x", "gP", "<Plug>(YankyGPutBefore)", {})
map("n", "<c-n>", "<Plug>(YankyCycleForward)", {})
map("n", "<c-p>", "<Plug>(YankyCycleBackward)", {})
EOF

" ### Configure fidget.nvim ###
lua require("fidget").setup()

" Configure luasnip
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" -1 for jumping backwards.
inoremap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<cmd>lua require("luasnip").jump(-1)<Cr>' : '<Tab>'

" Configure colors
lua << EOF
vim.o.bg = "dark"
vim.g.dark_theme_set = 1
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_contrast_light = "hard"
vim.cmd("colorscheme gruvbox")

function toggle_theme()
    if vim.g.dark_theme_set == 1 then
        vim.o.bg = "light"
        vim.g.dark_theme_set = 0
    else
        vim.o.bg = "dark"
        vim.g.dark_theme_set = 1
    end
end

vim.keymap.set("n", "<F12>", "<cmd>lua toggle_theme()<cr>")

EOF

endif

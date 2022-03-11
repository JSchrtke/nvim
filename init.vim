"### General settings ###
let mapleader = "\<Space>"
filetype plugin on
set number
set relativenumber
set updatetime=500
set ignorecase
set clipboard=unnamedplus
set mouse=a
set showbreak=↪\
set listchars=tab:-->,eol:↲,nbsp:␣,trail:•,space:•,extends:⟩,precedes:⟨
set diffopt+=algorithm:histogram
set colorcolumn=100
" always having the signcolumn shown avoids the entire buffer content moving whenever there are
" signs to be displayed
set signcolumn=yes:2
set t_Co=256
set termguicolors
set nowrap

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab

" Undo/Redo
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" highlight yanked text
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{timeout=200}
augroup END

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
call plug#begin('~/.vim/plugged')

" Performance
Plug 'lewis6991/impatient.nvim', { 'commit': '3ea9abedb6941995b05fdad654d9cfd51c38a31f' }

" UI
Plug 'kyazdani42/nvim-web-devicons', { 'commit': 'ac71ca88b1136e1ecb2aefef4948130f31aa40d1' }
Plug 'norcalli/nvim-colorizer.lua', { 'commit': '36c610a9717cc9ec426a07c8e6bf3b3abcb139d6' }
Plug 'lukas-reineke/indent-blankline.nvim', { 'commit': '0f8df7e43f0cae4c44e0e8383436ad602f333419' }
Plug 'onsails/lspkind-nvim', { 'commit': 'f0d1552890e384f15b47ea88bd1b8a077cddc24a' }
Plug 'folke/trouble.nvim', { 'commit': '20469be985143d024c460d95326ebeff9971d714' }
Plug 'folke/which-key.nvim', { 'commit': '312c386ee0eafc925c27869d2be9c11ebdb807eb' }
Plug 'folke/todo-comments.nvim', { 'commit': '672cd22bd15928434374ac52d0cf38dd250231df' }
Plug 'simeji/winresizer', { 'commit': '9dc9899cedf84d78b93263b1fdb105b37c54c7b5' }
Plug 'kassio/neoterm', { 'commit': '6851a447bcbc5b6450b4f7ea1e248188a53ef487' }
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git', { 'commit': 'fad12aef4640a01c75f64ec47bf082e4a750e873' }
" TODO configure this properly
Plug 'AckslD/nvim-neoclip.lua', { 'commit': 'bfd6503ce5e2949e17e4053ca00b9e6836fe94e7' }
Plug 'folke/zen-mode.nvim', { 'commit': 'f1cc53d32b49cf962fb89a2eb0a31b85bb270f7c' }
Plug 'sindrets/winshift.nvim', { 'commit': 'aaa04b97640165eb0877bfc04943f4282887470b' }
Plug 'kwkarlwang/bufresize.nvim', { 'commit': 'fe7d011b02bb0c2ac119af05b42a681ea182ca14' }
Plug 'filipdutescu/renamer.nvim', { 'commit': '80d627372f90660f135862c8a7f8941b28ee5373' }

" Search
Plug 'nvim-lua/plenary.nvim', { 'commit': '563d9f6d083f0514548f2ac4ad1888326d0a1c66' }
Plug 'nvim-telescope/telescope.nvim', { 'commit': '015a35626d5a293dc9c19dc2bb301f25850961f6' }
Plug 'nvim-telescope/telescope-project.nvim', { 'commit': 'ad33c9eb67de635ded67069af7552d5162497b1e' }
Plug 'nvim-telescope/telescope-file-browser.nvim', { 'commit': '6df8b49f5e16cd88817892dc12a1a79062e17856' }
Plug 'windwp/nvim-spectre', { 'commit': '4a4cf2c981b077055ef7725959d13007e366ba23' }

" Editing/motions
Plug 'tpope/vim-commentary', { 'commit': '627308e30639be3e2d5402808ce18690557e8292' }
Plug 'tpope/vim-repeat', { 'commit': '24afe922e6a05891756ecf331f39a1f6743d3d5a' }
Plug 'tpope/vim-surround', { 'commit': 'aeb933272e72617f7c4d35e1f003be16836b948d' }
Plug 'michaeljsmith/vim-indent-object', { 'commit': '5c5b24c959478929b54a9e831a8e2e651a465965' }
Plug 'junegunn/vim-easy-align', { 'commit': '12dd6316974f71ce333e360c0260b4e1f81169c3' }

" Git
Plug 'tpope/vim-fugitive', { 'commit': '57968b63c266b5d37bb08fa6e3807d230b882781' }
Plug 'rbong/vim-flog', { 'commit': '2358b199117900d3e36eada1de1f2a12556a5506' }
Plug 'lewis6991/gitsigns.nvim', { 'commit': 'c18fc65c77abf95ac2e7783b9e7455a7a2fab26c' }

" LSP
Plug 'neovim/nvim-lspconfig', { 'commit': '06e54cdfa38c2129bc555b6ee77d4086c3a74e5c' }
Plug 'hrsh7th/nvim-cmp', { 'commit': '5ddf3732c51587782de24bb717eada8fa0526eb4' }
Plug 'hrsh7th/cmp-buffer', { 'commit': 'f83773e2f433a923997c5faad7ea689ec24d1785' }
Plug 'hrsh7th/cmp-nvim-lsp', { 'commit': 'b4251f0fca1daeb6db5d60a23ca81507acf858c2' }
Plug 'hrsh7th/cmp-path', { 'commit': '4d58224e315426e5ac4c5b218ca86cab85f80c79' }
Plug 'hrsh7th/vim-vsnip', { 'commit': '7fde9c0b6878a62bcc6d2d29f9a85a6616032f02' }
Plug 'hrsh7th/cmp-vsnip', { 'commit': '0abfa1860f5e095a07c477da940cfcb0d273b700' }
Plug 'ray-x/lsp_signature.nvim', { 'commit': '31149835df7a183eb1fcc4dc82cae2dbd326ce4e' }
Plug 'nvim-lua/lsp-status.nvim', { 'commit': '4073f766f1303fb602802075e558fe43e382cc92' }
Plug 'mfussenegger/nvim-jdtls', { 'commit': 'eda96facfd46abdae960a4040840124a40664903' }
Plug 'williamboman/nvim-lsp-installer', { 'commit': '57398ee78d055b3fc566092c1a09ca8df9df1d71' }

" Debugging
" TODO actually set this up
Plug 'mfussenegger/nvim-dap', { 'commit': '3f1514d020f9d73a458ac04f42d27e5b284c0e48' }

" Syntax/Languages
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate', 'commit': '9fff379c17729d4643c9ed3b2e0494e2a7bbafe8' }
Plug 'rkennedy/vim-delphi', { 'commit': 'f9846b33d4aecfa57bd892097cfe57ecdb7fe618' }
Plug 'dag/vim-fish', { 'commit': '50b95cbbcd09c046121367d49039710e9dc9c15f' }
Plug 'simrat39/rust-tools.nvim', { 'commit': 'dc71e26cc2188c00fd849e1d80fa8a72ac422032' }
Plug 'fladson/vim-kitty', { 'commit': '212be70d5f5205d6e53dbc12e48e8593ba75e2f3' }

" Editor behaviour
Plug 'Pocco81/AutoSave.nvim', { 'commit': '3d342d6fcebeede15b6511b13a38a522c6f33bf8' }
Plug 'famiu/bufdelete.nvim', { 'commit': '1c59b784c53afaf7b9ca63186da99e5d46e3e429' }
Plug 'vim-scripts/BufOnly.vim', { 'commit': '43dd92303979bdb234a3cb2f5662847f7a3affe7' }

" Colors
Plug 'JSchrtke/melange'
Plug 'rktjmp/lush.nvim', { 'commit': '57e9f310b7ddde27664c3e1a5ec3517df235124b' }
Plug 'projekt0n/github-nvim-theme', { 'commit': 'd0a4be696adeffe9f41587558ad12fe52dfa7ce5' }
Plug 'mcchrish/zenbones.nvim', { 'commit': '668ec5d2b7835b16b2b6eebb3a71e31173e5da51' }
Plug 'rebelot/kanagawa.nvim'

" File management
Plug 'elihunter173/dirbuf.nvim'

call plug#end()

" ### Configure impatient.nvim ###
lua require('impatient').enable_profile()

" ### Configure treesitter ###
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
}
EOF

" ### Configure nvim-cmp###
lua << EOF
local cmp = require 'cmp'
cmp.setup({
    experimental = {
        ghost_text = true
    },

    preselect = cmp.PreselectMode.None,

    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    completion = {
        completeopt = 'menu,menuone,noinsert',
    },

    formatting = {
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

            -- set a name for each source
            vim_item.menu = ({ buffer = "[Buffer]", nvim_lsp = "[LSP]", vsnip = "[VSnip]", })[entry.source.name]
            return vim_item
        end,
    },

    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-q>'] = cmp.mapping.close(),
        ["<c-y>"] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
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
            name = 'vsnip',
            priority = 100
        },
        {
            name = 'path',
            priority = 10
        },
--        {
--            name = 'buffer',
--            option = {
--                keyword_pattern = [[\k\+]]
--            },
--            priority = 1
--        },
    },
})

EOF

" ### Configure vim-vsnip ###
let g:vsnip_snippet_dir = expand('~/config/nvim/snippets/')
imap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
smap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'

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

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>", {silent = true})
    require 'lsp_signature'.on_attach()
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
                    max_len_align = false,
                    max_len_align_padding = 1,
                    right_align = false,
                    right_align_padding = 7
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

" ### Configure lsp_signature.nvim ###
lua << EOF

require'lsp_signature'.on_attach(
    {
        bind = true,
        doc_lines = 2,
        floating_window = true,
        hint_enable = false,
        hint_prefix = " ■ ",
        hint_scheme = "String",
        use_lspsaga = false,
        hi_parameter = "SpellRare",
        handler_opts = {border = "single"},
    }
)

EOF

" ### Configure telescope.nvim ###
lua << EOF

local actions = require('telescope.actions')
local layout = require('telescope.actions.layout')
require('telescope').setup {
    defaults = {
        borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
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
            hide_on_startup = false,
        },
        dynamic_preview_title = true,
        mappings = {
            i = {
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-p>"] = layout.toggle_preview,
            },
            n = {
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-p>"] = layout.toggle_preview,
            },
        },
    }
}

require("telescope").load_extension("file_browser")
require("telescope").load_extension("todo-comments")
require('telescope').load_extension('neoclip')
require('telescope').load_extension('project')

EOF

" ### Configure todo-comments.nvim ###
lua << EOF
require('todo-comments').setup {
    search = {
        pattern = [[\b(KEYWORDS)\b]],
    },
    highlight = {
        before = "",
        keyword = "bg",
        after = "",
        pattern = [[.*<(KEYWORDS)\s*]],
        comments_only = true,
    },
    keywords = {
        FIX = {
            icon = " ",
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "FIX", "ISSUE" },

        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    },
}

EOF

" ### Configure gitsigns.nvim ###
lua << EOF

require('gitsigns').setup{
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
}

EOF

" ### Configure indent-blankline ###
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_filetype_exclude = ['help', 'Trouble', 'markdown']
let g:indent_blankline_buftype_exclude = ['terminal']
let g:indent_blankline_bufname_exclude = ['README.md', '.*\.txt']
let g:indent_blankline_show_first_indent_level = v:true
let g:indentLine_char = '│'

" ### Configure lspkind-nvim ###
lua << EOF
require('lspkind').init({
    with_text = true,
    symbol_map = {
        Text = '',
        Method = 'ƒ',
        Function = '',
        Constructor = '',
        Variable = '',
        Class = '',
        Interface = 'ﰮ',
        Module = '',
        Property = '',
        Unit = '',
        Value = '',
        Enum = '了',
        Keyword = '',
        Snippet = '﬌',
        Color = '',
        File = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = ''
    },
})
EOF

" ### Configure winresizer ###
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
map <C-e> <nop>

" ### Configure which-key.nvim/mappings ###
" quickly navigate quickfix entries
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>

nnoremap <C-e> :lua require("telescope").extensions.file_browser.file_browser(require("telescope.themes").get_ivy())<CR>

map <silent> <F2> <cmd>lua require('renamer').rename()<cr>

lua << EOF

local wk = require("which-key")
t = require('telescope.builtin')
t_ext = require('telescope').extensions
ivy_theme = require('telescope.themes').get_ivy()

-- Normal mode, no <leader> prefix
wk.register({
    ["gd"] = {"<cmd>lua vim.lsp.buf.definition()<CR>", "go to definition"},
    ["gt"] = {"next tab"},
    ["gT"] = {"previous tab"},
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

    ["<cr>"] = {"<cmd>Ttoggle<CR>", "toggle terminal"},

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
        f = {"<cmd>lua t.find_files(ivy_theme)<CR>", "file"},
        e = {"<cmd>lua t_ext.file_browser.file_browser(ivy_theme)<CR>", "file explorer"},
        r = {"<cmd>lua t.oldfiles(ivy_theme)<CR>", "recent"},
        b = {"<cmd>lua t.buffers(ivy_theme)<CR>", "buffer"},
        p = {"<cmd>Telescope project<CR>", "project"},
        gb = {"<cmd>lua t.git_branches(ivy_theme)<CR>", "git branch"},
        gc = {"<cmd>lua t.git_commits(ivy_theme)<CR>", "git commit"},
    },

    -- find
    f = {
        name = "+find",
        f = {"<cmd>lua t.current_buffer_fuzzy_find(ivy_theme)<CR>", "in file"},
        -- for syntax documentation see https://docs.rs/regex/1.5.4/regex/#syntax
        d = {"<cmd>lua t.live_grep(ivy_theme)<CR>", "in directory"},
        w = {"<cmd>lua t.grep_string(ivy_theme)<CR>", "word"},
        s = {"<cmd>lua t.lsp_document_symbols(ivy_theme)<CR>", "document symbols"},
        S = {"<cmd>lua t.lsp_workspace_symbols(ivy_theme)<CR>", "workspace symbols"},
        q = {"<cmd>lua t.quickfix(ivy_theme)<CR>", "in quickfix list"},
        h = {"<cmd>lua t.help_tags(ivy_theme)<CR>", "in help"},
        r = {"<cmd>lua t.lsp_references(ivy_theme)<CR>", "references"},
        t = {"<cmd>lua t_ext.todo.todo(ivy_theme)<CR>", "todos"},
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
        E = {"<cmd>Trouble workspace_diagnostics<CR>", "workspace errors"},
        c = {"<cmd>lua t_ext.neoclip.default(ivy_theme)<CR>", "clipboard"},
        d = {
            function()
                require("gitsigns.actions").diffthis()
                vim.cmd("windo set foldcolumn=0")
            end,
            "git diff"
        },
        D = {"<cmd>Dirbuf<CR>", "directory buffer"},
        e = {"<cmd>lua vim.diagnostic.open_float()<CR>", "line errors"},
        h = {"<cmd>lua vim.lsp.buf.hover()<CR>", "hover"},
        i = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "signature_help"},
        l = {"<cmd>Flog<CR>", "git log"},
        q = {"<cmd>copen<CR>", "quickfix list"},
        s = {"<cmd>G<CR>", "git status"},
        t = {"<cmd>TodoTrouble<CR>", "todos"},
        r = {"<cmd>lua vim.lsp.buf.references()<CR>", "lsp references"},
    },

    -- run
    r = {
        name = "+run",
        R = {"<cmd>lua require('spectre').open()<CR><bar><cmd>wincmd T<CR>", "search & replace"},
        w = {"<cmd>lua require('spectre').open_visual({select_word=true})<CR><bar><cmd>wincmd T<CR>", "replace word"},
        a = {"<cmd>lua t.lsp_code_actions(require('telescope.themes').get_cursor({}))<CR>", "code action"},
        n = {"<cmd>lua require('renamer').rename()<CR>", "rename"},
    },

    -- terminal
    t = {
        name = "+terminal",
        c = {"<cmd>T clear<CR>", "clear"},
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
    },
    -- previous
    p = {
        name = "+previous",
        e = {"<cmd>silent lua vim.lsp.diagnostic.goto_prev()<cr>", "error"},
        q = {"<cmd>cprevious<cr>", "quickfix item"},
        t = {"<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", "trouble"},
        c = {"<cmd>lua require('gitsigns.actions').prev_hunk()<CR>", "change"},
    },
}, { prefix = "<leader>"})

-- visual mode, <leader> prefix
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
vim.g.neoterm_default_mod = "vertical botright"
vim.g.neoterm_autojump = 1
vim.g.neoterm_automap_keys = false
vim.g.neoterm_autoscroll = 1
EOF

if has ("win32")
    " https://github.com/kassio/neoterm/issues/171#issuecomment-344291532
    let g:neoterm_eof = "\r"
    let g:neoterm_shell = "pwsh"
else
    let g:neoterm_shell = "fish"
endif


" ### Configure statusline ###
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

lua << EOF
vim.opt.statusline =
" %f  %< %{get(b:,'gitsigns_head','')} %{get(b:,'gitsigns_status','')}  %{LspStatus()} %m %r %w %= Ln %l, Col %c  %{&fileencoding?&fileencoding:&encoding}  "
EOF


" ### Configure nvim-neoclip ###
lua << EOF

require('neoclip').setup({
    history = 1000,
    filter = nil,
    preview = false,
    default_register = '"',
    content_spec_column = true,
    on_paste = {
        set_reg = false,
    },
    keys = {
        telescope = {
            i = {
                select = '<cr>',
                paste = '<c-p>',
                paste_behind = '<c-k>',
            },
            n = {
                select = '<cr>',
                paste = 'p',
                paste_behind = 'P',
            },
        },
    },
})

EOF

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

" ### Configure renamer.nvim ###
lua << EOF
require("renamer").setup()
EOF

" ### Configure Colors ###
let g:github_keyword_style = "italic"
let g:github_msg_area_style = "bold"
let g:github_function_style = "bold"
let g:github_dark_float = v:true
let g:github_dark_sidebars = v:true
let g:github_sidebars = ["qf", "terminal", "neoterm", "Trouble"]
let g:github_hide_inactive_statusline = v:false

lua << EOF

local function ends_with(str, ending)
   return ending == "" or str:sub(-#ending) == ending
end

local function split (inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

local function check_windows_theme()
    local theme = vim.fn.system("cmd.exe /C reg query HKCU\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize /v AppsUseLightTheme")
    local is_light_theme = ends_with(split(theme)[4], "1")
    if is_light_theme then
        return "light"
    else
        return "dark"
    end
end

local function check_linux_theme()
    local current_theme = vim.fn.system("bash -c 'gsettings get org.gnome.desktop.interface gtk-theme'")
    -- '%p' matches all punctuation chars, '%c' matches all control characters and '%s' matches all whitespace characters.
    current_theme = current_theme:gsub("[%p%c%s]", "")
    local is_light_theme = ends_with(current_theme, "light")
    if is_light_theme then
        return "light"
    else
        return "dark"
    end
end

function set_light_theme()
    local light_theme = "github_light"
    vim.cmd("colorscheme "..light_theme)
end

function set_dark_theme()
    local dark_theme = "kanagawa"
    vim.cmd("colorscheme "..dark_theme)
end

function set_highlights()
    if vim.opt.background:get() == "light" then
        vim.cmd("highlight! DiffText guibg=#73bdff guifg=#24292e")
        vim.cmd("highlight! Visual guibg=#BBDFFF")
        vim.cmd("highlight! LineNr guifg=#005CC5")
    else
        vim.cmd("highlight! LineNr guifg=#9389A8")
    end
end

function set_theme()
    local theme = ""
    if vim.fn.has("unix") == 1 then
        theme = check_linux_theme()
    else
        theme = check_windows_theme()
    end

    if theme == "light" then
        set_light_theme()
    else
        set_dark_theme()
    end
    set_highlights()
end

set_theme()

EOF

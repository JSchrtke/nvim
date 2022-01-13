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
set signcolumn=yes

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
tnoremap <C-Esc> <C-\><C-n>

" quickly navigate through the quickfix list
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>

" ### Install plugins ###
call plug#begin('~/.vim/plugged')

" Performance
Plug 'lewis6991/impatient.nvim', { 'commit': '3ea9abedb6941995b05fdad654d9cfd51c38a31f' }

" UI
Plug 'nvim-lualine/lualine.nvim', { 'commit': 'bc5c2f5658821f98e55013eb3bec9d540c420470' }
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

" Search
Plug 'nvim-lua/plenary.nvim', { 'commit': '563d9f6d083f0514548f2ac4ad1888326d0a1c66' }
Plug 'nvim-telescope/telescope.nvim', { 'commit': '015a35626d5a293dc9c19dc2bb301f25850961f6' }
Plug 'nvim-telescope/telescope-project.nvim', { 'commit': 'ad33c9eb67de635ded67069af7552d5162497b1e' }
Plug 'nvim-telescope/telescope-file-browser.nvim', { 'commit': '6df8b49f5e16cd88817892dc12a1a79062e17856' }
Plug 'windwp/nvim-spectre', { 'commit': '4a4cf2c981b077055ef7725959d13007e366ba23' }

" Editing/motions
Plug 'tpope/vim-commentary', { 'commit': '627308e30639be3e2d5402808ce18690557e8292' }
Plug 'tpope/vim-surround', { 'commit': 'aeb933272e72617f7c4d35e1f003be16836b948d' }
Plug 'michaeljsmith/vim-indent-object', { 'commit': '5c5b24c959478929b54a9e831a8e2e651a465965' }
Plug 'junegunn/vim-easy-align', { 'commit': '12dd6316974f71ce333e360c0260b4e1f81169c3' }
Plug 'tpope/vim-repeat', { 'commit': '24afe922e6a05891756ecf331f39a1f6743d3d5a' }
Plug 'ggandor/lightspeed.nvim', { 'commit': '2cc567615b4889a7fd3db502b42f9207e8cab6f1' }

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
Plug 'simrat39/rust-tools.nvim', { 'commit': '7eb435069b307f55bdc3aa27bd3fe4ad704e66db' }

" Editor behaviour
Plug 'Pocco81/AutoSave.nvim', { 'commit': '3d342d6fcebeede15b6511b13a38a522c6f33bf8' }
Plug 'famiu/bufdelete.nvim', { 'commit': '1c59b784c53afaf7b9ca63186da99e5d46e3e429' }
Plug 'vim-scripts/BufOnly.vim', { 'commit': '43dd92303979bdb234a3cb2f5662847f7a3affe7' }

" Colors
Plug 'JSchrtke/melange'
Plug 'rktjmp/lush.nvim', { 'commit': '57e9f310b7ddde27664c3e1a5ec3517df235124b' }
Plug 'projekt0n/github-nvim-theme', { 'commit': 'd0a4be696adeffe9f41587558ad12fe52dfa7ce5' }
Plug 'mcchrish/zenbones.nvim', { 'commit': '668ec5d2b7835b16b2b6eebb3a71e31173e5da51' }

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
cmp.setup {
    experimental = {
        ghost_text = true
    },

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
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },

    sources = {
        { name = 'vsnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
    },
}
EOF

" ### Configure vim-vsnip ###
imap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
smap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'

" ### Configure nvim diagnostics ###
lua << EOF

local function lspSymbol(name, icon)
    vim.fn.sign_define('DiagnosticSign' .. name, {text = icon, texthl = 'Diagnostic' .. name})
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
    -- TODO what do these 2 lines do here?
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    require 'lsp_signature'.on_attach()
end

-- lsp status
local lsp_status = require("lsp-status")
lsp_status.config({
    status_symbol = ' ',
    indicator_info = ' '
})
lsp_status.register_progress()

-- lsp installer
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(
    function(server)
        local opts = {}
        server:setup(opts)
        vim.cmd([[do User LspAttachBuffers]])
    end
)

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
            width = 0.95,
            height = 0.9,
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
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
            },
            n = {
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
                ["<BS>"] = layout.toggle_preview,
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
    }
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

" ### Configure which-key.nvim
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
    ["K"] = {"<cmd>lua vim.lsp.buf.hover()<CR>", "hover"},
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

    -- open
    c = {"<cmd>lua t.commands()<CR>", "run command"},
    o = {
        name = "+open",
        f = {"<cmd>lua t.find_files()<CR>", "file"},
        e = {"<cmd>lua t_ext.file_browser.file_browser()<CR>", "file explorer"},
        r = {"<cmd>lua t.oldfiles()<CR>", "recent"},
        b = {"<cmd>lua t.buffers()<CR>", "buffer"},
        p = {"<cmd>Telescope project<CR>", "project"},
        gb = {"<cmd>lua t.git_branches()<CR>", "git branch"},
        gc = {"<cmd>lua t.git_commits()<CR>", "git commit"},
    },

    -- find
    f = {
        name = "+find",
        f = {"<cmd>lua t.current_buffer_fuzzy_find()<CR>", "in file"},
        -- for syntax documentation see https://docs.rs/regex/1.5.4/regex/#syntax
        d = {"<cmd>lua t.live_grep()<CR>", "in directory"},
        w = {"<cmd>lua t.grep_string()<CR>", "word"},
        s = {"<cmd>lua t.lsp_document_symbols()<CR>", "document symbols"},
        S = {"<cmd>lua t.lsp_workspace_symbols()<CR>", "workspace symbols"},
        q = {"<cmd>lua t.quickfix()<CR>", "in quickfix list"},
        h = {"<cmd>lua t.help_tags()<CR>", "in help"},
        r = {"<cmd>lua t.lsp_references()<CR>", "references"},
        t = {"<cmd>lua t_ext.todo.todo()<CR>", "todos"},
    },

    -- layout
    l = {
        name = "+layout",
        h = {"<cmd>wincmd H<CR>", "drag window left"},
        j = {"<cmd>wincmd J<CR>", "drag window down"},
        k = {"<cmd>wincmd K<CR>", "drag window up"},
        l = {"<cmd>wincmd L<CR>", "drag window right"},
        H = {"<cmd>vsplit<CR>", "split left"},
        J = {"<cmd>split<bar>wincmd j<CR>", "split down"},
        K = {"<cmd>split<CR>", "split up"},
        L = {"<cmd>vsplit<bar>wincmd l<CR>", "split right"},
        r = {"<cmd>WinResizerStartResize<CR>", "resize mode"},
        e = {"<cmd>wincmd =<CR>", "equalize size"},
        m = { "<cmd>WinShift<CR>", "toggle window move mode"},
        s = { "<cmd>WinShift swap<CR>", "toggle window swap mode"},
        z = {"<cmd>ZenMode<CR>", "toggle zen mode"},
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
    },

    -- go
    g = {
        name = "+go",
        C = {"<cmd>lua require('gitsigns.actions').prev_hunk()<CR>", "previous change"},
        D = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "declaration"},
        E = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "previous error"},
        c = {"<cmd>lua require('gitsigns.actions').next_hunk()<CR>", "next change"},
        d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "definition"},
        e = {"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "next error"},
        h = {"<cmd>wincmd h<CR>", "move left"},
        i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "implementation"},
        j = {"<cmd>wincmd j<CR>", "move down"},
        k = {"<cmd>wincmd k<CR>", "move up"},
        l = {"<cmd>wincmd l<CR>", "move right"},
        t = {"<cmd>lua vim.lsp.buf.type_definition()<CR>", "type definition"},
        w = {"<cmd>lua require('nvim-window').pick()<CR>", "pick window"},
        b = {"<cmd>BufferLinePick<CR>", "pick buffer"},
    },

    -- show
    s = {
        name = "+show",
        E = {"<cmd>Trouble workspace_diagnostics<CR>", "workspace errors"},
        c = {"<cmd>lua t_ext.neoclip.default(ivy_theme)<CR>", "clipboard"},
        d = {"<cmd>Gvdiffsplit<bar>wincmd l<CR>", "git diff (current file)"},
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
        r = {"<cmd>lua vim.lsp.buf.rename()<CR>", "rename"},
        c = {"<cmd>lua t.commands(ivy_theme)<CR>", "command"},
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

    -- new
    n = {
        name = "+new",
        t = {"<cmd>tabnew<CR>", "tab"},
        T = {"<cmd>wincmd T<CR>", "tab from current buffer"},
        b = {"<cmd>enew<CR>", "buffer"},
        gb = {"<cmd>call nvim_feedkeys(':Git switch -c ', 't',v:true)<cr>", "git branch"},
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

" ### Configure winresizer ###
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
map <C-e> <nop>

" ### Configure rust-tools.nvim ###
lua << EOF

local opts = {
    tools = { -- rust-tools options
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

    server = {
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                }
            }
        }
    }
}

require('rust-tools').setup(opts)

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
    normal_hl = 'PMenuSel'
}

EOF


" ### Configure neoterm ###
let g:neoterm_default_mod = 'topleft'
let g:neoterm_autojump = 1
let g:neoterm_automap_keys = v:false

if has ("win32")
    " https://github.com/kassio/neoterm/issues/171#issuecomment-344291532
    let g:neoterm_eof = "\r"
    let g:neoterm_shell = "pwsh"
else
    let g:neoterm_shell = "fish"
endif


" ### Configure guis
" nvui
if exists(':NvuiAnimationsEnabled')
    set guifont=JetBrainsMono\ NF:h13
    :NvuiCursorAnimationDuration 0.02
    :NvuiMoveAnimationDuration 0.08
    :NvuiSnapshotLimit 64
    :NvuiTitlebarFontFamily BlexMono\ NF
    :NvuiScrollAnimationDuration 0.06
endif

" neovide
set guifont=FiraCode\ NF:h13
let g:neovide_refresh_rate = 144
let g:neovide_cursor_animation_length = 0.025
let g:neovide_cursor_antialiasing=v:true

" guifont size + 1
function! s:ZoomIn()
  let l:fsize = substitute(&guifont, '^.*:h\([^:]*\).*$', '\1', '')
  let l:fsize += 1
  let l:guifont = substitute(&guifont, ':h\([^:]*\)', ':h' . l:fsize, '')
  let &guifont = l:guifont
endfunction

" guifont size - 1
function! s:ZoomOut()
  let l:fsize = substitute(&guifont, '^.*:h\([^:]*\).*$', '\1', '')
  let l:fsize -= 1
  let l:guifont = substitute(&guifont, ':h\([^:]*\)', ':h' . l:fsize, '')
  let &guifont = l:guifont
endfunction

" command
command! -narg=0 ZoomIn    :call s:ZoomIn()
command! -narg=0 ZoomOut   :call s:ZoomOut()
command! -narg=0 ZoomReset :call s:ZoomReset()

" map
nmap + :ZoomIn<CR>
nmap - :ZoomOut<CR>


" ### Configure lualine.nvim ###
lua << EOF

require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'github',
        component_separators = {left='', right=''},
        section_separators = {left='', right=''},
        disabled_filetypes = {'help', 'NvimTree'}
    },
    sections = {
        lualine_a = {
            {'filename', file_status = true, path = 1},
        },
        lualine_b = {
            {'branch'},
            {'diff', colored = false},
        },
        lualine_c = {
            "require'lsp-status'.status()",
        },
        lualine_x = {
            'encoding',
            {'filetype', colored = false, icon_only = true},
        },
        lualine_y = {
            'progress'
        },
        lualine_z = {
            'location'
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {'filename', file_status = true, path = 2},
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

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

" ### Configure Colors ###
set t_Co=256
set termguicolors
set encoding=utf-8

highlight! link CmpItemAbbrDefault Pmenu
highlight! link CmpItemMenuDefault Pmenu

let g:github_keyword_style = "italic"
let g:github_msg_area_style = "bold"
let g:github_function_style = "bold"
let g:github_dark_float = v:true
let g:github_dark_sidebars = v:true
let g:github_sidebars = ["qf", "terminal", "neoterm", "Trouble"]

function! SetLightTheme()
    colorscheme github_light_default
    highlight! DiffText ctermbg=225 guifg=#b08800 guibg=#fff5b1
    highlight! link DiffChange CursorLine
    highlight! link ColorColumn StatusLine
    highlight! link NonText Whitespace
    highlight! link LineNr Comment
    highlight! link CursorLineNr CursorLine

    highlight! TelescopeNormal guibg=#E7E9EB

    highlight! TelescopePromptNormal guibg=#D5E5F6

    highlight! link TelescopePromptBorder TelescopePromptNormal
    highlight! TelescopePromptTitle gui=bold 

    highlight! link TelescopePreviewBorder TelescopeNormal
    highlight! TelescopePreviewTitle gui=bold,underline

    highlight! link TelescopeResultsBorder TelescopeNormal
    highlight! TelescopeResultsTitle gui=bold,underline
lua << EOF
    require'lualine'.setup {
        options = {
            theme = 'github'
        },
    }
EOF
endfunction

function! SetDarkTheme()
    colorscheme github_dark_default
    highlight! DiffText ctermbg=5 guifg=#e3b341 guibg=#341a00
    highlight! link DiffChange CursorLine
    highlight! link ColorColumn StatusLine
    highlight! link NonText Whitespace
    highlight! link LineNr Comment
    highlight! link CursorLineNr CursorLine

    highlight! TelescopeNormal guifg=#c9d1d9 guibg=#090C10

    highlight! TelescopePromptNormal guifg=#c9d1d9 guibg=#161B22
    highlight! link TelescopePromptBorder TelescopePromptNormal
    highlight! TelescopePromptTitle gui=bold 

    highlight! link TelescopePreviewBorder TelescopeNormal
    highlight! TelescopePreviewTitle gui=bold,underline

    highlight! link TelescopeResultsBorder TelescopeNormal
    highlight! TelescopeResultsTitle gui=bold,underline
lua << EOF
    require'lualine'.setup {
        options = {
            theme = 'github'
        },
    }
EOF
endfunction

command! Light :call SetLightTheme()
command! Dark :call SetDarkTheme()

function! CheckWindowsTheme()
    if system("powershell.exe -NoProfile (Get-ItemProperty  -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize\\).SystemUsesLightTheme") == 1
        return "light"
    else
        return "dark"
    endif
endfunction

function! CheckLinuxTheme()
    let time = strftime("%H%M")
    if 855 <= time && time <= 1604
        return "light"
    else
        return "dark"
    end
endfunction

function! CheckTheme()
    if has("win32")
        return CheckWindowsTheme()
    else
        return CheckLinuxTheme()
    endif
endfunction

function! CheckAndSetTheme()
    if CheckTheme() == "dark"
        call SetDarkTheme()
    else
       call SetLightTheme()
    endif
endfunction

command! C :call CheckAndSetTheme()

call CheckAndSetTheme()

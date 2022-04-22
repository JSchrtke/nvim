if has("nvim")
"### General settings ###
let mapleader = "\<Space>"
filetype plugin on
set nonumber
set norelativenumber
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
set scrolloff=3
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
call plug#begin('~/.vim/plugged')

" Performance
Plug 'lewis6991/impatient.nvim'

" UI
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/trouble.nvim'
Plug 'folke/which-key.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'simeji/winresizer'
Plug 'kassio/neoterm'
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
" TODO configure this properly
Plug 'AckslD/nvim-neoclip.lua'
Plug 'folke/zen-mode.nvim'
Plug 'sindrets/winshift.nvim'
Plug 'kwkarlwang/bufresize.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'rmagatti/goto-preview'
Plug 'https://github.com/nvim-lualine/lualine.nvim'
Plug 'SmiteshP/nvim-gps'
Plug 'stevearc/dressing.nvim'
Plug 'lukas-reineke/virt-column.nvim'
Plug 'notomo/cmdbuf.nvim'
Plug 'stevearc/aerial.nvim'

" Search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'windwp/nvim-spectre'
Plug 'nvim-telescope/telescope-fzf-native.nvim'

" Editing/motions
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'junegunn/vim-easy-align'
Plug 'ggandor/leap.nvim'
Plug 'jvgrootveld/telescope-zoxide'

" Git
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'lewis6991/gitsigns.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'williamboman/nvim-lsp-installer'

" Debugging
" TODO actually set this up
Plug 'mfussenegger/nvim-dap'

" Syntax/Languages
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'rkennedy/vim-delphi'
Plug 'dag/vim-fish'
Plug 'simrat39/rust-tools.nvim'
Plug 'fladson/vim-kitty'
Plug 'lervag/vimtex'

" Editor behaviour
Plug 'Pocco81/AutoSave.nvim'
Plug 'famiu/bufdelete.nvim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'ethanholz/nvim-lastplace'
Plug 'gbprod/yanky.nvim'

" Colors
Plug 'JSchrtke/melange'
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
lua <<EOF
local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.delphi = "pascal"
require'nvim-treesitter.configs'.setup{
    highlight = {
        enable = true,
    }
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

            -- set a name for each source
            vim_item.menu = ({ buffer = "[Buffer]", nvim_lsp = "[LSP]", vsnip = "[VSnip]", })[entry.source.name]
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
            name = 'vsnip',
            priority = 100
        },
        {
            name = 'path',
            priority = 10
        },
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
    require('lsp_signature').on_attach()
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
local trouble = require("trouble.providers.telescope")

require('telescope').setup {
     extensions = {
         fzf = {
             fuzzy = true,
             override_generic_sorter = true,
             override_file_sorter = true,
             case_mode = "smart_case",
         }
    },
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
                ["<C-q>"] = trouble.open_with_trouble,
                ["<M-p>"] = layout.toggle_preview,
            },
            n = {
                ["<C-q>"] = trouble.open_with_trouble,
                ["<M-p>"] = layout.toggle_preview,
            },
        },
    }
}

 -- telescope extensions
require("telescope").load_extension("todo-comments")
require('telescope').load_extension('neoclip')
require('telescope').load_extension('project')
require('telescope').load_extension('zoxide')
require('telescope').load_extension('fzf')

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
        f = {"<cmd>lua t.find_files()<CR>", "file"},
        e = {"<cmd>e .<CR>", "file explorer"},
        r = {"<cmd>lua t.oldfiles()<CR>", "recent"},
        b = {"<cmd>lua t.buffers()<CR>", "buffer"},
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
        j = {"<cmd>lua t_ext.zoxide.list{}<CR>", "type definition"},
    },

    -- show
    s = {
        name = "+show",
        E = {"<cmd>Trouble workspace_diagnostics<CR>", "workspace errors"},
        c = {"<cmd>lua t_ext.neoclip.default()<CR>", "clipboard"},
        d = {"<cmd>Gvdiffsplit|wincmd l<CR>", "git diff"},
        e = {"<cmd>lua vim.diagnostic.open_float()<CR>", "line errors"},
        h = {"<cmd>lua vim.lsp.buf.hover()<CR>", "hover"},
        i = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "signature_help"},
        l = {"<cmd>Flog<CR>", "git log"},
        q = {"<cmd>copen<CR>", "quickfix list"},
        s = {"<cmd>tabnew|G<CR>", "git status"},
        S = {"<cmd>AerialToggle!<CR>", "lsp symbols"},
        t = {"<cmd>TodoTrouble<CR>", "todos"},
        r = {"<cmd>Trouble lsp_references<CR>", "lsp references"},
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
vim.g.neoterm_default_mod = "vertical"
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

" ### Configure lualine ###
lua << EOF
local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

-- Lua
local gps = require("nvim-gps")
gps.setup()

local function location()
    if gps.is_available() then
        return gps.get_location()
    else
        return ""
    end
end

require('lualine').setup {
  options = {
    component_separators = '',
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = process_sections {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
      },
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_c = {
      { location },
    },
    lualine_x = {},
    lualine_y = { search_result, 'filetype' },
    lualine_z = { '%l:%c', '%p%%/%L' },
  },
  inactive_sections = {
    lualine_c = { '%f %y %m' },
    lualine_x = {},
  },
  tabline = {
    lualine_a = {
      { 'filename', file_status = false, path = 1 },
      { modified },
    },
    lualine_y = {
        { 'buffers' },
    },
    lualine_z = { 
        { 'tabs'  },
    },
  },
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

" ### Configure lir.nvim ###
lua << EOF
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

local lir = require("lir")
lir.setup {
    show_hidden_files = false,
    devicons_enable = true,
    mappings = {
        ['l']     = actions.edit,
        ['<CR>']     = actions.edit,
        ['<C-s>'] = actions.split,
        ['<C-v>'] = actions.vsplit,
        ['<C-t>'] = actions.tabedit,

        ['h']     = actions.up,
        ['q']     = actions.quit,

        ['ad']     = actions.mkdir,
        ['af']     = actions.newfile,
        ['r']     = actions.rename,
        ['@']     = actions.cd,
        ['yy']     = actions.yank_path,
        ['.']     = actions.toggle_show_hidden,
        ['dd']     = actions.delete,

        ['o'] = function()
            local ctx = lir.get_context()
            local current = ctx:current()
            if vim.fn.has("win32") == 1 then
                vim.fn.system('start ' .. current.fullpath)
            else
                vim.fn.system('xdg-open ' .. current.fullpath)
            end
        end,

        ['J'] = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
        end,

        ['C'] = clipboard_actions.copy,
        ['X'] = clipboard_actions.cut,
        ['P'] = clipboard_actions.paste,
    },

    float = {
        winblend = 0,
        curdir_window = {
            enable = false,
            highlight_dirname = false
        },
    },
    hide_cursor = true,
    on_init = function()
        vim.api.nvim_buf_set_keymap(
            0,
            "x",
            "J",
            ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
            { noremap = true, silent = true }
        )

        vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
    end,
}

require'nvim-web-devicons'.set_icon({
    lir_folder_icon = {
        icon = "",
        color = "#7ebae4",
        name = "LirFolderNode"
    }
})
EOF

" ### Configure dressing.nvim ###
lua << EOF
require("dressing").setup({
    input = {
        enabled = true,
        relative = "cursor",
    },
})
EOF

" ### Configure virt-column.nvim ###
lua << EOF
require("virt-column").setup{}
EOF

" ### Configure cmdbuf.nvim ###
lua << EOF
vim.keymap.set("n", "q:", function()
  require("cmdbuf").split_open(vim.o.cmdwinheight)
end)
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

" ### Configure leap.nvim ###
lua << EOF
require("leap").set_default_keymaps()
EOF

" ### Configure aerial.nvim ###
lua << EOF
require("aerial").setup({
    min_width = 20,
    default_direction = "prefer_left",
})
EOF

" ### Configure Colors ###
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

local function windows_theme()
    local theme = vim.fn.system("cmd.exe /C reg query HKCU\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize /v AppsUseLightTheme")
    local is_light_theme = ends_with(split(theme)[4], "1")
    if is_light_theme then
        return "light"
    else
        return "dark"
    end
end

local function linux_theme()
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

local function system_theme() 
    if vim.fn.has("unix") == 1 then
        return linux_theme()
    else
        return windows_theme()
    end
end

function set_light_theme()
    require("github-theme").setup({
        theme_style = "light",
        function_style = "bold",
        dark_float = true,
    })
    vim.cmd("colorscheme github_light")
end

function set_dark_theme()
    require("github-theme").setup({
        theme_style = "dark",
        function_style = "bold",
        dark_float = true,
    })
    vim.cmd("colorscheme github_dark")
end

function set_highlights(theme_style)
    if theme_style == "light" then
        vim.cmd("highlight! DiffText guibg=#73bdff guifg=#24292e")
        vim.cmd("highlight! Visual guibg=#BBDFFF")
        vim.cmd("highlight! ColorColumn guifg=#e1e4e8 guibg=#ffffff")
    else
        vim.cmd("highlight! DiffText guibg=#295F9E guifg=#ffffff")
    end
end

function set_theme(theme_style)
    if theme_style == "light" then
        set_light_theme()
    else
        set_dark_theme()
    end

    set_highlights(theme_style)
end

set_theme(system_theme())

EOF
endif

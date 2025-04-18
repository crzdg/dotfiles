local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true,         -- shows a list of your marks on ' and `
        registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true,      -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true,      -- default bindings on <c-w>
            nav = true,          -- misc bindings to work with windows
            z = true,            -- bindings for folds, spelling and others prefixed with z
            g = true,            -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded",       -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 },                                           -- min and max height of the columns
        width = { min = 20, max = 50 },                                           -- min and max width of the columns
        spacing = 3,                                                              -- spacing between columns
        align = "left",                                                           -- align columns left, center or right
    },
    ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true,                                                             -- show help message on the command line when the popup is visible
    triggers = "auto",                                                            -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
    ["e"] = { "<cmd>:NvimTreeToggle<cr>", "Tree" },
    ["r"] = { "<cmd>:NvimTreeFocus<cr>", "Focus Tree" },
    ["w"] = { "<cmd>w!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },
    ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["b"] = { "<cmd>FzfLua buffers<cr>", "Find buffer" },
    ["f"] = { "<cmd>FzfLua git_files<cr>", "Find files" },
    ["F"] = { "<cmd>FzfLua live_grep<cr>", "Find text" },
    ["G"] = { "<cmd>FzfLua grep<cr>", "Grep" },
    ["t"] = { "<cmd>FzfLua files<cr>", "Find files" },
    g = {
        name = "Git",
        b = { "<cmd>FzfLua git_bcommits<cr>", "Buffer commits" },
        C = { "<cmd>FzfLua git_branches<cr>", "Checkout branch" },
        r = { "<cmd>FzfLua git_status<cr>", "Open changed file" },
        c = { "<cmd>FzfLua git_commits<cr>", "Checkout commit" },
        d = {
            "<cmd>Gitsigns diffthis HEAD<cr>",
            "Diff",
        },
        l = { "<cmd>FzfLua git_commits<cr>", "Repo commits" },
    },
    --
    l = {
        name = "LSP",
        u = { "<cmd>FzfLua lsp_finder<cr>", "Show Finder" },
        f = { "<cmd>FzfLua lsp_finder<cr>", "Show Finder" },
        d = { "<cmd>FzfLua lsp_definitions<cr>", "Show definitions" },
        r = { "<cmd>FzfLua lsp_references<cr>", "Show references" },
        a = { "<cmd>FzfLua lsp_code_actions<cr>", "Code Action" },
        D = {
            "<cmd>TroubleToggle<cr>",
            "Document Diagnostics",
        },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    },
    s = {
        name = "Search",
        b = { "<cmd>FzfLua buffers<cr>", "Find buffer" },
        f = { "<cmd>FzfLua git_files<cr>", "Find git-files" },
        F = { "<cmd>FzfLua live_grep<cr>", "Find text" },
        t = { "<cmd>FzfLua files<cr>", "Find files in tree" },
    },
    u = {
        name = "Utilities",
        h = { "<cmd>FzfLua help_tags<cr>", "Find Help" },
        r = { "<cmd>FzfLua oldfiles<cr>", "Open Recent File" },
        k = { "<cmd>FzfLua keymaps<cr>", "Keymaps" },
    },
    T = {
        name = "TestSuite",
        f = { "<cmd>TestFile<cr>", "Run test of current file" },
        n = { "<cmd>TestNearest<cr>", "Run the nearest test" },
        s = { "<cmd>TestSuite<cr>", "Run the TestSuite" },
        v = { "<cmd>TestVisit<cr>", "Visit last test file" }
    },
    --   T = {
    --   name = "Terminal",
    --   -- n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    --   -- u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    --   t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    --   -- p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    --   f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    --   h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    --   v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    -- },
}

which_key.setup(setup)
which_key.register(mappings, opts)

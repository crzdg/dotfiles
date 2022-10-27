-- require'py_lsp'.setup {
--     host_python = "/home/rb/dev/python/venvs/nvim/bin"
-- }
require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.bufferline"
require "user.lualine"
require "user.whichkey"
require "user.indentline"

-- Coding
require "user.cmp"
require "user.vim-test"
require "user.treesitter"
require "user.comment"
require "user.gitsigns"
require "user.trouble"
require "user.lsp_signature_config"

-- LSP
require "user.lspsaga"
require "user.lsp"

-- Utils
require "user.fzf-lua"
require "user.nvim-tree"
require "user.autopairs"
require "user.project"
require "user.impatient"
require "user.autocommands"
require "user.surround"
require "user.nvim-tmux-navigation"

-- Load tint in the end to cache all highlights
require "user.tint"

-- archive
-- require "user.alpha"
-- require "user.toggleterm"
-- require "user.nvim-tree"
-- require "user.telescope"


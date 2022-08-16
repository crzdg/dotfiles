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
require "lsp_signature".setup({ hint_prefix="", doc_lines=0 })

-- LSP
require "user.lspsaga"
require "user.lsp"

-- Utils
require "user.fzf-lua"
require "user.autopairs"
require "user.project"
require "user.impatient"
require "user.autocommands"
require "user.surround"

-- archive
-- require "user.alpha"
-- require "user.toggleterm"
-- require "user.nvim-tree"
-- require "user.telescope"


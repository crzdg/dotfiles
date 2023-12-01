-- Disable autocmd for ts_context_commentstring to use with Comment
-- Will be deprecated in the future
vim.g.skip_ts_context_commentstring_module = true
require("ts_context_commentstring").setup { enable_autocmd = false }

require('Comment').setup {
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}

vim.g.gruvbox_baby_background_color = "dark"
vim.g.gruvbox_baby_transparent_mode = 1
vim.g.gruvbox_baby_function_style = "bold"
vim.g.gruvbox_baby_comment_style = "NONE"
vim.g.gruvbox_baby_keyword_style = "NONE"
local colors = require("gruvbox-baby.colors").config()
vim.g.gruvbox_baby_highlights = {
    Search = { bg = colors.gray, fg = colors.background },
}


vim.cmd[[colorscheme gruvbox-baby]]

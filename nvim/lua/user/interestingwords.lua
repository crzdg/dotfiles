local colors = require("gruvbox-baby.colors").config()
local cmd = string.format([[ let g:interestingWordsGUIColors = ["%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s", "%s"] ]],
    colors.forest_green,
    colors.magenta,
    colors.blue_gray,
    colors.bright_yellow,
    colors.error_red,
    colors.clean_green,
    colors.pink,
    colors.soft_yellow,
    colors.red
)

vim.cmd(cmd)

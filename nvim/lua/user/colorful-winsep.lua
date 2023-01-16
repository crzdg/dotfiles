local colors = require("gruvbox-baby.colors").config()
require("colorful-winsep").setup({
        highlight = {
            bg = colors.background,
            fg = colors.orange
        },
        create_event = function()
            local win_n = require("colorful-winsep.utils").getWinNumber()
            local colorful_winsep = require("colorful-winsep")
            if win_n == 2 then
                local win_id = vim.fn.win_getid(vim.fn.winnr('h'))
                local filetype = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win_id), 'filetype')
                if filetype == "NvimTree" then
                    colorful_winsep.NvimSeparatorDel()
                end
            end
        end
})

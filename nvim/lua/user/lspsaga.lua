local saga = require('lspsaga')
saga.setup({
    lightbulb = {
        enable = false,
        virtual_text = false,
    },
    symbol_in_winbar = {
        enable = false,
    },
    use_saga_diagnostic_sign = false,
    diagnostic_header_icon = ' 🪳 ',
    diagnostic_message_format = "%m %c (%s)",
    diagnostic_prefix_format = "%d. ",
    finder = {
        keys = {
            open = "o",
            vsplit = "s",
            split = "v",
            quit = "q"
        }
    },
    rename = { keys = { quit = "C-q" } },
    code_action = { keys = { quit = "q" } },
    definition = { width = 0.6, height = 0.6 },
}
)

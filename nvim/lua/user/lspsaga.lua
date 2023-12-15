local saga = require('lspsaga')
saga.setup({
    use_saga_diagnostic_sign = false,
    diagnostic_header_icon = ' 🪳 ',
    diagnostic_message_format = "%m %c (%s)",
    diagnostic_prefix_format = "%d. ",
    code_action_prompt = {
        enable = false,
        virtual_text = false,
        sign = false,
    },
    rename_output_qflist = {
        enable = false,
        auto_open_qflsit = false,
    },
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "v",
        quit = "q"
    },
    code_action_keys = {
        quit = "q"
    },
    rename_action_keys = {
        quit = "C-q",
    },
}
)

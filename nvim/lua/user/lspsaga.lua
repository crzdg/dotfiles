local saga = require('lspsaga')
saga.init_lsp_saga({
    use_saga_diagnostic_sign = false,
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
        quit= "q",
    },
    max_preview_lines = 120
 }
)

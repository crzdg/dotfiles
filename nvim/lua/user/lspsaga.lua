local config = {
    lightbulb = {
        enable = false,
        virtual_text = false,
    },
    symbol_in_winbar = {
        enable = false,
    },
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

return config

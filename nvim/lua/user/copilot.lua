require("copilot").setup({
    panel = { enabled = false },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
            accept = "<c-l>",
            next = "<c-j>",
            prev = "<c-k>",
            dismiss = "<c-h>",
        },
    },
    filetypes = {
        lua = true,
        python = true
    },
})
-- copilot_cmp seems tp be broken
-- to use uncomment and set suggestion / panel enabled to false
-- require("copilot_cmp").setup()

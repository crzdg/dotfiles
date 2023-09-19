require("copilot").setup({
    panel = { enabled = false },
    suggestion = { enabled = false },
    filetypes = { lua = true, python = true },
})
require("copilot_cmp").setup()

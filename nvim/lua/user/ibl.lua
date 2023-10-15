require "ibl".setup({
    enabled = true,
    scope = {
        enabled = true,
        injected_languages = true,
        show_start = true,
    },
    indent = {
        char = "▏"
    },
    exclude = {
        buftypes = { "terminal", "nofile" },
        filetypes = {
            "lspinfo",
            "packer",
            "checkhealth",
            "help",
            "man",
            "gitcommit",
            "TelescopePrompt",
            "TelescopeResult",
            "startify",
            "dashboard",
            "neogitstatus",
            "NvimTree",
            "Trouble"
        }
    },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
require 'lspconfig'.pylsp.setup{
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pylint = {
                    enabled = true,
                    args = {"--output-format=text"},
                    executable = "pylint"
                },
                jedi_completion = {
                    fuzzy = true
                },
                pylsp_mypy = {
                    enabled = true,
                    live_mode = true,
                    dmypy = false,
                    overrides = {true, "--no-pretty", "--hide-error-context"},
                },
            }
        }
    }
}

require("user.utils")

local function searchPath()
    if isInGitRepo()
        then
            return gitRepoPath()
    end
    return "."
end

local basepath = searchPath()

local function pylintrc()
    return exists(basepath .. "/pylintrc")
end

local function mypy()
    return exists(basepath .. "/mypy.ini")
end

local function ruff()
    return exists(basepath .. "/ruff.toml")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
require 'lspconfig'.pylsp.setup{
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pylint = {
                    enabled = pylintrc(),
                    args = {"--output-format=text"},
                    executable = "pylint"
                },
                jedi_completion = {
                    fuzzy = true
                },
                pylsp_mypy = {
                    enabled = mypy(),
                    live_mode = false,
                    dmypy = true,
                    overrides = {true, "--no-pretty", "--hide-error-context"},
                },
                ruff = {
                    enabled = ruff(),
                }
            }
        }
    }
}

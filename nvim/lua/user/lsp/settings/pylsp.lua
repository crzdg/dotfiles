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

vim.lsp.config("pylsp", {
        capabilities = require("user.lsp.handlers").capabilities,
        settings = {
            pylsp = {
                plugins = {
                    pyls_isort = {
                        enabled = true
                    },
                    pylint = {
                        enabled = pylintrc(),
                        args = { "--output-format=text" },
                        executable = "pylint"
                    },
                    jedi_completion = {
                        fuzzy = true
                    },
                    pylsp_mypy = {
                        enabled = mypy(),
                        live_mode = true,
                        dmypy = false,
                        overrides = { true, "--no-pretty", "--hide-error-context" },
                    },
                    ruff = {
                        enabled = ruff(),
                    }
                }
            }
        }
    }
)

vim.lsp.enable("pylsp")

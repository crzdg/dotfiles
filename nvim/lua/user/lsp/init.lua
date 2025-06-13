local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- [[ require("user.lsp.lsp-installer") ]]
require("user.lsp.handlers").setup()

require("user.lsp.settings.pylsp")
require("user.lsp.settings.jsonls")
require("user.lsp.settings.lua_ls")
require("user.lsp.settings.yamlls")
require("user.lsp.settings.bashls")
require("user.lsp.settings.mojo")
require("user.lsp.settings.rust_analyzer")
require("user.lsp.settings.vue_language_server")

local null_ls = require('null-ls') -- or require('null-ls') if using old version

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
  }
})
-- require("user.lsp.settings.pylyzer")

--[[ capabilities = vim.lsp.protocol.make_client_capabilities() ]]
--[[ capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities) ]]
--[[ capabilities.textDocument.completion.completionItem.snippetSupport = true ]]
--[[ require("lspconfig").jsonls.setup {capabilities = capabilities, require("user.lsp.settings.jsonls").opts} ]]

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

--[[ require("user.lsp.lsp-installer") ]]
require("user.lsp.handlers").setup()

require("user.lsp.settings.pylsp")
require("user.lsp.settings.jsonls")
require("user.lsp.settings.lua_ls")
require("lspconfig").yamlls.setup{}
require("user.lsp.settings.bashls")

--[[ capabilities = vim.lsp.protocol.make_client_capabilities() ]]
--[[ capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities) ]]
--[[ capabilities.textDocument.completion.completionItem.snippetSupport = true ]]
--[[ require("lspconfig").jsonls.setup {capabilities = capabilities, require("user.lsp.settings.jsonls").opts} ]]




require('lspconfig').volar.setup({
  on_attach = function(client, bufnr)
    -- Disable Volar's formatting so Prettier handles it
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

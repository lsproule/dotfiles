return {
  "pylsp",
  enabled = true,
  config = function(lspconfig)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    lspconfig.pylsp.setup({
      capabilities = capabilities,
    })
  end

}

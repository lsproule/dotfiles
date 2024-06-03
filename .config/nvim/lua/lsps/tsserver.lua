return {
  "tsserver",
  enabled = true,
  config = function(lspconfig)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    lspconfig.tsserver.setup({
      capabilities = capabilities,
      settings = {
        completions = {
          completeFunctionCalls = true,
        },
      },
    })
  end

}


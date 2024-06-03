return {
  "graphql",
  enabled = false,
  config = function(lspconfig)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.graphql.setup({
      capabilities = capabilities,
    })
  end,
}

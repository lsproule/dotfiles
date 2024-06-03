return {
  "bashls",
  enabled = true,
  config = function(lspconfig)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.bashls.setup({
      capabilities = capabilities,
    })
  end,
}

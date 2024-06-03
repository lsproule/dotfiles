return {
  "cssls",
  enabled = true,
  config = function(lspconfig)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.cssls.setup({
      capabilities = capabilities,
    })
  end,
}

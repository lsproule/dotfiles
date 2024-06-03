return {
  "prismals",
  enabled = false,
  config = function(lspconfig)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.prismals.setup({
      capabilities = capabilities,
    })
  end,

}

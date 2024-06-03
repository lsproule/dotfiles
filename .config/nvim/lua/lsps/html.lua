return {
  "html",
  enabled = true,
  config = function(lspconfig)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.html.setup({
      capabilities = capabilities,
    })
  end,
}

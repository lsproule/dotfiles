return {
  "gopls",
  enabled = true,
  config = function(lspconfig)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.gopls.setup({
      capabilities = capabilities,
    })
  end,
}

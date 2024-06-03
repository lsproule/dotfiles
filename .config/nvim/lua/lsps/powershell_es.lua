return {
  "powershell_es",
  enabled = true,
  config = function(lspconfig)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.powershell_es.setup({
      capabilities = capabilities,
    })
  end,
}

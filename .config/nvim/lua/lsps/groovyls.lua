return {
  "groovyls",
  enabled = false,
  config = function(lspconfig)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.groovyls.setup({
      capabilities = capabilities,
    })
  end,
}

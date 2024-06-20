return {
  "ruby_lsp",
  config = function(lspconfig)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.ruby_lsp.setup({
      capabilities = capabilities,
    })
  end,
}

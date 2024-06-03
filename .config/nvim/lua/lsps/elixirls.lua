return {
  "elixirls",
  enabled = false,
  config = function(lspconfig)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.elixirls.setup({
      capabilities = capabilities,
    })
  end,
}

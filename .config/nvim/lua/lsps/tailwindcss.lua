return {
  "tailwindcss",
  enabled = true,
  config = function(lspconfig)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
    })
  end,
}

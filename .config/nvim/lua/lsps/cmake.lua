return {
  "cmake",
  enabled = true,
  config = function(lspconfig)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.cmake.setup({
      capabilities = capabilities,
    })
  end,
}

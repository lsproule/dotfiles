return {
  "dockerls",
  enabled = true,
  config = function(lspconfig)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.dockerls.setup({
      capabilities = capabilities,
    })
  end,
}

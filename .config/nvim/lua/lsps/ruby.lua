return {
  "ruby_ls",
  config = function(lspconfig)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.ruby_ls.setup({
      capabilities = capabilities,
    })
  end,
}

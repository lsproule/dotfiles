return {
  "ruby_ls",
  enabled = true,
  function(lspconfig)
    local capabilities =  require("cmp_nv_lsp").default_capabilities()
    lspconfig.ruby_ls.setup({
      capabilities = capabilities,
    })
  end,
}

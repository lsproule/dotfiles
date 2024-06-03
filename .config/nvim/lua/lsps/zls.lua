return {
  "zls",
  enabled = false,
  config = function()
    require("lspconfig").zls.setup({
      cmd = { "zls" },
      filetypes = { "zig" },
      on_attach = require("lsp").common_on_attach,
    })
  end,
}

return {
  "zls",
  config = function()
    require("lspconfig").zls.setup({
      cmd = { "zls" },
      filetypes = { "zig" },
    })
  end,
}

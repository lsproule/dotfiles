return {
  "ray-x/lsp_signature.nvim",
  opts = {},
  event = "LspAttach",
  config = function(_, opts) require'lsp_signature'.setup(opts) end
}

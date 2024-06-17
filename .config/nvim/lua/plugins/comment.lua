return {
  "terrortylor/nvim-comment",
  event = "LspAttach",
  config = function()
    require("nvim_comment").setup({})
  end,
}

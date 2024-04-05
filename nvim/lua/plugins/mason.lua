return {
  {
    "williamboman/mason.nvim",
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
  },
  "williamboman/mason-lspconfig.nvim",
  "jay-babu/mason-null-ls.nvim",
}

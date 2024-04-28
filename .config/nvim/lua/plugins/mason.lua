return {
  {
    "williamboman/mason.nvim",
    event = "VimEnter",
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VimEnter",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VimEnter",
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = "VimEnter",
  },
}

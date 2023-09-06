return {
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "nvim-lua/plenary.nvim",
  "folke/neodev.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",
  "nvim-treesitter/nvim-treesitter",
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = { filesystem = { hijack_netrw_behavior = "open_current", filtered_items = { visible = true } } },
  }
}

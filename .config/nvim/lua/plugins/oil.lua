return {
  "stevearc/oil.nvim",
  enabled = false,
  config = function()
    require("oil").setup({})
    vim.keymap.set("n", "<leader>o", function()
      vim.cmd("Oil")
    end)
  end,
}

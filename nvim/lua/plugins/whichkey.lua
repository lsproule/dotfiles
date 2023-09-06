return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    vim.keymap.set("n", "<leader>", function ()
      vim.cmd(":WhichKey")
    end)
  end,
}

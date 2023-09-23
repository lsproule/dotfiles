return {
  "tpope/vim-repeat",
  {
    "pappasam/nvim-repl",

    config = function()
      vim.g.repl_filetype_commands = {
        javascript = "node",
        python = "ipython --no-autoindent",
      }
    end,
  },
}

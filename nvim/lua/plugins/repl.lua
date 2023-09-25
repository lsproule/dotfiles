return {
  "tpope/vim-repeat",
  {
    "ACupofAir/nvim-repl",

    config = function()
      vim.g.repl_split = "bottom"
      vim.g.repl_height = 10
      vim.g.repl_filetype_commands = {
        javascript = "node",
        python     = "ipython --no-autoindent",
        lua        = "lua",
        sh         = "bash",
        c          = "clang_repl",
        cpp        = "clang_repl",
        rust       = "papyrus",
      }
    end,
  },
}

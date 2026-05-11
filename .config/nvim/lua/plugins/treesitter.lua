return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    --build = ":TSUpdate",
    config = function()
      --require("nvim-treesitter.configs").setup({
      --  modules = {},
      --  sync_install = false,
      --  ensure_installed = {"vimdoc", "lua", "vim", "python", "go", "typescript"},
      --  ignore_install = {},
      --  auto_install = true,
      --  highlight = {
      --    disable = {"*.txt"},
      --  },
      --})
    end,
  },
}

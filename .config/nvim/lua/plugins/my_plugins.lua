return {
  {
    dir = "/home/lucas/plugins/git_lines",
    event = "LspAttach",
    name = "git_lines.nvim",
    config = function()
      require("git_lines").setup({})
    end,
  },
  {
    dir = "/home/lucas/plugins/lsps-manager",
    event = "VimEnter",
    name = "lsp-manager",
    lazy = false,
    config = function()
      require("lsp-manager").setup {}
    end,
  },
  {
    dir = "/home/lucas/plugins/reg-edit",
    event = "VimEnter",
    name = "reg-edit",
    lazy = false,
    config = function()
      require("reg-edit").setup({
        command_name = "RegEdit",
        keys = {
          open = "<leader>re",
          clear = "<leader>c",
        },
      })
    end,
  },
  --{
  --  dir = "/home/lucas/plugins/nvfs",
  --  event = "VimEnter",
  --  name = "nvfs",
  --  lazy = false,
  --  config = function()
  --    require("nvfs").setup{}
  --  end,
  --}
}

-- Local plugins live in ~/plugins. Expand at load time so the config is
-- username-agnostic (no hardcoded /home/lucas) and survives a fresh bootstrap.
local plugins = vim.fn.expand("~/plugins")

return {
  {
    dir = plugins .. "/git_lines",
    event = "LspAttach",
    name = "git_lines.nvim",
    config = function()
      require("git_lines").setup({})
    end,
  },
  {
    dir = plugins .. "/lsps-manager",
    event = "VimEnter",
    name = "lsp-manager",
    lazy = false,
    -- Dependencies that must load before lsp-manager.setup() runs:
    --  * mason / mason-lspconfig: mason puts its bin dir on PATH and provides the
    --    registry + server->package mappings used to install servers.
    --  * nvim-lspconfig: ships the bundled lsp/<name>.lua defaults (cmd, filetypes,
    --    root_dir). The minimal per-server configs (e.g. `return {"pyright"}`) rely
    --    on these being on the runtimepath; without it servers have no cmd/filetypes.
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("lsp-manager").setup {}
    end,
  },
  {
    dir = plugins .. "/reg-edit",
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
  --  dir = plugins .. "/nvfs",
  --  event = "VimEnter",
  --  name = "nvfs",
  --  lazy = false,
  --  config = function()
  --    require("nvfs").setup{}
  --  end,
  --}
}

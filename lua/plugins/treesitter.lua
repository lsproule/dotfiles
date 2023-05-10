return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "windwp/nvim-ts-autotag", "JoosepAlviste/nvim-ts-context-commentstring" },
    cmd = {
      "TSBufDisable",
      "TSBufEnable",
      "TSBufToggle",
      "TSDisable",
      "TSEnable",
      "TSToggle",
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSModuleInfo",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSPlaygoundToggle",
    },
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      incremental_selection = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = {
        "markdown",
        "markdown_inline",
        "tsx",
        "typescript",
        "javascript",
        "rust",
        "toml",
        "fish",
        "php",
        "json",
        "yaml",
        "rust",
        "python",
        "css",
        "html",
        "lua",
      },
    },
    config = require "plugins.configs.nvim-treesitter",
  },
  {
    "nvim-treesitter/playground",
    event = "User Astrofile",
    enable = true,
    config = {
      function()
        local status_ok, configs = pcall(require, "nvim-treesitter.configs")
        configs.setup {
          playground = {
            enable = true,
            disable = {},
            updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = {
              toggle_query_editor = "o",
              toggle_hl_groups = "i",
              toggle_injected_languages = "t",
              toggle_anonymous_nodes = "a",
              toggle_language_display = "I",
              focus_language = "f",
              unfocus_language = "F",
              update = "R",
              goto_node = "<cr>",
              show_help = "?",
            },
          },
        }
      end,
    },
  },
}

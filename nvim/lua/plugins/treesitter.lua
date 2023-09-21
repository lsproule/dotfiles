return {
  {
    event = "BufEnter",
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        modules = {},
        sync_install = false,
        ensure_installed = {},
        ignore_install = {},
        auto_install = false,
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
          filetypes = { "html", "xml" },
        },
      })
    end,
  },
  {
    "nvim-treesitter/playground",
    config = function()
      require("nvim-treesitter.configs").setup({
        modules = {},
        sync_install = false,
        ensure_installed = {},
        ignore_install = {},
        auto_install = false,
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
          filetypes = { "html", "xml" },
        },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25,    -- Debounced time for highlighting nodes in the playground from source code
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
      })
    end,
  },
}

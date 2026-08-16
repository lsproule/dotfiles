-- Completion engine: blink.cmp (replaces nvim-cmp).
-- Capabilities are advertised to LSP servers by lsp-manager via
-- require("blink.cmp").get_lsp_capabilities() (see lsp-manager init.lua).
return {
  "saghen/blink.cmp",
  version = "*", -- use a release tag so the prebuilt fuzzy matcher is downloaded
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    -- blink.compat lets us reuse nvim-cmp sources (vim-dadbod-completion for SQL)
    "saghen/blink.compat",
  },
  opts = {
    snippets = { preset = "luasnip" },

    sources = {
      -- snippets come from the built-in "snippets" source (luasnip preset below),
      -- not a "luasnip" source id (that was removed in newer blink.cmp).
      default = { "lsp", "snippets", "path", "buffer" },
      -- SQL buffers also get vim-dadbod-completion (an nvim-cmp source) via blink.compat
      per_filetype = {
        sql = { "dadbod", "lsp", "snippets", "path", "buffer" },
        mysql = { "dadbod", "lsp", "snippets", "path", "buffer" },
        plsql = { "dadbod", "lsp", "snippets", "path", "buffer" },
      },
      providers = {
        dadbod = {
          name = "vim-dadbod-completion", -- the nvim-cmp source name
          module = "blink.compat.source",
        },
      },
    },

    keymap = {
      preset = "default",
      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<C-j>"] = { "select_next", "snippet_forward", "fallback" },
      ["<C-k>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    signature = { enabled = true },
  },
}

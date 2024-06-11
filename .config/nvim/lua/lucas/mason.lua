local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local completions = null_ls.builtins.completion
local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

null_ls.setup({
  sources = {
    formatting.stylua,
    formatting.clang_format,
    require("none-ls.formatting.jq"),
    require("none-ls.code_actions.eslint"),
    formatting.prettierd,
    formatting.rubocop,
    formatting.cmake_format,
    formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "jsonc",
        "yaml",
        "markdown",
        "markdown.mdx",
        "graphql",
        "handlebars",
      },
    }),
    completions.spell,
  },
})

require("mason").setup()
require("mason-null-ls").setup({
  ensure_installed = {
    "tsserver",
    "flake8",
    "stylua",
  },
  handlers = {
    function() end, -- disables automatic setup of all null-ls sources
    stylua = function()
      null_ls.register(null_ls.builtins.formatting.stylua)
    end,
    shfmt = function(source_name, methods)
      require("mason-null-ls").default_setup(source_name, methods) -- to maintain default behavior
    end,
  },
  automatic_installation = true,
})

require("mason-lspconfig").setup({
  automatic_installation = true,
})


local lsps = {
  "pylsp",
  "tsserver",
}

require("neodev").setup()
local null_ls = require("null-ls")

null_ls.setup({})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
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
    formatting.stylua,
    diagnostics.eslint_d,
  },

  --format on save
  on_attach = function(current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = "userlspconfig", buffer = bufnr })
      vim.api.nvim_create_autocmd("InsertLeave", {
        group = "userlspconfig",
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            async = true,
            filter = function(client)
              -- only use null-ls for formatting instead of lsp server
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
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
    stylua = function(source_name, methods)
      null_ls.register(null_ls.builtins.formatting.stylua)
    end,
    shfmt = function(source_name, methods)
      -- custom logic
      require("mason-null-ls").default_setup(source_name, methods) -- to maintain default behavior
    end,
  },
  automatic_installation = true,
})

require("mason-lspconfig").setup({
  ensure_installed = lsps,
  automatic_installation = true,
})

-------------------------

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.tbl_map(function(item)
  lspconfig[item].setup({})
end, lsps)

lspconfig.tsserver.setup({
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
  },
  capabilities = capabilities,
})

lspconfig.lua_ls.setup({
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
      client.config.settings = vim.tbl_deep_extend("force", client.config.settings.Lua, {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
        },
        -- Make the server aware of Neovim runtime files
        workspace = {
          -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
          library = vim.api.nvim_get_runtime_file("", true),
        },
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end,
})

vim.keymap.set("n", "<space>ld", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("userlspconfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gk", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-f>", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>d", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>p", function()
      vim.lsp.buf.format({ async = true })
    end, opts)

    --vim.api.nvim_create_autocmd("InsertLeave", { group = "userlspconfig", callback = vim.lsp.buffer.format})
  end,
})

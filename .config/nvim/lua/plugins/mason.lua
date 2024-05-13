return {
  {
    "williamboman/mason.nvim",
    event = "VimEnter",
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("userlspconfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gk", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<C-f>", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
          end, opts)
          vim.keymap.set("n", "<leader>d", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>p", function()
            vim.lsp.buf.format({ async = true })
          end, opts)

          vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
          vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

          --vim.api.nvim_create_autocmd("InsertLeave", { group = "userlspconfig", callback = vim.lsp.buffer.format})
        end,
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VimEnter",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VimEnter",
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = "VimEnter",
  },
}

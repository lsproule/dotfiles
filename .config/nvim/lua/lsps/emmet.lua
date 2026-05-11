return {
  "emmet_ls",
  config = function()
    vim.lsp.config["emmet_ls"] = {
      filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
      init_options = {
        html = {
          options = {
            ["bem.enabled"] = true,
          },
        },
      }
    }
  end,
}

return {
  "helm_ls",
  config = function()
    vim.lsp.config["helm_ls"] = {
      cmd = { "helm_ls", "serve" },
      filetypes = { "helm" },
      root_dir = function(fname)
        return require("lspconfig.util").root_pattern("Chart.yaml")(fname)
      end,
    }
  end,
}


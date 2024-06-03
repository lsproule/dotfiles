return {
  "helm_ls",
  enabled = false,
  function(lspconfig)
    lspconfig.helm_ls.setup({
      cmd = { "helm_ls", "serve" },
      filetypes = { "helm" },
      root_dir = function(fname)
        return require("lspconfig.util").root_pattern("Chart.yaml")(fname)
      end,
    })
  end,
}


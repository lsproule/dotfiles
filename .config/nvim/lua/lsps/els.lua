return {
  "emmet_language_server",
  opts = {
    -- bundled defaults + javascript/pug (carried over from the old emmet_ls config)
    filetypes = {
      "astro", "css", "eruby", "html", "htmlangular", "htmldjango",
      "javascript", "javascriptreact", "less", "pug", "sass", "scss",
      "svelte", "typescriptreact", "vue",
    },
    init_options = {
      -- emmet-language-server passes `preferences` through to @vscode/emmet-helper
      preferences = {
        ["bem.enabled"] = true,
      },
    },
  },
}

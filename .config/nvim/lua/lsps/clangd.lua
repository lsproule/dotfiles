return {
  "clangd",
  config = function()
    -- capabilities come from the global vim.lsp.config("*") default (blink.cmp)
    vim.lsp.config["clangd"] = {
      cmd = { "clangd", "--background-index", "--offset-encoding=utf-16" },
      filetypes = { "c", "cpp", "objc", "objcpp", "ixx", "hpp", "h" },
      init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true,
        semanticHighlighting = true,
      },
      settings = {
        clangd = {
          InlayHints = {
            Designators = true,
            Enabled = true,
            ParameterNames = true,
            DeducedTypes = true,
          },
          fallbackFlags = { "-std=c++20" },
        },
      },
    }
  end,
}

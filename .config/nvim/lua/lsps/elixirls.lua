return {
  "elixirls",
  config = function()
    -- elixir-ls: the default root_dir returns nil when no mix.exs is found
    -- upward, so the client never attaches to loose .exs scripts.
    -- Fall back to the file's dir (or cwd) so single-file scripts get an LSP.
    vim.lsp.config("elixirls", {
      root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        local matches = vim.fs.find({ "mix.exs" }, { upward = true, limit = 2, path = fname })
        local child, umbrella = matches[1], matches[2]
        local root = ((umbrella or child) and vim.fs.dirname(umbrella or child))
          or vim.fs.dirname(fname)
          or vim.fn.getcwd()
        on_dir(root)
      end,
    })
  end,
}

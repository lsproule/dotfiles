    vim.api.nvim_create_autocmd("BufEnter", {
      command = "set nornu nonu | Neotree toggle",
    })
    vim.api.nvim_create_autocmd("BufEnter", {
      command = "set rnu nu",
    })

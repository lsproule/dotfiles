local api = vim.api


api.nvim_create_user_command("Ex", function()
  api.nvim_command("NvimTreeFindFileToggle")
end, { desc = "Open file explorer" })



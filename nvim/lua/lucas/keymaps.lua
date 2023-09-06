vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd.wincmd("p")
  else
    vim.cmd("Neotree source=filesystem reveal_force_cwd position=left")
  end
end, { desc = "Toggle Explorer Focus" })

vim.keymap.set("n", "<C-Up>", function()
  vim.cmd("horizontal resize -10")
end)
vim.keymap.set("n", "<C-Down>", function()
  vim.cmd("horizontal resize +10")
end)
vim.keymap.set("n", "<C-Right>", function()
  vim.cmd("vertical resize +10")
end)
vim.keymap.set("n", "<C-Left>", function()
  vim.cmd("vertical resize -10")
end)
vim.keymap.set("n", "<leader>th", function()
  vim.cmd("ToggleTerm direction=horizontal")
end)
vim.keymap.set("n", "<leader>tv", function()
  vim.cmd("ToggleTerm direction=vertical")
end)
vim.keymap.set("n", "<leader>tf", function()
  vim.cmd("ToggleTerm direction=float")
end)

vim.keymap.set("n", "<leader>h", [[<Cmd>wincmd h<CR>]])
vim.keymap.set("n", "<leader>j", [[<Cmd>wincmd j<CR>]])
vim.keymap.set("n", "<leader>k", [[<Cmd>wincmd k<CR>]])
vim.keymap.set("n", "<leader>l", [[<Cmd>wincmd l<CR>]])
vim.keymap.set("n", "<C-h>", [[<Cmd>wincmd h<CR>]])
vim.keymap.set("n", "<C-j>", [[<Cmd>wincmd j<CR>]])
vim.keymap.set("n", "<C-k>", [[<Cmd>wincmd k<CR>]])
vim.keymap.set("n", "<C-l>", [[<Cmd>wincmd l<CR>]])


function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead

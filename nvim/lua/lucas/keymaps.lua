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
end, { desc = "Resize up" })
vim.keymap.set("n", "<C-Down>", function()
  vim.cmd("horizontal resize +10")
end, { desc = "Resize down" })
vim.keymap.set("n", "<C-Right>", function()
  vim.cmd("vertical resize +10")
end, { desc = "Resize right" })
vim.keymap.set("n", "<C-Left>", function()
  vim.cmd("vertical resize -10")
end, { desc = "Resize left" })
vim.keymap.set("n", "<leader>th", function()
  vim.cmd("ToggleTerm direction=horizontal")
end, { desc = "Toggle horizontal Terminal" })
vim.keymap.set("n", "<leader>tv", function()
  vim.cmd("ToggleTerm direction=vertical")
end, { desc = "Toggle vertical Terminal" })
vim.keymap.set("n", "<leader>tf", function()
  vim.cmd("ToggleTerm direction=float")
end, { desc = "Toggle floating Terminal" })

vim.keymap.set("n", "<leader>h", [[<Cmd>wincmd h<CR>]], { desc = "Move left" })
vim.keymap.set("n", "<leader>j", [[<Cmd>wincmd j<CR>]], { desc = "Move down" })
vim.keymap.set("n", "<leader>k", [[<Cmd>wincmd k<CR>]], { desc = "Move up" })
vim.keymap.set("n", "<leader>l", [[<Cmd>wincmd l<CR>]], { desc = "Move right" })
vim.keymap.set("n", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move left" })
vim.keymap.set("n", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Move down" })
vim.keymap.set("n", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move up" })
vim.keymap.set("n", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Move right" })

vim.keymap.set({ "n", "i", "v" }, "<esc>", [[<C-\><C-n>]])
local opts = { buffer = 0 }
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)

vim.keymap.set("n", "<leader>ts", function()
  vim.cmd("TSPlaygroundToggle")
end, { desc = "Toggle TS Playground" })

vim.keymap.set("n", "<leader>sh", function()
  vim.cmd("split")
end, { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>sv", function()
  vim.cmd("vsplit")
end, { desc = "Split vertically" })

--DadBod
vim.keymap.set("n", "sd", "<Cmd>DB", { desc = "connect to db" })

-- my plugin
vim.keymap.set("n", "vip", "<Cmd>lua require('lucas.helper').select()<CR>", { desc = "Select" })

vim.keymap.set("v","<C-c>", ":w ! pbcopy<CR>")


vim.keymap.set("n", "<leader>/", "<Cmd>CommentToggle<CR>", { desc = "Comment" })
vim.keymap.set("v", "<leader>/", function ()
  require('nvim_comment').comment_range(true)
  
end, { desc = "Comment" })

-- harpoon
vim.keymap.set("n", "<leader>hu", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Harpoon UI" })
vim.keymap.set("n", "<leader>ha", function()
  require("harpoon.mark").add_file()
end, { desc = "Harpoon add file" })

vim.keymap.set("n", "<leader>rt", function()
  vim.cmd("ReplToggle")
end)
vim.keymap.set("n", "<leader>rr", function()
  vim.cmd("ReplRunCell")
end)
vim.keymap.set("n", "<leader>rl", function()
  vim.cmd("ReplSend")
end)
vim.keymap.set({ "v", "x" }, "<leader>x", function()
  vim.cmd("ReplSend")
end)

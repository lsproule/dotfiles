vim.g.mapleader = " "


vim.keymap.set("n", "<leader>e", function()
	if vim.bo.filetype == "nvim-tree" then
		vim.cmd("NvimTreeOpen")
	else
		vim.cmd("NvimTreeToggle")
	end
end, { desc = "Toggle Explorer Focus" })

--vim.keymap.set("n", "<leader>e", require("telescope.builtin").find_files, { desc = "Find Files" })


vim.keymap.set("n", "<leader>w", function()
	if vim.bo.filetype == "neo-tree" then
		vim.cmd.wincmd("p")
	else
		vim.cmd("Neotree source=git-status reveal_force_cwd position=left")
	end
end, { desc = "Toggle Explorer Focus" })

-- split screen
vim.keymap.set("n", "<leader>\\", function()
  vim.cmd("vsplit")
end, { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>-", function()
  vim.cmd("split")
end, { desc = "Split vertically" })

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



function CountTerms()
    local buffers = vim.api.nvim_list_bufs()
    local terminal_count = 0

    for _, buf in ipairs(buffers) do
        if vim.bo[buf].buftype == "terminal" then
            terminal_count = terminal_count + 1
        end
    end
    return terminal_count
end

vim.keymap.set("n", "<leader>th", function()
	vim.cmd("ToggleTerm direction=horizontal")
end, { desc = "toggle horizontal terminal" })

vim.keymap.set("n", "<leader>tn", function()
     local command = CountTerms() + 1 .. "ToggleTerm"
     vim.cmd(command)
 end, { noremap = true, silent = true, desc = "New" })

vim.keymap.set("n", "<leader>tv", function()
	vim.cmd( "ToggleTerm direction=vertical")
end, { desc = "Toggle vertical Terminal" })
vim.keymap.set("n", "<leader>tf", function()
	vim.cmd( "ToggleTerm direction=float")
end, { desc = "Toggle floating Terminal" })

vim.keymap.set("n", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move left" })
vim.keymap.set("n", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Move down" })
vim.keymap.set("n", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move up" })
vim.keymap.set("n", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Move right" })


vim.keymap.set({ "n", "v", "i" }, "<F2>", function()
	require("knap").process_once()
end, { desc = "Process and refresh latex" })
vim.keymap.set({ "n", "v", "i" }, "<F3>", function()
	require("knap").close_viewer()
end, { desc = "Close viewer" })
vim.keymap.set({ "n", "v", "i" }, "<F4>", function()
	require("knap").toggle_autopreviewing()
end, { desc = "Autoprocessing" })
vim.keymap.set({ "n", "v", "i" }, "<F5>", function()
	require("knap").forward_jump()
end, { desc = "SyncTeX" })

vim.keymap.set({ "n", "i", "v" , "t" }, "<esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])

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

--vim.keymap.set("v", "<C-c>", ":w ! pbcopy<CR>")

vim.keymap.set("n", "<leader>/", "<Cmd>CommentToggle<CR>", { desc = "Comment" })
vim.keymap.set("v", "<leader>/", "<Cmd>CommentToggle<CR>", { desc = "Comment" })

vim.keymap.set("v", "<leader>q", function()
	local start_line = vim.fn.getpos("'<")
	local end_line = vim.fn.getpos("'>")
	print(vim.inspect(start_line))
	print(vim.inspect(end_line))
	-- vim.cmd(start_line .. "," .. end_line .. " w ! xargs echo")
end
)


vim.keymap.set("v", "gl", function()
  vim.cmd("GitLink true")
end)

vim.keymap.set("n", "<Leader>gl", function()
  vim.cmd("GitLink")
end)


-- Copilot
vim.keymap.set("n", "<leader>cp", function()
  vim.cmd("Copilot toggle")
end, { desc = "toggle Copilot" })

vim.keymap.set("v", "<leader>y", 'y+"' , { desc = "Copy to clipboard" })
-- harpoon
vim.keymap.set("n", "<leader>hu", function()
	require("harpoon.ui").toggle_quick_menu()
end, { desc = "Harpoon UI" })
vim.keymap.set("n", "<leader>ha", function()
	require("harpoon.mark").add_file()
end, { desc = "Harpoon add file" })

vim.keymap.set("n", "<leader>rt", function() vim.cmd("ReplToggle")
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

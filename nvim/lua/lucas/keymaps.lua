vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", function()
	if vim.bo.filetype == "neo-tree" then
		vim.cmd.wincmd("p")
	else
		vim.cmd("Neotree source=filesystem reveal_force_cwd position=left")
	end
end, { desc = "Toggle Explorer Focus" })

return {
	{
		dir = "/home/lucas/plugins/git_lines",
		event = "LspAttach",
		name = "git_lines.nvim",
		config = function()
			require("git_lines").setup({})
		end,
	},
	{
		dir = "/home/lucas/plugins/lsps-manager",
		event = "VimEnter",
		name = "lsp",
		lazy = false,
		config = function()
			require("lsp-manager").setup({})
		end,
	},
}

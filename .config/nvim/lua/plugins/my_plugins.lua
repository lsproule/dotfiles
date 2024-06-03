return {
	{
		dir = "/Users/lucas/plugins/git_lines.nvim",
    event = "VeryLazy",
    name = "git_lines.nvim",
    config = function()
      require("git_lines").setup({})
    end,
	},
	{
		dir = "/Users/lucas/plugins/lsp",
    name = "lsp",
    config = function()
      require("lsp").setup({})
    end,
	},
}

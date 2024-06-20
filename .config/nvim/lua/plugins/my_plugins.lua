return {
	{
		dir = "/Users/lucas/plugins/git_lines.nvim",
    event = "LspAttach",
    name = "git_lines.nvim",
    config = function()
      require("git_lines").setup({})
    end,
	},
	{
		dir = "/Users/lucas/plugins/lsp",
    event = "LspAttach",
    name = "lsp",
    lazy = false,
    config = function()
      require("lsp-manager").setup({})
    end,
	},
}

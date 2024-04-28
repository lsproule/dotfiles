return {
	{
		dir = "/home/lucas/plugins/git_lines.nvim",
    event = "VeryLazy",
    name = "git_lines.nvim",
    config = function()
      require("git_lines").setup({})
    end,
	},
	{
		dir = "/home/lucas/plugins/autorun.nvim",
    event = "VeryLazy",
    name = "autorun.nvim",
	},
}

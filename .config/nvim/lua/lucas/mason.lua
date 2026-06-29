--local null_ls = require("null-ls")

--local formatting = null_ls.builtins.formatting
--local completions = null_ls.builtins.completion
local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

--null_ls.setup({
--	sources = {
--		formatting.stylua,
--		formatting.clang_format,
--		require("none-ls.formatting.jq"),
--		require("none-ls.code_actions.eslint"),
--		formatting.prettierd,
--		formatting.rubocop,
--		formatting.cmake_format,
--		formatting.prettier.with({
--			filetypes = {
--				"javascript",
--				"javascriptreact",
--				"typescript",
--				"typescriptreact",
--				"vue",
--				"css",
--				"scss",
--				"less",
--				"html",
--				"json",
--				"jsonc",
--				"yaml",
--				"markdown",
--				"markdown.mdx",
--				"graphql",
--				"handlebars",
--			},
--		}),
--		completions.spell,
--	},
--})

require("mason").setup({

})
--require("mason-null-ls").setup({
--	ensure_installed = {
--		"tsserver",
--		"flake8",
--		"stylua",
--	},
--	handlers = {
--		function() end, -- disables automatic setup of all null-ls sources
--		stylua = function()
--			null_ls.register(null_ls.builtins.formatting.stylua)
--		end,
--		shfmt = function(source_name, methods)
--			require("mason-null-ls").default_setup(source_name, methods) -- to maintain default behavior
--		end,
--	},
--	automatic_installation = true,
--})

require("mason-lspconfig").setup({
	automatic_installation = true,
})

-- elixir-ls: lspconfig's default root_dir returns nil when no mix.exs is
-- found upward, so the client never attaches to loose .exs scripts.
-- Fall back to the file's dir (or cwd) so single-file scripts get an LSP.
vim.lsp.config("elixirls", {
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local matches = vim.fs.find({ "mix.exs" }, { upward = true, limit = 2, path = fname })
		local child, umbrella = matches[1], matches[2]
		local root = ((umbrella or child) and vim.fs.dirname(umbrella or child))
			or vim.fs.dirname(fname)
			or vim.fn.getcwd()
		on_dir(root)
	end,
})

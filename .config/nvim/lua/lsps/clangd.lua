return {
	"clangd",
	enabled = true,
	config = function(lspconfig)
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		lspconfig.clangd.setup({
			cmd = { "clangd", "--background-index", "--offset-encoding=utf-16" },
			capabilities = capabilities,
			filetypes = { "c", "cpp", "objc", "objcpp" },
			root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
			init_options = {
				clangdFileStatus = true,
				usePlaceholders = true,
				completeUnimported = true,
				semanticHighlighting = true,
			},
		})
	end,
}

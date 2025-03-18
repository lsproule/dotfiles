return {
	"clangd",
	config = function(lspconfig)
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		lspconfig.clangd.setup({
			cmd = { "clangd", "--background-index", "--offset-encoding=utf-16" },
			capabilities = capabilities,
			filetypes = { "c", "cpp", "objc", "objcpp", "ixx", "hpp", "h" },
			root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
			init_options = {
				clangdFileStatus = true,
				usePlaceholders = true,
				completeUnimported = true,
				semanticHighlighting = true,
			},
			settings = {
				clangd = {
					InlayHints = {
						Designators = true,
						Enabled = true,
						ParameterNames = true,
						DeducedTypes = true,
					},
					fallbackFlags = { "-std=c++20" },
				},
			},
		})
	end,
}

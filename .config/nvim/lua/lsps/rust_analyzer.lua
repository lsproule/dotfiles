return {
	"rust_analyzer",
	config = function(lspconfig)
    local capabilities = require("coq").lsp_ensure_capabilities()
		lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		})
	end,
}

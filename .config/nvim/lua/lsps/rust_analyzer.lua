return {
	"rust_analyzer",
	config = function()
    --local capabilities = require("coq").lsp_ensure_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
		vim.lsp.config["rust_analyzer"] = {
      capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		}
	end,
}

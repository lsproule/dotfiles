return {
	"emmet_ls",
	config = function(lspconfig)
		local coq = require("coq")
		lspconfig.emmet_ls.setup(coq.lsp_ensure_capabilities({
			filetypes = {
				"astro",
				"css",
				"eruby",
				"html",
				"htmldjango",
				"javascriptreact",
				"less",
				"pug",
				"sass",
				"scss",
				"svelte",
				"typescriptreact",
				"vue",
			},
      cmd = {"emmet-ls", "--stdio"}
		}))
	end,
}

return {
	"L3MON4D3/LuaSnip",
	config = function()
		local snip_loader = require("luasnip.loaders.from_vscode")
		snip_loader.lazy_load()
		require("luasnip/loaders/from_lua").load({
			paths = {
				vim.fn.stdpath("config") .. "/snippets",
			},
		})
	end,
	dependencies = { { "rafamadriz/friendly-snippets", event = "LspAttach" } },
}

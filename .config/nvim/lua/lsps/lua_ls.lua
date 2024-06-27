return {
	"lua_ls",
	opts = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = vim.split(package.path, ";"),
				},
				diagnostics = {
					enable = true,
					globals = { "vim", "use" },
				},
				workspace = {
					library = { vim.api.nvim_get_runtime_file("", true), vim.env.VIMRUNTIME },
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
}

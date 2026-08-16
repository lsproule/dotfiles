return {
	"rust_analyzer",
	config = function()
    -- capabilities come from the global vim.lsp.config("*") default (blink.cmp)
		vim.lsp.config["rust_analyzer"] = {
			-- hard cap: the scope gets OOM-killed alone instead of taking the machine down
			cmd = { "systemd-run", "--user", "--scope", "--quiet", "-p", "MemoryMax=4G", "rust-analyzer" },
			settings = {
				["rust-analyzer"] = {
					check = {
						command = "clippy",
					},
					-- keep query caches small; default grows unbounded with workspace size
					lru = {
						capacity = 64,
					},
					-- skip whole-workspace warm-up indexing at startup
					cachePriming = {
						enable = false,
					},
				},
			},
		}
	end,
}

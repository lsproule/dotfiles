return {
	{
		"hrsh7th/nvim-cmp",
    lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local cmp = require("cmp")

			local luasnip = require("luasnip")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},

				window = {},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-c>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-p>"] = cmp.mapping.select_next_item(),
					["<C-n>"] = cmp.mapping.select_prev_item(),
--					["<Tab>"] = cmp.mapping(function(fallback)
--						if cmp.visible() then
--							cmp.select_next_item()
--						elseif luasnip.expand_or_jumpable() then
--							luasnip.expand_or_jump()
--						else
--							fallback()
--						end
--					end),
--					["<S-Tab>"] = cmp.mapping(function(fallback)
--						if cmp.visible() then
--							cmp.select_prev_item()
--						elseif luasnip.jumpable(-1) then
--							luasnip.jump(-1)
--						else
--							fallback()
--						end
--					end),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", max_item_count = 15 },
					{ name = "luasnip", max_item_count = 3 }, -- For luasnip users.
					{ name = "buffer" },
					-- { name = "vsnip" }, -- For vsnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				}),
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
				}, {
					{ name = "buffer" },
				}),
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
}

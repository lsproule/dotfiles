local null_ls = require("null-ls")

null_ls.setup({})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
			},
		}),
		formatting.stylua,
		diagnostics.eslint_d,
	},

	--format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = "userlspconfig", buffer = bufnr })
			vim.api.nvim_create_autocmd("InsertLeave", {
				group = "userlspconfig",
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						async = true,
						filter = function(client)
							-- only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = "userlspconfig",
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						async = true,
						filter = function(client)
							-- only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})

require("mason").setup()
require("mason-null-ls").setup({
	ensure_installed = {
		"tsserver",
		"flake8",
		"stylua",
	},
	handlers = {
		function() end, -- disables automatic setup of all null-ls sources
		stylua = function()
			null_ls.register(null_ls.builtins.formatting.stylua)
		end,
		shfmt = function(source_name, methods)
			-- custom logic
			require("mason-null-ls").default_setup(source_name, methods) -- to maintain default behavior
		end,
	},
	automatic_installation = true,
})

require("mason-lspconfig").setup({
	ensure_installed = lsps,
	automatic_installation = true,
})

-------------------------

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()



vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("userlspconfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gk", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<C-f>", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
		end, opts)
		vim.keymap.set("n", "<leader>d", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>p", function()
			vim.lsp.buf.format({ async = true })
		end, opts)

		--vim.api.nvim_create_autocmd("InsertLeave", { group = "userlspconfig", callback = vim.lsp.buffer.format})
	end,
})





lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workleader_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workleader = {
            checkThirdParty = false,
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workleader/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}

lspconfig.tsserver.setup({
	settings = {
		completions = {
			completeFunctionCalls = true,
		},
	},
	capabilities = capabilities,
})



local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<leader>la", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
}
)



for _, server in ipairs({"clangd",  "cssls","tailwindcss","pylsp", "gopls","rust_analyzer", "bashls", "emmet_ls", "graphql", "html", "prismals" }) do
  lspconfig[server].setup({
    capabilities = capabilities,
  })
end

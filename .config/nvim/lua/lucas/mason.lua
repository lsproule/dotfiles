local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completions = null_ls.builtins.completion
null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.clang_format,
    formatting.mypy,
		require("none-ls.formatting.jq"),
		require("none-ls.code_actions.eslint"),
		formatting.prettierd,
		formatting.cmake_format,
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
		completions.spell,
	},
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
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
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

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

local cmp_nvim_lsp = require("cmp_nvim_lsp")

lspconfig.clangd.setup({
	cmd = { "clangd", "--background-index", "--offset-encoding=utf-16" },
	capabilities = cmp_nvim_lsp.default_capabilities(),
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
	init_options = {
		clangdFileStatus = true,
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
	},
})

lspconfig.tsserver.setup({
	settings = {
		completions = {
			completeFunctionCalls = true,
		},
	},
	capabilities = capabilities,
})

lspconfig.zls.setup({
	capabilities = capabilities,
	cmd = { "zls" },
	filetypes = { "zig", "zir" },
})

lspconfig.yamlls.setup({
	schemas = {
		["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.0/all.json"] = "k8s/**",
		["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
			"ci/*.yml",
			".gitlab-ci.yml",
		},
		["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = {
			"*.yaml",
			"*.yml",
		},
	},
	settings = {
		yaml = {
			schemaStore = {
				url = "https://www.schemastore.org/api/json/catalog.json",
				enable = true,
			},
			schemas = {
				["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.0/all.json"] = "k8s/**",
				["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
					"ci/*.yml",
					".gitlab-ci.yml",
				},
			},
		},
	},
})

local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

if not configs.helm_ls then
	configs.helm_ls = {
		default_config = {
			cmd = { "helm_ls", "serve" },
			filetypes = { "helm" },
			root_dir = function(fname)
				return util.root_pattern("Chart.yaml")(fname)
			end,
		},
	}
end

lspconfig.helm_ls.setup({
	filetypes = { "helm" },
	cmd = { "helm_ls", "serve" },
})

lspconfig.zls.setup({})

lspconfig.pylsp.setup({})

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

lspconfig.ruby_ls.setup({})

for _, server in ipairs({
	--  "yamlls",
	"tailwindcss",
	"gopls",
	"bashls",
	"cmake",
	"cssls",
	"dockerls",
	"graphql",
	"html",
	"prismals",
	"bashls",
}) do
	lspconfig[server].setup({
		capabilities = capabilities,
	})
end

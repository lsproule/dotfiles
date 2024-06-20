return {
  "lua_ls",
  config = function(lspconfig)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
          },
          diagnostics = {
            enable = true,
            globals = { "vim", "use"},
          },
          workspace = {
            library = {vim.api.nvim_get_runtime_file("", true), vim.env.VIMRUNTIME},
          },
          telemetry = {
            enable = false,
          },
        },
      },
      capabilities = capabilities,
    })
  end
}

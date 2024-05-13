local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local util = require("lspconfig.util")

local servers = {
  lua_ls = {
    enabled = true,
    config = {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    },
  },
  clangd = {
    enabled = true,
    config = {
      cmd = { "clangd", "--background-index", "--offset-encoding=utf-16" },
      capabilities = capabilities,
      filetypes = { "c", "cpp", "objc", "objcpp" },
      root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
      init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true,
        semanticHighlighting = true,
      },
    },
  },
  tsserver = {
    enabled = true,
    config = {
      capabilities = capabilities,
      settings = {
        completions = {
          completeFunctionCalls = true,
        },
      },
    },
  },

  zls = {
    enabled = false,
    config = {
      capabilities = capabilities,
      cmd = { "zls" },
      filetypes = { "zig", "zir" },
    },
  },
  yamlls = {
    enabled = true,
    config = {
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
    },
  },
  helm_ls = {
    enabled = false,
    config = {
      cmd = { "helm_ls", "serve" },
      filetypes = { "helm" },
      root_dir = function(fname)
        return util.root_pattern("Chart.yaml")(fname)
      end,
    },
  },
  pylsp = {
    enabled = true,
    config = {
      capabilities = capabilities,
    },
  },
  ruby_ls = {
    enabled = true,
    config = {
      capabilities = capabilities,
    },
  },
  powershell_es = {
    enabled = true,
    config = {
      capabilities = capabilities,
    },
  },
  rust_analyzer = {
    enabled = true,
    config = {
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy",
          },
        },
      },
    },
  },
  tailwindcss = { enabled = true, config = {} },
  gopls = { enabled = true, config = {} },
  groovyls = { enabled = false, config = {} },
  bashls = { enabled = true, config = {} },
  cmake = { enabled = true, config = {} },
  cssls = { enabled = true, config = {} },
  dockerls = { enabled = true, config = {} },
  graphql = { enabled = false, config = {} },
  html = { enabled = true, config = {} },
  prismals = { enabled = false, config = {} },
}

local function to_json()
  local servers_enabled = {}
  local file = io.open(vim.fn.stdpath("config") .. "/servers.json", "w")

  for server, config in pairs(servers) do
    if type(config) == "table" then
      servers_enabled[server] = config.enabled
    end
  end
  if not file then
    print("Error opening file")
    return
  end
  file:write(vim.json.encode(servers_enabled))
end

local function from_json(servers)
  servers = servers or {}
  local file = io.open(vim.fn.stdpath("config") .. "/servers.json", "r")

  if not file then
    print("Error opening file")
    return
  end
  local data = file:read("*a")
  if data == nil then
    print("No data in file")
    return
  end
  for server, enabled in pairs(vim.json.decode(data)) do
    servers[server].enabled = enabled
  end
  return servers
end

local function update_json(server)
  local file = io.open(vim.fn.stdpath("config") .. "/servers.json", "r")
  if not file then
    print("Error opening file")
    return
  end
  local data = vim.json.decode(file:read("*a"))
  if data[server] == nil then
    data[server] = true
  elseif data[server] then
    data[server] = false
  elseif not data[server] then
    data[server] = true
  else
    data[server] = not data[server]
  end
  file = io.open(vim.fn.stdpath("config") .. "/servers.json", "w")
  if not file then
    print("Error opening file")
    return
  end
  file:write(vim.json.encode(data))
  file:flush()
end

local function toggle_server(server)
  update_json(server)
end

local function telescope_toggle()
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local telescope_picker = require("telescope.pickers")
  local server_names = {}
  for server, _ in pairs(servers) do
    table.insert(server_names, server)
  end
  telescope_picker
      .new({}, {
        prompt_title = "LSP Servers",
        finder = finders.new_table({
          results = server_names,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
          local toggle = function()
            local selection = require("telescope.actions.state").get_selected_entry()
            toggle_server(selection.value)
            require("telescope.actions").close(prompt_bufnr)
          end
          map("i", "<CR>", toggle)
          map("n", "<CR>", toggle)
          return true
        end,
      })
      :find()
end
--to_json()
servers = from_json(servers) or servers

vim.api.nvim_create_user_command("ToggleServer", function()
  telescope_toggle()
end, {})

for server, config in pairs(servers) do
  if config.enabled then
    lspconfig[server].setup(config.config)
  end
end

print("test")
local lspconfig = require("lspconfig")
lspconfig.tailwindcss.setup({
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cva\\(([^)]*)\\)",
           "[\"'`]([^\"'`]*).*?[\"'`]" },
        },
      },
    },
  },
})



local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}



lspconfig.cssls.setup({
settings = {
  css = { validate = true,
        lint = {
            unknownAtRules = "ignore"
        }
  },
  scss = { validate = true,
        lint = {
            unknownAtRules = "ignore"
        }
  },
  less = { validate = true,
        lint = {
            unknownAtRules = "ignore"
        }
  },
 },
})

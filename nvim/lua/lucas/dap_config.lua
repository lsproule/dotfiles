local dap, dapui =require("dap"),require("dapui")

dapui.setup()
vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>" )

-- dap keybindings
vim.keymap.set("n", '<leader>dn', dap.step_over)
vim.keymap.set("n", '<leader>db', dap.toggle_breakpoint)
vim.keymap.set("n", '<leader>di', dap.step_into)
vim.keymap.set("n", '<leader>do', dap.step_into)
vim.keymap.set("n", '<leader>dc', dap.continue)
vim.keymap.set("n", '<leader>dm', require('dap-python').test_method)
vim.keymap.set("n", '<leader>dm', require('dap-python').test_method)
vim.keymap.set("n", '<leader>dk', require('dap-python').test_class)
vim.keymap.set("n", '<leader>de', function ()
  dap.clear_breakpoints()
  dapui.toggle()
  dap.terminate()
  require("notify")("Debugger terminated", "info", {title = "DAP"})
end)

-- dap ui settings
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'
-- C/C++ debugging
dap.adapters.cpp = {
    type = 'executable',
    command = 'lldb-vscode',
    env = {
      LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
    },
    name = "lldb"
  }
  dap.configurations.cpp = {
    {
      name = "Launch",
      type = "cpp",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      args = {}
    }
  }
  dap.configurations.c = dap.configurations.cpp

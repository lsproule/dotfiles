return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      vim.keymap.set("n", "<leader>dc", function()
        require("dap").continue()
      end)
      vim.keymap.set("n", "<leader>dl", function()
        require("dap").run_last()
      end)
      vim.keymap.set("n",  "<leader>di", dap.step_into)
      vim.keymap.set("n",  "<leader>do", dap.step_over)
      vim.keymap.set("n", "<leader>db", function()
        require("dap").toggle_breakpoint()
      end)
    end,
  },
  "rcarriga/nvim-dap-ui",
}

return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Find Definitions" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recent" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find in Files" })
    vim.keymap.set("n", "<leader>fm", function()
      builtin.man_pages({ sections = { "2", "3", "9",  "3type", "2type" } })
    end, { desc = "Find man_pages" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
  end,
}

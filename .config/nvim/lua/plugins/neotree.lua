return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "VeryLazy",
  opts = {
    filesystem = {
      hijack_netrw_behavior = "open_current",
      filtered_items = { visible = true },
    },
    file_size = {
      enabled = false,
    },
    created = {
      enabled = false,
    },
    last_modified = {
      enabled = false,
    },
  },
  config = function()
    require("neo-tree").setup({
      file_size = {
        enabled = false,
      },
      hide_dotfiles = false,
      hide_by_name = { ".git", "node_modules", ".cache" },
      hide_hidden = false,
      window = {
        width = 30,
        side = "left",
        auto_resize = true,
      },
      created = {
        enabled = false,
      },
      last_modified = {
        enabled = false,
      },

      event_handlers = {

        {
          event = "file_opened",
          handler = function(file_path)
            -- auto close
            -- vimc.cmd("Neotree close")
            -- OR
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    })
  end,
}
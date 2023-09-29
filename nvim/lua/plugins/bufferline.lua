return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",

  config = function()
    require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = "filesystem",
            separator = true,
            text_align = "left",
          },
        },
        diagnostics = "nvim_lsp",
        numbers = "buffer_id",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
      },
    })
  end,
}

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "NvimTree",
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

return {
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "storm",
        --transparent = true,
        styles ={
          sidebars =  "transparent",
          floats =  "transparent"
        }

      })
    end
  },
}

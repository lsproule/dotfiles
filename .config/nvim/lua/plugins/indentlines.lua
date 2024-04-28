return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function ()
    local highlight = {
      "DarkGray",
      "Gray",
      "Blue",
      "Green",
      "Red",
      "Cyan",
    }
    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "DarkGray", { fg = "#2b2b2b" })
      vim.api.nvim_set_hl(0, "Gray", { fg = "#6c6a6a" })
      vim.api.nvim_set_hl(0, "Blue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "Green", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "Red", { fg = "#ff0000" })
      vim.api.nvim_set_hl(0, "Cyan", { fg = "#56B6C2" })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }
    require("ibl").setup { scope = { highlight = highlight } }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end

}

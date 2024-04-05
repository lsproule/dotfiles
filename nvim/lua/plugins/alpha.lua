return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "█      █    █  ████    ██    ████ ",
      "█      █    █ █    █  █  █  █     ",
      "█      █    █ █      █    █  ████ ",
      "█      █    █ █      ██████      █",
      "█      █    █ █    █ █    █ █    █",
      "██████  ████   ████  █    █  ████ ",
      "                                   ",
      "█    █ ██████  ████  █    █ █ █    █",
      "██   █ █      █    █ █    █ █ ██  ██",
      "█ █  █ █████  █    █ █    █ █ █ ██ █",
      "█  █ █ █      █    █ █    █ █ █    █",
      "█   ██ █      █    █  █  █  █ █    █",
      "█    █ ██████  ████    ██   █ █    █",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New file" , ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
      dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | wincmd k<CR>"),
      dashboard.button("q", "✗  > Quit NVIM", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
    ]])
  end,
}

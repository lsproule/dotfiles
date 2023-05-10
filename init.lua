if vim.loader then vim.loader.enable() end -- enable vim.loader early if available

for _, source in ipairs {
  "astronvim.bootstrap",
  "astronvim.options",
  "astronvim.lazy",
  "astronvim.autocmds",
  "astronvim.mappings",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

if astronvim.default_colorscheme then
  if not pcall(vim.cmd.colorscheme, astronvim.default_colorscheme) then
    require("astronvim.utils").notify("Error setting up colorscheme: " .. astronvim.default_colorscheme, "error")
  end
end
require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)
require "lucas"
require("transparent").setup {
  groups = { -- table: default groups
    "Normal",
    "NormalNC",
    "Comment",
    "Constant",
    "Special",
    "Identifier",
    "Statement",
    "PreProc",
    "Type",
    "Underlined",
    "Todo",
    "String",
    "Function",
    "Conditional",
    "Repeat",
    "Operator",
    "Structure",
    "LineNr",
    "NonText",
    "SignColumn",
    "CursorLineNr",
    "EndOfBuffer",
  },
  extra_groups = { "NeoTreeNormal" }, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
}

vim.o.background = "dark" -- or "light" for light mode
vim.lsp.buf.format { timeout_ms = 9000 } -- 9 seconds
vim.cmd.colorscheme "tender"
vim.cmd.colorscheme "gruvbox"
vim.cmd.colorscheme "melange"
vim.g.sexyscroll_update_display_per_milliseconds = 30
require("notify").setup {
  background_colour = "#000000",
}
require("notify").setup {
  background_colour = "#000000",
}

vim.o.background = "dark" -- or "light" for light mode
vim.lsp.buf.format { timeout_ms = 9000 } -- 9 seconds
vim.cmd.colorscheme "tender"
vim.cmd.colorscheme "gruvbox"
vim.cmd.colorscheme "melange"
vim.g.sexyscroll_update_display_per_milliseconds = 30
require("notify").setup {
  background_colour = "#000000",
}

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 6
vim.bo.softtabstop = 2
vim.opt.swapfile = false
vim.opt.listchars = {
  tab = "| ",
  trail = "·",
  extends = "…",
  precedes = "…"
}
vim.opt.list = true
vim.opt.termguicolors = true
vim.o.laststatus = 3
vim.o.cmdheight=0
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false

vim.g.neovide_scale_factor = .7
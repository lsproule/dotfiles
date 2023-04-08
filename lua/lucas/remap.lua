vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>pv", vim.cmd.Ex)


 vim.g.markdown_fenced_languages = {'go','perl','sh', 'python', 'cpp', 'c', 'javascript', 'vim', 'dockerfile'}

vim.cmd [[
 au FileType markdown let b:presenting_slide_separator = '\v(^|\n)-{4,}'
]]

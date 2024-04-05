
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
  pattern = '*.txt.inja',
  command = 'set filetype=cmake',
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {

  pattern = '*.c.inja',
  command = 'set filetype=c',

})
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
  pattern = '*.cpp.inja',
  command = 'set filetype=c',
})

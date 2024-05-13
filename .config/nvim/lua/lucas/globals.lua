string.ends_with = vim.endswith
string.starts_with = vim.startswith
string.trim = vim.trim
string.split = vim.split
string.join = vim.join

autocmd = vim.api.nvim_create_autocmd
nvim_buf_get_lines = vim.api.nvim_buf_get_lines
nvim_buf_get_name = vim.api.nvim_buf_get_name
nvim_buf_set_lines = vim.api.nvim_buf_set_lines
nvim_buf_set_text = vim.api.nvim_buf_set_text
nvim_chan_send = vim.api.nvim_chan_send
nvim_create_buf = vim.api.nvim_create_buf
nvim_create_namespace = vim.api.nvim_create_namespace
nvim_feedkeys = vim.api.nvim_feedkeys
nvim_get_current_buf = vim.api.nvim_get_current_buf
nvim_list_wins = vim.api.nvim_list_wins
nvim_open_term = vim.api.nvim_open_term
nvim_replace_termcodes = vim.api.nvim_replace_termcodes
nvim_set_current_buf = vim.api.nvim_set_current_buf
nvim_win_get_buf = vim.api.nvim_win_get_buf
if_nil = vim.F.if_nil

function table.take(tbl, field)
  local val = tbl[field]
  tbl[field] = nil
  return val
end

---@class SystemOptions : vim.SystemOpts
---
---@field on_exit? fun(result: vim.SystemCompleted)
--- Executes a shell command.
---
---@param cmd string[]
---@param options? SystemOptions
---
---@return vim.SystemObj | vim.SystemCompleted
function System(cmd, options)
  options = if_nil(options, {})
  options.text = if_nil(options.text, true)
  if options.on_exit == nil then
    return vim.system(cmd, options):wait()
  end
  local on_exit = table.take(options, "on_exit")
  return vim.system(cmd, options, vim.schedule_wrap(on_exit))
end

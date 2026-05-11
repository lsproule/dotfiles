local M = {}

local containers = {
  block = true,
  statement_block = true,
  compound_statement = true,
  chunk = true,
  program = true,
  module = true,
  source_file = true,
  translation_unit = true,
}

local function is_container(node)
  return containers[node:type()] == true
end

local get_master_node = function()
  local node = vim.treesitter.get_node()
  if node == nil then
    return nil
  end

  local fallback = node
  while node do
    if not is_container(node) then
      fallback = node
      local srow, _, erow, _ = node:range()
      if erow > srow then
        return node
      end
    end
    node = node:parent()
  end

  return fallback
end

M.select = function()
  local node = get_master_node()
  if node == nil then
    return
  end

  local start_row, start_col, end_row, end_col = node:range()
  start_row = start_row + 1
  end_row = end_row + 1
  if end_col == 0 then
    end_row = end_row - 1
    end_col = #vim.api.nvim_buf_get_lines(0, end_row - 1, end_row, false)[1]
  end

  vim.api.nvim_win_set_cursor(0, { start_row, start_col })
  vim.cmd("normal! V")
  vim.api.nvim_win_set_cursor(0, { end_row, 0 })
end

return M

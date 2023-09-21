local ts_utils = require("nvim-treesitter.ts_utils")
local M = {}

local get_master_node = function()
  local node = ts_utils.get_node_at_cursor()

  if node == nil then
    return nil
  end

  local root =  ts_utils.get_root_for_node(node)
  local start_row = node:start()
  local parent = node:parent()
  while parent ~= nil and parent:start() == start_row do
    if parent == root then
      break
    end
    node = parent
    parent = node:parent()
  end
  return node
end

M.select = function()

  local node = get_master_node()
  local bufnr = vim.api.nvim_get_current_buf()
  ts_utils.update_selection(bufnr, node, "V")

end

return M

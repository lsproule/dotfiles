local M = {}
function os.stdout(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', '')
  return s 
end


function os.stdout_table(cmd, raw)
  local lines = table or {}
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  for line in s:gmatch("[^\r\n]+") do
    table.insert(lines, line)
  end
  return table
end

M.get_emoji = function(...)
  local str = table.concat({...}, " ")
  local emoji = os.stdout('cut -d " " -f 1 | emoji-fzf get' .." " .. str)
  return emoji
end

vim.api.nvim_create_user_command(
  "Emoji",
  function (args)
    local command = "emoji-fzf preview"
    if args["args"] ~= "" then
      command = "emoji-fzf get"
      command = command .. " " .. args["args"]
      local emoji = M.get_emoji(command)
      print(emoji)
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      vim.api.nvim_buf_set_text(0, row-1, col, row-1, col, {emoji})
      return
    end
    local fzf = require("fzf")
    local emojis = os.stdout_table(command)

    local res = coroutine.wrap(function()
      local res = fzf.fzf(emojis)
      return res
    end)()

    print(res)
    local emoji = M.get_emoji(res)
    print(emoji)

  end,
  {
    desc = "Get an emoji",
    nargs = "*"
  }
)

  return M

local api = vim.api
local lsp = vim.lsp

local autocmd = api.nvim_create_autocmd

local group = api.nvim_create_augroup("autorun", {
  clear = true,
})

local elixir = api.nvim_create_augroup("elixir", {
  clear = true,
})

api.nvim_create_autocmd("BufWritePre", {
  group = group,
  pattern = "*.py",
  callback = function()
    lsp.buf.format()
  end,
})
--api.nvim_create_autocmd("BufEnter", {
--  group = elixir,
--  pattern = "*.exs",
--  callback = function()
--    vim.cmd("TSEnable highlight")
--  end,
--})
api.nvim_create_autocmd("BufWritePre", {
  group = "autorun",
  pattern = { "*.js", "*.ts" },
  callback = function()
    lsp.buf.format()
  end,
})


local attach_to_buffer = function(output_bufnr, pattern, command)
  autocmd("BufWritePost", {
    group = group,
    pattern = pattern,
    callback = function()
      local append = function(data)
        if data then
          api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
        end
      end
      vim.inspect(command)
      vim.fn.jobstart(command, {
        on_stdout = append,
        on_stderr = append,
        stdout_buffered = true,
      })
    end,
  })
end
autocmd("BufWritePre", {
  pattern = "*",
  desc = "Force expandtab and retab before saving",
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local name = vim.api.nvim_buf_get_name(args.buf)

    -- skip makefiles
    if ft == "make" or name:match("[Mm]akefile") then
      return
    end
    vim.opt_local.expandtab = true
    vim.cmd("silent! retab")
  end,
})


autocmd({"BufWinLeave"}, {
  pattern = {"*.*"},
  desc = "save view (folds), when closing file",
  command = "mkview",
})
autocmd({"BufWinEnter"}, {
  pattern = {"*.*"},
  desc = "load view (folds), when opening file",
  command = "silent! loadview"
})

vim.api.nvim_create_user_command("Autorun", function()
  local new_buf = vim.api.nvim_create_buf(false, true)
  local cmd = vim.split(vim.fn.input("Command: "), " ")
  local pattern = vim.fn.input("Pattern: ")
  attach_to_buffer(new_buf, pattern, cmd)
  local win = vim.api.nvim_open_win(new_buf, true, {
    split = "below",
  })
  vim.api.nvim_set_current_win(win)
end, {})

return {
  "lsproule/reg-edit",
  config = function()
    require("reg-edit").setup({
      command_name = "RegEdit",
      keys = {
        open = "<leader>re",
        clear = "<leader>c",
      },
    })
  end
}


--require("reg-edit").setup({
--  command_name = "RegEdit",
--  keys = {
--    open = "<leader>re",
--    clear = "<leader>c",
--  },
--})

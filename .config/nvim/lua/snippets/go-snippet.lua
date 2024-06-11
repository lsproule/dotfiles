local ls = require("luasnip")
local s = ls.s
local sn = ls.sn
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("go", {
  s("ifn", {
    t("if "),
    t("err != nil {"),
    i(1),
    t("\n}"),
  }),
})

return {
  go = {
    s("ifn", {
      t("if "),
      t("err != nil {"),
      i(1),
      t("\n}"),
    }),
  } 
}

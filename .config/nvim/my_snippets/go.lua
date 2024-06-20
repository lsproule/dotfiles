local ls = require("luasnip")
local s = ls.s
local sn = ls.sn
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("go", {
	s("ifn", {
		t("if err != nil {\t"),
		i(1),
		t("}"),
	}),
  s("print", {
    t("fmt.Println("),
    i(1),
    t(")"),
  })
})



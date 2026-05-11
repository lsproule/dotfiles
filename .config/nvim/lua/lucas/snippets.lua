
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")


ls.add_snippets("lua", {
  s("req", fmt('local {} = require("{}")', { i(1), rep(1) })),
})


local function pascalcase(str)
  return str
    :gsub("_(%a)", string.upper)   -- snake_case → camelCase first
    :gsub("^%a",   string.upper)   -- capitalise first letter
end


ls.add_snippets("ruby", {
  s("clsi", fmt([[
    # {class_name} docstring
    class {class_name}
      def initialize({args})
        {body}
      end
    end
  ]], {
    -- ① Derive class name from the file name at expansion time
    class_name = f(function(_, snip)
      return pascalcase(snip.env.TM_FILENAME_BASE or "ClassName")
    end),

    args = i(1, ""),   -- tabstop 1 – constructor args
    body = i(2, ""),   -- tabstop 2 – constructor body
  }))
})

ls.add_snippets("ruby", {
    s("defm", fmt([[
      define_method :{method_name} do |{args}|
        {body}
      end
    ]]
    , {
      method_name = i(1, "method_name"),  -- tabstop 1 – method name
      args = i(2, ""),                     -- tabstop 2 – method args
      body = i(3, ""),                     -- tabstop 3 – method body
    }
  ))
})



ls.add_snippets("ruby", {
    s("fsl", fmt("# frozen_string_literal: true", {}))
})


ls.add_snippets("ruby", {
    s("ata", fmt([[
      attr_accessor :{attr}
    ]]
    , {
      attr = i(1, "attr"),  -- tabstop – attribute
    }
  ))
})

ls.add_snippets("ruby", {
    s("atr", fmt([[
      attr_reader :{attr}
    ]]
    , {
      attr = i(1, "attr"),  -- tabstop – attribute
    }
  ))
})

ls.add_snippets("ruby", {
    s("req", fmt([[
      require_relative '{mod}'
    ]]
    , {
      mod= i(1, "mod"),  -- tabstop 1 – module name 
    }
  ))
})

ls.add_snippets("ruby", {
    s("rrel", fmt([[
      require_relative "{mod}"
    ]]
    , {
      mod= i(1, "mod"),  -- tabstop 1 – module name
    }
  ))
})

ls.add_snippets("all", {
    s("#!", fmt([[
      #!/usr/bin/env {interpreter}
    ]]
    , {
      interpreter = i(1, "bash"),  -- tabstop 1 – interpreter
    }
  ))
})

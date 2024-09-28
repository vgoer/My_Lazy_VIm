local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

return {
  -- 1. 函数定义
  s("def", {
    t("def "),
    i(1, "function_name"),
    t("("),
    i(2, "params"),
    t({ "):", "\t" }),
    i(0),
  }),

  -- 2. 类定义
  s("class", {
    t("class "),
    i(1, "ClassName"),
    t({ ":", "\tdef __init__(self, " }),
    i(2, "args"),
    t({ "):", "\t\t" }),
    t("self."),
    i(3, "attribute"),
    t(" = "),
    i(4, "value"),
    t({ "", "\t" }),
    i(0),
  }),

  -- 3. If 条件
  s("if", {
    t("if "),
    i(1, "condition"),
    t({ ":", "\t" }),
    i(0),
  }),

  -- 4. For 循环
  s("for", {
    t("for "),
    i(1, "variable"),
    t(" in "),
    i(2, "iterable"),
    t({ ":", "\t" }),
    i(0),
  }),

  -- 5. Try-Except
  s("try", {
    t({ "try:", "\t" }),
    i(1, "code"),
    t({ "", "except " }),
    i(2, "Exception"),
    t({ ":", "\t" }),
    i(3, "handle_exception"),
  }),

  -- 6. Import 模块
  s("imp", {
    t("import "),
    i(1, "module_name"),
  }),

  -- 7. Main 函数
  s("main", {
    t({ "if __name__ == '__main__':", "\t" }),
    i(0),
  }),
}

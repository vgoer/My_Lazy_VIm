local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- vue3 模板
  s("vue3", {
    -- 添加 HTML 部分
    t("<style scoped lang='sass'>"),
    t({ "", "" }), -- 空行
    t({ "", "" }), -- 空行
    t("</style>"),
    t({ "", "" }), -- 空行
    t("<!-- "),
    i(1, ""),
    t(" -->"),
    t({ "", "<template>", "" }),
    t(" "),
    i(2, ""), -- 在 template 中间留出插入点
    t({ "", "</template>", "" }),
    t("<script setup>"),
    t({ "", "" }), -- 空行
    i(0), -- 结尾处的插入点
    t({ "", "</script>", "" }),
  }),
  -- vue3 ts 模板
  s("vue3ts", {
    -- 添加 HTML 部分
    t("<style scoped lang='sass'>"),
    t({ "", "" }), -- 空行
    t({ "", "" }), -- 空行
    t("</style>"),
    t({ "", "" }), -- 空行
    t("<!-- "),
    i(1, ""),
    t(" -->"),
    t({ "", "<template>", "" }),
    t(" "),
    i(2, ""), -- 在 template 中间留出插入点
    t({ "", "</template>", "" }),
    t("<script setup lang='ts'>"),
    t({ "", "" }), -- 空行
    i(0), -- 结尾处的插入点
    t({ "", "</script>", "" }),
  }),
}

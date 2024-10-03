-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- 更好的上下移动
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "向下移动", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "向下移动", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "向上移动", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "向上移动", expr = true, silent = true })

-- 使用 <ctrl> hjkl 键移动到窗口
map("n", "<C-h>", "<C-w>h", { desc = "移动到左侧窗口", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "移动到下方窗口", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "移动到上方窗口", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "移动到右侧窗口", remap = true })

-- 使用 <ctrl> 方向键调整窗口大小
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "增加窗口高度" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "减少窗口高度" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "减少窗口宽度" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "增加窗口宽度" })

-- 移动行
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "向下移动" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "向上移动" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "向下移动" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "向上移动" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "向下移动" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "向上移动" })

-- 缓冲区
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "上一个缓冲区" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "下一个缓冲区" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "上一个缓冲区" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "下一个缓冲区" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "切换到其他缓冲区" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "切换到其他缓冲区" })
map("n", "<leader>bd", LazyVim.ui.bufremove, { desc = "删除缓冲区" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "删除缓冲区和窗口" })

-- 使用 <esc> 清除搜索
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "退出并清除搜索高亮" })

-- 清除搜索、更新差异并重绘
-- 来自 runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "重绘 / 清除搜索高亮 / 更新差异" }
)

-- 更好的 n 和 N 行为
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "下一个搜索结果" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "下一个搜索结果" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "下一个搜索结果" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "上一个搜索结果" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "上一个搜索结果" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "上一个搜索结果" })

-- 添加撤销断点
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- 保存文件
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "保存文件" })

-- 关键字命令
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "关键字命令" })

-- 更好的缩进
map("v", "<", "<gv")
map("v", ">", ">gv")

-- 注释
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "在下方添加注释" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "在上方添加注释" })

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy配置" })

-- 新文件
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "新建文件" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "位置列表" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "快速修复列表" })
map("n", "[q", vim.cmd.cprev, { desc = "上一个快速修复" })
map("n", "]q", vim.cmd.cnext, { desc = "下一个快速修复" })

-- 格式化
map({ "n", "v" }, "<leader>cf", function()
  LazyVim.format({ force = true })
end, { desc = "格式化" })

-- 诊断
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "行诊断" })
map("n", "]d", diagnostic_goto(true), { desc = "下一个诊断" })
map("n", "[d", diagnostic_goto(false), { desc = "上一个诊断" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "下一个错误" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "上一个错误" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "下一个警告" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "上一个警告" })

-- 切换选项
LazyVim.toggle.map("<leader>uf", LazyVim.toggle.format(), { desc = "切换格式化" })
LazyVim.toggle.map("<leader>uF", LazyVim.toggle.format(true), { desc = "强制格式化" })
LazyVim.toggle.map("<leader>us", LazyVim.toggle("spell", { name = "拼写检查" }))
LazyVim.toggle.map("<leader>uw", LazyVim.toggle("wrap", { name = "自动换行" }))
LazyVim.toggle.map("<leader>uL", LazyVim.toggle("relativenumber", { name = "相对行号" }))
LazyVim.toggle.map("<leader>ud", LazyVim.toggle.diagnostics, { desc = "切换诊断" })
LazyVim.toggle.map("<leader>ul", LazyVim.toggle.number, { desc = "切换行号" })
LazyVim.toggle.map(
  "<leader>uc",
  LazyVim.toggle(
    "conceallevel",
    { values = { 0, vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }, desc = "切换折叠级别" }
  )
)
LazyVim.toggle.map("<leader>uT", LazyVim.toggle.treesitter, { desc = "切换 Tree-sitter" })
LazyVim.toggle.map("<leader>ub", LazyVim.toggle("background", { values = { "light", "dark" }, name = "背景颜色" }))
if vim.lsp.inlay_hint then
  LazyVim.toggle.map("<leader>uh", LazyVim.toggle.inlay_hints, { desc = "切换内联提示" })
end

-- lazygit
map("n", "<leader>gg", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit（根目录）" })
map("n", "<leader>gG", function()
  LazyVim.lazygit()
end, { desc = "Lazygit（当前工作目录）" })
map("n", "<leader>gb", LazyVim.lazygit.blame_line, { desc = "Git 责任追踪行" })
map("n", "<leader>gB", LazyVim.lazygit.browse, { desc = "浏览 Git 仓库" })

map("n", "<leader>gf", function()
  local git_path = vim.api.nvim_buf_get_name(0)
  LazyVim.lazygit({ args = { "-f", vim.trim(git_path) } })
end, { desc = "Lazygit 当前文件历史" })

map("n", "<leader>gl", function()
  LazyVim.lazygit({ args = { "log" }, cwd = LazyVim.root.git() })
end, { desc = "Lazygit Git 日志" })
map("n", "<leader>gL", function()
  LazyVim.lazygit({ args = { "log" } })
end, { desc = "Lazygit 日志（当前工作目录）" })

-- 退出所有
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "退出所有" })

-- 高亮光标下的内容
map("n", "<leader>ui", vim.show_pos, { desc = "检查位置" })
map("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "检查树" })

-- LazyVim 更新日志
map("n", "<leader>L", function()
  LazyVim.news.changelog()
end, { desc = "LazyVim 更新日志" })

-- 浮动终端
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end
map("n", "<leader>ft", lazyterm, { desc = "终端（根目录）" })
map("n", "<leader>fT", function()
  LazyVim.terminal()
end, { desc = "终端（当前工作目录）" })
map("n", "<c-/>", lazyterm, { desc = "终端（根目录）" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- 终端映射
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "进入普通模式" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "切换到左侧窗口" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "切换到下方窗口" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "切换到上方窗口" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "切换到右侧窗口" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "隐藏终端" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- 窗口
map("n", "<leader>w", "<c-w>", { desc = "窗口", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "下方分割窗口", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "右侧分割窗口", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "删除窗口", remap = true })
LazyVim.toggle.map("<leader>wm", LazyVim.toggle.maximize)

-- 标签页
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "最后一个标签" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "关闭其他标签" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "第一个标签" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "新建标签" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "下一个标签" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "关闭标签" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "上一个标签" })

-- 打开浏览器
map({ "n", "i" }, "<C-i>", "<cmd>LiveServerStart<cr>", { desc = "打开浏览器", remap = true })

-- Emmet 补全快捷键
map({ "n", "i" }, "<C-e>", "<plug>(emmet-expand-abbr)<cr>", { desc = "Emmet补全", remap = true })

-- 打开mardown
map({ "n", "i" }, "<C-m>", "<cmd>MarkdownPreview<cr>", { desc = "打开markdown", remap = true })

-- 撤销可视化快捷键
map("n", "<leader><F5>", vim.cmd.UndotreeToggle, { desc = "撤销可视化" })

-- esc
map("i", "jk", "<ESC>", { desc = "esc退出" })

-- 分割窗口

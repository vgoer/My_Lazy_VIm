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

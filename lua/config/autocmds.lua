-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 此文件由 lazyvim.config.init 自动加载。

-- 创建一个自动命令组
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- 当焦点获得、终端关闭或离开时检查是否需要重新加载文件
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime") -- 重新加载文件
    end
  end,
})

-- 在文本 yank 后高亮
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank() -- 高亮被 yank 的文本
  end,
})

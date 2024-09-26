-- 前端配置 neovim
-- 前端配置 neovim

return {
  -- live-server.nvim 插件
  {
    "barrett-ruth/live-server.nvim",
    build = "pnpm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },

  -- emmet-vim 插件
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "typescript", "jsx", "tsx" },
    -- keys = {
    --   {
    --     "<C-k", -- 快捷键
    --     mode = { "i", "n" }, -- 模式
    --     "<plug>(emmet-expand-abbr)", -- Emmet 的扩展缩写命令
    --     desc = "Emmet 提示", -- 描述信息
    --   },
    -- },
  },
}

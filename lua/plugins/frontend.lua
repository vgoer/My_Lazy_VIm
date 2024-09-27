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
  },
  -- 彩虹缩进
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function(_, opts)
      -- Other blankline configuration here
      return require("indent-rainbowline").make_opts(opts)
    end,
    dependencies = {
      "TheGLander/indent-rainbowline.nvim",
    },
  },
  -- 颜色高亮
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({
        -- 自动显示颜色代码
        enable_named_colors = true,
        -- 启用 tailwindcss
        enable_tailwind = true,
        -- 可以根据需要添加更多自定义设置
      })
    end,
  },
}

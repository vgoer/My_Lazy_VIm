-- mason提示插件
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        --
        --  LSP
        --
        -- rust 提示插件
        "rust_analyzer",

        -- html 提示插件
        "html",

        -- css 提示插件
        "cssls",

        -- js、ts 提示插件
        "ts_ls",

        -- eslint 插件
        "eslint",

        -- php
        "phpactor",
      },
    },
    config = function() end,
  },
}

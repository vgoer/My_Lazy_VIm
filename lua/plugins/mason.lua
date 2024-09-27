return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- rust 提示插件
        "rust_analyzer",

        -- html 提示插件
        -- "html-lsp",
        -- css 提示插件
      },
    },
    config = function() end,
  },
}
